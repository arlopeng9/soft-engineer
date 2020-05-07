package com.course_manage;
import com.course_manage.Mappers.CourseMapper;
import com.course_manage.Mappers.UserMapper;
import com.course_manage.entity.Course;
import com.course_manage.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
public class Test {
            public static void main(String[] args) throws Exception {
                // 指定全局配置文件
                String resource = "mybatis-config.xml";
                // 读取配置文件
                InputStream inputStream = Resources.getResourceAsStream(resource);
                // 构建sqlSessionFactory
                SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
                // 获取sqlSession
                SqlSession sqlSession = sqlSessionFactory.openSession(true);
                try{
                    //操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
                     //第二个参数：指定传入sql的参数：这里是用户id
                    CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
                    Course course = new Course();
                    course.setId(2);
                    course.setName("计算机网络");
                    course.setContext("..");
                    course.setType("计算机");
                    course.setPrice("23");
                    course.setLabel("已加入");
                    course.setHour("13h");
                    mapper.insertCourse(course);
                    sqlSession.commit();
                    System.out.println(mapper.queryCourseAll());


//                try {
//                    // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
//                    // 第二个参数：指定传入sql的参数：这里是用户id
//                    UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//                    System.out.println(mapper.queryUserAll());
//                    User us = new User();
//                    us.setUsername("pyk");
//                    us.setPassword("pyj");
//                    us.setEmail("dsa");
//                    us.setAge(18);
//                    us.setSex("男");
//                    mapper.insertUser(us);
//                    sqlSession.commit();
//                    System.out.println(us.getId());
//                    System.out.println(mapper.queryUserAll());

                }finally {
                    sqlSession.close();
                }




    }
}
