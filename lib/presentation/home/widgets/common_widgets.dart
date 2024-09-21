import 'package:flutter/cupertino.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

class GreenButton extends StatelessWidget {
  final String buttonName;
  const GreenButton({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.lightGreen,
                borderRadius: BorderRadius.circular(context.width * 0.02),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.01,
                  vertical: context.width * 0.005),
              child: Text(buttonName, style: context.buttonWhiteStyle),
            ),
          ],
        ),
      ),
    );
  }
}
