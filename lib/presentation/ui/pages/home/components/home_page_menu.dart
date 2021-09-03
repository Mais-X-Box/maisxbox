import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_menu_item.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_menu_social.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePageMenu extends StatelessWidget {
  const HomePageMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppThemeColors.black,
      padding: AppTheme.defaultPaddingHorizontal.copyWith(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              HomePageMenuItem(text: "Início", width: 30, isSelected: false, applySpace: false),
              //HomePageMenuItem(text: "Contato", width: 45, hyperlinkUrl: Uri(scheme: 'mailto', path: 'email@gmail.com', query: 'subject=Olá!&body=Em que posso te ajudar?').toString()),
            ],
          ),
          HomePageMenuSocial(),
        ],
      ),
    );
  }
}
