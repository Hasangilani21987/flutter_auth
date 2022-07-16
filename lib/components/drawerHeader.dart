import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerHeaderComponent extends StatelessWidget {
  const DrawerHeaderComponent({
    Key? key,
    required this.title,
    required this.icon,
    required this.profileImg,
  }) : super(key: key);

  final String title;
  final String icon;
  final String profileImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                icon,
              ),
            ),
          ],
        ),
        Image.asset(
          profileImg,
        ),
        const Text(
          "Nat",
          style: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            height: 0,
          ),
        )
      ],
    );
  }
}
