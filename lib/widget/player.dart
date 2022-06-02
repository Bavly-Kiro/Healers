import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/book_in_row.dart';
import 'package:http/http.dart' as http;

class thePlayer extends StatefulWidget {
  const thePlayer({Key? key}) : super(key: key);

  @override
  State<thePlayer> createState() => _thePlayerState();
}

class _thePlayerState extends State<thePlayer> with SingleTickerProviderStateMixin{

  bool loading = true;
  bool isMute=true;
  bool isCopy=false;

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
  String episode = "";

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    //_player.stop();
    getData();
  }

/*  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    super.dispose();
  }*/

  Future<void> getData() async {

    final prefs = await SharedPreferences.getInstance();

    bool alreadyPlaying = prefs.getBool('alreadyPlaying') ?? false;

/*    if(alreadyPlaying){

    }else{*/

      setState(() {
        loading = true;
        _controller.repeat();
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
      movieID = "";
      episode = "";

      try {
        final prefs = await SharedPreferences.getInstance();
        log("movieID: " + movieID);
        log("clicked: " + clicked);

        movieID = prefs.getString('lastClickedMovie').toString();
        clicked = prefs.getString('lastClicked').toString();
        episode = prefs.getString('lastClickedEpisode').toString();

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

   // }

  }

  Future<void> getEpisodesRow() async {

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
          firstList = [];
          firstList = loadData;
        });
        startAud();

      });
    } catch (e) {
      log(e.toString());
    }
  }

  final _player = AudioPlayer();
  bool playing = false;


  void startAud() async{


    _player.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {

        setState((){
          playing = false;
          loading = true;
        });

      }else if(processingState == ProcessingState.completed){

        print("complettteedd");
        nextEpis();

      }else if (!isPlaying) {

        setState((){
          playing = false;
          loading = false;
        });

      } else {

        setState(() async{
          playing = true;
          loading = false;

          final prefs = await SharedPreferences.getInstance();

          prefs.setBool('alreadyPlaying', true);
          //episodeTime = ;
        });

      }
    });

/*    _player.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {



      }
      else if(processingState == ProcessingState.ready){
        print("ready");

      }else if (!isPlaying) {



      }
      else if(isPlaying) {

      }

    });*/


    _player.positionStream.listen((timeNow) {
/*      final oldState = progressNotifier.value;

      progressNotifier.value = ProgressBarState(
        current: timeNow,
        buffered: oldState.buffered,
        total: oldState.total,
      );*/

    setState((){
      newTime = timeNow.inMicroseconds.toDouble();
      newTime2 = timeNow.inMicroseconds.toDouble();
    });

    //print("newTime: $newTime");
    //print("_player.duration?.inMicroseconds: ${_player.duration?.inMicroseconds}");



    });


    _player.durationStream.listen((totalDuration) {

      setState((){
        episodeTime = totalDuration?.inMicroseconds.toDouble() ?? Duration.zero.inMicroseconds.toDouble();
        _player.play();
      });

    });



    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          firstList[firstList.indexWhere((f) => f.idToEdit == episode)].url))
      );

    } catch (e) {
      print("Error loading audio source: $e");
    }



  }


/*  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }*/


