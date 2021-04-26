import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/theme/palette.dart';

class Body extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const Body({
    @required this.imageUrl,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                child: Icon(Icons.chevron_left, size: 30),
                onTap: () {
                  Get.back();
                }),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Image(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "ProximaNova",
            fontSize: 19,
            color: Palette.accentColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: 14,
              color: Palette.secondaryColor,
              height: 1.5),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30)
      ],
    );
  }
}
