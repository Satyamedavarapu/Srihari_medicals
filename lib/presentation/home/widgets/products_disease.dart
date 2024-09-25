import 'package:flutter/material.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';
import 'package:srihari_medicals/presentation/home/widgets/heading_row.dart';
import 'package:srihari_medicals/util/asset_paths.dart';

import 'common_widgets.dart';

class ProductsDisease extends StatefulWidget {
  const ProductsDisease({super.key});

  @override
  State<ProductsDisease> createState() => _ProductsDiseaseState();
}

class _ProductsDiseaseState extends State<ProductsDisease> {
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
              title: 'Products Based on Disease',
              buttonColor: context.buttonCreamBg),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
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
                        padding: EdgeInsets.all(12.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetPaths.nutrition,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          height: context.height * 0.09,
                        ),
                      ),
                    ),
                    Text(
                      '\nDiabetes',
                      style: context.titleStyle.copyWith(color: Colors.black),
                    )
                  ],
                ),
              );
            },
          )),
          const GreenButton(buttonName: 'View All')
        ],
      ),
    );
  }
}
