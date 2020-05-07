package com.course_manage.controller;

import com.course_manage.Mappers.CourseMapper;
import com.course_manage.Mappers.UserMapper;
import com.course_manage.entity.User;
import com.course_manage.tools.VarCode;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

@Controller
public class UserController {

    // 指定全局配置文件
    String resource = "mybatis-config.xml";
    // 读取配置文件
    InputStream inputStream = Resources.getResourceAsStream(resource);
    // 构建sqlSessionFactory
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    // 获取sqlSession
    SqlSession sqlSession = sqlSessionFactory.openSession(true);

    public UserController() throws IOException {}

    @RequestMapping(value = "index")
    public String welcome(){
        return "login";
    }

    @RequestMapping(value = "selectcourse")
    public void selectCourse(){

    }
    @RequestMapping(value = "withdrawcourse")
    public void withdrawCourse(){
    }
    @RequestMapping(value = "querycourse")
    public void queryCourse(){

    }
    @RequestMapping(value = "login")
    public String login(User user, HttpSession session, HttpServletRequest req){
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User loginUser = userMapper.queryUser(user);
        if(loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "index";
        }else{
            return "login";
        }

    }
    @RequestMapping(value = "register")
    public String register(User user, HttpSession session, HttpServletRequest req){
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User loginUser = userMapper.queryUser(user);
        userMapper.insertUser(user);
        if(loginUser != null) {
            session.setAttribute("loginUser", loginUser);
            return "index";
        }else{
            return "register";
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
}
