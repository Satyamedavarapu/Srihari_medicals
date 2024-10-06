import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';

class GreenButton extends StatelessWidget {
  final String buttonName;
  final Function()? onTap;
  const GreenButton({super.key, required this.buttonName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
