import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportList extends StatelessWidget {
  const SupportList({Key? key, required this.supportText}) : super(key: key);

  final String supportText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/bulletIcon.svg",
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            textAlign: TextAlign.justify,
            supportText,
            style: const TextStyle(
              fontFamily: "Avenir",
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
