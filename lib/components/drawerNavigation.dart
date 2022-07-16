import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation(
      {Key? key,
      required this.icon,
      required this.routeName,
      required this.forwardIcon})
      : super(key: key);

  final String icon;
  final String routeName;
  final String forwardIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // print(routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(icon),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    routeName,
                    style: const TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(forwardIcon)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
