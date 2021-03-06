package com.course_manage.Mappers;

import com.course_manage.entity.User;
import java.util.List;

public interface UserMapper {

    /**
     * 根据id查询用户信息
     *
     * @param id
     * @return
     */
    public User queryUser(User user);
    public User queryUserById(int id);

    /**
     * 查询所有用户信息
     *
     * @return
     */
    public List<User> queryUserAll();

    /**
     * 新增用户
     *
     * @param user
     */
    public  int insertUser(User user);

    /**
     * 更新用户信息
     *
     * @param user
     */
    public int updateUser(User user);

    /**
     * 根据id删除用户信息
     *
     * @param id
     */
    public int deleteUser(int id);
}
