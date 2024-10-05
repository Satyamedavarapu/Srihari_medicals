import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/presentation/ui/products/web/products_web.dart';

import '../../../../core/util/constants.dart';

class HomePageTypes extends StatefulWidget {
  final List<CategoryModel> categories;
  const HomePageTypes({super.key, required this.categories});

  @override
  State<HomePageTypes> createState() => _HomePageTypesState();
}

class _HomePageTypesState extends State<HomePageTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      color: context.bgGreen,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductsWeb(
                            categories: widget.categories,
                            selectedCategoryId:
                                widget.categories[index].categoryId))),
                child: _BuildText(text: widget.categories[index].categoryName));
          }),
    );
  }
}

class _BuildText extends StatelessWidget {
  final String text;
  const _BuildText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.height * 0.03),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: Constants.montserratBold,
            color: context.appBarGreen,
            fontWeight: FontWeight.w700,
            fontSize: context.width * 0.01),
      ),
    );
  }
}
