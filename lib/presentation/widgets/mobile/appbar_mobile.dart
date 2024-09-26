import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/app/routing/mobile/mobile_routes.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';
import 'package:srihari_medicals/presentation/providers/mobile/mHome_provider.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
        padding: EdgeInsets.only(
            top: context.padding.top,
            left: context.width * 0.02,
            right: context.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetPaths.shLogo,
              height: context.height * 0.06,
              filterQuality: FilterQuality.high,
            ),
            Consumer<MobileHomeProvider>(builder: (context, prov, child) {
              switch (prov.selectedIndex) {
                case 0:
                  return Text('Home', style: context.titleStyle);
                case 1:
                  return Text('Products', style: context.titleStyle);
                case 2:
                  return Text('Orders', style: context.titleStyle);
                case 3:
                  return Text('Cart', style: context.titleStyle);
                default:
                  return Text('Home', style: context.titleStyle);
              }
            }),
            InkWell(
              onTap: () => Navigator.pushNamed(context, MobileRoutes.profile),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.lightGreen)),
                  padding: EdgeInsets.all(context.width * 0.02),
                  child: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.black,
                    size: context.width * 0.04,
                  )),
            )
          ],
        ));
  }
}
