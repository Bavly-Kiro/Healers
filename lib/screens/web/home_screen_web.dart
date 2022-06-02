import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/widget/back_ground_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenWeb> {
  bool isLogin = false;
  bool isShowCategory = false;

  @override
  Widget build(BuildContext context) {
    var sizeTotal = MediaQuery.of(context).size;
    print(MediaQuery.of(context).size.width);
    var size = sizeTotal.width >= 1000
        ? MediaQuery.of(context).size
        : sizeTotal.width <= 850
            ? MediaQuery.of(context).size * 1.5
            : MediaQuery.of(context).size * 1;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            const BackGroundImage(),
            Container(
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black38,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                            width: size.width * 0.10,
                            height: size.width * 0.10,
                          ),
                        ),
                        /* AnimatedSwitcher(
                          duration:  const Duration(milliseconds: 600),
                          switchInCurve: Curves.linear,
                          reverseDuration: const Duration(milliseconds: 600),
                          child: isLogin?
                          Container(
                            color: Colors.black26,
                            padding:  const EdgeInsets.all(22.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/images/facebook.png",
                                      fit: BoxFit.fill,
                                      width: size.height*0.030,
                                      height: size.height*0.030,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/images/google.png",
                                      fit: BoxFit.fill,
                                      width: size.height*0.030,
                                      height: size.height*0.030,
                                    ),
                                  )
                                ]),
                          ):MaterialButton(onPressed: (){
                            setState(() {
                              isLogin=!isLogin;
                            });
                          },
                            child: Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child:   Text('تسجيل الدخول',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: size.width*0.02,color: Colors.white
                                ),),
                            ),
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                    width: 3
                                )
                            ),
                            padding:  EdgeInsets.symmetric(vertical: size.height*0.015,horizontal: size.width*0.008),
                          ),

                        ),*/
                      ],
                    ),
                    // SizedBox(height: isShowCategory?size.height*0.00005:size.height*0.1,),
                    Text(
                      'باندا روش',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: size.width * 0.05,
                          fontFamily: 'aribic',
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1.5,
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.italic,
                          shadows: const [
                            Shadow(
                                color: Colors.blueAccent, offset: Offset(2, 2)),
                            Shadow(
                                color: Colors.orangeAccent,
                                offset: Offset(3, 3)),
                            Shadow(color: Colors.white, offset: Offset(4, 4)),
                          ]),
                    ),
                    SizedBox(height: size.height * 0.0125),
                    Container(
                      color: Colors.black54,
                      child: Text(
                        'استمع لاقوى واحلى المسلسلات واستمتع بالكتب الصوتية',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'aribic',
                          fontSize: size.width * 0.028,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.0125,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      switchInCurve: Curves.linear,
                      reverseDuration: const Duration(milliseconds: 600),
                      child: isShowCategory
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    prefs.setString('clicked', "s&m");

                                    Get.toNamed(Routes.categoryMovies);
                                  },
                                  child: SizedBox(
                                    width: size.width * 0.12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                              'assets/images/film.jpg',
                                              fit: BoxFit.fill,
                                              width: size.width * 0.18,
                                              height: size.width * 0.09,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          child: Text(
                                            'المسلسلات والأفلام',
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'aribic',
                                                fontSize: size.width * 0.02,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.white,
                                                      offset: Offset(1, 1)),
                                                  Shadow(
                                                      color: Colors.deepOrange,
                                                      offset: Offset(3, 3)),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.026,
                                ),
                                InkWell(
                                  onTap:() async{
                                    final prefs = await SharedPreferences.getInstance();

                                    prefs.setString('clicked', "books");

                                    Get.toNamed(Routes.categoryMovies);

                                  },
                                  child: SizedBox(
                                    width: size.width * 0.12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                              'assets/images/book.jpg',
                                              fit: BoxFit.fill,
                                              width: size.width * 0.18,
                                              height: size.width * 0.09,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          child: Text(
                                            'الكتب',
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.visible,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'aribic',
                                                fontSize: size.width * 0.02,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.white,
                                                      offset: Offset(1, 1)),
                                                  Shadow(
                                                      color: Colors.deepOrange,
                                                      offset: Offset(3, 3)),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    isShowCategory = !isShowCategory;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.deepOrange,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'بدا الاستخدام',
                                    style: TextStyle(
                                        fontFamily: 'aribic',
                                        fontSize: size.width * 0.018,
                                        color: Colors.white),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.015,
                                    horizontal: size.width * 0.008),
                              ),
                            ),
                    ),

                    //SizedBox(height: size.height*0.2,),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.015,
                    horizontal: size.width * 0.008),
                child: MaterialButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'حول كتابك',
                      barrierDismissible: false,
                      buttonColor: Colors.deepOrange,
                      content: Column(
                        children: [
                          Text(
                              ':اذا اعجبك هذا الكتاب يمكنك الأن التواصل معنا لتحويل كتابك'),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        'https://wa.me/message/XJFNP7N7WYRBJ1'));
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.whatsapp,
                                    size: 40,
                                    color: Colors.green,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        'https://www.facebook.com/KITABAKMASMO3'));
                                  },
                                  child: Icon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                    color: Colors.blue,
                                  )),
                            ],
                          )
                        ],
                      ),
                      cancelTextColor: Colors.black,
                      textCancel: 'العوده',
                    );
                  },
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'حول كتابك',
                      style: TextStyle(
                          fontFamily: 'aribic',
                          fontSize: size.width * 0.013,
                          color: Colors.white),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.008),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
