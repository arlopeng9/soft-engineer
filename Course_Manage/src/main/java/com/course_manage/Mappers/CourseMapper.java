package com.course_manage.Mappers;

import com.course_manage.entity.Course;

import java.util.List;

public interface CourseMapper {
    /**
     * 根据id查询课程信息
     *
     * @param id
     * @return
     */
    public Course queryCourseById(String id);

    /**
     * 查询所有课程信息
     *
     * @return
     */
    public List<Course> queryCourseAll();

    /**
     * 新增课程
     *
     * @param course
     */
    public void insertCourse(Course course);

    /**
     * 更新课程信息
     *
     * @param course
     */
    public void updateCourse(Course course);

    /**
     * 根据id删除课程信息
     *
     * @param id
     */
    public void deleteCourse(String id);
}
