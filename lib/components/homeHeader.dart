import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/screens/drawerScreen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.logo,
    required this.chatLogo,
    required this.hamberMenu,
  }) : super(key: key);

  final String logo;
  final String chatLogo;
  final String hamberMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => const DrawerScreen());
          },
          child: SvgPicture.asset(
            hamberMenu,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            chatLogo,
          ),
        ),
      ],
    );
  }
}
