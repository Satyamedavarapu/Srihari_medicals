import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';

import '../../../util/asset_paths.dart';

class WebPageAppBar extends StatelessWidget {
  const WebPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.1,
      color: context.appBarGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: context.width * 0.05),
          Image.asset(
            AssetPaths.shLogo,
            height: context.height * 0.08,
            filterQuality: FilterQuality.high,
          ),
          SizedBox(width: context.width * 0.01),
          const VerticalDivider(
            width: 0.5,
            color: Color.fromRGBO(255, 255, 255, 0.5),
            indent: 8.0,
            endIndent: 8.0,
          ),
          SizedBox(width: context.width * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.flash_on_sharp,
                    color: Colors.amberAccent,
                    size: context.width * 0.01,
                  ),
                  Text(
                    'Express delivery to',
                    style: TextStyle(
                      fontFamily: 'Montserrat-Light',
                      color: const Color.fromRGBO(154, 175, 169, 1),
                      // color: Color.fromRGBO(246, 247, 251, 1),
                      fontSize: context.width * 0.008,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Pincode  ',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: context.width * 0.008,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
          Container(
            height: context.height * 0.045,
            width: context.width * 0.35,
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.08),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(color: Colors.white.withOpacity(0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.01),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.grey,
                        size: context.width * 0.01,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.01),
                      child: Text(
                        'Search your medicine here',
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: context.width * 0.01,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: context.height * 0.045,
                  // width: context.width * 0.35,
                  decoration: BoxDecoration(
                    color: context.lightGreen,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.01),
                  child: Row(
                    children: [
                      Text(
                        'Upload Prescription',
                        style: TextStyle(
                            fontFamily: 'Montserrat-Light',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: context.width * 0.007),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.01),
                        child: Icon(
                          FontAwesomeIcons.fileCirclePlus,
                          color: Colors.white,
                          size: context.width * 0.01,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.user,
            color: Colors.white,
            size: context.width * 0.01,
          ),
          Text(
            '  Hello, Login/Sign Up',
            style: GoogleFonts.roboto(
                color: Colors.white.withOpacity(0.7),
                fontSize: context.width * 0.01),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: context.width * 0.02),
          //   decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.white,
          //       ),
          //       shape: BoxShape.circle),
          //   child: Icon(
          //     Icons.percent,
          //     color: Colors.white,
          //     size: context.width * 0.01,
          //   ),
          // ),
          // Text(
          //   '  Cart',
          //   style: GoogleFonts.roboto(
          //       color: Colors.white.withOpacity(0.7),
          //       fontSize: context.width * 0.01),
          // ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 0.02),
            child: Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.white,
              size: context.width * 0.01,
            ),
          ),
          Text(
            '   Cart',
            style: GoogleFonts.roboto(
                color: Colors.white.withOpacity(0.7),
                fontSize: context.width * 0.01),
          ),
        ],
      ),
    );
  }
}
