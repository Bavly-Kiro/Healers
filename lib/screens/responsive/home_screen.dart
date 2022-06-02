

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandarosh/unit/responsive.dart';
import 'package:pandarosh/screens/mobile/home_screen_mobile.dart';
import 'package:pandarosh/screens/web/home_screen_web.dart';
import 'package:pandarosh/widget/back_ground_image.dart';

import 'category_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  HomeScreenMobile(),
        webWidget: HomeScreenWeb());
  }
}
