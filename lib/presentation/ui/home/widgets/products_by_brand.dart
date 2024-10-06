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
  final brands = [
    {'Name': 'Evion', 'Path': AssetPaths.evion},
    {'Name': 'Nivea', 'Path': AssetPaths.nivea},
    {'Name': 'Revital', 'Path': AssetPaths.revital},
    {'Name': 'Volini', 'Path': AssetPaths.volini}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingRowWithButtons(
              title: 'Products By Brand', buttonColor: context.buttonCreamBg),
          SizedBox(height: context.height * 0.05),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                height: context.height * 0.30,
                margin: EdgeInsets.only(right: context.width * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
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
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(brands[index]['Path']!,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            height: context.height * 0.1,
                            alignment: Alignment.center)
                      ],
                    ),
                    // SizedBox(height: context.height * 0.03),
                    // Text(
                    //   textAlign: TextAlign.center,
                    //   brands[index]['Name']!,
                    //   style: context.titleStyle.copyWith(
                    //       color: Color.fromRGBO(26, 32, 44, 1),
                    //       fontSize: context.width * 0.02),
                    // )
                  ],
                ),
              );
            },
          )),
          // SizedBox(height: context.height * 0.05)
          // const GreenButton(buttonName: 'View All')
        ],
      ),
    );
  }
}
