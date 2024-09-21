import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';
import 'package:srihari_medicals/util/asset_paths.dart';

import '../../../util/constants.dart';
import '../../util/widgets/mobile/appbar_mobile.dart';

class ProductsMobile extends StatefulWidget {
  const ProductsMobile({super.key});

  @override
  State<ProductsMobile> createState() => _ProductsMobileState();
}

class _ProductsMobileState extends State<ProductsMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MobileAppBar(),
            Flexible(
                child: GridView.builder(
                    itemCount: 18,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(context.width * 0.01),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: context.buttonBg)),
                        margin: EdgeInsets.all(context.width * 0.02),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                margin: EdgeInsets.only(top: 12.0),
                                child: Image.network(
                                  // AssetPaths.shLogo,
                                  'https://plus.unsplash.com/premium_photo-1668898899024-02f028349666?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBpbGxzfGVufDB8fDB8fHww',
                                  alignment: Alignment.center,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                ),
                              ),

                              // child: Image.network(
                              //   // AssetPaths.shLogo,
                              //   'https://plus.unsplash.com/premium_photo-1668898899024-02f028349666?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBpbGxzfGVufDB8fDB8fHww',
                              //   alignment: Alignment.center,
                              //   filterQuality: FilterQuality.high,
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.all(context.width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        child: Text('Baby Wheat Apple Cerelac',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.titleStyle),
                                      ),
                                    ),
                                    Text(
                                        'Dolo is a drug for general fever Dolo is a drug for general feverDolo is a drug for general feverDolo is a drug for general fever Dolo is a drug for general fever',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.subTitleStyle),
                                    SizedBox(height: context.height * 0.005),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.indianRupeeSign,
                                              size: context.width * 0.05,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              '32.8',
                                              style: context.titleStyle
                                                  .copyWith(
                                                      fontSize:
                                                          context.width * 0.05),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: context.appBarGreen,
                                              borderRadius:
                                                  BorderRadius.circular(9.0)),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(
                                              context.width * 0.02),
                                          child: Icon(
                                            FontAwesomeIcons.cartPlus,
                                            color: Colors.white,
                                            size: context.width * 0.04,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
            SizedBox(height: context.height * 0.08)
          ],
        ),
      ),
    );
  }
}
