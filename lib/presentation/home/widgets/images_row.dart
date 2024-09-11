import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

import '../../../util/asset_paths.dart';

class ImagesRow extends StatelessWidget {
  const ImagesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      color: context.darkGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AssetPaths.stetho, filterQuality: FilterQuality.high),
          Text(
            'Buy Medicines \nand Essentials',
            style: TextStyle(
              fontFamily: 'Montserrat-ExtraBold',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: context.width * 0.03),
          ),
          Image.asset(
            AssetPaths.scooter,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
