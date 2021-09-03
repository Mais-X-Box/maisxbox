import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageMenu extends StatelessWidget {
  const HomePageMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
