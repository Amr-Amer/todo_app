import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff5D9CEC);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color blackColor = Color(0xff303030);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color greyColor = Color(0xffA9A9A9);
  static Color backgroundLightColor = Color(0xffDFECDB);
  static Color backgroundDarkColor = Color(0xff1E1E1E);
  static Color primaryDarkColor = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundLightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: MyTheme.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor),
      bottomAppBarTheme: BottomAppBarTheme(
          color: MyTheme.whiteColor, shadowColor: MyTheme.whiteColor),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              side: BorderSide(width: 3, color: MyTheme.primaryColor))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 4))),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        titleSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: blackColor),
        titleMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: primaryColor),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryDarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: MyTheme.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 1,
          selectedItemColor: primaryColor,
          unselectedItemColor: whiteColor),
      bottomAppBarTheme: BottomAppBarTheme(
          color: MyTheme.backgroundDarkColor, shadowColor: MyTheme.whiteColor),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: backgroundDarkColor,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              side: BorderSide(width: 3, color: MyTheme.primaryColor))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: StadiumBorder(
            side: BorderSide(color: backgroundDarkColor, width: 4)),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),
        titleSmall: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: whiteColor),
        titleMedium: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: primaryColor),
      ));
}
