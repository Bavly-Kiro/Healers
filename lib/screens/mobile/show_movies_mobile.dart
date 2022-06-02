
import 'dart:convert';
import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/widget/audio_sound.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/book_in_row.dart';
import 'package:http/http.dart' as http;

import '../../widget/player_mobile.dart';



class ShowMoviesMobile extends StatefulWidget {
  const ShowMoviesMobile({Key? key}) : super(key: key);

  @override
  _ShowMoviesState createState() => _ShowMoviesState();
}

class _ShowMoviesState extends State<ShowMoviesMobile> {

  bool isSoundIcon = true;
  bool showPlayer = false;
  IconData icons = Icons.play_circle_fill;

  bool showOffers = true;

  List<bookInRow> firstList = [];

  String name = "";
  String category = "";
  String writerName = "";
  String about = "";
  String profits = "";
  String time = "";
  String episodesNum = "";
  String urlB = "";
  String urlP = "";
  String num = "";

  String refB = "";
  String refP = "";

  String categoryID = "";
  String writerNameID = "";

  String movieID = "";

  String clicked = "";

  bool loading = false;

  bool isCopy = false;

  @override
  void initState() {
    super.initState();

    getData();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    log("BACK BUTTON!");
    // Do some stuff.

    Get.offNamed(Routes.categoryMovies);

    return true;
  }


