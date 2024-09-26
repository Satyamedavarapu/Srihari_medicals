import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebPageAppBar(),
            HomePageTypes(),
            ImagesRow(),
            CategoryWidget(),
            ExploreProductsPage(
              title: 'Explore our Products',
            ),
            WhyUsWidget(),
            ProductsDisease(),
            ExploreProductsPage(
              title: 'Discount Products',
            ),
            ProductsByBrand(),
            CustomerReviews(),
            BlogPage(),
            HomeFooter()
          ],
        ),
      ),
    );
  }
}
