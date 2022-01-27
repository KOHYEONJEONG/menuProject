package com.menu.controller;

import com.menu.service.IMenuService;
import com.menu.service.MenuServiceImpl;
import com.menu.vo.MenuDBVO;
import com.menu.vo.SearchVO;
import com.menu.vo.WeekMenuTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class MenuController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    IMenuService service;

    
    @RequestMapping("/searchMenu.do")
    public String searchMenu(){
        return "searchMenu";
    }

    @RequestMapping("/printMenu.do")
    public String printMenu(Model model, SearchVO vo){
        logger.info("getStartDate ---"+vo.getStartDate()+vo.getEndDate()+vo.getMealName());

        MenuServiceImpl menuServiceImpl = new MenuServiceImpl();//메소드 사용하려고

        ArrayList<MenuDBVO> menuVo = service.selectMenuList(vo);

        logger.info("menuVo : "+menuVo.get(0));

        WeekMenuTable weekMenuTable = menuServiceImpl.getTable(vo,menuVo);

        model.addAttribute("weekMenuTable",weekMenuTable);

        return "printMenu";
    }

    @RequestMapping("/printMenuTest.do")
    public String printMenu(Model model){

      /*  MenuServiceImpl menuServiceImpl = new MenuServiceImpl();//메소드 사용하려고

        ArrayList<MenuDBVO> menuVo = service.selectMenuListTest();

        WeekMenuTable weekMenuTable = menuServiceImpl.getTable(menuVo);

        model.addAttribute("weekMenuTable",weekMenuTable);*/

        return "printMenuTest";
    }

    
}
