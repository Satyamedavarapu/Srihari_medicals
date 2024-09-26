import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';

import 'common_widgets.dart';
import 'heading_row.dart';

class ExploreProductsPage extends StatefulWidget {
  final String title;
  const ExploreProductsPage({super.key, required this.title});

  @override
  State<ExploreProductsPage> createState() => _ExploreProductsPageState();
}

class _ExploreProductsPageState extends State<ExploreProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingRowWithButtons(
              buttonColor: context.buttonCreamBg, title: widget.title),
          SizedBox(height: context.height * 0.1),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: context.width * 0.05,
                    mainAxisSpacing: context.width * 0.05,
                    crossAxisCount: 4,
                    childAspectRatio: 1),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const BuildProductContainer();
                }),
          ),
          const GreenButton(buttonName: 'View All')
        ],
      ),
    );
  }
}

class BuildProductContainer extends StatelessWidget {
  const BuildProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.height * 0.35,
          width: context.width * 0.15,
          // color: Colors.lightGreen,
          // margin: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.buttonCreamBg,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetPaths.nutrition,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    height: context.height * 0.10,
                    width: context.width * 0.07,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          'Product Name',
                          style: context.titleStyle,
                        )),
                        // Expanded(
                        //   child: Row(
                        //     children: [
                        //       const Text('Add to Cart'),
                        //       Visibility(
                        //           visible: context.width > 800.0,
                        //           child: const Icon(Icons.shopping_cart))
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amberAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Baby Care',
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                        ),
                        const Text('150')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: context.height * 0.02,
          right: -context.width * 0.02,
          child: Container(
            decoration: BoxDecoration(
              color: context.redColor,
              borderRadius: BorderRadius.circular(21.0),
            ),
            // alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: Text(
              '20% OFF',
              style: context.buttonWhiteStyle,
            ),
          ),
        )
      ],
    );
  }
}
