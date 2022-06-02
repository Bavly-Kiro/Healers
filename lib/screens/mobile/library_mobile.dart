

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pandarosh/unit/routes.dart';

class LibraryMobile extends StatelessWidget {
  const LibraryMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text('الافلام والمسلسلات',style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: size.width*0.04,
                  fontFamily: 'aribic',
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                ),),
                Text('الكتب',style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: size.width*0.04,
                  fontFamily: 'aribic',
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                ),),
              ],
            ),
            foregroundColor: Colors.deepOrange,
            elevation: 0.0,
            backgroundColor:  Get.isDarkMode?const Color(0XFF2B2D2F): const Color(0XFFF8F8F8),
            title:  Text('مكتبتي',style: TextStyle(
              color: Colors.deepOrange,
              fontSize: size.width*0.06,
              fontFamily: 'aribic',
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
            ),),
          ),
          backgroundColor: context.theme.backgroundColor,
          body: const TabBarView(
            children: [
              LibraryMovies(),
              LibraryBook(),
            ],
          ),
        ),
      ),
    );
  }

}
class LibraryMovies extends StatelessWidget {
  const LibraryMovies({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return GridView.builder(
        padding: const EdgeInsets.all(5),
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            mainAxisExtent: 200,
            crossAxisSpacing: 8,
            childAspectRatio: 3/2),
        itemCount: 5,
        itemBuilder: (context,index){
          return InkWell(
            onTap: ()=>Get.toNamed(Routes.showMovies),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.deepOrange,
                      width: 0.5
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/image.webp',
                          fit: BoxFit.cover,width: 400,
                          height: 150,
                        ),
                        const Positioned(
                          top: 0,
                          left: 0,
                          child:  Banner(
                            color: Colors.red,
                            message: 'الجديد',
                            location: BannerLocation.topEnd,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child:Container(
                              color: Colors.black38,
                              child: const Text('10:54',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                                textAlign: TextAlign.start,),
                            ) )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                      child:  Text('الحقيقه والسراب',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode?Colors.white:const Color(0XFF215480),
                        fontSize: size.width*0.04,
                      ),
                        textAlign: TextAlign.start,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
class LibraryBook extends StatelessWidget {
  const LibraryBook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return GridView.builder(
        padding: const EdgeInsets.all(5),
        shrinkWrap: false,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            mainAxisExtent: 200,
            crossAxisSpacing: 8,
            childAspectRatio: 3/2),
        itemCount: 10,
        itemBuilder: (context,index){
          return InkWell(
            onTap: ()=>Get.toNamed(Routes.showBook),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.deepOrange,
                      width: 0.5
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/book.jpg',
                          fit: BoxFit.cover,width: 400,
                          height: 150,
                        ),
                        const Positioned(
                          top: 0,
                          left: 0,
                          child:  Banner(
                            color: Colors.red,
                            message: 'الجديد',
                            location: BannerLocation.topEnd,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child:Container(
                              color: Colors.black38,
                              child: const Text('10:54',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                                textAlign: TextAlign.start,),
                            ) )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6),
                      child:  Text('الحقيقه والسراب',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode?Colors.white:const Color(0XFF215480),
                        fontSize: size.width*0.04,
                      ),
                        textAlign: TextAlign.start,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}



