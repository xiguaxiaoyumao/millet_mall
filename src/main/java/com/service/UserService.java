package com.service;

import com.mapper.UserMapper;

import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zht
 * @date 2020/10/20 16:04
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(User user) {
        User user1 = userMapper.login(user);
        return user1;
    }

    public User selectByName(String act_name) {
        return userMapper.selectByName(act_name);
    }
}
