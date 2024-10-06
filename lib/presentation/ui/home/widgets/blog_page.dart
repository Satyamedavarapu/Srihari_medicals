import 'package:flutter/material.dart';
import 'package:srihari_medicals/core/extensions/theme_extension.dart';
import 'package:srihari_medicals/presentation/ui/home/widgets/common_widgets.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.6,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Check Our Blog',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: context.width * 0.02,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold')),
          SizedBox(height: context.height * 0.05),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    width: context.width * 0.15,
                    // color: Colors.teal,
                    margin: EdgeInsets.only(right: context.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: context.height * 0.25,
                          width: context.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1514416432279-50fac261c7dd?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWVkaWNhbHxlbnwwfHwwfHx8MA%3D%3D'),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(height: context.height * 0.01),
                        Expanded(
                            child: Text(
                                'How to Choose the Right Vitamins and Supplements for Your Needs')),
                        SizedBox(height: context.height * 0.01),
                        Container(
                          width: context.width * 0.1,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 102, 160, 0.1),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: context.height * 0.01),
                          alignment: Alignment.center,
                          child: Text(
                            'Medical',
                            style: context.buttonWhiteStyle.copyWith(
                                color: Color.fromRGBO(255, 102, 160, 1)),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: context.height * 0.05),
          const GreenButton(buttonName: 'View All'),
        ],
      ),
    );
  }
}
