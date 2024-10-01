import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/handlers/stream_handler_widget.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/explore_products.dart';

import '../../../providers/web/products_provider_web.dart';
import '../../home/widgets/home_types.dart';
import '../../home/widgets/web_home_app_bar.dart';

class ProductsWeb extends StatefulWidget {
  final List<CategoryModel> categories;
  final int selectedCategoryId;
  const ProductsWeb(
      {super.key, required this.categories, required this.selectedCategoryId});

  @override
  State<ProductsWeb> createState() => _ProductsWebState();
}

class _ProductsWebState extends State<ProductsWeb> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());
    super.initState();
  }

  void afterBuild() {
    context
        .read<ProductsProviderWeb>()
        .loadProductsByCategory(widget.selectedCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebPageAppBar(),
            HomePageTypes(categories: widget.categories),
            StreamHandlerWidget(
                stream:
                    context.read<ProductsProviderWeb>().productStream.stream,
                dataBuilder: (context, snapshot) {
                  return snapshot.isEmpty
                      ? Container(
                          height: context.height * 0.8,
                          alignment: Alignment.center,
                          child: Text('No Products available',
                              style: context.titleStyle),
                        )
                      : ExploreProductsPage(
                          title: widget.categories
                              .where((c) =>
                                  c.categoryId == widget.selectedCategoryId)
                              .first
                              .categoryName,
                          products: snapshot,
                          showViewAll: false,
                          showMoreButtons: false);
                },
                loadingBuilder: (context) {
                  return Container(
                    height: context.height * 0.8,
                    alignment: Alignment.center,
                    child: SpinKitChasingDots(color: context.darkGreen),
                  );
                },
                retryCallback: afterBuild)
          ],
        ),
      ),
    );
  }
}
