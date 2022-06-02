
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/widget/audio_sound.dart';
import 'package:pandarosh/widget/card_screens.dart';

class FavBookWeb extends StatelessWidget {

  const FavBookWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    print(MediaQuery.of(context).size.width);
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
                        Container(height: 50,
                          padding: const EdgeInsets.symmetric( horizontal: 20, ),
                          width: double.infinity,
                          color: context.theme.backgroundColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('باندا روش',style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: size.width*0.020,
                                fontFamily: 'aribic',
                                fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic,
                              ),),
                              const VerticalDivider(
                                color: Colors.black,
                                indent: 1,
                                endIndent: 1,
                                thickness: 0.5,
                              ),
                              Text('الكتب المفضله',style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: size.width*0.018,
                                fontFamily: 'aribic',
                                fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic,
                              ),),
                              const Spacer(),
                              (size.width>820)?Container(
                                width: size.width*0.40,
                                height: 40,
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade300
                                ),
                                child:  Row(
                                  children:  [
                                    Text('ابحث عن الكتب المفضله',
                                      style: TextStyle(
                                          fontSize: size.width*0.01,
                                          color: Colors.black
                                      ),),
                                    const Spacer(),
                                    const Icon(Icons.search)
                                  ],
                                ),
                              ):Container(),
                              const SizedBox(width: 15,),
                              (size.width>660)?MaterialButton(onPressed: (){},
                                color: Colors.deepOrange,
                                child:  Text('الدعم و التبرع',
                                  style: TextStyle(
                                      fontFamily: 'aribic',
                                      fontSize: size.width*0.015,color: Colors.white
                                  ),),
                                padding: const EdgeInsets.all(12),
                              ):Container(),
                            ],
                          ),),
                        Expanded(
                          child: GridView.builder(
                              padding: const EdgeInsets.all(20),
                              shrinkWrap: false,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 180,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 3/2),
                              itemCount: 10,
                              itemBuilder: (context,index){
                                return InkWell(
                                  onTap: ()=>Get.toNamed(Routes.showBook),
                                  child: HoverCrossFadeWidget(
                                    duration: const Duration(milliseconds: 500),
                                    firstChild: Container(
                                      decoration:  const BoxDecoration(
                                          image:  DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage('assets/images/book.jpg',)
                                          )
                                      ),

                                    ),
                                    secondChild: Container(
                                      width: 400,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.deepOrange,
                                              width: 0.5
                                          )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Image.asset('assets/images/image.webp',
                                                fit: BoxFit.cover,width: 400,
                                                height: 150,
                                              ),
                                              const Positioned(
                                                top: 0,
                                                left: 0,
                                                child:  Banner(
                                                  color: Colors.red,
                                                  message: 'الجديد',
                                                  location: BannerLocation.topEnd,
                                                ),
                                              ),
                                              Positioned(
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
                                                  ) )
                                            ],
                                          ),
                                          Padding(
                                            padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                                            child:  Text('الحقيقه والسراب',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Get.isDarkMode?Colors.white:const Color(0XFF215480),
                                              fontSize: 20,
                                            ),
                                              textAlign: TextAlign.start,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  CardScreen(isBook: false,isFav: true, isLib: false,isMovies: false,),
                ],
              ),
            ),
            Card(
              color: context.theme.backgroundColor,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children:  [
                      (size.width>710)?Image.asset('assets/images/book.jpg',
                        height: size.width*0.050,width: size.width*0.050,):Container(),
                      const SizedBox(width: 15,),
                      (size.width>710)?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('الجقيقه والسراب',style: TextStyle(
                              color: Get.isDarkMode?Colors.white:Colors.black,
                              fontSize: size.width*0.015,fontWeight: FontWeight.bold
                          ),),
                          Text('احمد اسماعيل',style: TextStyle(
                              color: Get.isDarkMode?Colors.white:Colors.blueAccent,
                              fontSize: size.width*0.012,fontWeight: FontWeight.normal
                          ),)
                        ],
                      ):Container(),
                      const Spacer(),
                      (size.width>710)?const Icon(FontAwesomeIcons.heartCircleBolt,color: Colors.red,):Container(),
                      SizedBox( width: size.width*0.012,),
                      const Icon(FontAwesomeIcons.share,color: Colors.deepOrange,),
                      VerticalDivider(color: Colors.grey.shade300,
                        thickness: 2,
                        indent: 10,endIndent: 10,),

                      const AudioThePlayer(),
                      VerticalDivider(color: Colors.grey.shade300,
                        thickness: 2,
                        indent: 10,endIndent: 10,),
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child:  Icon(FontAwesomeIcons.volumeHigh,color: Colors.deepOrange,),
                      ),
                      VerticalDivider(color: Colors.grey.shade300,
                        thickness: 2,
                        indent: 10,endIndent: 10,),
                      MaterialButton(onPressed: (){},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        color: Colors.deepOrange,
                        child: Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                          child:   Row(
                            children: [
                              Text('المزيد ',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: size.width*0.012,color: Colors.white
                                ),),
                              const  SizedBox(width: 5,),
                              const Icon(Icons.keyboard_arrow_up,
                                color: Colors.white,)
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
