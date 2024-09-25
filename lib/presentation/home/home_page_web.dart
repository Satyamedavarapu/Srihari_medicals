import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';
import 'package:srihari_medicals/models/category_model.dart';
import 'package:srihari_medicals/presentation/home/widgets/blog_page.dart';
import 'package:srihari_medicals/presentation/home/widgets/category_widget.dart';
import 'package:srihari_medicals/presentation/home/widgets/customers_say.dart';
import 'package:srihari_medicals/presentation/home/widgets/explore_products.dart';
import 'package:srihari_medicals/presentation/home/widgets/footer.dart';
import 'package:srihari_medicals/presentation/home/widgets/home_types.dart';
import 'package:srihari_medicals/presentation/home/widgets/images_row.dart';
import 'package:srihari_medicals/presentation/home/widgets/products_by_brand.dart';
import 'package:srihari_medicals/presentation/home/widgets/products_disease.dart';
import 'package:srihari_medicals/presentation/home/widgets/web_home_app_bar.dart';
import 'package:srihari_medicals/presentation/home/widgets/why_us.dart';

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
