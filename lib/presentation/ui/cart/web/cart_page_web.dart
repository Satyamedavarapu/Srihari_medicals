import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/presentation/providers/web/cart_provider_web.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/category_widget.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/common_widgets.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/customers_say.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/footer.dart';

import '../../../../core/util/asset_paths.dart';
import '../../../../core/util/constants.dart';
import '../../authentication/web/web_login.dart';
import '../../home/widgets/home_types.dart';
import '../../home/widgets/web_home_app_bar.dart';

class CartPageWeb extends StatefulWidget {
  const CartPageWeb({super.key});

  @override
  State<CartPageWeb> createState() => _CartPageWebState();
}

class _CartPageWebState extends State<CartPageWeb> {
  @override
  void initState() {
    context.read<WebCartProvider>().resetVariables();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());
    super.initState();
  }

  void afterBuild() {
    context.read<WebCartProvider>().loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WebCartProvider>(builder: (context, prov, child) {
      return prov.isCartLoading
          ? Center(child: SpinKitSpinningLines(color: context.darkGreen))
          : (prov.cartProducts.isEmpty
              ? const Center(
                  child: Text('No products added in the cart'),
                )
              : CustomScrollView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  slivers: [
                    const WebSliverAppBar(),
                    const SliverToBoxAdapter(child: HomePageTypes()),
                    SliverToBoxAdapter(
                        child: Container(
                      height: context.height * 0.6,
                      margin: EdgeInsets.symmetric(
                          horizontal: context.width * 0.1,
                          vertical: context.height * 0.05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cart',
                                  style: context.titleStyle.copyWith(
                                      fontSize: context.width * 0.02)),
                              GestureDetector(
                                onTap: prov.clearCart,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: context.buttonCreamBg),
                                        borderRadius: BorderRadius.circular(
                                            context.width * 0.01)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.width * 0.01,
                                        vertical: context.width * 0.004),
                                    child: Text(
                                      'Clear All',
                                      style: context.titleStyle
                                          .copyWith(color: Colors.black),
                                    )),
                              )
                            ],
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: context.width * 0.002),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemCount: prov.cartProducts.length,
                                        itemBuilder: (context, index) {
                                          return _BuildProductContainer(
                                              product:
                                                  prov.cartProducts[index]);
                                        })),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: context.width * 0.05),
                                    )),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          context.width * 0.01),
                                      border: Border.all(
                                          color: context.buttonCreamBg)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: context.width * 0.02),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Cart Total',
                                          style: context.titleStyle),
                                      const _TextRow(
                                        leading: 'SubTotal',
                                        trailing: '345',
                                      ),
                                      const _TextRow(
                                        leading: 'Tax',
                                        trailing: '34.5',
                                      ),
                                      const _TextRow(
                                        leading: 'Shipping',
                                        trailing: '5',
                                      ),
                                      _TextRow(
                                        leading: 'Total',
                                        trailing: '384.5',
                                        leadingStyle: context.titleStyle,
                                        trailingStyle: context.titleStyle,
                                      ),
                                      GreenButton(
                                          buttonName: 'Checkout',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const WebLoginPage())))
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )),
                        ],
                      ),
                    )),
                    const SliverToBoxAdapter(child: CustomerReviews()),
                    const SliverToBoxAdapter(child: HomeFooter())
                  ],
                ));
    }));
  }
}

class _BuildProductContainer extends StatelessWidget {
  final ProductModel product;
  const _BuildProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.2,
        decoration: BoxDecoration(
            border: Border.all(color: context.buttonCreamBg),
            borderRadius: BorderRadius.circular(context.width * 0.01)),
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.01, vertical: context.width * 0.004),
        margin: EdgeInsets.only(bottom: context.width * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: context.buttonCreamBg,
                  borderRadius: BorderRadius.circular(context.width * 0.01),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(context.width * 0.002),
                margin: EdgeInsets.all(context.width * 0.002),
                child: Image.asset(
                  AssetPaths.noImage,
                  // height: context.height * 0.05,
                  // width: context.width * 0.1,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.productName, style: context.titleStyle),
                  Text('${Constants.rupee}${product.price}',
                      style: context.titleStyle),
                  Text('${Constants.rupee}${product.price}',
                      style: context.titleStyle),
                ],
              ),
            )
          ],
        ));
  }
}

class _TextRow extends StatelessWidget {
  final String leading, trailing;
  final TextStyle? leadingStyle, trailingStyle;
  const _TextRow(
      {super.key,
      required this.leading,
      required this.trailing,
      this.leadingStyle,
      this.trailingStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$leading:', style: leadingStyle ?? context.cartTotalStyle),
        Text('${Constants.rupee}$trailing',
            style: leadingStyle ?? context.cartTotalStyle),
      ],
    );
  }
}
