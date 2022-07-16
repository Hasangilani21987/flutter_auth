import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/components/supportList.dart';

class SupportBottomModal extends StatelessWidget {
  const SupportBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: SvgPicture.asset(
              "assets/images/modalTopBar.svg",
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Your Support Team",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Avenir",
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset(
                  "assets/images/supportLogo.svg",
                ),
                Wrap(
                  children: const [
                    SupportList(
                      supportText: "Issues with your profile?",
                    ),
                    SupportList(
                      supportText: "Trouble contacting an owner?",
                    ),
                    SupportList(
                      supportText: "Want to report a fake account?",
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFFF6634),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Contact Support",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
