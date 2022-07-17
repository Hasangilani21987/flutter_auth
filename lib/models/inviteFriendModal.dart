import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/models/contactSearchModal.dart';
import 'package:permission_handler/permission_handler.dart';

class InviteFriendBottomModal extends StatelessWidget {
  const InviteFriendBottomModal({Key? key}) : super(key: key);

  _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;

    if (permission == PermissionStatus.granted) {
      return PermissionStatus.granted;
    }

    if (permission != PermissionStatus.granted) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts];
    } else {
      return Permission;
    }
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/inviteLogo.png",
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "Invite your Friends!",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: const Text(
                          "Chillow is a growing, vibrant community of roommates and renters. Invite your friends to find their next roommate for wherever they’re looking to live!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      final PermissionStatus permissionStatus =
                          await _getPermission();
                      if (permissionStatus == PermissionStatus.granted) {
                        Get.to(
                          ContactBottomModal(),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
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
                        "Invite Friends",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFAF55F5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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
