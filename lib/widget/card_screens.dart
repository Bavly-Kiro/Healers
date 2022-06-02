import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/unit/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardScreen extends StatefulWidget {
  bool isMovies = true;
  bool isBook = false;
  bool isFav = false;
  bool isLib = false;

  CardScreen(
      {Key? key,
      this.isMovies: false,
      this.isBook: false,
      this.isFav: false,
      this.isLib: false})
      : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String email = "";

  @override
  void initState() {
    super.initState();

    checkLogged();
  }

  void checkLogged() async {
    final prefs = await SharedPreferences.getInstance();

    email = prefs.getString('email') ?? "";

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(10),
      color: Get.isDarkMode ? const Color(0XFF2B2D2F) : const Color(0XFFF8F8F8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();

              prefs.setString('clicked', "s&m");

              Navigator.of(context).popAndPushNamed(Routes.categoryMovies);
            },
            child: HoverWidget(
              onHover: (event) {},
              hoverChild: Column(
                children: const [
                  Icon(
                    FontAwesomeIcons.clapperboard,
                    color: Colors.deepOrange,
                    size: 50,
                  ),
                  Text(
                    'المسلسلات و الافلام',
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.clapperboard,
                    color:
                        widget.isMovies ? Colors.deepOrange : Color(0xFFA1A5AC),
                    size: 50,
                  ),
                  Text(
                    'المسلسلات و الافلام',
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: widget.isMovies
                            ? Colors.deepOrange
                            : Color(0xFFA1A5AC),
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();

              prefs.setString('clicked', "books");

              Navigator.of(context).popAndPushNamed(Routes.categoryMovies);
            },
            child: HoverWidget(
              onHover: (event) {},
              hoverChild: Column(
                children: const [
                  Icon(
                    FontAwesomeIcons.bookMedical,
                    color: Colors.deepOrange,
                    size: 50,
                  ),
                  Text(
                    'الكتب',
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.bookMedical,
                    color:
                        widget.isBook ? Colors.deepOrange : Color(0xFFA1A5AC),
                    size: 50,
                  ),
                  Text(
                    'الكتب',
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: widget.isBook
                            ? Colors.deepOrange
                            : Color(0xFFA1A5AC),
                        fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          PopupMenuButton(
              child: HoverWidget(
                onHover: (event) {},
                hoverChild: Column(
                  children: const [
                    Icon(
                      Icons.library_music,
                      color: Colors.deepOrange,
                      size: 50,
                    ),
                    Text(
                      'مكتبتي',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.library_music,
                      color:
                          widget.isLib ? Colors.deepOrange : Color(0xFFA1A5AC),
                      size: 50,
                    ),
                    Text(
                      'مكتبتي',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: widget.isLib
                              ? Colors.deepOrange
                              : Color(0xFFA1A5AC),
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              itemBuilder: (context) => <PopupMenuEntry<Text>>[
                    PopupMenuItem<Text>(
                        child: MaterialButton(
                          minWidth: double.infinity,
                          textColor: Colors.blue,
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();

                        prefs.setString('clicked', "libS&M");

                        Navigator.of(context).pop();
                        Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

                      },
                      child: Text(
                        'المسلسلات والافلام',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                      ),
                    )),
                    PopupMenuItem<Text>(
                        child: MaterialButton(
                          minWidth: double.infinity,
                            textColor: Colors.blue,
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();

                              await prefs.setString('clicked', "libBooks").then((value) {

                                Navigator.of(context).pop();
                                Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

                              });


                            },
                            child: const Text('الكتب')))
                  ]),
          const SizedBox(
            height: 25,
          ),
          PopupMenuButton(
              child: HoverWidget(
                onHover: (event) {},
                hoverChild: Column(
                  children: const [
                    Icon(
                      FontAwesomeIcons.heartCircleBolt,
                      color: Colors.deepOrange,
                      size: 50,
                    ),
                    Text(
                      'المفضله',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.heartCircleBolt,
                      color:
                          widget.isFav ? Colors.deepOrange : Color(0xFFA1A5AC),
                      size: 50,
                    ),
                    Text(
                      'المفضله',
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: widget.isFav
                              ? Colors.deepOrange
                              : Color(0xFFA1A5AC),
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              itemBuilder: (context) => <PopupMenuEntry<Text>>[
                    PopupMenuItem<Text>(
                        child: MaterialButton(
                          minWidth: double.infinity,
                          textColor: Colors.blue,
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();

                        prefs.setString('clicked', "favS&M");

                        Navigator.of(context).pop();
                        Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

                      },
                      child: Text(
                        'المسلسلات والافلام',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                      ),
                    )),
                    PopupMenuItem<Text>(
                        child: MaterialButton(
                            minWidth: double.infinity,
                            textColor: Colors.blue,
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();

                              prefs.setString('clicked', "favBooks");

                              Navigator.of(context).pop();
                              Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

                            },
                            child: const Text('الكتب')))
                  ]),
          const Spacer(),
          PopupMenuButton(
              child: HoverWidget(
                onHover: (event) {},
                hoverChild: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.deepOrange,
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        'الاعدادات',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Color(0xFFA1A5AC),
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        'الاعدادات',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFA1A5AC),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemBuilder: (context) {

                log("email: " + email);


                if(email == ""){

                  return <PopupMenuEntry<Text>>[
                    PopupMenuItem<Text>(
                        child:  TextButton(onPressed: (){
                          ThemeController().changeTheTheme();
                          Get.back();
                        },
                          child:Row(
                            children: [
                              Icon(Get.isDarkMode?FontAwesomeIcons.lightbulb:FontAwesomeIcons.moon,
                                size: 20,),
                              const SizedBox(width: 10,),
                              Text(Get.isDarkMode?'تفعيل الوضع الفاتح':'تفعيل الوضع الغامق',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),)
                    ),
                    PopupMenuItem<Text>(
                        child: TextButton(onPressed: (){}, child:const Text('تواصل معنا'))
                    ),
                  ];

                }
                else{
                  return <PopupMenuEntry<Text>>[
                    PopupMenuItem<Text>(
                        child:  TextButton(onPressed: (){
                          ThemeController().changeTheTheme();
                          Get.back();
                        },
                          child:Row(
                            children: [
                              Icon(Get.isDarkMode?FontAwesomeIcons.lightbulb:FontAwesomeIcons.moon,
                                size: 20,),
                              const SizedBox(width: 10,),
                              Text(Get.isDarkMode?'تفعيل الوضع الفاتح':'تفعيل الوضع الغامق',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),)
                    ),
                    PopupMenuItem<Text>(
                        child: TextButton(onPressed: (){}, child:const Text('تواصل معنا'))
                    ),
                    PopupMenuItem<Text>(
                        child: TextButton(
                            onPressed: () async {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        child: Center(
                                            child:
                                            CircularProgressIndicator()));
                                  });

                              try {
                                await FirebaseAuth.instance
                                    .signOut()
                                    .then((value) async {
                                  final prefs =
                                  await SharedPreferences.getInstance();

                                  prefs.setString('ID', "");
                                  prefs.setString('email', "");
                                  prefs.setString('name', "");
                                  prefs.setString('picURL', "");

                                  Navigator.of(context).pop();

                                  Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

                                });
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            child: const Text('تسجيل الخروج')))
                  ];

                }


              }),
        ],
      ),
    );
  }
}
