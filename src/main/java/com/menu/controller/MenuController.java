package com.menu.controller;

import com.menu.service.IMenuService;
import com.menu.service.MenuServiceImpl;
import com.menu.vo.MenuDBVO;
import com.menu.vo.WeekMenuTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String printMenu(Model model){



        MenuServiceImpl menuServiceImpl = new MenuServiceImpl();//메소드 사용하려고

        ArrayList<MenuDBVO> menuVo = service.selectMenuListTest();
        logger.info("데이터----------------------------------------------"+menuVo.get(0));

        WeekMenuTable weekMenuTable = menuServiceImpl.getTable(menuVo);

        model.addAttribute("weekMenuTable",weekMenuTable);

        return "printMenu";
    }
    
    
}