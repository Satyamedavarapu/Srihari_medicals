import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';

class CustomerReviews extends StatelessWidget {
  const CustomerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What Our Customer Say',
            style: context.buttonWhiteStyle.copyWith(
              color: Colors.black,
              fontSize: context.width * 0.02,
            ),
          ),
          SizedBox(height: context.height * 0.1),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return const _BuildReviewColumn(
                      assetPath: AssetPaths.shLogo,
                      title: 'Amy Smith',
                      subtitle:
                          'Effortless shopping for quality healthcare products—convenient, reliable, and delivered right to your door!',
                    );
                  }))
        ],
      ),
    );
  }
}

class _BuildReviewColumn extends StatelessWidget {
  final String assetPath, title, subtitle;
  const _BuildReviewColumn(
      {super.key,
      required this.assetPath,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      width: context.width * 0.2,
      margin: EdgeInsets.only(right: context.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: context.height * 0.1,
              width: context.width * 0.1,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(assetPath),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high)),
            ),
          ),
          SizedBox(height: context.height * 0.02),
          Text(
            title,
            textAlign: TextAlign.start,
            style: context.titleStyle,
          ),
          SizedBox(height: context.height * 0.02),
          Expanded(
            child: Text(
              subtitle,
              textAlign: TextAlign.start,
              style: context.titleStyle
                  .copyWith(color: const Color.fromRGBO(26, 32, 44, 1)),
            ),
          )
        ],
      ),
    );
  }
}
