import 'package:flutter/material.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_header.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_header_message.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_menu.dart';
import 'package:maisxbox/presentation/ui/pages/home/components/home_page_sub_header.dart';
import 'package:maisxbox/presentation/ui/pages/home/list_blocks/home_page_list_block_deals_with_gold.dart';
import 'package:maisxbox/presentation/ui/pages/home/list_blocks/home_page_list_block_xbox_store.dart';
import 'package:maisxbox/presentation/ui/theme/app_theme_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'partner/home_page_partners.dart';

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
        child: Column(
          children: [
            HomePageHeader(),
            HomePageMenu(),
            HomePageHeaderMessage(),
            HomePageSubHeader(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).copyWith(right: 0),
                        child: HomePageListBlockXboxStore(presenter: this.widget.presenter),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25).copyWith(right: 0),
                        child: HomePageListBlockDealsWithGold(presenter: this.widget.presenter),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 120),
                  width: 250,
                  child: HomePagePartners(this.widget.presenter),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
