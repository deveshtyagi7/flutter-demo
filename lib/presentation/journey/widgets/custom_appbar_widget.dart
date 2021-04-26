import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final AssetImage image;
  final double height;

  const CustomAppBar({Key key, this.image, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: Icon(Icons.chevron_left, size: 30),
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(width: 80),
            ],
          ),
        ),
        SizedBox(
          height: height ?? 0,
        ),
        Container(
          child: Image(
            image: image ?? AssetImage("assets/images/car/Group23597.png"),
          ),
        ),
      ],
    );
  }
}
