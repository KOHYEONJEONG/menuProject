package com.menu.service;

import com.menu.controller.HomeController;
import com.menu.dao.IMenuDao;
import com.menu.vo.MealDivision;
import com.menu.vo.MenuDBVO;
import com.menu.vo.MenuRecipe;
import com.menu.vo.WeekMenuTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    IMenuDao menuDao;

    @Override
    public ArrayList<MenuDBVO> selectMenuListTest() {
        return menuDao.selectMenuListTest();
    }

    @Override
    public ArrayList<MenuDBVO> selectMenuList(String restaurantNm, String startDate, String endDate, String mealNm) {
        return menuDao.selectMenuList(restaurantNm, startDate, endDate, mealNm);
    }

    public WeekMenuTable getTable(List<MenuDBVO> vo){
        WeekMenuTable weekMenuTable = new WeekMenuTable();//순서3

        //조식(월-일)
        MealDivision breakFast = new MealDivision();//순서2
        //중식(월-일)
        MealDivision lunch = new MealDivision();//순서2
        //석식(월-일)
        MealDivision dinner = new MealDivision();//순서2
        //간식(월-일)
        MealDivision snack = new MealDivision();//순서2

        weekMenuTable.setRestaurantName("여민관");
        weekMenuTable.setStartDate("2022-01-03");
        weekMenuTable.setEndDate("2022-01-07");

        //날짜 포맷
        DateFormat input = new SimpleDateFormat("E");//to월~일

        for(MenuDBVO menuDBVO : vo){
            Date date = menuDBVO.getMenuYmd();
            String toStringYmd = input.format(date);

            if(menuDBVO.getMealNm().equals("조식")){
                logger.info("조식------------------------------");
                //월-일
                division(toStringYmd,breakFast,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("중식")){
                logger.info("중식------------------------------");
                //월-일
                division(toStringYmd,lunch,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("석식")){
                logger.info("석식------------------------------");
                //월-일
                division(toStringYmd,dinner,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("간식")){
                logger.info("간식------------------------------");
                //월-일
                division(toStringYmd,snack,menuDBVO);
            }
        }

        weekMenuTable.getMdList().add(breakFast);
        weekMenuTable.getMdList().add(lunch);
        weekMenuTable.getMdList().add(dinner);
        weekMenuTable.getMdList().add(snack);

        return weekMenuTable;
    }


    public void division(String toStringYmd,MealDivision division, MenuDBVO menuDBVO){
        if(toStringYmd.equals("월")) {
            division.getRecipeListMon().add(new MenuRecipe(menuDBVO.getMenuNm(), menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("화")){
            division.getRecipeListTue().add(new MenuRecipe(menuDBVO.getMenuNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("수")) {
            division.getRecipeListWed().add(new MenuRecipe(menuDBVO.getMenuNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("목")) {
            division.getRecipeListThu().add(new MenuRecipe(menuDBVO.getMenuNm(),menuDBVO.getIngredientsNm()));
        } else if(toStringYmd.equals("금")) {
            division.getRecipeListFri().add(new MenuRecipe(menuDBVO.getMenuNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("토")) {
            division.getRecipeListSat().add(new MenuRecipe(menuDBVO.getMenuNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("일")) {
            division.getRecipeListSun().add(new MenuRecipe(menuDBVO.getMenuNm(), menuDBVO.getIngredientsNm()));
        }
    }
}
