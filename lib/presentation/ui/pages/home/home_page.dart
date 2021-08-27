import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: Container(
        child: Column(
          children: [
            Image.network(AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.cover),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Confira as ofertas da semana oficiais da Microsoft para o seu Xbox:"),
              ),
            ),
            CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? ""),
          ],
        ),
      ),
    );
  }
}
