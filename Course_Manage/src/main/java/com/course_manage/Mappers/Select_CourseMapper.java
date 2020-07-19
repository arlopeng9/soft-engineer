package com.course_manage.Mappers;

import com.course_manage.entity.Select_Course;

import java.util.List;

public interface Select_CourseMapper {
    int deleteByPrimaryId(Select_Course record);

    int insert(Select_Course record);

    List<Select_Course> select();

    List<Integer> selectByuserId(Integer userId);

    List<Select_Course> selectByUserId(Integer userId);

    List<Select_Course> selectBycourseId(Integer courseId);

    String selectByPrimaryId(Select_Course record);
}