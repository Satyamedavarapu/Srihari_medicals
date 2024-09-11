import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';
import 'package:srihari_medicals/models/category_model.dart';
import 'package:srihari_medicals/presentation/home/widgets/category_widget.dart';
import 'package:srihari_medicals/presentation/home/widgets/home_types.dart';
import 'package:srihari_medicals/presentation/home/widgets/images_row.dart';
import 'package:srihari_medicals/presentation/home/widgets/web_home_app_bar.dart';


class MyWebHomePage extends StatefulWidget {
  const MyWebHomePage({super.key});

  @override
  State<MyWebHomePage> createState() => _MyWebHomePageState();
}

class _MyWebHomePageState extends State<MyWebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebPageAppBar(),
            const HomePageTypes(),
            const ImagesRow(),
            const CategoryWidget(),
            Container(
              height: context.height * 0.5,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
