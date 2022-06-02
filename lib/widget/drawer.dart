
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pandarosh/unit/routes.dart';
import 'package:pandarosh/unit/theme.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:const  [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  backgroundImage:  NetworkImage('https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=',),
                ),
                SizedBox(height: 10,),
                Text('Ahmed Mostafa',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
              ],
            ),
          ),
          Divider(height: 3,
            color: Get.isDarkMode?Colors.white:Colors.black,),
          const SizedBox(height: 5,),
          ListTile(
            title: Text('المسلسلات و الافلام',

              textAlign: TextAlign.start,
              style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(FontAwesomeIcons.clapperboard,
              color: Colors.deepOrange,size: 30,),
            onTap: ()=>Get.offNamed(Routes.categoryMovies),
          ),
          ListTile(
            title: Text('الكتب',
              textAlign: TextAlign.start,
              style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(FontAwesomeIcons.bookMedical,
              color: Colors.deepOrange,size: 30,),
            onTap: ()=>Get.offNamed(Routes.categoryBook),
          ),
          ListTile(
            title: Text('مكتبتي',

              textAlign: TextAlign.start,
              style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(Icons.library_music,
              color: Colors.deepOrange,size: 30,),
            onTap: ()=>Get.offAndToNamed(Routes.library),
          ),
          ListTile(
            title: Text('المفضله',

              textAlign: TextAlign.start,
              style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(FontAwesomeIcons.heartCircleBolt,
              color: Colors.deepOrange,size: 30,),
            onTap: ()=>Get.offAndToNamed(Routes.fav),
          ),
          ListTile(
            title: Text(Get.isDarkMode?'الوضع الغامق':'الوضع الفاتح',

              softWrap: true,

              style:  TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:   Icon(Get.isDarkMode?FontAwesomeIcons.moon:FontAwesomeIcons.lightbulb,
              color: Colors.deepOrange,size: 30,),
            onTap: ()=> ThemeController().changeTheTheme(),
          ),

          ListTile(
            title: Text('الدعم و التبرع',
              textAlign: TextAlign.start,
              style: TextStyle(color:  Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(Icons.volunteer_activism,
              color: Colors.deepOrange,size: 30,),
            onTap: (){},
          ),

          ListTile(
            title: Text('تسجيل الخروج',
              textAlign: TextAlign.start,
              style: TextStyle(color: Get.isDarkMode?Colors.grey:Colors.black,
                  fontSize: 20),) ,
            leading:  const Icon(Icons.logout,
              color: Colors.deepOrange,size: 30,),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
