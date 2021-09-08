import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
//import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';

class HomePageSubHeader extends StatelessWidget {
  const HomePageSubHeader();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   constraints: BoxConstraints(maxHeight: 230),
    //   color: AppThemeColors.black,
    //   child: CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? ""),
    // );
    return CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? "", fit: BoxFit.contain);
  }
}
