import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maisxbox/domain/entities/partner/partner_entity.dart';
import 'package:maisxbox/presentation/ui/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePagePartnerCard extends StatelessWidget {
  final PartnerEntity? partner;
  const HomePagePartnerCard(this.partner);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 140,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppThemeColors.black,
          image: DecorationImage(image: CachedNetworkImageProvider(partner?.logoUrl ?? ""), fit: BoxFit.cover),
        ),
      ),
      onTap: () async {
        if (await canLaunch(partner?.hyperlinkUrl ?? "")) {
          await launch(partner?.hyperlinkUrl ?? "");
        }
      },
    );
  }
}
