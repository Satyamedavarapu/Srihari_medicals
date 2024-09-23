import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

import '../../../util/asset_paths.dart';

class ImagesRow extends StatelessWidget {
  final double? containerHeight, height, width;
  const ImagesRow({super.key, this.containerHeight, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight ?? context.height * 0.3,
      color: context.darkGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AssetPaths.stetho,
              height: height, width: width, filterQuality: FilterQuality.high),
          Text(
            'Buy Medicines \nand Essentials',
            style: TextStyle(
                fontFamily: 'Montserrat-ExtraBold',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: kIsWeb ? context.width * 0.03 : context.width * 0.05),
          ),
          Image.asset(
            AssetPaths.scooter,
            height: height,
            width: width,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
