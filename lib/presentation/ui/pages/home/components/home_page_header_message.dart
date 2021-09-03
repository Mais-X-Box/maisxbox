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
        child: Text("Confira as ofertas da semana oficiais da Microsoft para o seu Xbox:", style: AppThemeText.h2()),
      ),
    );
  }
}
