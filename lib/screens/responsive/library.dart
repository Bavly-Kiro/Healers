
import 'package:flutter/material.dart';
import 'package:pandarosh/screens/mobile/library_mobile.dart';
import 'package:pandarosh/screens/web/library_movies_web.dart';
import 'package:pandarosh/unit/responsive.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  LibraryMobile(),
        webWidget: LibraryMoviesWeb());
  }
}

