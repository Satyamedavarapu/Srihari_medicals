import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.5,
      padding: EdgeInsets.symmetric(vertical: context.height * 0.05),
      decoration: BoxDecoration(
          color: context.darkGreen,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.width * 0.02),
              topRight: Radius.circular(context.width * 0.02))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: context.width * 0.01),
                child: Image.asset(
                  AssetPaths.shLogo,
                  filterQuality: FilterQuality.high,
                  height: context.height * 0.1,
                  width: context.width * 0.1,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: context.width * 0.015),
                child: Text(
                  '© 2024 - All rights reserved',
                  textAlign: TextAlign.right,
                  style: context.titleStyle.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Categories', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                const _BuildText(text: 'On Sale'),
                const _BuildText(text: 'Featured'),
                const _BuildText(text: 'Baby Care'),
                const _BuildText(text: 'Elderely Care'),
                const _BuildText(text: 'Nutritional Drinks & Supplements'),
                const _BuildText(text: 'Women Care'),
                const _BuildText(text: 'Personal Care'),
                const _BuildText(text: 'Health Conditions'),
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Legal', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                const _BuildText(text: 'Terms of Service'),
                const _BuildText(text: 'Privacy Policy'),
                const _BuildText(text: 'Return Policy'),
                const _BuildText(text: 'Shipping'),
                const _BuildText(text: 'Data Protection')
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company', style: context.buttonWhiteStyle),
                SizedBox(height: context.height * 0.02),
                const _BuildText(text: 'About'),
                const _BuildText(text: 'Blog'),
                const _BuildText(text: 'Contact')
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
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      alignment: Alignment.center,
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
