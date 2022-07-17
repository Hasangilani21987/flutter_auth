import 'package:flutter/material.dart';

const forwrdIcon = "assets/images/forwardIcon.svg";
const profileIcon = "assets/images/profileIcon.png";
const lisitingIcon = "assets/images/lisitingIcon.png";
const verifyIcon = "assets/images/verifyIcon.png";
const backgroundIcon = "assets/images/backgroundIcon.png";
const reviewIcon = "assets/images/reviewIcon.png";
const inviteIcon = "assets/images/inviteIcon.png";
const supportIcon = "assets/images/supportIcon.png";

final List<Map<String, dynamic>> drawerList = [
  {
    "icon": profileIcon,
    "RouteName": "Profile",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": lisitingIcon,
    "RouteName": "My Listings",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": verifyIcon,
    "RouteName": "Verify ID",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": backgroundIcon,
    "RouteName": "Background Check",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": reviewIcon,
    "RouteName": "Reviews",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": inviteIcon,
    "RouteName": "Invite Friends",
    "forwardIcon": forwrdIcon,
  },
  {
    "icon": supportIcon,
    "RouteName": "Support",
    "forwardIcon": forwrdIcon,
  },
];

final kborderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(35),
  borderSide: const BorderSide(
    color: Color(
      0xFFC4C4C4,
    ),
    width: 1.5,
  ),
);
