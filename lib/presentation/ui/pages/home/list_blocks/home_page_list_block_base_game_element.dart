import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageListBlockBaseGameElement extends StatelessWidget {
  final String? name;
  final String? priceOriginal;
  final String? priceFinal;
  final String? buy;
  final bool isHeader;
  const HomePageListBlockBaseGameElement({required this.name, required this.priceOriginal, required this.priceFinal, required this.buy, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
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
}
