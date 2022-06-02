
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:pandarosh/widget/audio_sound.dart';

class ShowBookMobile extends StatefulWidget {
  const ShowBookMobile({Key? key}) : super(key: key);

  @override
  _ShowMoviesState createState() => _ShowMoviesState();
}

class _ShowMoviesState extends State<ShowBookMobile> {
  bool isSoundIcon=true;
  bool isShowSoundPlay=false;
  IconData icons=Icons.play_circle_fill;
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
                              fontSize: 25,
                            ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,),
                          ),
                          const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 5),
                            child:  Text('احمد اسماعيل',style: TextStyle(
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
                      child:   Text('''يبحث قائد (الديسيبتكانز) عن حجرة خارقة تعطي حاملها قوة بناء أقوى جيش في المجرة، والوحيد الذي يمكنه الوصول إلى هذه الحجرة لوقف (الديسيبتكانز) هو (سام) وهو طالب بالجامعة، وصديقته (ميكايلا)، فهل سينقذ العالم قبل أن تقع الحجرة في أيدي (الديسيبتكانز)؟'''
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
                                        child: Image.asset('assets/images/book.jpg',
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 10.0,
                                          vertical: 8),
                                      child:  Text('الحلقه الاولي',style: TextStyle(
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
                    Divider(color:  Get.isDarkMode?Colors.white:Colors.grey,height: 2,),
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            color: Colors.deepOrange,
                            child:const Padding(
                              padding:  EdgeInsets.all(5.0),
                              child:   Text('حول كتباتك',
                                style: TextStyle(
                                    fontFamily: 'aribic',
                                    fontSize: 25,color: Colors.white
                                ),),
                            ),

                          ),
                          const SizedBox(width: 20,),
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

                          ),
                        ],
                      ),
                    ),
                    isShowSoundPlay?const SizedBox(  height: 80,):Container(),
                  ],
                ),
              ),
              isShowSoundPlay?MusicPlayer():Container()
            ],
          ),
        ),
      ),
    );
  }
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(const MusicScreen()),
      child: Card(
        color: context.theme.backgroundColor,
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child:Row(
            children: [
              Image.asset('assets/images/image.webp',
                height: 60,width: 60,),
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('الجقيقه والسراب',style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: MediaQuery.of(context).size.width*0.05,fontWeight: FontWeight.bold
                  ),),
                  Text('احمد اسماعيل',style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.blueAccent,
                      fontSize: MediaQuery.of(context).size.width*0.04,fontWeight: FontWeight.normal
                  ),)
                ],
              ),

              const Spacer(),
              const  Icon(Icons.loop_sharp,color: Colors.grey,size: 20,),
              const Spacer(),
              Icon(Icons.skip_next_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,),
              const Spacer(),
              const Icon(Icons.play_circle_filled_sharp,color: Colors.blue,size: 50,),
              const Spacer(),
              Icon(Icons.skip_previous_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,),
              const Spacer(),
              const Icon(Icons.audiotrack,color: Colors.grey,size: 20,),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0.0,
          foregroundColor: Colors.deepOrange,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('الجقيقه والسراب',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        fontSize: MediaQuery.of(context).size.width*0.07,fontWeight: FontWeight.bold
                    ),),
                    Text('احمد اسماعيل',style: TextStyle(
                        color: Get.isDarkMode?Colors.white:Colors.blueAccent,
                        fontSize: MediaQuery.of(context).size.width*0.06,fontWeight: FontWeight.normal
                    ),),
                    const SizedBox(height: 15,),
                    Image.asset('assets/images/image.webp',
                      height: 300,width: 300,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(FontAwesomeIcons.heartCircleBolt,color: Colors.red,),
                        Icon(FontAwesomeIcons.share,color: Colors.deepOrange,),
                        Icon(FontAwesomeIcons.volumeHigh,color: Colors.deepOrange,),

                      ],
                    ),
                    Slider(value: 1,
                      min: 1,
                      max: 10,
                      thumbColor: Colors.blueAccent,
                      divisions: 1,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: Colors.grey.shade300,
                      onChanged: (value){},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const  [
                        Text('0:01',style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                        Text('3:11',style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const  Icon(Icons.loop_sharp,color: Colors.grey,size: 30,),
                        const Spacer(),
                        Icon(Icons.skip_next_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 40,),
                        const Icon(Icons.play_circle_filled_sharp,color: Colors.blue,size: 50,),
                        Icon(Icons.skip_previous_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 40,),
                        const Spacer(),
                        const Icon(Icons.audiotrack,color: Colors.grey,size: 30,),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      onPressed: ()=>Get.to( MoreMusicScreen()),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      color: Colors.deepOrange,
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                        child:   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text('المزيد ',
                              style: TextStyle(
                                  fontFamily: 'aribic',
                                  fontSize: 18,color: Colors.white
                              ),),
                            SizedBox(width: 5,),
                            Icon(Icons.keyboard_arrow_up,
                              color: Colors.white,)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all( 12),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MoreMusicScreen extends StatefulWidget {
  MoreMusicScreen({Key? key}) : super(key: key);

  @override
  State<MoreMusicScreen> createState() => _MoreMusicScreenState();
}

class _MoreMusicScreenState extends State<MoreMusicScreen> {
  IconData icons=Icons.play_circle_fill;

  @override
  Widget build(BuildContext context) {

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar:AppBar(
            foregroundColor: Colors.deepOrange,
            backgroundColor: context.theme.backgroundColor,
            elevation: 0.0,
          ),
          body: ListView.builder(
              itemCount: 25,
              itemBuilder: (context,index){
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/image.webp',),
                  ),
                  title: Text('الحقيقه والسراب',
                    style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                        fontSize: 25),) ,
                  subtitle: const Text('الحقيقه والسراب',
                    style: TextStyle(color: Colors.blueAccent,
                        fontSize: 20),) ,
                  trailing: IconButton(
                    color: Colors.deepOrange,
                    onPressed: (){
                      setState(() {
                        icons=icons==Icons.pause?Icons.play_circle_fill:Icons.pause;
                      });
                    },
                    icon: Icon(icons),
                  ),
                );

              }),
        ));
  }
}

