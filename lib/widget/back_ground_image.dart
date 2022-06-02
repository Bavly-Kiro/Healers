
import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/back_ground.jpeg')
        ),
    ));


  }
}

