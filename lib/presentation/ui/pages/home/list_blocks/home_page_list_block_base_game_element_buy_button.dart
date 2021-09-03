import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageListBlockBaseGameElementBuyButton extends StatelessWidget {
  final String text;
  final String hyperlinkUrl;
  final bool isHeader;
  const HomePageListBlockBaseGameElementBuyButton({required this.text, required this.hyperlinkUrl, required this.isHeader});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 90,
      decoration: isHeader ? null : BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppThemeColors.green),
      child: isHeader
          ? Text(text, style: AppThemeText.buttonLabel(), textAlign: TextAlign.center)
          : TextButton(
              child: Text(text, style: AppThemeText.buttonLabel(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              style: AppButtonTheme.makeButtonStylePrimary(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0)).copyWith(shape: AppButtonTheme.setButtonRadius(radius: 30)),
              onPressed: () async {
                if (hyperlinkUrl.isNotEmpty && await canLaunch(hyperlinkUrl) == true) {
                  await launch(hyperlinkUrl);
                }
              },
            ),
    );
  }
}
