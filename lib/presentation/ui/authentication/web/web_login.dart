import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/font_constants.dart';
import 'package:srihari_medicals/presentation/providers/web/web_auth_provider.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/common_widgets.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/footer.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/home_types.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/web_home_app_bar.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/mixins/text_field_mixin.dart';

class WebLoginPage extends StatefulWidget {
  const WebLoginPage({super.key});

  @override
  State<WebLoginPage> createState() => _WebLoginPageState();
}

class _WebLoginPageState extends State<WebLoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          WebSliverAppBar(),
          WebSliverHomePageTypes(),
          SliverToBoxAdapter(child: _BuildLoginForm()),
          SliverToBoxAdapter(child: HomeFooter())
        ],
      ),
    );
  }
}

class _BuildLoginForm extends StatelessWidget with TextFieldMixin {
  const _BuildLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.width * 0.02),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)));

    OutlineInputBorder disabledBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.width * 0.02),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)));

    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(context.width * 0.02),
        borderSide: const BorderSide(color: Colors.redAccent));

    return Consumer<WebAuthenticationProvider>(builder: (context, prov, child) {
      return Container(
        // color: Colors.teal,
        height: context.height * 0.74,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.1, vertical: context.height * 0.05),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Create Account',
              //   style: GoogleFonts.roboto(
              //       color: const Color.fromRGBO(26, 32, 44, 1),
              //       fontSize: context.width * 0.02,
              //       fontWeight: FontWeight.w600),
              //   // style: context.cartTotalStyle.copyWith(
              //   //     color: Color.fromRGBO(26, 32, 44, 1),
              //   //     fontSize: context.width * 0.02),
              // ),
              Text(
                'Create Account',
                style: context.cartTotalStyle.copyWith(
                    color: Color.fromRGBO(26, 32, 44, 1),
                    fontSize: context.width * 0.02,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: context.height * 0.04),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  // height: context.height * 0.12,
                  width: context.width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Number\n',
                        style: context.noramlWhiteStyle.copyWith(
                            color: const Color.fromRGBO(26, 32, 44, 1)),
                      ),
                      TextFormField(
                        controller: prov.mobileNumberCtrl,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'This field cannot be empty';
                          } else if (int.parse(val[0]) < 6) {
                            return 'Please provide a valid Mobile Number';
                          } else if (val.length != 10) {
                            return 'Mobile Number must contain 10 numbers';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: context.titleStyle,
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            floatingLabelStyle: context.titleStyle,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                            focusedErrorBorder: errorBorder,
                            disabledBorder: disabledBorder,
                            errorBorder: errorBorder),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.04),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP\n',
                        style: context.noramlWhiteStyle.copyWith(
                            color: const Color.fromRGBO(26, 32, 44, 1)),
                      ),
                      const Pinput(
                        keyboardType: TextInputType.number,
                        length: 6,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.08),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.width * 0.25,
                  child: Row(
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(213, 227, 223, 1)),
                        padding: const EdgeInsets.all(6),
                        child: Container(
                          height: 18.0,
                          width: 18.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Text(''),
                        ),
                      ),
                      RichText(
                          text: const TextSpan(
                              text: '  I have read and agree to ',
                              style: TextStyle(
                                  fontFamily: FontConstants.montserrat,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                              children: [
                            TextSpan(
                              text: 'Terms and conditions',
                              style: TextStyle(
                                  fontFamily: FontConstants.montserratBold,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )
                          ])),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.08),
              const Align(
                alignment: Alignment.center,
                child: GreenButton(buttonName: 'Create/Login'),
              )
            ],
          ),
        ),
      );
    });
  }
}
