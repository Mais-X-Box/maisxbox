import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_text.dart';

class LoadingComponentWithText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsets? padding;
  final double spacingBetweenLoadinAndTitle;
  final double size;
  final Color? color;
  final Color? subtitleColor;
  final double? subtitleSize;
  LoadingComponentWithText({
    this.title,
    this.subtitle,
    this.padding,
    this.spacingBetweenLoadinAndTitle = 10,
    this.size = 36,
    this.color,
    this.subtitleColor,
    this.subtitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.only(top: 40, bottom: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: this.size, height: this.size, child: SpinKitCircle(color: this.color ?? AppThemeColors.yellow, size: size)),
              Column(
                children: [
                  SizedBox(height: spacingBetweenLoadinAndTitle),
                  if (title?.isNotEmpty == true)
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(title ?? "", style: AppThemeText.h2Plus(color: AppThemeColors.brown), textAlign: TextAlign.center),
                    ),
                  if (subtitle?.isNotEmpty == true) Text(subtitle ?? "", style: AppThemeText.message(color: subtitleColor ?? AppThemeColors.brownLight).copyWith(fontSize: this.subtitleSize), textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        ));
  }
}
