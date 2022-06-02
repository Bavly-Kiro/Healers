
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandarosh/screens/mobile/show_book_mobile.dart';
import 'package:pandarosh/unit/responsive.dart';
import 'package:pandarosh/screens/web/show_book_web.dart';

class ShowBook extends StatelessWidget {
  const ShowBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  ShowBookMobile(),
        webWidget: ShowBookWeb());
  }
}
