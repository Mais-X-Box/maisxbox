import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_text.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';

class AppButtonTheme {
  static ButtonStyle makeButtonStylePrimary({TextStyle? textStyle, EdgeInsetsGeometry? padding}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: AppThemeColors.green,
      primary: AppThemeColors.black,
      onSurface: AppThemeColors.brownLight, //Text color when the button is disabled
      minimumSize: Size(88, 52),
      textStyle: textStyle ?? null,
      padding: padding ?? EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ).copyWith(
      backgroundColor: _setButtonBackgroundColor(enabledColor: AppThemeColors.green, disabledColor: AppThemeColors.greenDisabled),
      overlayColor: _setButtonOverlayColor(enabledColor: AppThemeColors.greenLittleDark),
    );

    return buttonStyle;
  }

  static ButtonStyle makeButtonStyleLight({Color? textColor}) {
    return makeButtonStylePrimary(textStyle: AppThemeText.buttonLabel().copyWith(fontFamily: "CircularStd-Medium", fontSize: 16)).copyWith(
      foregroundColor: _setButtonBackgroundColor(enabledColor: textColor ?? AppThemeColors.brownDark.withOpacity(0.6), disabledColor: AppThemeColors.grayDark),
      backgroundColor: _setButtonBackgroundColor(enabledColor: AppThemeColors.gray, disabledColor: AppThemeColors.gray),
      overlayColor: _setButtonOverlayColor(enabledColor: AppThemeColors.grayDark),
    );
  }

  static ButtonStyle makeButtonStyleSecondary({TextStyle? textStyle, Color? textColor, Color? borderColor, Color? borderDisabledColor, Color? overlayColor}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      primary: textColor ?? AppThemeColors.white,
      backgroundColor: Colors.transparent,
      onSurface: AppThemeColors.brownLight, //Text color when the button is disabled
      minimumSize: Size(88, 52),
      textStyle: textStyle ?? AppThemeText.bodyP(),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    ).copyWith(
      backgroundColor: _setButtonBackgroundColor(enabledColor: Colors.transparent, disabledColor: Colors.transparent),
      overlayColor: _setButtonOverlayColor(enabledColor: overlayColor ?? AppThemeColors.green),
      side: _setButtonBorderSide(enabledColor: borderColor ?? AppThemeColors.white, disabledColor: borderDisabledColor ?? AppThemeColors.brownLight, borderWidth: 1), //Border
    );

    return buttonStyle;
  }

  static ButtonStyle makeButtonStyleTransparent({TextStyle? textStyle, Color? textColor, Color? borderColor, Color? borderDisabledColor, Color? overlayColor}) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      primary: textColor ?? AppThemeColors.white,
      backgroundColor: Colors.transparent,
      onSurface: AppThemeColors.brownLight, //Text color when the button is disabled
      padding: EdgeInsets.zero,
    ).copyWith(
        //backgroundColor: _setButtonBackgroundColor(enabledColor: Colors.transparent, disabledColor: Colors.transparent),
        //overlayColor: _setButtonOverlayColor(enabledColor: overlayColor ?? AppThemeColors.green),
        //side: _setButtonBorderSide(enabledColor: borderColor ?? AppThemeColors.white, disabledColor: borderDisabledColor ?? AppThemeColors.brownLight, borderWidth: 1), //Border
        );

    return buttonStyle;
  }

  static MaterialStateProperty<Color?> _setButtonBackgroundColor({required Color enabledColor, required Color disabledColor}) {
    return MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) return disabledColor;
      return enabledColor;
    });
  }

  static MaterialStateProperty<Color?> _setButtonOverlayColor({required Color enabledColor}) {
    return MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) return enabledColor;
      if (states.contains(MaterialState.hovered)) return enabledColor;
      if (states.contains(MaterialState.pressed)) return enabledColor;
      return null; // Defer to the button theme's default.
    });
  }

  static MaterialStateProperty<BorderSide?> _setButtonBorderSide({required Color enabledColor, required Color disabledColor, required double borderWidth}) {
    Color color;
    return MaterialStateProperty.resolveWith<BorderSide?>((Set<MaterialState> states) {
      color = (states.contains(MaterialState.disabled)) ? disabledColor : enabledColor;
      return BorderSide(color: color, width: borderWidth);
    });
  }

  static MaterialStateProperty<OutlinedBorder?> setButtonRadius({required double radius}) {
    return MaterialStateProperty.resolveWith<OutlinedBorder?>((Set<MaterialState> states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))); // Defer to the button theme's default.
    });
  }
}
