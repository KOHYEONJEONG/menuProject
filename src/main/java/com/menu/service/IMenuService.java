package com.menu.service;

import com.menu.vo.MenuDBVO;

import java.util.ArrayList;

public interface IMenuService {

    public ArrayList<MenuDBVO> selectMenuListTest();

    public ArrayList<MenuDBVO> selectMenuList(String restaurantNm, String startDate, String endDate, String mealNm);

}
