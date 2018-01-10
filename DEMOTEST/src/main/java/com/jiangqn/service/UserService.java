package com.jiangqn.service;

import com.jiangqn.model.User;

public interface UserService {
    User login(String a, String b);
    User register_sel(String a,String b);
    int register_ins(String a,String b,String c);
    int revisepass(String a,String b);
    int changeuser(String a,String b,String c);

}
