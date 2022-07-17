import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/models/verifyModal.dart';
import 'package:flutter_auth/models/reviewsModal.dart';
import 'package:flutter_auth/models/supportModal.dart';
import 'package:flutter_auth/models/listingModal.dart';
import 'package:flutter_auth/models/backgroundModal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_auth/models/inviteFriendModal.dart';

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
    void handleBottomModal(routeName) {
      switch (routeName) {
        case "Profile":
          print("Profile Page");
          break;
        case "My Listings":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const ListingBottomModal(),
          );
          break;
        case "Verify ID":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const VerifyBottomModal(),
          );
          break;
        case "Background Check":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const BackgroundBottomModal(),
          );
          break;
        case "Reviews":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const ReviewBottomModal(),
          );
          break;
        case "Invite Friends":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const InviteFriendBottomModal(),
          );
          break;
        case "Support":
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            builder: (context) => const SupportBottomModal(),
          );
          break;
        default:
      }
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            handleBottomModal(routeName);
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
