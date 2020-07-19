package com.course_manage.Mappers;

import com.course_manage.entity.Review;

import java.util.List;

public interface ReviewMapper {
    int deleteByPrimaryId(Integer id);

    int insert(Review review);

    List<Review> select();

    Review selectById(Integer id);

    List<Review> selectByCourseId(Integer courseId);

    int update(Review review);

    int updatecoursename(Review review);
}