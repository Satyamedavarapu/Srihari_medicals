import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/core/util/asset_paths.dart';
import 'package:srihari_medicals/presentation/providers/authentication_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    context.read<AuthenticationProvider>().resetVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetPaths.shLogo,
                      alignment: Alignment.center,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                    ),
                  ),
                  Container(
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: const BoxDecoration(
                          color: const Color.fromRGBO(250, 251, 252, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 16.0),
                      child: Consumer<AuthenticationProvider>(
                          builder: (context, prov, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(prov.isLogin ? 'SignIn' : 'Verify OTP',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    color:
                                        const Color.fromRGBO(62, 62, 62, 1))),
                            Visibility(
                              visible: !prov.isLogin,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Please enter the OTP that was sent to your registered mobile number.',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            _BuildTextField(
                                ctrl: prov.loginCtrl,
                                iconData: FontAwesomeIcons.user,
                                label: 'Name',
                                isVisible: prov.isLogin),
                            _BuildTextField(
                                ctrl: prov.pwdCtrl,
                                iconData: FontAwesomeIcons.phone,
                                label: 'Phone Number',
                                isVisible: prov.isLogin),
                            _BuildTextField(
                                ctrl: prov.otpCtrl,
                                iconData: FontAwesomeIcons.lock,
                                label: 'Enter the OTP',
                                isVisible: !prov.isLogin),
                            InkResponse(
                              radius: 10.0,
                              onTap: prov.isLogin
                                  ? prov.onSendOtp
                                  : () => prov.onVerifyOtp(context),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: context.lightGreen),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 4.0),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  prov.isLogin
                                      ? 'Send Otp'
                                      : 'Verify and Proceed',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18.0),
                                ),
                              ),
                            )
                          ],
                        );
                      })),
                ],
              ),
              Positioned(
                top: -MediaQuery.sizeOf(context).height * 0.15,
                left: -MediaQuery.sizeOf(context).width * 0.3,
                child: const _BuildCircle(),
              ),
              Positioned(
                bottom: -MediaQuery.sizeOf(context).height * 0.15,
                right: -MediaQuery.sizeOf(context).width * 0.3,
                child: const _BuildCircle(),
              )
            ],
          ),
        ));
  }
}

class _BuildTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final IconData iconData;
  final String label;
  final bool isVisible;
  const _BuildTextField(
      {required this.ctrl,
      required this.iconData,
      required this.label,
      required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
              color: const Color.fromRGBO(232, 232, 232, 1),
              width: 1.0,
            )),
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
          controller: ctrl,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                iconData,
                size: 16.0,
              ),
              prefixIconColor: const Color.fromRGBO(0, 0, 0, 0.2),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              hintText: label,
              hintStyle: GoogleFonts.roboto(
                  color: const Color.fromRGBO(0, 0, 0, 0.2),
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}

class _BuildCircle extends StatelessWidget {
  const _BuildCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width * 0.6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.appBarGreen,
      ),
    );
  }
}
