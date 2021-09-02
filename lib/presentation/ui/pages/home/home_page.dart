import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maisxbox/app/di/utils/app_config/app_config.dart';
import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/components/loading_component.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_text.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  HomePage(this.presenter);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.presenter.loadData();
    super.initState();
  }

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
                child: CachedNetworkImage(imageUrl: AppConfig.general.headerBannerPrincipalUrl ?? "", fit: BoxFit.cover),
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
              CachedNetworkImage(imageUrl: AppConfig.general.subHeaderBannerUrl ?? ""),
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
                                  child: Observer(
                                    builder: (_) {
                                      return this.widget.presenter.homeViewModel.isGamesLoading
                                          ? LoadingComponent()
                                          : ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: this.widget.presenter.homeViewModel.games.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    if (index == 0) Padding(padding: EdgeInsets.only(bottom: 10), child: makeGameHeader()),
                                                    makeGameLine(this.widget.presenter.homeViewModel.games[index]),
                                                  ],
                                                );
                                              },
                                            );
                                    },
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
                    padding: EdgeInsets.only(top: 120),
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
                        Observer(
                          builder: (_) {
                            return this.widget.presenter.homeViewModel.isPartnersLoading
                                ? LoadingComponent()
                                : ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: this.widget.presenter.homeViewModel.partners.length,
                                    itemBuilder: (context, index) {
                                      return makePartnerCard(this.widget.presenter.homeViewModel.partners[index]);
                                    },
                                  );
                          },
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

  Widget makePartnerCard(PartnerEntity? partner) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppThemeColors.black,
      ),
      child: Text(partner?.name ?? "", style: TextStyle(color: Colors.white)),
    );
  }

  Widget makeGameLine(GameEntity? game) {
    return _makeGameLineBase(
      name: game?.name,
      priceOriginal: "R\$ ${game?.priceOriginal?.toStringAsFixed(2)}",
      priceFinal: "R\$ ${game?.priceFinal?.toStringAsFixed(2)}",
      buy: "Comprar",
    );
  }

  Widget _makeGameLineBase({required String? name, required String? priceOriginal, required String? priceFinal, required String? buy, bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(child: Text(name ?? "", style: AppThemeText.bodyP(), overflow: TextOverflow.ellipsis)),
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(priceOriginal ?? "", style: AppThemeText.bodyP(), textAlign: TextAlign.center),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(priceFinal ?? "", style: AppThemeText.bodyP(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: isHeader ? null : BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppThemeColors.green),
            child: Text(buy ?? "", style: AppThemeText.buttonLabel(fontWeight: isHeader ? null : FontWeight.bold), textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget makeGameHeader() {
    return _makeGameLineBase(name: "Jogo", priceOriginal: "De", priceFinal: "Por", buy: "Link", isHeader: true);
  }
}
