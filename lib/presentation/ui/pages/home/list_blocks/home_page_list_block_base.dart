import 'package:flutter/material.dart';
import 'package:maisxbox/domain/entities/game/game_entity.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/components/loading_component.dart';
import 'package:maisxbox/presentation/ui/pages/home/list_blocks/home_page_list_block_base_game_element.dart';
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

  Widget makeGameLine(GameEntity? game) {
    Locale localePtBR = Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');

    return HomePageListBlockBaseGameElement(
      name: game?.name,
      priceOriginal: game?.priceOriginal?.formatCurrencyValue(localePtBR),
      priceFinal: game?.priceFinal?.formatCurrencyValue(localePtBR),
      buy: "Comprar",
    );
  }

  Widget makeGameHeader() {
    return HomePageListBlockBaseGameElement(name: "Jogo", priceOriginal: "De", priceFinal: "Por", buy: "Link", isHeader: true);
  }
}
