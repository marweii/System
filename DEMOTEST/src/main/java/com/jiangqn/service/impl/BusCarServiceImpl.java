package com.jiangqn.service.impl;

import com.jiangqn.mapper.BusCarMapper;
import com.jiangqn.model.BusCar;
import com.jiangqn.service.BusCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

@Service
public class BusCarServiceImpl implements BusCarService{
    @Autowired
    private BusCarMapper busCarMapper;
    @Override
    public int BusCar_ins(String id, String startstation, String endStation, String pay, String time1, String time2, String station) {
        return busCarMapper.BusCar_ins(id,startstation,endStation,pay,time1,time2,station);
    }

    @Override
    public BusCar BusCar_sel(String id) {
        return busCarMapper.BusCar_sel(id);
    }

    @Override
    public ArrayList<String> BusCar_selAll() {
        return busCarMapper.BusCar_selAll();
    }

    @Override
    public int BusCar_update(String id, String startstation, String endStation, String pay, String time1, String time2, String station) {
        return busCarMapper.BusCar_update(id,startstation,endStation,pay,time1,time2,station);
    }

    @Override
    public int BusCar_delete(String id) {
        return busCarMapper.BusCar_delete(id);
    }

    @Override
    public ArrayList<BusCar> BusCar_sel10(int page) {
        return busCarMapper.BusCar_sel10(page);
    }

    @Override
    public ArrayList<BusCar> BusCar_select(String id, String startstation, String endStation, String pay, String time1, String time2, String station) {
        return busCarMapper.BusCar_select(id,startstation,endStation,pay,time1,time2,station);
    }

    @Override
    public ArrayList<String> BusCar_selectcount(String id, String startstation, String endStation, String pay, String time1, String time2, String station) {
        return busCarMapper.BusCar_selectcount(id,startstation,endStation,pay,time1,time2,station);

    }

    @Override
    public ArrayList<BusCar> BusCar_selpage(int page, String id, String startstation, String endStation, String pay, String time1, String time2, String station) {
        return busCarMapper.BusCar_selpage(page,id,startstation,endStation,pay,time1,time2,station);
    }


}
