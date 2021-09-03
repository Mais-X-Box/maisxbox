import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageMenuItem extends StatelessWidget {
  final String text;
  final double width;
  final bool isSelected;
  final bool applySpace;
  final String? hyperlinkUrl;

  const HomePageMenuItem({required this.text, required this.width, this.isSelected = false, this.applySpace = true, this.hyperlinkUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.zero,
      margin: applySpace ? EdgeInsets.only(left: 15) : null,
      child: TextButton(
        style: AppButtonTheme.makeButtonStyleTransparent(),
        child: Align(alignment: Alignment.centerLeft, child: Text(text, style: AppThemeText.h3(color: isSelected ? AppThemeColors.green : AppThemeColors.white), textAlign: TextAlign.start)),
        onPressed: () async {
          if ((this.hyperlinkUrl ?? "").isNotEmpty && await canLaunch(this.hyperlinkUrl!)) {
            await launch(this.hyperlinkUrl!);
          }
        },
      ),
    );
  }
}
