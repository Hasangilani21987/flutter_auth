import 'package:get/get.dart';
import '../constants/types.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/globals/lists.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset("assets/images/closeIcon.svg"),
          ),
          Obx(() => Text(
                "Reviewing ${contactName.toString().split(" ")[0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: kFontFamily,
                ),
              )),
          const Text("")
        ],
      )),
    );
  }
}
