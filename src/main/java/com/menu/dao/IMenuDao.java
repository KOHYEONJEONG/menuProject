package com.menu.dao;

import com.menu.vo.MenuDBVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface IMenuDao {

    public ArrayList<MenuDBVO> selectMenuListTest();

    public ArrayList<MenuDBVO> selectMenuList(String restaurantNm, String startDate, String endDate, String mealNm);
}
