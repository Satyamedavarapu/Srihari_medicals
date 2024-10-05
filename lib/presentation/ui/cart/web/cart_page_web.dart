import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/presentation/providers/web/cart_provider_web.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/category_widget.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/customers_say.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/footer.dart';

import '../../../../core/util/asset_paths.dart';
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
          : prov.cartProducts.isEmpty
              ? const Center(
                  child: Text('No products added in the cart'),
                )
              : CustomScrollView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  slivers: [
                    const WebSliverAppBar(),
                    const SliverToBoxAdapter(
                        child: HomePageTypes(categories: [])),
                    SliverToBoxAdapter(
                        child: Container(
                      height: context.height * 0.5,
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
                              Container(child: Text('Clear'))
                            ],
                          )
                        ],
                      ),
                    )),
                    const SliverToBoxAdapter(child: CustomerReviews()),
                    const SliverToBoxAdapter(child: HomeFooter())
                  ],
                );
    }));
  }
}
