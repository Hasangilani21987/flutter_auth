import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InviteFriendBottomModal extends StatelessWidget {
  const InviteFriendBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFAF55F5),
            Color(0xFFF555C8),
          ],
        )),
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
                children: [
                  Wrap(
                    children: [
                      Image.asset(
                        "assets/images/inviteLogo.png",
                      ),
                      const Text(
                        "Invite your Friends!",
                        style: TextStyle(),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
