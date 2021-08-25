import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/app_button_theme.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_text.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';

class AppTheme {
  static final EdgeInsets defaultPadding = EdgeInsets.fromLTRB(30, 30, 30, 30);
  static final EdgeInsets defaultPaddingHorizontal = EdgeInsets.only(left: defaultPadding.left, right: defaultPadding.right);
  static final EdgeInsets defaultPaddingVertical = EdgeInsets.only(top: defaultPadding.top, bottom: defaultPadding.bottom);

  static final primaryColor = AppThemeColors.yellow;
  static final primaryColorDark = AppThemeColors.yellow;
  static final primaryColorLight = AppThemeColors.brownLight;

  static ThemeData makeAppTheme() {
    final textTheme = TextTheme(
      headline1: AppThemeText.h1(),
      headline2: AppThemeText.h2(),
      headline3: AppThemeText.h3(),
      headline5: AppThemeText.h5(),
      headline4: AppThemeText.inputLabel(),
      overline: AppThemeText.h2Plus(),
      caption: AppThemeText.inputLabel(),
      bodyText1: AppThemeText.bodyP(),
      button: AppThemeText.buttonLabel(),
      subtitle1: AppThemeText.inputText(),
    );

    final inputDecorationTheme = InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColorLight)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.grayDark)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.alert.withOpacity(0.5))),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemeColors.alert)),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      alignLabelWithHint: true,
    );

    return ThemeData(
      colorScheme: ColorScheme.light(primary: primaryColor, secondary: primaryColor),
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      //accentColor: primaryColor,
      backgroundColor: Colors.white,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      textButtonTheme: TextButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      outlinedButtonTheme: OutlinedButtonThemeData(style: AppButtonTheme.makeButtonStylePrimary()),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
