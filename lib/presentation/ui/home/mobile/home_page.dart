import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/presentation/providers/mobile/mHome_provider.dart';

import '../../../util/widgets/mobile/appbar_mobile.dart';
import '../widgets/images_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<MobileHomeProvider>().resetVariables();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());
    super.initState();
  }

  void afterBuild() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MobileAppBar(),
            ImagesRow(
                containerHeight: context.height * 0.25,
                height: context.height * 0.2,
                width: context.width * 0.3),
          ],
        ),
      ),
    );
  }
}

///old code
// class _BuildGridItem extends StatelessWidget {
//   final String asset, buttonName;
//   final Function()? callBack;
//   const _BuildGridItem(
//       {required this.asset, required this.buttonName, required this.callBack});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12.0),
//       height: MediaQuery.sizeOf(context).height * 0.2,
//       width: MediaQuery.sizeOf(context).width * 0.40,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             height: MediaQuery.sizeOf(context).height * 0.15,
//             asset,
//             filterQuality: FilterQuality.high,
//             fit: BoxFit.fill,
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18.0),
//                 color: const Color.fromRGBO(251, 209, 34, 1),
//                 boxShadow: const [
//                   BoxShadow(
//                       color: Color.fromRGBO(0, 0, 0, 0.25),
//                       offset: Offset(0, 4),
//                       blurRadius: 4.0)
//                 ]),
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(vertical: 3.0),
//             margin: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               buttonName,
//               style: GoogleFonts.roboto(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///Old Home Page code
// return Scaffold(
// body: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.only(
// left: 12.0,
// right: 12.0,
// top: MediaQuery.of(context).padding.top + 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Image.asset(AssetPaths.shLogo, height: 60.0, width: 60.0),
// Stack(
// alignment: Alignment.topRight,
// clipBehavior: Clip.none,
// children: [
// const Icon(
// Icons.shopping_cart,
// color: Colors.grey,
// ),
// Positioned(
// top: -12.0,
// right: -6.0,
// child: Container(
// decoration: const BoxDecoration(
// color: Colors.amber,
// shape: BoxShape.circle,
// ),
// alignment: Alignment.center,
// padding: const EdgeInsets.all(4.0),
// child: Text(
// '2',
// style: GoogleFonts.roboto(fontSize: 10.0),
// ),
// ),
// )
// ],
// )
// ],
// ),
// ),
// Container(
// height: MediaQuery.sizeOf(context).height * 0.25,
// decoration: BoxDecoration(
// color: Colors.amber,
// borderRadius: BorderRadius.circular(12.0),
// image: const DecorationImage(
// image: AssetImage(
// AssetPaths.home,
// ),
// fit: BoxFit.fill)),
// margin:
// const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
// // child: Image.asset(AssetPaths.home),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// child: Text(
// 'Select Medicine Category',
// style: GoogleFonts.roboto(
// fontSize: 21.0, fontWeight: FontWeight.w700),
// ),
// ),
// const Padding(
// padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
// child: Wrap(
// runSpacing: 8.0,
// spacing: 8.0,
// direction: Axis.horizontal,
// children: [
// _BuildGridItem(
// asset: AssetPaths.allergy,
// buttonName: 'Allergy Relief',
// callBack: null,
// ),
// _BuildGridItem(
// asset: AssetPaths.pain,
// buttonName: 'Pain Relief',
// callBack: null,
// ),
// _BuildGridItem(
// asset: AssetPaths.cold,
// buttonName: 'Cold & Flu',
// callBack: null,
// ),
// _BuildGridItem(
// asset: AssetPaths.vitamins,
// buttonName: 'Vitamins',
// callBack: null,
// )
// ],
// ),
// )
// ],
// ),
// ),
// );
