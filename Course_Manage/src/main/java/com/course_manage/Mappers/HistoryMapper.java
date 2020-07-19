package com.course_manage.Mappers;

import com.course_manage.entity.History;

import java.util.List;

public interface HistoryMapper {
    int delete(History record);

    int insert(History record);

    List<History> select();

    History selecttime(History record);

    int update(History record);
}
