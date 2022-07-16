import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListingBottomModal extends StatelessWidget {
  const ListingBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: SvgPicture.asset(
              "assets/images/modalTopBar.svg",
            ),
          ),
        ],
      ),
    );
  }
}
