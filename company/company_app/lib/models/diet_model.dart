import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;


  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected
  });


static List<DietModel> getDiets(){
  List <DietModel> diets = [];

  diets.add(
    DietModel(name: 'Honey Pancake',
      iconPath: 'assets/honey-pancakes.svg',
      level: 'easy',
      duration: '30 min',
      calories: '180 kcal',
      viewIsSelected: true,
      boxColor: Color(0xff9DCEFF)
      )
  );

  diets.add(
    DietModel(name: 'canai Bread',
     iconPath: 'assets/canai-bread.svg',
      level: 'Easy',
       duration: '28 min',
        calories: '230 kcal',
         viewIsSelected: false,
         boxColor: Color(0xffEEA4CE)
         )
  );
  return diets;


}
}