import 'dart:async';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/textInputField.dart';
import 'package:flutter_auth/globals/lists.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactBottomModal extends StatefulWidget {
  final String searchText;
  final String placeholderText;

  const ContactBottomModal({
    Key? key,
    required this.searchText,
    required this.placeholderText,
  }) : super(key: key);

  @override
  State<ContactBottomModal> createState() => _ContactBottomModalState();
}

class _ContactBottomModalState extends State<ContactBottomModal> {
  Timer? _debounce;
  RxBool isloading = false.obs;
  RxList<Contact> contactsList = <Contact>[].obs;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
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
            child: SingleChildScrollView(
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
                      inputTextStytle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Avenir",
                        decoration: TextDecoration.none,
                      ),
                      onChanged: (value) async {
                        if (value.isNotEmpty) {
                          isloading.value = true;
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce = Timer(const Duration(milliseconds: 500),
                              () async {
                            final result =
                                await ContactsService.getContacts(query: value);
                            contactsList.value = result;
                            isloading.value = false;
                          });
                        } else {
                          _debounce?.cancel();
                          isloading.value = false;
                          return contactsList.value = [];
                        }
                      },
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: const EdgeInsets.all(0),
                        enabledBorder: kborderStyle,
                        focusedBorder: kborderStyle,
                        labelText: widget.placeholderText,
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
                  Obx(
                    (() {
                      return (contactsList.isEmpty)
                          ? Container(
                              margin: const EdgeInsets.only(top: 100.0),
                              child: Column(
                                children: [
                                  Obx(
                                    () {
                                      return (isloading.isTrue)
                                          ? Column(
                                              children: const [
                                                CircularProgressIndicator(
                                                  backgroundColor: Colors.red,
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "Loading...",
                                                )
                                              ],
                                            )
                                          : Container();
                                    },
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/peopleGroup.svg",
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      widget.searchText,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFD4D4D4),
                                        decoration: TextDecoration.none,
                                        height: 1.3,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              addAutomaticKeepAlives: false,
                              itemCount: contactsList.length,
                              padding: const EdgeInsets.only(top: 20.0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final contact = contactsList[index];
                                return ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  title: Text(
                                    contact.displayName.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: kFontFamily,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  leading: (contact.avatar != null &&
                                          contact.avatar!.isNotEmpty)
                                      ? CircleAvatar(
                                          backgroundImage: MemoryImage(
                                            contact.avatar!,
                                          ),
                                        )
                                      : CircleAvatar(
                                          backgroundColor:
                                              const Color(0xFFFDDB64),
                                          child: Text(
                                            contact.initials(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: kFontFamily,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                );
                              },
                            );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
