package com.menu.service;

import com.menu.controller.HomeController;
import com.menu.dao.IMenuDao;
import com.menu.util.MenuPage;
import com.menu.vo.*;
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
    public ArrayList<MenuDBVO> selectMenuListTest() {//테스트
        return menuDao.selectMenuListTest();
    }

    @Override
    public ArrayList<MenuDBVO> selectMenuList(SearchData vo) {//메뉴 불러오기.
        return menuDao.selectMenuList(vo);
    }

    @Override
    public ArrayList<MenuCodeVo> selectCode() {//searchPrint.jsp에 식사구분, 식당이 포함된 공통코드테이블 넣어주려고.
        return menuDao.selectCode();
    }

    public WeekMenuTable getTable(SearchData searchData, List<MenuDBVO> vo){
         //조식(월-일)
        MealDivision breakFast = new MealDivision();//순서2
        //중식(월-일)
        MealDivision lunch = new MealDivision();//순서2
        //석식(월-일)
        MealDivision dinner = new MealDivision();//순서2
        //간식(월-일)
        MealDivision snack = new MealDivision();//순서2


        WeekMenuTable weekMenuTable = new WeekMenuTable(searchData.getRestaurantName(),searchData.getStartDate(),searchData.getEndDate());//순서3
        /*weekMenuTable.setRestaurantName(vo.getRestaurantName());
        weekMenuTable.setStartDate(vo.setStartDate(););
        weekMenuTable.setEndDate(endDate);*/

        //날짜 포맷
        DateFormat input = new SimpleDateFormat("E");

        for(MenuDBVO menuDBVO : vo){
            logger.info("-------------------" + menuDBVO.getYmd());
            Date date = menuDBVO.getYmd();
            String toStringYmd = input.format(date);

            if(menuDBVO.getMealNm().equals("조식")){
                logger.info("조식------------------------------");
                //월-일
                dayDivision(toStringYmd,breakFast,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("중식")){
                logger.info("중식------------------------------");
                //월-일
                dayDivision(toStringYmd,lunch,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("석식")){
                logger.info("석식------------------------------");
                //월-일
                dayDivision(toStringYmd,dinner,menuDBVO);

            }else if(menuDBVO.getMealNm().equals("간식")){
                logger.info("간식------------------------------");
                //월-일
                dayDivision(toStringYmd,snack,menuDBVO);
            }
        }

        weekMenuTable.getMdList().add(breakFast);
        weekMenuTable.getMdList().add(lunch);
        weekMenuTable.getMdList().add(dinner);
        weekMenuTable.getMdList().add(snack);

        return weekMenuTable;
    }


    public void dayDivision(String toStringYmd,MealDivision mealDivision, MenuDBVO menuDBVO){
        if(toStringYmd.equals("월")) {
            mealDivision.getRecipeListMon().add(new MenuRecipe(menuDBVO.getFoodNm(), menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("화")){
            mealDivision.getRecipeListTue().add(new MenuRecipe(menuDBVO.getFoodNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("수")) {
            mealDivision.getRecipeListWed().add(new MenuRecipe(menuDBVO.getFoodNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("목")) {
            mealDivision.getRecipeListThu().add(new MenuRecipe(menuDBVO.getFoodNm(),menuDBVO.getIngredientsNm()));
        } else if(toStringYmd.equals("금")) {
            mealDivision.getRecipeListFri().add(new MenuRecipe(menuDBVO.getFoodNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("토")) {
            mealDivision.getRecipeListSat().add(new MenuRecipe(menuDBVO.getFoodNm(),menuDBVO.getIngredientsNm()));
        }else if(toStringYmd.equals("일")) {
            mealDivision.getRecipeListSun().add(new MenuRecipe(menuDBVO.getFoodNm(), menuDBVO.getIngredientsNm()));
        }
    }

    public MenuPage paging(WeekMenuTable weekMenuTable){//페이징
        MenuPage mp = new MenuPage();

        //조식,중식,석식,

        return mp;
    }
}
