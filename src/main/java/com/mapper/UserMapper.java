package com.mapper;

import com.pojo.User;

/**
 * @author zht
 * @date 2020/10/20 15:56
 */

public interface UserMapper{
    public abstract User login(User user);
    public abstract User selectByName(String act_name);
}
