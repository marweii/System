package com.jiangqn.service.impl;

import com.jiangqn.mapper.UsersMapper;
import com.jiangqn.model.User;
import com.jiangqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper usersMapper;
    @Override
    public User login(String a, String b) {
        return usersMapper.login(a,b);
    }
    public User register_sel(String a,String b) {
        return usersMapper.register_sel(a,b);
    }
    public int register_ins(String a,String b ,String c) {
        return usersMapper.register_ins(a,b,c);
    }

    @Override
    public int revisepass(String a, String b) {
        return usersMapper.revisepass(a,b);
    }

    @Override
    public int changeuser(String a, String b, String c) {
        return usersMapper.changeuser(a, b, c);
    }
}
