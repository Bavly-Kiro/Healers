
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandarosh/unit/responsive.dart';
import 'package:pandarosh/screens/mobile/show_movies_mobile.dart';
import 'package:pandarosh/screens/web/show_movies_web.dart';


class ShowMovies extends StatelessWidget {
  const ShowMovies({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  ShowMoviesMobile(),
        webWidget: ShowMoviesWeb());
  }
}