/*  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));*/

  double newTime = 0;
  double newTime2 = 0;
  double episodeTime = 0;
  //double shownTime = 0;


  String formatedTime(int secTime) {

    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        getParsedTime(sec.toString()) + " : " + getParsedTime(min.toString());

    return parsedTime;
  }



  void previousEpis() async{

    try {

      final prefs = await SharedPreferences.getInstance();

      //episode = prefs.getString('lastClickedEpisode').toString();

      int ind = firstList.indexWhere((f) => f.idToEdit == episode);
      log("index: " + ind.toString());

      if(ind == 0){

      }else{

        await _player.setAudioSource(AudioSource.uri(Uri.parse(
            firstList[(firstList.indexWhere((f) => f.idToEdit == episode)) - 1].url))
        );


        prefs.setString('lastClickedEpisode', firstList[(firstList.indexWhere((f) => f.idToEdit == episode)) - 1].idToEdit.toString());

        getData();

      }

    } catch (e) {
      print("Error loading audio source: $e");
    }

  }

  void nextEpis() async{

    try {

      final prefs = await SharedPreferences.getInstance();

      //episode = prefs.getString('lastClickedEpisode').toString();

      int ind = firstList.indexWhere((f) => f.idToEdit == episode);

      log("index: " + ind.toString());

      if(ind == (firstList.length - 1)){



      }else{

        await _player.setAudioSource(AudioSource.uri(Uri.parse(
            firstList[(firstList.indexWhere((f) => f.idToEdit == episode)) + 1].url))
        );


        prefs.setString('lastClickedEpisode', firstList[(firstList.indexWhere((f) => f.idToEdit == episode)) + 1].idToEdit.toString());
        getData();

      }

    } catch (e) {
      print("Error loading audio source: $e");
    }

  }


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Card(
      color: context.theme.backgroundColor,
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children:  [
              (size.width>710)?
                  loading ? Container()
              :Image.network(urlP,
                height: size.width*0.050,
                width: size.width*0.050,
                fit: BoxFit.cover,
              ) :Container(),
              const SizedBox(width: 15,),
              (size.width>710)? loading? CircularProgressIndicator() : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(name + " - " + firstList[firstList.indexWhere((f) => f.idToEdit == episode)].name,style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: size.width*0.015,fontWeight: FontWeight.bold
                  ),),
                  Text(writerName,style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.blueAccent,
                      fontSize: size.width*0.012,fontWeight: FontWeight.normal
                  ),)
                ],
              ) :Container(),
              const Spacer(),
              (size.width>710)?const Icon(FontAwesomeIcons.heartCircleBolt,color: Colors.red,):Container(),
              SizedBox( width: size.width*0.012,),
              InkWell(
                  onTap: () {
                    isCopy = false;

                    Get.defaultDialog(
                      title: 'مشاركه',
                      barrierDismissible: false,
                      buttonColor:
                      Colors.deepOrange,
                      content: Column(
                        children: [
                          // Text('انسخ الرابط'),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  ':شارك هذا المسلسل او الكتاب مع اصدقائك'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () async {

                                         // await launchUrl(Uri.parse('https://www.facebook.com/sharer/sharer.php?u=$urlToShare&quote=$textToShare'));
                                        },
                                        child: Icon(
                                          FontAwesomeIcons
                                              .facebook,
                                          size: 40,
                                          color: Colors
                                              .blue,
                                        )
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () async {

                                        //  await launchUrl(Uri.parse('https://twitter.com/intent/tweet?url=$urlToShare&text=$textToShare'));
                                        },
                                        child: Icon(
                                          FontAwesomeIcons
                                              .twitter,
                                          size: 40,
                                          color: Colors
                                              .blue,
                                        )
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () async {

                                          //await launchUrl(Uri.parse('https://api.whatsapp.com/send?text=$textToShare\n$urlToShare'));
                                        },
                                        child: Icon(
                                          FontAwesomeIcons
                                              .whatsapp,
                                          size: 40,
                                          color: Colors
                                              .green,
                                        )
                                    ),
                                  )


                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      cancelTextColor:
                      Colors.black,
                      textCancel: 'العوده',
                    );
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.deepOrange,
                    size: size.width * 0.025,
                  )),
              VerticalDivider(color: Colors.grey.shade300,
                thickness: 2,
                indent: 10,endIndent: 10,),

              //middle part
              SizedBox(
                width: size.width*0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children:  [
                        Text(formatedTime(newTime2 ~/ 1000000).toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
                        const Spacer(),
                        //const  Icon(Icons.loop_sharp,color: Colors.grey,size: 20,),
                        const Spacer(),

                        InkWell(
                            onTap: (){

                              previousEpis();

                            },
                            child: Icon(Icons.skip_next_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,)
                        ),

                        loading? RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                          child: Icon(Icons.play_circle_filled_sharp,color: Colors.blue,size: 40,),
                        )
                            :InkWell(
                            onTap: (){

                              setState((){
                                if(playing){
                                  playing = false;
                                  _player.pause();
                                }else {
                                  playing = true;
                                  _player.play();
                                }
                              });


                            },
                            child: playing ? Icon(Icons.pause_circle_filled,color: Colors.blue,size: 40,) : Icon(Icons.play_circle_filled_sharp,color: Colors.blue,size: 40,)
                        ),



                        InkWell(
                            onTap: (){

                              nextEpis();

                            },
                            child: Icon(Icons.skip_previous_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,)
                        ),

                        const Spacer(),
                        // const Icon(Icons.audiotrack,color: Colors.grey,size: 20,),
                        const Spacer(),
                        Text(formatedTime(episodeTime ~/ 1000000).toString().toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 15),)
                      ],
                    ),

                    //slider
                    Expanded(
                      child:

                      /*ValueListenableBuilder<ProgressBarState>(
                        valueListenable: progressNotifier,
                        builder: (_, value, __) {
                          return ProgressBar(
                            progress: value.current,
                            buffered: value.buffered,
                            total: value.total,
                          );
                        },
                      ),*/

                      Slider(
                        value: newTime,
                        min: 0.0,
                        max: episodeTime,
                        thumbColor: Colors.blueAccent,
                        label: "sda",
                        inactiveColor: Colors.grey.shade300,
                        activeColor: Colors.grey.shade300,
                        onChanged: (value){
                          setState((){
                            newTime = value;
                            //shownTime = value * episodeTime;
                            print(value);
                          });
                        },
                        onChangeEnd: (v){
                          //load in the AudioPlayer

                          _player.seek(Duration(microseconds: v.toInt()));

                        },
                      ),
                    )
                  ],
                ),
              ),
              VerticalDivider(color: Colors.grey.shade300,
                thickness: 2,
                indent: 10,endIndent: 10,),
               Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0),
                child:  InkWell(
                onTap: () async{
                  setState((){
                    isMute=!isMute;
                  });

                  if(isMute){
                    await _player.setVolume(1);
                  }else{
                    await _player.setVolume(0);
                  }

                }
                ,child: Icon(isMute?FontAwesomeIcons.volumeHigh:FontAwesomeIcons.volumeMute,color: Colors.deepOrange,)),
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
                    ...firstList.map((e) => PopupMenuItem<Text>(
                        child:  ListTile(
                          style: ListTileStyle.list,
                          leading:  CircleAvatar(
                            radius: size.width*0.013,
                            backgroundImage: NetworkImage(urlP),
                          ),
                          title: Text(e.name,
                            style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                                fontSize: size.width*0.01),) ,
                          /*subtitle:  Text('الحقيقه والسراب',

                            style: TextStyle(color: Colors.blueAccent,
                              fontSize: size.width*0.009,),) ,*/
                          /*trailing: IconButton(
                            color: Colors.deepOrange,
                            onPressed: (){


                            },
                            icon: Icon(Icons.pause),
                          ),*/
                        )
                    ),).toList()
                  ]
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}