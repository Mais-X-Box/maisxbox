import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/components/loading_component.dart';
import 'package:maisxbox/utils/extensions/format_double_extension.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:mobx/mobx.dart';

class HomePageListBlockBase extends StatelessWidget {
  final HomePresenter presenter;
  final String title;
  final String subtitle;
  final bool isLoading;
  final ObservableList list;
  const HomePageListBlockBase({required this.presenter, required this.title, required this.subtitle, required this.isLoading, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppThemeColors.black),
          child: Text(title, style: AppThemeText.buttonLabel(color: AppThemeColors.green, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2, top: 8, bottom: 30),
          child: Text(subtitle, style: AppThemeText.h1()),
        ),
        this.isLoading
            ? LoadingComponent()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppThemeColors.gray),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(color: Colors.yellow, height: 40, width: 100),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        //itemCount: this.presenter.homeViewModel.games.length,
                        itemCount: this.list.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (index == 0) Padding(padding: EdgeInsets.only(bottom: 10), child: makeGameHeader()),
                              makeGameLine(this.list[index]),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ],
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

  Widget makeGameLine(GameEntity? game) {
    Locale localePtBR = Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');

    return _makeGameLineBase(
      name: game?.name,
      priceOriginal: game?.priceOriginal?.formatCurrencyValue(localePtBR),
      priceFinal: game?.priceFinal?.formatCurrencyValue(localePtBR),
      buy: "Comprar",
    );
  }

  Widget makeGameHeader() {
    return _makeGameLineBase(name: "Jogo", priceOriginal: "De", priceFinal: "Por", buy: "Link", isHeader: true);
  }

  String formatCurrencyValue(double? valor) {
    Locale currentLocale = Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');
    if (valor == null) return "";

    try {
      final formatter = NumberFormat.simpleCurrency(locale: currentLocale.languageCode);
      String totalValueFormatted = formatter.format(valor);
      return totalValueFormatted;
    } catch (e) {
      return this.toString();
    }
  }
}
