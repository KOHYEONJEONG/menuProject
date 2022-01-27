package com.menu.service;

import com.menu.vo.MenuDBVO;
import com.menu.vo.SearchVO;

import java.util.ArrayList;

public interface IMenuService {

    public ArrayList<MenuDBVO> selectMenuListTest();

    public ArrayList<MenuDBVO> selectMenuList(SearchVO vo);

}
