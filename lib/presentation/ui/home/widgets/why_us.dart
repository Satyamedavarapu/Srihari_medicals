import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';

class WhyUsWidget extends StatelessWidget {
  const WhyUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      width: context.width,
      color: context.darkGreen,
      padding: EdgeInsets.symmetric(
          vertical: context.height * 0.05, horizontal: context.width * 0.1),
      child: Column(
        children: [
          Text(
            '-Why Us',
            style: context.itallicWhiteStyle,
          ),
          Text(
            'Why People Choose Us',
            style: context.buttonWhiteStyle
                .copyWith(fontSize: context.width * 0.03),
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          Expanded(
            child: Container(
              height: context.height * 0.25,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildColumn(
                    title: 'Easy Returns',
                    iconData: Icons.shopping_bag,
                    subtitle:
                        'Our return policy is simple and that is why customers love our shop.',
                  ),
                  BuildColumn(
                    title: 'Customer Service',
                    iconData: Icons.person,
                    subtitle:
                        'We offer amazing customer service no matter what happens.',
                  ),
                  BuildColumn(
                    title: 'High Quality',
                    iconData: Icons.star,
                    subtitle:
                        'All of our products go through very strict inspection before we dispatch them.',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildColumn extends StatelessWidget {
  final IconData iconData;
  final String title, subtitle;
  const BuildColumn(
      {super.key,
      required this.iconData,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          Text(
            title,
            style: context.buttonWhiteStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          Expanded(
            child: Text(
              subtitle,
              style: context.itallicWhiteStyle.copyWith(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontStyle: FontStyle.normal),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
