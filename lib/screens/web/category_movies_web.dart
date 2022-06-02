import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/widget/card_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/main.dart';
import 'package:http/http.dart' as http;

import '../../widget/player.dart';

class CategoryMoviesWeb extends StatefulWidget {
  const CategoryMoviesWeb({Key? key}) : super(key: key);

  @override
  State<CategoryMoviesWeb> createState() => _CategoryMoviesWebState();
}

class _CategoryMoviesWebState extends State<CategoryMoviesWeb> {
  bool loading = true;
  String clicked = "books";
  bool notLogged = true;
  bool isLogin = false;
  bool clickMe = true;

  String userID = "";
  String userName = "";
  String userEmail = "";
  String userPicURL = "";


  bool showPlayerGlobal = false;
  bool showPlayer = false;


  @override
  void initState() {
    super.initState();

    getData();
  }

  List<mainL> theList = [];

  void getData() async {
    theList = [];

    final prefs = await SharedPreferences.getInstance();


    showPlayerGlobal = prefs.getBool('showPlayerGlobal') ?? false;

    if(showPlayerGlobal){
      setState((){
        showPlayer = true;
      });
    }else{
      setState((){
        showPlayer = false;
      });
    }

    clicked = prefs.getString('clicked').toString();
    if(clicked == "libS&M" ||clicked == "libBooks"){
      clickMe = true;
    }else {
      clickMe = false;
    }


    log(clicked);

    try {

      getUserData();

      if (clicked == "s&m" || clicked == "books") {
        final url = Uri.parse(
            'https://pandarosh-91270-default-rtdb.firebaseio.com/' +
                clicked +
                '.json');

        http.get(url).then((value) {
          if (value.body == "{}") {
          } else {
            final List<mainL> loadData = [];

            final extractedData = json.decode(value.body);

            extractedData?.forEach((Key, value) {
              loadData.add(mainL(
                idToEdit: Key,
                name: value['name'],
                num: value['num'],
                urlB: value['urlB'],
                urlP: value['urlP'],
                infoID: value['info'],
              ));
            });

            setState(() {
              theList = loadData;
              loading = false;
              tempList = theList;
            });


          }
        });
      }

      else {

        setState((){
          //for the load
          clicked = "";
        });


      }

    } catch (error) {
      log(error.toString());
    }
  }

