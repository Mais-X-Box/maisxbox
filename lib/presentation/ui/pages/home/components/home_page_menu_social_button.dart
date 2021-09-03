import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageMenuSocialButton extends StatelessWidget {
  final String assetImage;
  final String hyperlinkUrl;
  const HomePageMenuSocialButton({required this.assetImage, required this.hyperlinkUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      margin: EdgeInsets.only(left: 15),
      child: TextButton(
        style: AppButtonTheme.makeButtonStyleTransparent(),
        child: Image.asset(this.assetImage, width: 15, height: 15),
        onPressed: () async {
          if (this.hyperlinkUrl.isNotEmpty && await canLaunch(this.hyperlinkUrl)) {
            await launch(this.hyperlinkUrl);
          }
        },
      ),
    );
  }
}
