
import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/heading_row.dart';

import 'common_widgets.dart';

class ProductsByBrand extends StatefulWidget {
  const ProductsByBrand({super.key});

  @override
  State<ProductsByBrand> createState() => _ProductsByBrandState();
}

class _ProductsByBrandState extends State<ProductsByBrand> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadingRowWithButtons(
              title: 'Products By Brand', buttonColor: context.buttonCreamBg),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: 12,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    // color: Colors.teal,
                    height: context.height * 0.30,
                    // width: context.width * 0.25,
                    margin: EdgeInsets.only(right: context.width * 0.06),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(36.0),
                          child: Container(
                            height: context.height * 0.25,
                            width: context.width * 0.15,
                            decoration: BoxDecoration(
                              color: context.buttonCreamBg,
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                            // padding: EdgeInsets.all(12.0),
                            // alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.03),
                            child: Container(
                              height: context.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              // child:
                              // child: Image.asset(
                              //   AssetPaths.nutrition,
                              //   filterQuality: FilterQuality.high,
                              //   fit: BoxFit.cover,
                              //   height: context.height * 0.09,
                              //   width: double.maxFinite,
                              // ),
                            ),
                          ),
                        ),
                        Text(
                          '\nEvion',
                          style:
                              context.titleStyle.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Image.asset(AssetPaths.fitness,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      height: context.height * 0.1,
                      alignment: Alignment.center)
                ],
              );
            },
          )),
          const GreenButton(buttonName: 'View All')
        ],
      ),
    );
  }
}
