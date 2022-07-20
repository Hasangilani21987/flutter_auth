import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/components/supportList.dart';

class VerifyBottomModal extends StatelessWidget {
  const VerifyBottomModal({Key? key}) : super(key: key);

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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Verify ID",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Avenir",
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
                Image.asset(
                  "assets/images/verifyLogo.png",
                ),
                Column(
                  children: const [
                    SupportList(
                      supportText: "Boost your chances of finding a roommate",
                    ),
                    SupportList(
                      supportText: "Make your profile more credible",
                    ),
                    SupportList(
                      supportText: "Help keep our Chillow community safe",
                    ),
                  ],
                ),
                const Text(
                  "\$3.99",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Avenir",
                    decoration: TextDecoration.none,
                    color: Color(0xFFFD33BD),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFFD33BD),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: Container(
                    width: 250,
                    height: 35,
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Run Verify ID",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Avenir",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
