import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/heading_row.dart';

import 'common_widgets.dart';

class ProductsDisease extends StatefulWidget {
  const ProductsDisease({super.key});

  @override
  State<ProductsDisease> createState() => _ProductsDiseaseState();
}

class _ProductsDiseaseState extends State<ProductsDisease> {
  final diseaseList = [
    {'Name': 'Diabetes', 'Path': AssetPaths.diabetes},
    {'Name': 'Cardiac', 'Path': AssetPaths.cardiac},
    {'Name': 'Liver', 'Path': AssetPaths.liver},
    {'Name': 'Stomach', 'Path': AssetPaths.stomach}
  ];

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
          // SizedBox(height: context.height * 0.05),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: diseaseList.length,
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
                        padding: const EdgeInsets.all(12.0),
                        alignment: Alignment.center,
                        child: Image.asset(
                          diseaseList[index]['Path']!,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          height: context.height * 0.09,
                        ),
                      ),
                    ),
                    Text(
                      '\n${diseaseList[index]['Name']}',
                      style: context.titleStyle.copyWith(color: Colors.black),
                    )
                  ],
                ),
              );
            },
          )),
          // SizedBox(height: context.height * 0.05),
          // const GreenButton(buttonName: 'View All')
        ],
      ),
    );
  }
}
