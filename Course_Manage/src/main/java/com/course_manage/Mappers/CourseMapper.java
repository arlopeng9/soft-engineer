package com.course_manage.Mappers;

import com.course_manage.entity.Course;

import java.util.List;

public interface CourseMapper {
    public Course queryCourseById(int id);

    public List<Course> queryCourseByName(String name);

    public List<Course> queryCourseByTag(Course course);

    public List<Course> queryCourseByType(String type);

    public List<Course> queryCourseByGrade(String grade);

    public List<Course> queryCourseBySchool(String school);

    public List<Course> queryCourseBySearch(String search);

    public List<Course> queryfavourate();
    public Course selectlastcourse();
    public List<Course> queryCourseAll();

    public int insertCourse(Course course);

    public int updateCourse(Course course);

    public int deleteCourse(int courseid);
}
