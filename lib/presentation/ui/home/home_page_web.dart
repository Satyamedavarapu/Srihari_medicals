import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/handlers/stream_handler_widget.dart';
import 'package:srihari_medicals/presentation/providers/web/web_home_provider.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/blog_page.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/category_widget.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/customers_say.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/explore_products.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/footer.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/home_types.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/images_row.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/products_by_brand.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/products_disease.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/web_home_app_bar.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/why_us.dart';

class MyWebHomePage extends StatefulWidget {
  const MyWebHomePage({super.key});

  @override
  State<MyWebHomePage> createState() => _MyWebHomePageState();
}

class _MyWebHomePageState extends State<MyWebHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());
    super.initState();
  }

  void afterBuild() {
    context.read<WebHomeProvider>().loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamHandlerWidget(
            stream: context.read<WebHomeProvider>().homeDataStreamCtrl.stream,
            dataBuilder: (context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const WebPageAppBar(),
                    const HomePageTypes(),
                    const ImagesRow(),
                    CategoryWidget(categories: snapshot.categories),
                    ExploreProductsPage(
                      title: 'Explore our Products',
                      products: snapshot.discountProducts,
                    ),
                    const WhyUsWidget(),
                    // const ProductsDisease(),
                    ExploreProductsPage(
                      title: 'Discount Products',
                      products: snapshot.discountProducts,
                    ),
                    const ProductsByBrand(),
                    const CustomerReviews(),
                    // const BlogPage(),
                    const HomeFooter()
                  ],
                ),
              );
            },
            retryCallback: afterBuild));
  }
}
