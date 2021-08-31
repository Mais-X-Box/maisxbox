import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config_general.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppThemeColors.white, AppThemeColors.black],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                //Image.network(AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.cover),//TODO voltar
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/maisxbox-bob.appspot.com/o/website%2Fbanner_principal.png?alt=media&token=34f1b766-c3fa-4592-ad21-75c00e748a1b", fit: BoxFit.contain),
              ),
              Container(
                width: double.infinity,
                color: AppThemeColors.black,
                padding: AppTheme.defaultPaddingHorizontal.copyWith(bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Início", style: AppThemeText.h3(color: AppThemeColors.white)),
                        Text("Contato", style: AppThemeText.h3(color: AppThemeColors.white)),
                      ],
                    ),
                    Text("Segue nóis:", style: AppThemeText.h3(color: AppThemeColors.green)),
                    //Text("Segue nóis:"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: AppTheme.defaultPaddingHorizontal,
                  child: Text("Confira as ofertas da semana oficiais da Microsoft para o seu Xbox:", style: AppThemeText.h1()),
                ),
              ),

              //CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? ""),//TODO voltar
              CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/maisxbox-bob.appspot.com/o/website%2Fbanner_promocao_far_cry_5.png?alt=media&token=5bc37015-bd7a-455f-8096-68a53be9ad97"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).copyWith(right: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppThemeColors.black,
                            ),
                            child: Text("Xbox Store", style: AppThemeText.buttonLabel(color: AppThemeColors.green, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2, top: 8, bottom: 30),
                            child: Text(AppConfig.general.xBoxStoreTituloTexto ?? "", style: AppThemeText.h1()),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppThemeColors.gray,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    color: Colors.yellow,
                                    height: 40,
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: Text("Jogo", style: AppThemeText.bodyP())),
                                          Text("De", style: AppThemeText.bodyP()),
                                          Text("Por", style: AppThemeText.bodyP(fontWeight: FontWeight.bold)),
                                          Text("Link", style: AppThemeText.bodyP()),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text("Asseto Corsa", style: AppThemeText.bodyP())),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 25),
                                              child: Text("R\$ 59,00", style: AppThemeText.bodyP()),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 25),
                                              child: Text("R\$ 11,80", style: AppThemeText.bodyP(fontWeight: FontWeight.bold)),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppThemeColors.green),
                                              child: Text("Comprar", style: AppThemeText.buttonLabel(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 132),
                    width: MediaQuery.of(context).size.width * 0.18,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppThemeColors.green,
                          ),
                          child: Text("Parceiros", style: AppThemeText.buttonLabel(), textAlign: TextAlign.center),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppThemeColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
