import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/globals/lists.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_auth/models/contactSearchModal.dart';
import 'package:permission_handler/permission_handler.dart';

class ReviewBottomModal extends StatelessWidget {
  const ReviewBottomModal({Key? key}) : super(key: key);

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFB800),
            Color(0xFFFDDB64),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: SvgPicture.asset(
              "assets/images/endrosementTopBar.svg",
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/ratingImage.svg",
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "ROOMMATE REVIEW!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        fontFamily: kFontFamily,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Increase your chances of finding your next credible roommate while strengthening your Chillow profile in the process!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    fontFamily: kFontFamily,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final PermissionStatus permissionStatus =
                            await _getPermission();
                        if (permissionStatus == PermissionStatus.granted) {
                          Navigator.of(context).pop();
                          showCupertinoModalBottomSheet(
                            expand: false,
                            context: context,
                            useRootNavigator: true,
                            builder: (context) {
                              return const ContactBottomModal(
                                searchText: "Search for your former roommate",
                                placeholderText: "who do you want to review?",
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFFFFFFF),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          "Give A Review",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFFF6634),
                            fontWeight: FontWeight.w700,
                            fontFamily: kFontFamily,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        final PermissionStatus permissionStatus =
                            await _getPermission();
                        if (permissionStatus == PermissionStatus.granted) {
                          Navigator.of(context).pop();
                          showCupertinoModalBottomSheet(
                            expand: false,
                            context: context,
                            useRootNavigator: true,
                            builder: (context) {
                              return const ContactBottomModal(
                                searchText: "Search for your former roommate",
                                placeholderText: "who do you want to review?",
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFFFFFFF),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          "Get A Review",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFFF6634),
                            fontWeight: FontWeight.w700,
                            fontFamily: kFontFamily,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
