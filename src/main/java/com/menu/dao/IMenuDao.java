package com.menu.dao;

import com.menu.vo.MenuDBVO;
import com.menu.vo.SearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface IMenuDao {

    public ArrayList<MenuDBVO> selectMenuListTest();

    public ArrayList<MenuDBVO> selectMenuList(SearchVO vo);
}
