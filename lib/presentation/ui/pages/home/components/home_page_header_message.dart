import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageHeaderMessage extends StatelessWidget {
  const HomePageHeaderMessage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: AppTheme.defaultPaddingHorizontal,
        child: AutoSizeText(
          "Confira as ofertas da semana oficiais da Microsoft para o seu Xbox:",
          minFontSize: 4,
          style: AppThemeText.h2(),
          maxLines: 1,
        ),
      ),
    );
  }
}
