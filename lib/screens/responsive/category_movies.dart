
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandarosh/unit/responsive.dart';
import 'package:pandarosh/screens/mobile/category_movies_mobile.dart';
import 'package:pandarosh/screens/web/category_movies_web.dart';

class CategoryMovies extends StatelessWidget {
  const CategoryMovies({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileWidget:  CategoryMoviesMobile(),
        webWidget: CategoryMoviesWeb());
  }
}
