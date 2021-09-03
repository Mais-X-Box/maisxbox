import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppThemeColors.white, AppThemeColors.black],
          stops: [0, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CachedNetworkImage(imageUrl: AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.cover),
    );
  }
}