  Future<void> getData() async {
    setState(() {
      loading = true;
    });

    name = "";

    category = "";
    writerName = "";

    about = "";
    profits = "";
    time = "";

    num = "";

    episodesNum = "";
    urlB = "";
    urlP = "";

    refB = "";
    refP = "";

    categoryID = "";
    writerNameID = "";

    clicked = "";

    try {
      final prefs = await SharedPreferences.getInstance();
      log("movieID: " + movieID);
      log("clicked: " + clicked);

      movieID = prefs.getString('movieID').toString();
      clicked = prefs.getString('clicked').toString();

      log("movieID: " + movieID);
      log("clicked: " + clicked);

      var url = Uri.parse('');

      if (clicked == "s&m") {
        log("hhhheeeeeeerrrrrr");
        url = Uri.parse(
            'https://pandarosh-91270-default-rtdb.firebaseio.com/s&mInfo/$movieID.json');
      } else if (clicked == "books") {
        log("555555555555");

        url = Uri.parse(
            'https://pandarosh-91270-default-rtdb.firebaseio.com/booksInfo/$movieID.json');
      }

      log("url: " + url.toString());

      await http.get(url).then((value) async {
        if (value.body == "{}") {
          log("error loading");
        } else {
          final extractedData = json.decode(value.body);

          final urlCat = Uri.parse(
              '${'https://pandarosh-91270-default-rtdb.firebaseio.com/categories/' + extractedData['category']}/name.json');

          log("urlCat: " + urlCat.toString());

          //get category name
          await http.get(urlCat).then((valueCat) async {
            //get writer name
            final urlWrit = Uri.parse(
                '${'https://pandarosh-91270-default-rtdb.firebaseio.com/writers/' + extractedData['writer']}/name.json');
            log("77777777");

            await http.get(urlWrit).then((valueWrit) async {
              setState(() {
                name = extractedData['name'];

                category = json.decode(valueCat.body);
                writerName = json.decode(valueWrit.body);

                categoryID = extractedData['category'];
                writerNameID = extractedData['writer'];

                about = extractedData['about'];
                profits = extractedData['profits'];
                time = extractedData['time'];

                num = extractedData['num'];

                episodesNum = extractedData['episodes'];
                urlB = extractedData['urlB'];
                urlP = extractedData['urlP'];

                refB = extractedData['refB'];
                refP = extractedData['refP'];
              });

              getEpisodesRow();
            });
          });
        }
      });
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> getEpisodesRow() async {
    firstList = [];

    try {
      //s&m
      var url = Uri.parse('');

      if (clicked == "s&m") {
        url = Uri.parse(
            'https://pandarosh-91270-default-rtdb.firebaseio.com/s&mEpis.json?orderBy="movie"&equalTo="$movieID"');
      } else if (clicked == "books") {
        url = Uri.parse(
            'https://pandarosh-91270-default-rtdb.firebaseio.com/booksEpis.json?orderBy="movie"&equalTo="$movieID"');
      }

      await http.get(url).then((value) async {
        log(movieID);
        final extractedData = json.decode(value.body);

        final List<bookInRow> loadData = [];

        extractedData?.forEach((Key, value) {
          loadData.add(bookInRow(
            idToEdit: Key,
            name: value['name'],
            urlP: urlP,
            ref: value['ref'],
            EpisodeNum: value['EpisodeNum'],
            url: value['url'],
          ));
        });

        setState(() {
          firstList = loadData;
          loading = false;
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }


  String urlToShare = "www.google.com";
  String textToShare = "555555555555  wsxa as";


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:  AppBar(
          foregroundColor: Colors.deepOrange,
          elevation: 0.0,
          backgroundColor:  Get.isDarkMode?const Color(0XFF2B2D2F): const Color(0XFFF8F8F8),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width*0.7,
                      height: size.height*0.45,
                      margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.isDarkMode?Colors.white:const Color(0XFFEAF5F8),
                          border: Border.all(
                              color: Colors.deepOrange,
                              width: 0.5
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/kk.gif',
                                image: urlP,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding:const  EdgeInsets.symmetric(horizontal: 8.0),
                            child:  Text(name,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Get.isDarkMode?Colors.black:const Color(0XFF215480),
                              fontSize: 25,
                            ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 5),
                            child:  Text(writerName,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF215480),
                              fontSize: 20,
                            ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child:   Text(about
                        ,textAlign: TextAlign.start,

                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: size.width*0.05,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode?Colors.white:Colors.black
                        ),
                      ),
                    ),
                     Divider(color: Get.isDarkMode?Colors.white:Colors.grey,height: 2,),

                    Container(
                      width: double.infinity,
                      height: 350,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: ListView.builder(
                        itemCount: firstList.length,
                           scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: () async {
                                //on tap episode

                                final prefs =
                                await SharedPreferences.getInstance();

                                prefs.setString(
                                    'lastClickedMovie', movieID.toString());
                                prefs.setString('lastClickedEpisode',
                                    firstList[index].idToEdit.toString());
                                prefs.setString('lastClicked', clicked);

                                setState(() {
                                  if(showPlayer){

                                  }else{
                                    prefs.setBool('showPlayerGlobal', true);

                                    showPlayer = true;
                                  }

                                });
                              },
                              child: Container(
                                width: size.width*0.55,
                                height: size.height*0.35,
                                margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:Get.isDarkMode?Colors.white: const Color(0XFFEAF5F8),
                                    border: Border.all(
                                        color: Colors.deepOrange,
                                        width: 0.5
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                        child: FadeInImage.assetNetwork(
                                          placeholder: 'assets/kk.gif',
                                          image: urlP,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                     Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 10.0,
                                          vertical: 8),
                                      child:  Text(firstList[index].name,style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF215480),
                                        fontSize: 20,
                                      ),
                                        textAlign: TextAlign.center,),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                     Divider(color: Get.isDarkMode?Colors.white:Colors.grey,height: 2,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(onPressed: () {
                            Get.defaultDialog(
                              title: 'حول كتابك',
                              barrierDismissible: false,
                              buttonColor:
                              Colors.deepOrange,
                              content: Column(
                                children: [
                                  Text(
                                      ':اذا اعجبك هذا الكتاب يمكنك الأن التواصل معنا لتحويل كتابك'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            await launchUrl(
                                                Uri.parse(
                                                    'https://wa.me/message/XJFNP7N7WYRBJ1'));
                                          },
                                          child: Icon(
                                            FontAwesomeIcons
                                                .whatsapp,
                                            size: 40,
                                            color: Colors
                                                .green,
                                          )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            await launchUrl(
                                                Uri.parse(
                                                    'https://www.facebook.com/KITABAKMASMO3'));
                                          },
                                          child: Icon(
                                            FontAwesomeIcons
                                                .facebook,
                                            size: 40,
                                            color:
                                            Colors.blue,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              cancelTextColor: Colors.black,
                              textCancel: 'العوده',
                            );
                          },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            color: Colors.deepOrange,
                            child:const Padding(
                              padding:  EdgeInsets.all(5.0),
                              child:   Text('حول كتابك',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: 25,color: Colors.white
                                ),),
                            ),

                          ),
/*                          const SizedBox(width: 20,),
                          MaterialButton(onPressed: (){

                          },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            color: Colors.deepOrange,
                            child:const Padding(
                              padding:  EdgeInsets.all(5.0),
                              child:   Text('الدعم والتبرع',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: 25,color: Colors.white
                                ),),
                            ),

                          ),*/


                        ],
                      ),
                    ),
                    showPlayer?const SizedBox(  height: 80,):Container(),
                  ],
                ),
              ),
              showPlayer?MusicPlayer():Container()
            ],
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() async {
    // Create a new provider

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(child: Center(child: CircularProgressIndicator()));
        });

    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithPopup(googleProvider).then((value) {
        checkIfFirstTime(
            value.user?.displayName ?? "error",
            value.user?.email ?? "error",
            value.user?.photoURL ?? "error",
            "google");
      });
    } catch (error) {
      Navigator.of(context).pop();
      log("error here:" + error.toString());
    }
  }

  void signInWithFacebook() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(child: Center(child: CircularProgressIndicator()));
        });

    try {
      // Create a new provider
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithPopup(facebookProvider)
          .then((value) {
        checkIfFirstTime(
            value.user?.displayName ?? "error",
            value.user?.email ?? "error",
            value.user?.photoURL ?? "error",
            "facebook");
      });
    } catch (error) {
      Navigator.of(context).pop();
      log("error here:" + error.toString());
    }

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }

  void checkIfFirstTime(name, email, picURL, loggedWith) async {
    //checkDataBase
    try {
      //s&m
      final url = Uri.parse(
          'https://pandarosh-91270-default-rtdb.firebaseio.com/users.json?orderBy="email"&equalTo="$email"');

      await http.get(url).then((value) async {
        if (value.body == "{}") {
          //first time
          newAccount(name, email, picURL, loggedWith);
        } else {
          //logged before

          final prefs = await SharedPreferences.getInstance();

          prefs.setString('email', email);

          Navigator.of(context).pop();

          Navigator.of(context).pushNamed(Routes.showMovies);
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void newAccount(name, email, picURL, loggedWith) async {
    try {
      final url = Uri.parse(
          'https://pandarosh-91270-default-rtdb.firebaseio.com/users.json');

      await http
          .post(
        url,
        body: json.encode({
          'name': name,
          'email': email,
          'picURL': picURL,
          'loggedWith': loggedWith,
        }),
      )
          .then((value) async {
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('email', email);

        Navigator.of(context).pop();

        Navigator.of(context).pushNamed(Routes.showMovies);
      });
    } catch (err) {
      log(err.toString());
    }
  }
}
