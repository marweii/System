package com.jiangqn.service;

import com.jiangqn.model.BusCar;

import java.util.ArrayList;
import java.util.Date;

public interface BusCarService {
    int BusCar_ins(String id, String startstation, String endStation, String pay, String time1,String time2,String station);
    BusCar BusCar_sel(String id);
    ArrayList<String> BusCar_selAll();
    int BusCar_update(String id, String startstation, String endStation, String pay, String time1,String time2,String station);
    int BusCar_delete(String id);
    ArrayList<BusCar> BusCar_sel10(int page);
    ArrayList<BusCar> BusCar_select(String id, String startstation, String endStation, String pay, String time1,String time2,String station);
    ArrayList<String> BusCar_selectcount(String id, String startstation, String endStation, String pay, String time1,String time2,String station);
    ArrayList<BusCar> BusCar_selpage(int page,String id, String startstation, String endStation, String pay, String time1,String time2,String station);
}

