import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/home_page.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/orders_mobile.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/products_mobile.dart';
import 'package:srihari_medicals/presentation/ui/home/mobile/cart_mobile.dart';
import 'package:srihari_medicals/presentation/providers/mobile/mHome_provider.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Consumer<MobileHomeProvider>(builder: (context, prov, child) {
            switch (prov.selectedIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const ProductsMobile();
              case 2:
                return const OrdersMobile();
              case 3:
                return const CartMobile();
              default:
                return const HomePage();
            }
          }),
          Container(
            height: context.height * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Colors.grey.withOpacity(0.5))),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.width * 0.1),
                    topRight: Radius.circular(context.width * 0.1))),
            alignment: Alignment.center,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BuildNavigationIcon(
                    iconData: Icons.home,
                    navigationIndex: 0,
                    navigationName: 'Home'),
                _BuildNavigationIcon(
                    iconData: FontAwesomeIcons.listUl,
                    navigationIndex: 1,
                    navigationName: 'Products'),
                _BuildNavigationIcon(
                    iconData: FontAwesomeIcons.book,
                    navigationIndex: 2,
                    navigationName: 'Orders'),
                _BuildNavigationIcon(
                    iconData: FontAwesomeIcons.cartShopping,
                    navigationIndex: 3,
                    navigationName: 'Cart'),
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     // color: Colors.white,
      //     // height: context.height * 0.05,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         _BuildNavigationIcon(
      //             iconData: Icons.home,
      //             navigationIndex: 0,
      //             navigationName: 'Home'),
      //         _BuildNavigationIcon(
      //             iconData: FontAwesomeIcons.listUl,
      //             navigationIndex: 1,
      //             navigationName: 'Products'),
      //         _BuildNavigationIcon(
      //             iconData: FontAwesomeIcons.book,
      //             navigationIndex: 2,
      //             navigationName: 'Orders'),
      //         _BuildNavigationIcon(
      //             iconData: FontAwesomeIcons.idBadge,
      //             navigationIndex: 3,
      //             navigationName: 'Profile'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class _BuildNavigationIcon extends StatelessWidget {
  final IconData iconData;
  final String navigationName;
  final int navigationIndex;
  const _BuildNavigationIcon({
    super.key,
    required this.iconData,
    required this.navigationName,
    required this.navigationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MobileHomeProvider>(builder: (context, prov, child) {
      return InkWell(
        onTap: () => prov.onIndex(navigationIndex),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,
                size: context.width * 0.03,
                color: prov.selectedIndex == navigationIndex
                    ? context.lightGreen
                    : context.darkGreen),
            SizedBox(height: context.width * 0.01),
            Text(
              navigationName,
              style: GoogleFonts.roboto(
                  fontSize: context.width * 0.03,
                  fontWeight: prov.selectedIndex == navigationIndex
                      ? FontWeight.bold
                      : FontWeight.w500,
                  color: prov.selectedIndex == navigationIndex
                      ? context.lightGreen
                      : context.darkGreen),
            ),
          ],
        ),
      );
    });
  }
}
