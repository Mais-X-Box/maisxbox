import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_menu_social_button.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageMenuSocial extends StatelessWidget {
  const HomePageMenuSocial();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Segue nóis:", style: AppThemeText.h3(color: AppThemeColors.green)),
        HomePageMenuSocialButton(assetImage: "lib/presentation/ui/assets/images/icons/instagram.png", hyperlinkUrl: AppConfig.urls.instagramUrl ?? ""),
        HomePageMenuSocialButton(assetImage: "lib/presentation/ui/assets/images/icons/youtube.png", hyperlinkUrl: AppConfig.urls.youtubeUrl ?? ""),
        HomePageMenuSocialButton(assetImage: "lib/presentation/ui/assets/images/icons/twitter.png", hyperlinkUrl: AppConfig.urls.twitterUrl ?? ""),
      ],
    );
  }
}
