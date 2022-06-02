
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AudioThePlayer extends StatefulWidget {
  const AudioThePlayer({Key? key}) : super(key: key);

  @override
  _AudioThePlayerState createState() => _AudioThePlayerState();
}

class _AudioThePlayerState extends State<AudioThePlayer> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              const Text('0:01',style: TextStyle(color: Colors.blueAccent,fontSize: 15),),
              const Spacer(),
              const  Icon(Icons.loop_sharp,color: Colors.grey,size: 20,),
              const Spacer(),
              Icon(Icons.skip_next_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,),
              const Icon(Icons.play_circle_filled_sharp,color: Colors.blue,size: 40,),
              Icon(Icons.skip_previous_rounded,color: Get.isDarkMode?Colors.white:Colors.black,size: 30,),
              const Spacer(),
              const Icon(Icons.audiotrack,color: Colors.grey,size: 20,),
              const Spacer(),
              const Text('3:11',style: TextStyle(color: Colors.blueAccent,fontSize: 15),)
            ],
          ),
          Expanded(
            child: Slider(value: 1,
                min: 1,
                max: 10,
                thumbColor: Colors.blueAccent,
                divisions: 1,
                inactiveColor: Colors.grey.shade300,
                activeColor: Colors.grey.shade300,
                onChanged: (value){},
            ),
          )
        ],
      ),
    );
  }
}



