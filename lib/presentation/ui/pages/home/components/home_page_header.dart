import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:maisxbox/presentation/ui/utils/target_platform_util.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      //constraints: BoxConstraints(maxHeight: 400),
      decoration: BoxDecoration(
        color: AppThemeColors.black,
        gradient: TargetPlatformUtil.isWebMobile
            ? null
            : LinearGradient(
                colors: [AppThemeColors.white, AppThemeColors.black],
                stops: [0.5, 0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      //child: CachedNetworkImage(imageUrl: AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.fitHeight),
      child: CachedNetworkImage(imageUrl: AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.contain),
    );
  }
}
