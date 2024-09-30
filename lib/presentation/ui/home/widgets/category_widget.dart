import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';
import 'package:srihari_medicals/data/models/web/home_model_web.dart';
import 'package:srihari_medicals/presentation/common_widgets/cache_image.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/heading_row.dart';

class CategoryWidget extends StatefulWidget {
  final List<CategoryModel> categories;
  const CategoryWidget({super.key, required this.categories});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
          HeadingRowWithButtons(
              title: 'Browse by Category', buttonColor: context.buttonBg),
          SizedBox(
              height: context.height * 0.2,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    return BuildCategoryContainer(
                        model: widget.categories[index]);
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
            ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: BuildCachedNetworkImage(
                    networkImage: model.categoryName, fit: BoxFit.contain)),
            SizedBox(height: context.height * 0.01),
            Text(model.categoryName,
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
