package com.course_manage.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.course_manage.Mappers.*;
import com.course_manage.entity.*;
import com.course_manage.tools.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.course_manage.tools.JsonUtil.readJsonFile;


@Controller
public class UserController {

    @Autowired
    UserMapper userMapper;
    @Autowired
    CourseMapper courseMapper;
    @Autowired
    Select_CourseMapper select_coursemapper;
    @Autowired
    ReviewMapper reviewmapper;
    @Autowired
    HistoryMapper historyMapper;

    @RequestMapping(value = "index")
    public String index(HttpSession session,HttpServletRequest req){
        User loginUser = (User) session.getAttribute("loginUser");
        List<Course> greatcourses = (List<Course>) courseMapper.queryCourseByGrade("国家精品");
        List<Course> courses = (List<Course>) courseMapper.queryCourseAll();
        List<Integer> school = listslide.listslideinitial(courses);
        List<Course> latestcourses = new ArrayList<Course>();
        List<Course> favouratecourses = (List<Course>) courseMapper.queryfavourate();
        for(int i = courses.size()-1;i>courses.size()-11;i--){
            latestcourses.add(courses.get(i));
        }

//        for(int i = 0;i<courses.size();i++){
//            Review review = new Review();
//            review.setId(i);
//            review.setCourseName(courses.get(i).getName());
//            reviewmapper.updatecoursename(review);
//        }
//        for(int i = 0;i<courses.size();i++){
//            Review review = new Review();
//            review.setId(i+courses.size());
//            review.setCourseName(courses.get(i).getName());
//            reviewmapper.updatecoursename(review);
//        }
//        for(int i = 0;i<courses.size();i++){
//            Review review = new Review();
//            review.setId(i+courses.size()+courses.size());
//            review.setCourseName(courses.get(i).getName());
//            reviewmapper.updatecoursename(review);
//        }
//        for(int i = 434;i<850;i++){
//            String path = "/style/images/products/"+i%12+".jpg";
//            Course course = new Course();
//            course.setPicture(path);
//            course.setId(courses.get(i).getId());
//            courseMapper.updateCourse(course);
//        }
//        for(int i = 850;i<courses.size();i++){
//            String path = "/style/images/best-sell-product/"+i%8+".jpg";
//            Course course = new Course();
//            course.setPicture(path);
//            course.setId(courses.get(i).getId());
//            courseMapper.updateCourse(course);
//        }
        List<Course> computercourses = (List<Course>) courseMapper.queryCourseByType("计算机");
        List<Course> therocourses = (List<Course>) courseMapper.queryCourseByType("数理化");
        List<Course> faccourses = (List<Course>) courseMapper.queryCourseByType("工业技术");
        List<Course> ecocourses = (List<Course>) courseMapper.queryCourseByType("经济学");
        List<Course> creacourses = (List<Course>) courseMapper.queryCourseByType("生物学");
        session.setAttribute("courses", courses);
        session.setAttribute("favouratecourses", favouratecourses);
        session.setAttribute("latestcourses", latestcourses);
        session.setAttribute("computercourses", computercourses);
        session.setAttribute("greatcourses", greatcourses);
        session.setAttribute("therocourses", therocourses);
        session.setAttribute("faccourses", faccourses);
        session.setAttribute("ecocourses", ecocourses);
        session.setAttribute("creacourses", creacourses);
        session.setAttribute("school", school);
        if(loginUser!=null){
            List<Integer> courseIds = select_coursemapper.selectByuserId(loginUser.getId());
            List<Course> mycourses = new ArrayList<Course>();
            for(int i =0;i<courseIds.size();i++){
                Course course = courseMapper.queryCourseById(courseIds.get(i));
                mycourses.add(course);
            }
            session.setAttribute("mycourses",mycourses);
        }
        return "index";
    }
    @RequestMapping(value = "addreview")
    public void addreview (int courseId, String courseName,String userName, String review,String evaluate,HttpSession session, HttpServletRequest req,
        HttpServletResponse response) throws IOException{
        String message = "评论失败";
        User loginUser = (User)session.getAttribute("loginUser") ;
        if(loginUser==null){
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print("请登陆后评论");
        }
        Review insert = new Review();
        insert.setCourseId(courseId);
        insert.setCourseName(courseName);
        insert.setUserName(userName);
        insert.setReview(SensitiveAnalys.word_analys(review));
        insert.setDate(CurDate.now());
        insert.setEvaluate(evaluate);
        if(reviewmapper.insert(insert) == 1){
            message = "评论成功";
        }else{
            message = "评论失败";
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }
    @RequestMapping(value = "selectcourse")
    public void selectCourse (int courseid, String coursename,int userid, String username,HttpSession session, HttpServletRequest req,
    HttpServletResponse response) throws IOException{
        String message = "加入课程失败";
        User loginUser = (User)session.getAttribute("loginUser") ;
        Select_Course insert = new Select_Course();
        insert.setCourseId(courseid);
        insert.setCourseName(coursename);
        insert.setUserId(userid);
        insert.setUserName(username);
        if(select_coursemapper.insert(insert) == 1){
            message = "加入课程成功";
        }else{
            message = "加入课程失败";
        }
        if(loginUser!=null){
            List<Integer> courseIds = select_coursemapper.selectByuserId(loginUser.getId());
            List<Course> mycourses = new ArrayList<Course>();
            for(int i =0;i<courseIds.size();i++){
                Course course = courseMapper.queryCourseById(courseIds.get(i));
                mycourses.add(course);
            }
            session.setAttribute("mycourses",mycourses);
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }
    @RequestMapping(value = "withdrawcourse")
    public void withdrawCourse(int courseid, int userid, HttpSession session,HttpServletResponse response, HttpServletRequest req) throws IOException {
        String message = "撤销课程失败";
        User loginUser = (User)session.getAttribute("loginUser") ;
        Select_Course param = new Select_Course();
        param.setUserId(userid);
        param.setCourseId(courseid);
        if(select_coursemapper.deleteByPrimaryId(param) == 1){
            message = "撤销课程成功";
        }else{
            message = "撤销课程失败";
        }
        if(loginUser!=null){
            List<Integer> courseIds = select_coursemapper.selectByuserId(loginUser.getId());
            List<Course> mycourses = new ArrayList<Course>();
            for(int i =0;i<courseIds.size();i++){
                Course course = courseMapper.queryCourseById(courseIds.get(i));
                mycourses.add(course);
            }
            session.setAttribute("mycourses",mycourses);
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print(message);
    }
    @RequestMapping(value = "querycourse")
    public String queryCourse(String search, HttpSession session,  Map map){
        List<Course> courses;
        List<Integer> school = new ArrayList<Integer>();
        session.removeAttribute("courses");
        map.remove("newcourses");
        session.removeAttribute("search");
        session.removeAttribute("school");
        if(search != null){
            courses =(List<Course>)courseMapper.queryCourseBySearch(search);
        }else{
            courses =(List<Course>)courseMapper.queryCourseAll();
        }
        school = listslide.listslideinitial(courses);
        school = listslide.listslideinitial(courses);
        session.setAttribute("courses", courses);
        map.put("newcourses", courses);
        session.setAttribute("search", search);
        session.setAttribute("school",school);
        return "course_list";
    }

    @RequestMapping(value = "querycourseByTag")
    public String queryCourseByTag(String search1, HttpSession session,  Map map){
        List<Course> courses;
        List<Integer> school = new ArrayList<Integer>();
        session.removeAttribute("school");
        String search = (String) session.getAttribute("search");
        if(search == null){
            search = "%%";
        }
        Course course =new Course();
        course.setName(search);
        course.setType(search1);
        courses =(List<Course>)courseMapper.queryCourseByTag(course);
        school = listslide.listslideinitial(courses);
        session.setAttribute("courses", courses);
        map.put("newcourses", courses);
        session.setAttribute("school",school);
        return "course_list";
    }
    @RequestMapping(value = "querycourseBySchool")
    public String querycourseBySchool(String search, HttpSession session,  Map map){
        List<Course> courses =(List<Course>)session.getAttribute("courses");
        List<Course> newcourses = new ArrayList<Course>();
        map.remove("newcourses");
        if(search == null){
            return "course_list";
        }else if(search =="其他"){
            for(int i=0;i<courses.size();i++) {
                if (courses.get(i).getSchool() == null) {
                    newcourses.add(courses.get(i));
                }
            }
        }else{
            for(int i=0;i<courses.size();i++){
                if (search.equals(courses.get(i).getSchool())) {
                    newcourses.add(courses.get(i));
                }
        }

        }
        map.put("newcourses", newcourses);
        return "course_list";
    }
    @RequestMapping(value = "course_info")
    // 单课程主页
    public String Course_info(int id, HttpSession session, Map map) {
        User loginUser = (User) session.getAttribute("loginUser");
        if(loginUser != null) {
            Select_Course param = new Select_Course();
            param.setUserId(loginUser.getId());
            param.setCourseId(id);
            String select = select_coursemapper.selectByPrimaryId(param);
            System.out.println(select);
            if (select == null) {
                map.put("isSelect", false);
            } else {
                map.put("isSelect", true);
            }
        }
        List<Review> reviews = (List<Review>) reviewmapper.selectByCourseId(id);
        map.put("reviews",reviews);
        Course course = courseMapper.queryCourseById(id);
        map.put("course", course);
        return "course_info";

    }
    @RequestMapping(value = "learncourse")
    public String learnCourse(HttpSession session, Map map){
        User loginUser = (User)session.getAttribute("loginUser");
        if (loginUser == null) {
            return "login";
        }
        List<Course> mycourses = (List<Course>)session.getAttribute("mycourses");
        if(mycourses == null){
            mycourses = new ArrayList<Course>();
            List<Integer> courseIds = select_coursemapper.selectByuserId(loginUser.getId());
            for(int i =0;i<courseIds.size();i++){
                Course course = courseMapper.queryCourseById(courseIds.get(i));
                mycourses.add(course);
            }
            session.setAttribute("mycourses",mycourses);
        }
        return "learn_course";

    }
    @RequestMapping(value = "login")
    public String login(User user, HttpSession session, HttpServletRequest req){
        User loginUser = userMapper.queryUser(user);
        if(loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "redirect:index";
        }else{
            return "login";
        }

    }
    @RequestMapping(value = "logout")
    public String logout( HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        if(loginUser == null){
            return "login";
        }else{
            session.invalidate();
            return "redirect:index";
        }
    }
    @RequestMapping(value = "regist")
    public String register(User user, HttpSession session, HttpServletRequest req){
        User loginUser = userMapper.queryUser(user);
        if(loginUser == null) {
            userMapper.insertUser(user);
            session.setAttribute("loginUser", user);
            return "index";
        }else{
            return "regist";
        }

    }

    @RequestMapping(value = "varcodecheck")//验证码验证
    public void varcodecheck(String varcode, HttpSession session, HttpServletResponse res) throws IOException {
        res.setCharacterEncoding("utf-8");
        PrintWriter pw = res.getWriter();
        String var = (String) session.getAttribute("varcodenumber");
        if(!var.equals(varcode)){
            pw.write("0");
        }
    }

    @RequestMapping(value = "createvarcode")//验证码验证
    public void createvarcode(HttpSession session,HttpServletResponse res) throws IOException {
        String varcodenumber = VarCode.VarCode(res.getOutputStream());
        session.setAttribute("varcodenumber",varcodenumber);
    }
    @RequestMapping(value = "historyrecord")//记录学习历史
    public void historyrecord(int courseId,int userId,HttpSession session,HttpServletResponse res) throws IOException {
        User loginUser = (User)session.getAttribute("loginUser");
        History param = new History();
        param.setUserId(userId);
        param.setCourseId(courseId);
        param.setDay(CurDate.today());
        History flag = historyMapper.selecttime(param);
        if(flag == null){
            param.setTime(5);
            historyMapper.insert(param);
        }else{
            param.setTime(flag.getTime()+5);
            historyMapper.update(param);
        }
    }
    @RequestMapping(value = "echart")//验证码验证
    public void echart(HttpSession session,HttpServletResponse res) throws IOException {
        res.setCharacterEncoding("utf-8");
        PrintWriter pw = res.getWriter();
        User loginUser = (User)session.getAttribute("loginUser");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd/");
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyMMdd");
        Date date= new Date();
        String curdate = formatter.format(date);
        String path="D:\\Document\\Course_Manage\\src\\main\\webapp\\style/json/"+curdate+loginUser.getUsername()+".json";
        String jsonStrExist = JsonUtil.readJsonFile(path);
        if(jsonStrExist!=null){
            pw.write(jsonStrExist);
            return;
        }
        JSONObject root=new JSONObject();
        JSONArray xAxis=new JSONArray();
        JSONArray series=new JSONArray();
        JSONObject data=new JSONObject();
        for(int i = 7 ;i>0;i--){
            Calendar calendar=Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY,-(24*i));
            String pastDate=dateFormat.format(calendar.getTime());
            xAxis.add(pastDate);
        }
        data.put("xAxis",xAxis);
        List<Select_Course> myselect = (List<Select_Course>)select_coursemapper.selectByUserId(loginUser.getId());
        Iterator<Select_Course> iterator = myselect.iterator();
        while(iterator.hasNext()){
            Select_Course select = iterator.next();
            JSONObject sery =new JSONObject();
            sery.put("name",select.getCourseName());
            sery.put("type","line");
            sery.put("stack","总量");
            JSONObject areaStyle =new JSONObject();
            areaStyle.put("type","default");
            JSONObject normal =new JSONObject();
            normal.put("areaStyle",areaStyle);
            JSONObject itemStyle =new JSONObject();
            itemStyle.put("normal",normal);
            sery.put("itemStyle",itemStyle);
            JSONArray timedata=new JSONArray();
            for(int i = 7 ;i>0;i--){
                Calendar calendar=Calendar.getInstance();
                calendar.set(Calendar.HOUR_OF_DAY,-(24*i));
                String pastDate=dateFormat.format(calendar.getTime());
                History param = new History();
                param.setCourseId(select.getCourseId());
                param.setUserId(select.getUserId());
                param.setDay(pastDate);
                History time = historyMapper.selecttime(param);
                if(time == null)
                    timedata.add(0);
                else timedata.add(time.getTime());
            }
            sery.put("data",timedata);
            series.add(sery);
        }
        data.put("series",series);
        root.put("code",0);
        root.put("result",true);
        root.put("messge","success");
        root.put("data",data);
        String jsonStr = JsonUtil.formatJson(root.toString());
        JsonUtil.writeJsonFile(jsonStr,path);
        pw.write(jsonStr);

    }




}
