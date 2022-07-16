import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/globals/lists.dart';
import 'package:flutter_auth/components/drawerHeader.dart';
import 'package:flutter_auth/components/drawerNavigation.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: const DrawerHeaderComponent(
                  title: "Logout",
                  icon: "assets/images/closeIcon.svg",
                  profileImg: "assets/images/profile.png",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
                  height: double.maxFinite,
                  child: ListView.separated(
                    itemBuilder: (((context, index) {
                      return DrawerNavigation(
                        icon: drawerList[index]['icon'],
                        routeName: drawerList[index]['RouteName'],
                        forwardIcon: drawerList[index]['forwardIcon'],
                      );
                    })),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    }),
                    itemCount: drawerList.length,
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 30.0),
              //   child: ,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
