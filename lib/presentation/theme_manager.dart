import 'package:flutter/material.dart';
import 'package:mvvmproject/presentation/font_manager.dart';
import 'package:mvvmproject/presentation/styles_manager.dart';
import 'package:mvvmproject/presentation/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main Colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,

    //card view theme

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    //App bar theme
    appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        centerTitle: true,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s16)),
    //Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
        disabledColor: ColorManager.grey1),
    //Elevated Button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      textStyle: getRegularTextStyle(color: ColorManager.white),
      primary: ColorManager.primary,
    )),

    //Text theme
    textTheme: TextTheme(
      headline1: getSemiBoldTextStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      subtitle1: getMediumTextStyle(
          color: ColorManager.lightGrey, fontSize: FontSize.s14),
      caption: getRegularTextStyle(color: ColorManager.grey1),
      bodyText1: getRegularTextStyle(color: ColorManager.grey),
    ),

    //input decoration theme(text from field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      labelStyle: getSemiBoldTextStyle(color: ColorManager.darkGrey),
      hintStyle: getRegularTextStyle(color: ColorManager.grey1),
      errorStyle: getRegularTextStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.grey)),
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.error)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.primary)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorManager.primary)),
    ),
  );
}
