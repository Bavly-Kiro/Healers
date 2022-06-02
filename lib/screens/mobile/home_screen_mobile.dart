import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/widget/back_ground_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMobile> {
  bool isLogin=false;
  bool isShowCategory=false;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              const BackGroundImage(),
              Padding(
                padding:const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              width: size.width*0.25,
                              height: size.width*0.25,
                            ),
                          ),
                          AnimatedSwitcher(
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
                                        width: size.width*0.1,
                                        height: size.width*0.1,
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
                                        width: size.width*0.1,
                                        height: size.width*0.1,
                                      ),
                                    )
                                  ]),
                            ):MaterialButton(onPressed: (){
                              setState(() {
                                isLogin=!isLogin;
                              });
                            },
                              child: Padding(
                                padding:  const EdgeInsets.all(5.0),
                                child:   Text('تسجيل الدخول',
                                  style: TextStyle(
                                      fontFamily: 'aribic',
                                      fontSize: size.width*0.03,color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),
                              ),
                              color:  Colors.deepOrange,
                              padding:  EdgeInsets.symmetric(vertical: size.height*0.015,horizontal: size.width*0.024),
                            ),

                          ),

                        ],
                      ),
                      SizedBox(height: size.height*0.02,),
                      Text('باندا روش',
                          textAlign: TextAlign.end,style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: size.width*0.125,
                          fontFamily: 'aribic',
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1.5,
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.italic,
                          shadows: const [
                            Shadow(color: Colors.blueAccent,offset: Offset(2, 2)),
                            Shadow(color: Colors.orangeAccent,offset: Offset(3, 3)),
                            Shadow(color: Colors.white,offset: Offset(4, 4)),
                          ]
                      ),),
                      SizedBox( height: size.height*0.01,),
                      Container(
                        color: Colors.black38,
                        child: Text('استمع لاقوى واحلى المسلسلات واستمتع بالكتب الصوتية',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'aribic',
                            fontSize: size.width*0.05,fontWeight: FontWeight.bold,
                          ),),
                      ),
                      AnimatedSwitcher(
                        duration:  const Duration(milliseconds: 600),
                        switchInCurve: Curves.linear,
                        reverseDuration: const Duration(milliseconds: 600),
                        child: isShowCategory?Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:() async{
                                final prefs = await SharedPreferences.getInstance();

                                prefs.setString('clicked', "s&m");

                                Get.toNamed(Routes.categoryMovies);

                              },
                              child: SizedBox(
                                width: size.width*0.25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset('assets/images/film.jpg',
                                          fit: BoxFit.fill,width: size.width*0.2,height: size.width*0.2,),
                                      ),
                                    ),
                                    const SizedBox( height: 10,),
                                    Container(
                                      color: Colors.black12,
                                      child:  Text('المسلسلات والأفلام',
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'aribic',
                                          fontSize: size.width*0.045,fontWeight: FontWeight.bold,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox( width: 15,),
                            InkWell(
                              onTap:() async{
                                final prefs = await SharedPreferences.getInstance();

                                prefs.setString('clicked', "books");

                                Get.toNamed(Routes.categoryMovies);

                              },
                              child: SizedBox(
                                width: size.width*0.25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset('assets/images/book.jpg',
                                          fit: BoxFit.fill,width: size.width*0.2,
                                          height: size.width*0.2,),
                                      ),
                                    ),
                                    const SizedBox( height: 10,),
                                    Container(
                                      color:Colors.black12,
                                      child:  Text('الكتب',
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'aribic',
                                          fontSize: size.width*0.04,fontWeight: FontWeight.bold,
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),



                          ],
                        ):Center(
                          child: MaterialButton(onPressed: (){
                            setState(() {
                              isShowCategory=!isShowCategory;
                            });
                          },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            color: Colors.deepOrange,
                            child: Padding(
                              padding:  const EdgeInsets.all(8.0),
                              child:   Text('بدا الاستخدام',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: size.width*0.045,color: Colors.white
                                ),),
                            ),
                            padding:EdgeInsets.symmetric(vertical: size.height*0.015,horizontal: size.width*0.024),
                          ),
                        ),),

                      SizedBox(height: size.height*0.2,),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(onPressed: (){
                    setState(() {
                    });
                  },
                    color: Colors.deepOrange,
                    child: Text('الدعم و التبرع',
                      style: TextStyle(
                          fontFamily: 'aribic',
                          fontSize: size.width*0.04,color: Colors.white
                      ),),
                    padding:  EdgeInsets.symmetric(vertical: size.height*0.015,horizontal: size.width*0.024),
                  ),
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}