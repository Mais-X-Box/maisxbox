import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/pages/home/list_blocks/home_page_list_block_base_game_element_buy_button.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageListBlockBaseGameElement extends StatelessWidget {
  final String? name;
  final String? priceOriginal;
  final String? priceFinal;
  final String? buy;
  final String? hyperlinkUrl;
  final bool isHeader;
  final bool isLastItem;
  const HomePageListBlockBaseGameElement({required this.name, required this.priceOriginal, required this.priceFinal, required this.buy, this.hyperlinkUrl, this.isHeader = false, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(name ?? "", style: AppThemeText.bodyP(), overflow: TextOverflow.ellipsis)),
              Container(
                width: 85,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(priceOriginal ?? "", style: AppThemeText.bodyP(), textAlign: TextAlign.center),
              ),
              Container(
                width: 85,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(priceFinal ?? "", style: AppThemeText.bodyP(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ),
              HomePageListBlockBaseGameElementBuyButton(text: buy ?? "", hyperlinkUrl: hyperlinkUrl ?? "", isHeader: isHeader),
            ],
          ),
          if (isHeader == false && isLastItem == false)
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Divider(thickness: 1),
            ),
        ],
      ),
    );
  }
}
