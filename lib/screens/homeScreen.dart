import 'package:flutter/material.dart';
import 'package:flutter_auth/components/homeHeader.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: const HomeHeader(
                  logo: "assets/images/appLogo.png",
                  chatLogo: "assets/images/chatLogo.svg",
                  hamberMenu: "assets/images/drawerLogo.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
