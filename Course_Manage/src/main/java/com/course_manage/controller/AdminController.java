package com.course_manage.controller;

import com.course_manage.Mappers.*;
import com.course_manage.entity.Adminuser;
import com.course_manage.entity.Course;
import com.course_manage.entity.Review;
import com.course_manage.entity.User;
import com.course_manage.tools.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    UserMapper userMapper;
    @Autowired
    AdminuserMapper adminuserMapper;
    @Autowired
    CourseMapper courseMapper;
    @Autowired
    Select_CourseMapper select_coursemapper;
    @Autowired
    ReviewMapper reviewMapper;
    @RequestMapping(value = "adminlogin")
    public String adminlogin(Adminuser user, HttpSession session, HttpServletRequest req){
        Adminuser admin = adminuserMapper.queryAdmin(user);
        if(admin != null) {
            session.setAttribute("Admin", admin);
            return "redirect:adminindex";
        }else{
            return "login";
        }

    }
    @RequestMapping(value = "adminlogout")
    public String adminlogout(Adminuser user, HttpSession session, HttpServletRequest req){
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if(admin == null){
            return "login";
        }else{
            session.invalidate();
            return "redirect:index";
        }
    }
    @RequestMapping(value = "adminindex")
    public String adminindex(HttpSession session, HttpServletRequest req){
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        return "adminindex";

    }
    @RequestMapping(value = "allreview")//全部用户界面
    public String allreview(int page, HttpSession session) {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        List<Review> reviews = reviewMapper.select();
        int totalpage = 14;//一页的数量
        List<Review> pagereviews = new ArrayList<Review>();
        session.setAttribute("maxpage", (reviews.size()-1)/totalpage);
        for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
            if(reviews.size()==i){
                session.setAttribute("reviews", pagereviews);
                session.setAttribute("page", page);
                return "allreview";
            }
            pagereviews.add(reviews.get(i));
        }
        session.setAttribute("page", page);
        session.setAttribute("reviews", pagereviews);
        return "allreview";
    }
    @RequestMapping(value = "deletereview")//删除课程
    public void deletereview(int id, String removepassword, HttpSession session, HttpServletRequest req, HttpServletResponse response) throws IOException {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return;
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        if(!removepassword.equals(admin.getPassword())){
            pw.print("0");
        }else{
            Review review = reviewMapper.selectById(id);
            reviewMapper.deleteByPrimaryId(id);
            pw.print("评论删除成功！请刷新页面后操作");
        }
    }
    @RequestMapping(value = "alluser")//全部用户界面
    public String alluser(int page, HttpSession session) {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        List<User> users = userMapper.queryUserAll();
        int totalpage = 14;//一页的数量
        List<User> pageusers = new ArrayList<User>();
        session.setAttribute("maxpage", (users.size()-1)/totalpage);
        for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
            if(users.size()==i){
                session.setAttribute("users", pageusers);
                session.setAttribute("page", page);
                return "alluser";
            }
            pageusers.add(users.get(i));
        }
        session.setAttribute("page", page);
        session.setAttribute("users", pageusers);
        return "alluser";
    }
    @RequestMapping(value = "userdetail")//用户详情界面
    public String userdetail(int userid, HttpSession session) {
        session.removeAttribute("msg");
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        if(userid == -1){
            session.removeAttribute("user");
            return "auserdetail";
        }else{
            User user = userMapper.queryUserById(userid);
            session.setAttribute("user", user);
            return "auserdetail";
        }
    }
    @RequestMapping(value = "deleteuser")//删除用户
    public void deleteuser(int userid, String removepassword, HttpSession session, HttpServletRequest req, HttpServletResponse response) throws IOException {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return;
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        if(!removepassword.equals(admin.getPassword())){
            pw.print("0");
        }else{
            User user = userMapper.queryUserById(userid);
            userMapper.deleteUser(userid);
            pw.print("用户："+user.getUsername()+",删除成功！请刷新页面后操作");
        }
    }
    @RequestMapping(value = "userop")//用户新增/修改
    public String userop(User user, HttpServletRequest req, HttpSession session) {
        session.removeAttribute("msg");
        Adminuser admin = (Adminuser) session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        //此时当进行添加用户操作
        if(user.getId() == -1 || user.getId() == null){
            if(userMapper.insertUser(user) == 1)
                session.setAttribute("msg", "添加成功");
            else {
                session.setAttribute("msg", "添加失败");
            }
        }else{
            if(userMapper.updateUser(user) == 1)
                session.setAttribute("msg", "更新成功");
            else {
                session.setAttribute("msg", "更新失败");
            }

        }
        User opuser = userMapper.queryUserById(user.getId());
        session.setAttribute("user", opuser);
        return "auserdetail";

    }
    @RequestMapping(value = "alladmin")//全部管理员界面
    public String alladmin(int page, HttpSession session) {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        List<Adminuser> admins = adminuserMapper.queryAdminAll();
        int totalpage = 14;//一页的数量
        List<Adminuser> pageadmins = new ArrayList<Adminuser>();
        session.setAttribute("maxpage", (admins.size()-1)/totalpage);
        for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
            if(admins.size()==i){
                session.setAttribute("admins", pageadmins);
                session.setAttribute("page", page);
                return "alladmin";
            }
            pageadmins.add(admins.get(i));
        }
        session.setAttribute("page", page);
        session.setAttribute("admins", pageadmins);
        return "alladmin";
    }
    @RequestMapping(value = "admindetail")//管理员详情界面
    public String admindetail(int adminid, HttpSession session) {
        session.removeAttribute("msg");
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        if(adminid == -1){
            session.removeAttribute("admin");
            return "admindetail";
        }else{
            Adminuser admin1 = adminuserMapper.queryAdminById(adminid);
            session.setAttribute("admin", admin1);
            return "admindetail";
        }
    }
    @RequestMapping(value = "deleteadmin")//删除管理员
    public void deleteadmin(int adminid, String removepassword, HttpSession session, HttpServletRequest req, HttpServletResponse response) throws IOException {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return;
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        if(!removepassword.equals(admin.getPassword())){
            pw.print("0");
        }else{
            Adminuser admin1 = adminuserMapper.queryAdminById(adminid);
            adminuserMapper.deleteAdmin(adminid);
            pw.print("用户："+admin.getUsername()+",删除成功！请刷新页面后操作");
        }
    }
    @RequestMapping(value = "adminop")//管理员新增/修改
    public String adminop(Adminuser admin, HttpServletRequest req, HttpSession session) {
        session.removeAttribute("msg");
        //此时当进行添加课程操作
        if(admin.getId() == -1 ||admin.getId() == null){
            if(adminuserMapper.insertAdmin(admin) == 1)
                session.setAttribute("msg", "添加成功");
            else {
                session.setAttribute("msg", "添加失败");
            }
        }else{
            if(adminuserMapper.updateAdmin(admin) == 1)
                session.setAttribute("msg", "更新成功");
            else {
                session.setAttribute("msg", "更新失败");
            }

        }
        Adminuser admin1 = adminuserMapper.queryAdminById(admin.getId());
        session.setAttribute("admin", admin1);
        return "admindetail";

    }
    @RequestMapping(value = "bancourse")
    public  void bancourse(int courseid,String removepassword,HttpSession session, HttpServletResponse response) throws IOException {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return ;
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        Course course = courseMapper.queryCourseById(courseid);
        if(!removepassword.equals(admin.getPassword())) {
            pw.print("0");
        }
        else{
            if("上架".equals(course.getLabel() )){
                course.setLabel("下架");
                if(courseMapper.updateCourse(course)==1)
                    pw.print("课程下架成功！");
            }else if("下架".equals(course.getLabel() )){
                course.setLabel("上架");
                if(courseMapper.updateCourse(course)==1)
                    pw.print("课程上架成功！");
            }else pw.print("操作失败");
        }
    }

    @RequestMapping(value = "deletecourse")//删除课程
    public void deletecourse(int courseid, String removepassword, HttpSession session, HttpServletRequest req, HttpServletResponse response) throws IOException {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return;
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        if(!removepassword.equals(admin.getPassword())){
            pw.print("0");
        }else{
            Course course = courseMapper.queryCourseById(courseid);
            courseMapper.deleteCourse(courseid);
            pw.print("用户："+course.getName()+",删除成功！请刷新页面后操作");
        }
    }
    @RequestMapping(value = "coursedetail")//课程详情界面
    public String coursede(int courseid, HttpSession session) {
        session.removeAttribute("msg");
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        if(courseid == -1){
            session.removeAttribute("course");
            return "acoursedetail";
        }else{
            Course course = courseMapper.queryCourseById(courseid);
            session.setAttribute("course", course);
            return "acoursedetail";
        }
    }
    @RequestMapping(value = "allcourse")//全部课程界面
    public String allcourse(int page, HttpSession session) {
        Adminuser admin = (Adminuser)session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
        List<Course> courses = courseMapper.queryCourseAll();
        int totalpage = 14;//一页的数量
        List<Course> pagecourses = new ArrayList<Course>();
        session.setAttribute("maxpage", (courses.size()-1)/totalpage);
        for(int i = page*totalpage;i<page*totalpage+totalpage;i++){
            if(courses.size()==i){
                session.setAttribute("courses", pagecourses);
                session.setAttribute("page", page);
                return "allcourse";
            }
            pagecourses.add(courses.get(i));
        }
        session.setAttribute("page", page);
        session.setAttribute("courses", pagecourses);
        return "allcourse";
    }
    @RequestMapping(value = "courseop")//课程上传/修改
    public String courseop(HttpServletRequest req, HttpSession session) {
        session.removeAttribute("msg");
        Adminuser admin = (Adminuser) session.getAttribute("Admin");
        if (admin == null) {
            return "login";
        }
//        //此时当进行添加课程操作
//        if(course.getId() == -1 || course.getId() == null){
//            if(courseMapper.insertCourse(course) == 1)
//                session.setAttribute("msg", "添加成功");
//            session.setAttribute("msg", "添加失败");
//        }else{
//            if(courseMapper.updateCourse(course) == 1)
//                session.setAttribute("msg", "更新成功");
//            session.setAttribute("msg", "更新失败");
//
//        }
        int maxid = courseMapper.selectlastcourse().getId();
        Course course = (Course) Upload.uploadFile(String.valueOf(maxid), req);
        if(course.getId()==-1) {
            courseMapper.insertCourse(course);
            /*System.out.println(course.getId());*/
        }else {
            courseMapper.updateCourse(course);
        }
        session.setAttribute("msg", "操作成功");
        return "acoursedetail";

    }

}
