import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const Color mainColor=Colors.deepOrange;
const Color backGroundColor=Colors.white;
const Color darkBackGroundColor=Color(0XFF182430);

/*const Color darkGreyColor=Color(0xFF121212);
const Color pinkColor=Color(0xFFff4667);
const Color kColor1=Color(0xFF685959);
const Color kColor2=Color(0xFFADA79B);
const Color kColor3=Color(0xFFA5947F);
const Color kColor4=Color(0xFF738B71);
const Color kColor5=Color(0xFF6D454D);*/

/*const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);*/

class Themes{
  static final light=ThemeData(
      backgroundColor: backGroundColor,
      primaryColor: mainColor,
      brightness: Brightness.light
  );
  static final  dark=ThemeData(
      backgroundColor: darkBackGroundColor,
      primaryColor: mainColor,
      brightness: Brightness.dark
  );
}


//logic Theme
class ThemeController{
  GetStorage boxStorage=GetStorage();
  String keyBox='isDark';

  saveTheThemeInBox(bool changeTheme){
    boxStorage.write(keyBox, changeTheme);
  }

  bool getTheThemeInBox(){
    return boxStorage.read<bool>(keyBox)??false;
  }

  ThemeMode get themeMode=>getTheThemeInBox()?ThemeMode.dark:ThemeMode.light;

  changeTheTheme(){
    Get.changeThemeMode(getTheThemeInBox()?ThemeMode.light:ThemeMode.dark);
    saveTheThemeInBox(!getTheThemeInBox());
  }
}
