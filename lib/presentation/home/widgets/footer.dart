import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srihari_medicals/extensions/theme_extension.dart';
import 'package:srihari_medicals/util/asset_paths.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      decoration: BoxDecoration(
          color: context.darkGreen,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetPaths.shLogo,
                filterQuality: FilterQuality.high,
                height: context.height * 0.1,
                width: context.width * 0.1,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                '© 2024 - All rights reserved',
                textAlign: TextAlign.center,
                style: context.titleStyle.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _BuildSocialMediaContainer(
                      iconData: FontAwesomeIcons.instagram),
                  _BuildSocialMediaContainer(
                      iconData: FontAwesomeIcons.twitter),
                  _BuildSocialMediaContainer(
                      iconData: FontAwesomeIcons.facebook),
                ],
              )
            ],
          ),
          Container(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                _BuildText(text: 'On Sale'),
                _BuildText(text: 'Featured'),
                _BuildText(text: 'Baby Care'),
                _BuildText(text: 'Elderely Care'),
                _BuildText(text: 'Nutritional Drinks & Supplements'),
                _BuildText(text: 'Women Care'),
                _BuildText(text: 'Personal Care'),
                _BuildText(text: 'Health Conditions'),
              ],
            ),
          ),
          Container(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Legal', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                _BuildText(text: 'Terms of Service'),
                _BuildText(text: 'Privacy Policy'),
                _BuildText(text: 'Return Policy'),
                _BuildText(text: 'Shipping'),
                _BuildText(text: 'Data Protection')
              ],
            ),
          ),
          Container(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                _BuildText(text: 'About'),
                _BuildText(text: 'Blog'),
                _BuildText(text: 'Contact')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BuildSocialMediaContainer extends StatelessWidget {
  final IconData iconData;
  const _BuildSocialMediaContainer({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      width: context.width * 0.05,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        iconData,
        color: Colors.black,
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
      padding: EdgeInsets.only(top: context.height * 0.01),
      child: Text(text, style: context.noramlWhiteStyle),
    );
  }
}
