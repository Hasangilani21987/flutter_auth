import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/components/textInputField.dart';
import 'package:flutter_auth/globals/lists.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactBottomModal extends StatelessWidget {
  ContactBottomModal({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 87, 87),
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: SvgPicture.asset(
                    "assets/images/modalTopBar.svg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 18.0),
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      "assets/images/backArrow.svg",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18.0),
                  child: TextInputField(
                    keyboard: TextInputType.name,
                    inputController: nameController,
                    inputTextStytle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Avenir",
                      decoration: TextDecoration.none,
                    ),
                    inputDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.all(0),
                      enabledBorder: kborderStyle,
                      focusedBorder: kborderStyle,
                      labelText: "Type your friend’s name",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Avenir",
                        color: Color(
                          0xFFD4D4D4,
                        ),
                      ),
                      prefixIcon: Image.asset(
                        "assets/images/searchIcon.png",
                      ),
                    ),
                  ),
                ),
                // Obx((() {
                //   return Text();
                // }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
