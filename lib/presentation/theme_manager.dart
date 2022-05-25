import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main Colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor: ColorManager.grey1,

    accentColor:ColorManager.grey

    //cart view theme
    //App bar theme
    //Button theme
    //Text theme
    //input decoration theme(text from field)
  );
}