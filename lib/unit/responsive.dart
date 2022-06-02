
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
  final Widget webWidget;
  const ResponsiveLayout({Key? key,required this.mobileWidget,required this.webWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints,){
      if(constraints.maxWidth<=500){
        return mobileWidget;
      }else{
        return webWidget;
      }

    });
  }
}
