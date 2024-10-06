import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/preference_keys.dart';
import 'package:srihari_medicals/main.dart';
import 'package:srihari_medicals/presentation/common_widgets/cache_image.dart';
import 'package:srihari_medicals/presentation/providers/web/cart_provider_web.dart';
import '../../../../core/util/constants.dart';
import '../../../../data/models/web/home_model_web.dart';
import 'common_widgets.dart';
import 'heading_row.dart';

class ExploreProductsPage extends StatefulWidget {
  final String title;
  final List<ProductModel> products;
  final bool showMoreButtons, showViewAll;
  const ExploreProductsPage(
      {super.key,
      required this.title,
      required this.products,
      this.showMoreButtons = true,
      this.showViewAll = true});

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
          widget.showMoreButtons
              ? HeadingRowWithButtons(
                  buttonColor: context.buttonCreamBg, title: widget.title)
              : Text(
                  widget.title,
                  style: context.buttonWhiteStyle.copyWith(
                      color: Colors.black, fontSize: context.width * 0.02),
                ),
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
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return BuildProductContainer(
                    product: widget.products[index],
                  );
                }),
          ),
          SizedBox(height: context.height * 0.05),
          Visibility(
              visible: widget.showViewAll,
              child: const GreenButton(buttonName: 'View All'))
        ],
      ),
    );
  }
}

class BuildProductContainer extends StatefulWidget {
  final ProductModel product;
  const BuildProductContainer({super.key, required this.product});

  @override
  State<BuildProductContainer> createState() => _BuildProductContainerState();
}

class _BuildProductContainerState extends State<BuildProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: context.height * 0.35,
          width: context.width * 0.15,
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
                  child: BuildCachedNetworkImage(
                    networkImage: widget.product.productImage ?? '',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.productName,
                            style: context.titleStyle,
                          ),
                        ),
                        Text('${Constants.rupee} ${widget.product.price}',
                            style: context.titleStyle),
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
                            color: HexColor(
                                    widget.product.categoryColor ?? '2975FF')
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            widget.product.categoryName,
                            style: TextStyle(
                                color: HexColor(
                                    widget.product.categoryColor ?? '2975FF'),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () => context
                              .read<WebCartProvider>()
                              .addToCart(widget.product),
                          child: const Icon(
                            FontAwesomeIcons.cartPlus,
                          ),
                        )
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
          child: Visibility(
            visible:
                widget.product.discount != null && widget.product.discount! > 0,
            child: Container(
              height: context.height * 0.05,
              width: context.width * 0.06,
              decoration: BoxDecoration(
                color: context.redColor,
                borderRadius: BorderRadius.circular(21.0),
              ),
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
              child: Text(
                '${widget.product.discount}% OFF',
                style: context.buttonWhiteStyle,
              ),
            ),
          ),
        )
      ],
    );
  }
}
