import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/font_constants.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/main.dart';
import 'package:srihari_medicals/presentation/providers/web/web_home_provider.dart';
import 'package:srihari_medicals/presentation/ui/products/web/products_web.dart';

import '../../../../core/util/constants.dart';

class HomePageTypes extends StatefulWidget {
  const HomePageTypes({super.key});

  @override
  State<HomePageTypes> createState() => _HomePageTypesState();
}

class _HomePageTypesState extends State<HomePageTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.08,
        color: context.bgGreen,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
        child: Consumer<WebHomeProvider>(builder: (context, whProv, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: whProv.homeData?.categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductsWeb(
                                categories: whProv.homeData!.categories,
                                selectedCategoryId: whProv
                                    .homeData!.categories[index].categoryId))),
                    child: _BuildText(
                        text: whProv.homeData!.categories[index].categoryName));
              });
        }));
  }
}

class WebSliverHomePageTypes extends StatefulWidget {
  const WebSliverHomePageTypes({super.key});

  @override
  State<WebSliverHomePageTypes> createState() => _WebSliverHomePageTypesState();
}

class _WebSliverHomePageTypesState extends State<WebSliverHomePageTypes> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          height: context.height * 0.11,
          color: context.bgGreen,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
          child: Consumer<WebHomeProvider>(builder: (context, whProv, child) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: whProv.homeData?.categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductsWeb(
                                  categories: whProv.homeData!.categories,
                                  selectedCategoryId: whProv.homeData!
                                      .categories[index].categoryId))),
                      child: _BuildText(
                          text:
                              whProv.homeData!.categories[index].categoryName));
                });
          })),
    );
  }
}

class _BuildText extends StatelessWidget {
  final String text;
  const _BuildText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.height * 0.03),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            color: context.appBarGreen,
            fontWeight: FontWeight.w700,
            fontSize: context.width * 0.009),
        // style: TextStyle(
        //     fontFamily: FontConstants.montserratBold,
        //     color: context.appBarGreen,
        //     fontWeight: FontWeight.w700,
        //     fontSize: context.width * 0.007),
      ),
    );
  }
}
