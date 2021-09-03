import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maisxbox/presentation/presenters/home/home_presenter.dart';
import 'package:maisxbox/presentation/ui/components/loading_component.dart';
import 'package:maisxbox/presentation/ui/pages/home/partner/home_page_partner_card.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';

class HomePagePartners extends StatelessWidget {
  final HomePresenter presenter;
  const HomePagePartners(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            return this.presenter.homeViewModel.isPartnersLoading
                ? LoadingComponent()
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: this.presenter.homeViewModel.partners.length,
                    itemBuilder: (context, index) {
                      return HomePagePartnerCard(this.presenter.homeViewModel.partners[index]);
                    },
                  );
          },
        ),
      ],
    );
  }
}
