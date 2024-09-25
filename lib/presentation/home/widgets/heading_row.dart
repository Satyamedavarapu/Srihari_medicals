import 'package:flutter/material.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

class HeadingRowWithButtons extends StatelessWidget {
  final String title;
  final Color buttonColor;
  const HeadingRowWithButtons(
      {super.key, required this.title, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: context.width * 0.02,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Bold'),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: context.height * 0.04,
              width: context.width * 0.04,
              decoration: BoxDecoration(
                color: buttonColor,
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
                color: buttonColor,
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
    );
  }
}
