import 'package:flutter/material.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

import '../../../models/category_model.dart';
import '../../../util/asset_paths.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<CategoryModel> categories = [
    const CategoryModel(AssetPaths.mustHave, 'Must Haves'),
    const CategoryModel(AssetPaths.elderlyCare, 'Elderly Care'),
    const CategoryModel(AssetPaths.personalCare, 'Personal Care'),
    const CategoryModel(AssetPaths.monsoon, 'Monsoon Essentials'),
    const CategoryModel(AssetPaths.motherCare, 'Mother Care'),
    const CategoryModel(AssetPaths.nutrition, 'Nutrition Care'),
    const CategoryModel(AssetPaths.nutritionCare, 'Nutrition Care'),
    const CategoryModel(AssetPaths.fitness, 'Fitness Care'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      decoration: const BoxDecoration(
          gradient: LinearGradient(stops: [
        0,
        33,
        100
      ], colors: [
        Colors.white,
        Color.fromRGBO(238, 248, 245, 1),
        Color.fromRGBO(206, 234, 226, 1)
      ])),
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Browse by Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: context.width * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat-Bold'),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: context.height * 0.04,
                    width: context.width * 0.04,
                    decoration: BoxDecoration(
                      color: context.buttonBg,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: context.width * 0.01,
                    ),
                  ),
                  Container(
                    height: context.height * 0.04,
                    width: context.width * 0.04,
                    decoration: BoxDecoration(
                      color: context.buttonBg,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: context.width * 0.01,
                    ),
                  ),
                ],
              )
            ],
          ),
          // Expanded(child: Container()),
          SizedBox(
              height: context.height * 0.2,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return BuildCategoryContainer(model: categories[index]);
                  })),
          // Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }
}

class BuildCategoryContainer extends StatelessWidget {
  final CategoryModel model;
  const BuildCategoryContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      width: context.width * 0.09,
      margin: EdgeInsets.only(right: context.width * 0.01),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(model.image,
                height: context.height * 0.1,
                filterQuality: FilterQuality.high),
            Text(model.text,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Color.fromRGBO(26, 32, 44, 1),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat-Bold')),
          ],
        ),
      ),
    );
  }
}
