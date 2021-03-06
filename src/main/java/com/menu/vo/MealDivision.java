package com.menu.vo;


import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Setter
@Getter
public class MealDivision {//순서2
    //요일과 레시피
    //식단이 해당 요일에 없으면 null
    List<MenuRecipe> recipeListMon = new ArrayList<>();//월 + 레시피
    List<MenuRecipe> recipeListTue = new ArrayList<>();
    List<MenuRecipe> recipeListWed = new ArrayList<>();
    List<MenuRecipe> recipeListThu = new ArrayList<>();
    List<MenuRecipe> recipeListFri = new ArrayList<>();
    List<MenuRecipe> recipeListSat = new ArrayList<>();
    List<MenuRecipe> recipeListSun = new ArrayList<>();//일 + 레시피
}
