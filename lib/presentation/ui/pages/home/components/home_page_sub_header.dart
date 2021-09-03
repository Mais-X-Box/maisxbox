import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';

class HomePageSubHeader extends StatelessWidget {
  const HomePageSubHeader();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? "");
  }
}
