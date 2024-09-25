import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

class HomePageTypes extends StatefulWidget {
  const HomePageTypes({super.key});

  @override
  State<HomePageTypes> createState() => _HomePageTypesState();
}

class _HomePageTypesState extends State<HomePageTypes> {
  List<String> texts = [
    'Baby Care',
    'Elderly Care',
    'Nutritional Drinks & Supplements',
    'Women Care',
    'Personal Care',
    'Health Conditions'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      color: context.bgGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(texts.length, (index) {
          return _BuildText(text: texts[index]);
        }),
      ),
    );
  }
}

class _BuildText extends StatelessWidget {
  final String text;
  const _BuildText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Montserrat-Bold',
            color: context.appBarGreen,
            fontWeight: FontWeight.w700,
            fontSize: context.width * 0.01),
      ),
    );
  }
}
