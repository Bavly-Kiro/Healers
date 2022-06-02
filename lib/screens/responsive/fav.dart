
import 'package:flutter/material.dart';
import 'package:pandarosh/screens/mobile/fav_mobile.dart';
import 'package:pandarosh/screens/web/fav_book_web.dart';
import 'package:pandarosh/unit/responsive.dart';

class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  FavMobile(),
        webWidget: FavBookWeb());
  }
}
