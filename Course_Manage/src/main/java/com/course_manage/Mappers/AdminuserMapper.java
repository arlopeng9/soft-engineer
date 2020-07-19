package com.course_manage.Mappers;

import com.course_manage.entity.Adminuser;
import com.course_manage.entity.User;

import java.util.List;

public interface AdminuserMapper {
    int deleteAdmin(int id);

    int insertAdmin(Adminuser record);

    Adminuser queryAdmin(Adminuser admin);
    Adminuser queryAdminById(int id);

    List<Adminuser> queryAdminAll();

    int updateAdmin(Adminuser admin);
}