  void getUserData() async {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(child: Center(child: CircularProgressIndicator()));
        });


    final prefs = await SharedPreferences.getInstance();

    userEmail = prefs.getString('email') ?? "";

    try {

      if (userEmail == "") {

        Navigator.of(context).pop();

        setState((){
          notLogged = true;
        });

      }
      else {

        final url = Uri.parse('https://pandarosh-91270-default-rtdb.firebaseio.com/users.json?orderBy="email"&equalTo="$userEmail"');


        http.get(url).then((value) {
          if (value.body == "{}") {

            Navigator.of(context).pop();

          }
          else {

            final extractedData = json.decode(value.body);

            extractedData?.forEach((Key, value) {

              setState((){
                userID = Key;
                userName = value['name'];
                userEmail = value['email'];
                userPicURL = value['picURL'];
              });

            });

            prefs.setString('ID', userID);
            prefs.setString('email', userEmail);
            prefs.setString('name', userName);
            prefs.setString('picURL', userPicURL);

            Navigator.of(context).pop();

            setState(() {
              notLogged = false;
            });


          }
        });

      }

    } catch (error) {
      log(error.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          width: double.infinity,
                          color: context.theme.backgroundColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'باندا روش',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: size.width * 0.020,
                                  fontFamily: 'aribic',
                                  fontWeight: FontWeight.bold,
                                  //fontStyle: FontStyle.italic,
                                ),
                              ),
                              const VerticalDivider(
                                color: Colors.black,
                                indent: 1,
                                endIndent: 1,
                                thickness: 0.5,
                              ),
                              CircleAvatar(
                                radius: size.width * 0.015,
                                backgroundColor: Colors.black,
                                backgroundImage: userPicURL.isEmpty? NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/001/840/612/small/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg')
                                : NetworkImage(userPicURL),
                              ),
                              SizedBox(
                                width: size.width * 0.010,
                              ),
                              Text(
                                userName,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: size.width * 0.015,
                                ),
                              ),
                              const Spacer(),

                              Container(
                                //search bar
                                width: size.width*0.40,
                                height: 40,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade300
                                ),
                                child:  TextFormField(
                                  onChanged: (v) {

                                    filter(v);

                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    suffixIconColor: Colors.deepOrange,
                                    hintText: 'ابحث عن المزيد من المسلسلات والافلام والكتب',
                                    hintStyle: TextStyle(
                                        fontSize: size.width>=900?size.width*0.012:size.width*0.015,
                                        color: Colors.black
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300
                                        )
                                    ),
                                  ),

                                ),

                                /*Row(
                                children:  [
                                  Text('ابحث عن المزيد من المسلسلات والافلام ',
                                    style: TextStyle(
                                      fontSize: size.width*0.01,
                                        color: Colors.black
                                    ),),
                                  const Spacer(),
                                  const Icon(Icons.search)
                                ],
                              ),*/
                              ),

                              const SizedBox(
                                width: 15,
                              ),
                              (size.width>660)?MaterialButton(onPressed: (){
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
                                color: Colors.deepOrange,
                                child:  Text('حول كتابك',
                                  style: TextStyle(
                                      fontFamily: 'aribic',
                                      fontSize: size.width*0.015,color: Colors.white
                                  ),),
                                /*padding: const EdgeInsets.only(top:10, right: 12,
                                    left: 12,
                                    bottom: 20),*/
                              ):Container(),
                            ],
                          ),
                        ),

                        //mn awl hnnnnaaaaaa
                        Container(
                          child:
                              clicked == "s&m" || clicked == "books" ? loading
                                  ? Center(child: CircularProgressIndicator())
                                  : Expanded(
                                child: GridView.builder(
                                    padding: const EdgeInsets.all(20),
                                    shrinkWrap: false,
                                    gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 400,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: 180,
                                        crossAxisSpacing: 8,
                                        childAspectRatio: 3 / 2),
                                    itemCount: theList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async{
                                          final prefs = await SharedPreferences.getInstance();

                                          prefs.setString('movieID', theList[index].infoID.toString());


                                          Get.offNamed(Routes.showMovies);

                                        },
                                        child: HoverCrossFadeWidget(
                                          duration:
                                          Duration(milliseconds: 500),
                                          firstChild: Container(
                                            child: FadeInImage.assetNetwork(
                                              placeholder: 'assets/kk.gif',
                                              image: theList[index].urlP,
                                              height: 180,
                                              width: 400,
                                              fit: BoxFit.cover,
                                            ),


                                                    /*Image.network(,
                                                      errorBuilder: ,
                                                      loadingBuilder: ,
                                                      placeholder: 'assets/images/logo.png',
                                                      height: size.width*0.050,
                                                      width: size.width*0.050,
                                                    ).image,*/
                                                ) ,
                                          secondChild: Container(
                                            width: 400,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.deepOrange,
                                                    width: 0.5)),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    FadeInImage.assetNetwork(
                                                      placeholder: 'assets/kk.gif',
                                                      image: theList[index].urlP,
                                                      height: 150,
                                                      width: 400,
                                                      fit: BoxFit.cover,
                                                    )
                                                   /* Image.network(
                                                      theList[index].urlP,
                                                      fit: BoxFit.cover,
                                                      width: 400,
                                                      height: 150,
                                                    )*/,
                                                    const Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: Banner(
                                                        color: Colors.red,
                                                        message: 'الجديد',
                                                        location:
                                                        BannerLocation
                                                            .topEnd,
                                                      ),
                                                    ),
                                                    /*Positioned(
                                                  top: 10,
                                                    right: 10,
                                                    child:Container(
                                                      color: Colors.black38,
                                                      child: const Text('10:54',style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                        textAlign: TextAlign.start,),
                                                    )
                                                )*/
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    theList[index].name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Get.isDarkMode
                                                          ? Colors.white
                                                          : const Color(
                                                          0XFF215480),
                                                      fontSize: 20,
                                                    ),
                                                    textAlign:
                                                    TextAlign.start,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                              : notLogged ? Expanded(
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //color: Colors.deepOrange,
                                        border: Border.all(color: Colors.deepOrange,
                                            width: 3),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('يجب عليك تسجيل الدخول لرؤيه مكتبتك او المفضله',
                                          style: TextStyle(
                                            color: Get.isDarkMode?Colors.white:Colors.black,
                                            fontSize: 18,

                                          ),),
                                        const SizedBox(height: 20,),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  signInWithFacebook();
                                                },
                                                child: Icon(FontAwesomeIcons.facebook,
                                                  color: Colors.blueAccent,size: 40,),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  signInWithGoogle();
                                                },
                                                child: Image.asset(
                                                  "assets/images/google.png",
                                                  fit: BoxFit.fill,
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  : loading
                                  ? Center(child: CircularProgressIndicator())
                                  : Expanded(
                                child: GridView.builder(
                                    padding: const EdgeInsets.all(20),
                                    shrinkWrap: false,
                                    gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 400,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: 180,
                                        crossAxisSpacing: 8,
                                        childAspectRatio: 3 / 2),
                                    itemCount: theList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: ()  async{
                                          final prefs = await SharedPreferences.getInstance();

                                          prefs.setString('movieID', theList[index].infoID.toString());


                                          Get.offNamed(Routes.showMovies);
                                        },
                                        child: HoverCrossFadeWidget(
                                          duration:
                                          Duration(milliseconds: 500),
                                          firstChild: Expanded(
                                            child: FadeInImage.assetNetwork(
                                              placeholder: 'assets/kk.gif',
                                              image: theList[index].urlP,
                                              height: 180,
                                              width: 400,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          secondChild: Container(
                                            width: 400,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.deepOrange,
                                                    width: 0.5)),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Image.network(
                                                      theList[index].urlP,
                                                      fit: BoxFit.cover,
                                                      width: 400,
                                                      height: 150,
                                                    ),
                                                    const Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: Banner(
                                                        color: Colors.red,
                                                        message: 'الجديد',
                                                        location:
                                                        BannerLocation
                                                            .topEnd,
                                                      ),
                                                    ),
                                                    /*Positioned(
                                                  top: 10,
                                                    right: 10,
                                                    child:Container(
                                                      color: Colors.black38,
                                                      child: const Text('10:54',style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                        textAlign: TextAlign.start,),
                                                    )
                                                )*/
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    theList[index].name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Get.isDarkMode
                                                          ? Colors.white
                                                          : const Color(
                                                          0XFF215480),
                                                      fontSize: 20,
                                                    ),
                                                    textAlign:
                                                    TextAlign.start,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                        ),
                      ],
                    ),
                  ),
                  clicked == "books"
                      ? CardScreen(
                          isBook: true,
                          isFav: false,
                          isLib: false,
                          isMovies: false,
                        )
                      : clicked == "s&m"
                          ? CardScreen(
                              isBook: false,
                              isFav: false,
                              isLib: false,
                              isMovies: true,
                            )
                          : clickMe
                              ? CardScreen(
                                  isBook: false,
                                  isFav: false,
                                  isLib: true,
                                  isMovies: false,
                                )
                              /*: clickMe
                                  ? CardScreen(
                                      isBook: false,
                                      isFav: false,
                                      isLib: true,
                                      isMovies: false,
                                    )*/
                                  : CardScreen(
                                      isBook: false,
                                      isFav: true,
                                      isLib: false,
                                      isMovies: false,
                                    ),
                ],
              ),
            ),

            //bottom
            showPlayer //here
                ? thePlayer()
                : Container()

          ],
        ),
      ),
    );
  }

  List<mainL> tempList = [];

  void filter(String enteredKeyword) {
    List<mainL> results = [];


    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users

      setState((){
        theList = tempList;
      });

    } else {

      results = theList.where((name) => name.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      setState((){
        theList = results;
      });

        // we use the toLowerCase() method to make it case-insensitive
    }


  }



  void signInWithGoogle() async {
    // Create a new provider

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(child: Center(child: CircularProgressIndicator()));
        });

    try{

      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithPopup(googleProvider).then((value) {
        checkIfFirstTime(value.user?.displayName ?? "error", value.user?.email ?? "error", value.user?.photoURL ?? "error", "google");
      });

    }catch(error){
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

    try{

      // Create a new provider
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithPopup(facebookProvider).then((value) {
        checkIfFirstTime(value.user?.displayName ?? "error", value.user?.email ?? "error", value.user?.photoURL ?? "error", "facebook");
      });


    }catch(error){
      Navigator.of(context).pop();
      log("error here:" + error.toString());
    }


    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }


  void checkIfFirstTime(name, email, picURL, loggedWith) async{

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

          Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

        }

      });
    } catch (e) {
      log(e.toString());
    }

  }

  void newAccount(name, email, picURL, loggedWith) async {

    try{


      final url = Uri.parse('https://pandarosh-91270-default-rtdb.firebaseio.com/users.json');

      await http
          .post(
        url,
        body: json.encode({
          'name': name,
          'email': email,
          'picURL': picURL,
          'loggedWith': loggedWith,

        }),
      ).then((value) async{

        final prefs = await SharedPreferences.getInstance();

        prefs.setString('email', email);

        Navigator.of(context).pop();

        Navigator.of(context).popAndPushNamed(Routes.categoryMovies);

      });


    }catch(err){
      log(err.toString());
    }

  }



}
