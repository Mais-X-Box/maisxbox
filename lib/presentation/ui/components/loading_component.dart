import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';

class LoadingComponent extends StatelessWidget {
  final EdgeInsets? padding;
  final double size;
  final Color? color;
  LoadingComponent({this.padding, this.size = 36, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 40, bottom: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: this.size,
              height: this.size,
              child: SpinKitCircle(color: this.color ?? AppThemeColors.yellow, size: size),
            ),
          ],
        ),
      ),
    );
  }
}
