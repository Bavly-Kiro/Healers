
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/widget/audio_sound.dart';

class ShowBookWeb extends StatefulWidget {
  const ShowBookWeb({Key? key}) : super(key: key);

  @override
  _ShowMoviesState createState() => _ShowMoviesState();
}

class _ShowMoviesState extends State<ShowBookWeb> {

  bool isSoundIcon=true;
  bool isShowSoundPlay=false;
  IconData icons=Icons.play_circle_fill;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                SizedBox(
                  height: size.width*0.40,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children:[
                              Image.asset('assets/images/book.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: size.width*0.28,),
                              Container(
                                width: double.infinity,
                                height: size.width*0.028,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        tileMode: TileMode.clamp,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white10,
                                          Colors.white12,
                                          Colors.white24,
                                          Colors.white30,
                                          Colors.white38,
                                          Colors.white54,
                                          Colors.white60,
                                          Colors.white70,
                                          Colors.white,
                                        ]
                                    )
                                ),
                              ),
                              Positioned(
                                left:  size.width*0.015,
                                top:  size.width*0.015,
                                child: Container(
                                  height: size.width*0.04,
                                  width:  size.width*0.04,
                                  decoration:const  BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isSoundIcon=!isSoundIcon;
                                      });
                                    },
                                    child:   Icon(isSoundIcon?Icons.volume_up:Icons.volume_off,color: Colors.deepOrange,
                                      size:  size.width*0.05,),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:  size.width*0.015,vertical: 10),
                                  child: Container(
                                    height:  size.width*0.05,
                                    width:  size.width*0.05,
                                    decoration:const  BoxDecoration(
                                        color: Colors.black54,
                                        shape: BoxShape.circle
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          isShowSoundPlay=!isShowSoundPlay;
                                          icons=icons==Icons.pause?Icons.play_circle_fill:Icons.pause;
                                        });
                                      },
                                      child:  Icon(icons,color: Colors.deepOrange,
                                        size:  size.width*0.05,),),
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Row(
                          children: [
                            SizedBox(width: size.width*0.20,),
                            Container(
                              width: size.width*0.80,
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child:   Text('''يبحث قائد (الديسيبتكانز) عن حجرة خارقة تعطي حاملها قوة بناء أقوى جيش في المجرة، والوحيد الذي يمكنه الوصول إلى هذه الحجرة لوقف (الديسيبتكانز) هو (سام) وهو طالب بالجامعة، وصديقته (ميكايلا)، فهل سينقذ العالم قبل أن تقع الحجرة في أيدي (الديسيبتكانز)؟'''
                                ,textAlign: TextAlign.start,
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: size.width*0.020,
                                    fontWeight: FontWeight.normal,
                                    color: Get.isDarkMode?Colors.white:Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: size.width*0.15,
                          height: size.width*0.25,
                          margin:  EdgeInsets.symmetric(vertical: size.width*0.025,horizontal: 40),
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
                                  child: Image.asset('assets/images/book.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding:const  EdgeInsets.symmetric(horizontal: 8.0),
                                child:  Text('الحقيقه والسراب',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode?Colors.black:const Color(0XFF215480),
                                  fontSize: size.width*0.018,
                                ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.start,),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 5),
                                child:  Text('احمد اسماعيل',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0XFF215480),
                                  fontSize: size.width*0.013,
                                ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.start,),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(color: Get.isDarkMode?Colors.white:Colors.grey,height: 2,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(onPressed: (){},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Colors.deepOrange,
                        child: Padding(
                          padding:  const EdgeInsets.all(5.0),
                          child:   Text('حول كتباتك',
                            style: TextStyle(
                                fontFamily: 'aribic',
                                fontSize: size.width*0.018,color: Colors.white
                            ),),
                        ),

                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: size.width*0.25,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: ListView.builder(
                      itemCount: 25,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            setState(() {
                              isShowSoundPlay=!isShowSoundPlay;
                              icons=icons==Icons.pause?Icons.play_circle_fill:Icons.pause;
                            });
                          },
                          child: HoverCrossFadeWidget(
                            duration: const Duration(milliseconds: 500),
                            firstChild: Container(
                              width: size.width*0.15,
                              height: size.width*0.2,
                              margin: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:Get.isDarkMode?Colors.white: const Color(0XFFEAF5F8),
                              ),
                              child: ClipRRect(
                                borderRadius:  BorderRadius.circular(10),
                                child: Image.asset('assets/images/image.webp',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            secondChild:  Container(
                              width: size.width*0.15,
                              height: size.width*0.2,
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
                                      child: Image.asset('assets/images/image.webp',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:   EdgeInsets.symmetric(horizontal: size.width*0.006,
                                        vertical: 8),
                                    child:  Text('الحلقه الاولي',style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0XFF215480),
                                      fontSize: size.width*0.013,
                                    ),
                                      textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Divider(color:  Get.isDarkMode?Colors.white:Colors.grey,height: 2,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(onPressed: (){

                  },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:   Text('الدعم والتبرع',
                        style: TextStyle(
                            fontFamily: 'aribic',
                            fontSize: size.width*0.013,color: Colors.white
                        ),),
                    ),

                  ),
                ),
                isShowSoundPlay? SizedBox(  height: size.width*0.07,):Container(),
              ],
            ),

            isShowSoundPlay?Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                color: context.theme.backgroundColor,
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children:  [
                        (size.width>710)?Image.asset('assets/images/image.webp',
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
                        PopupMenuButton(
                            child:  Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12,
                                  vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.deepOrange,
                              ),
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
                            ),
                            itemBuilder:   (context) =>
                            <PopupMenuEntry<Text>>[
                              ...[1,2,3].map((e) => PopupMenuItem<Text>(
                                  child:  ListTile(
                                    style: ListTileStyle.list,
                                    leading:  CircleAvatar(
                                      radius: size.width*0.013,
                                      backgroundImage: AssetImage('assets/images/image.webp',),
                                    ),
                                    title: Text('الحقيقه والسراب',
                                      style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                                          fontSize: size.width*0.01),) ,
                                    subtitle:  Text('الحقيقه والسراب',

                                      style: TextStyle(color: Colors.blueAccent,
                                        fontSize: size.width*0.009,),) ,
                                    trailing: IconButton(
                                      color: Colors.deepOrange,
                                      onPressed: (){},
                                      icon: Icon(Icons.pause),
                                    ),
                                  )
                              ),).toList()
                            ]
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ):Container()
          ],
        ),
      ),
    );
  }
}
