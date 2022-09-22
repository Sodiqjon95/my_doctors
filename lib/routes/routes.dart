import 'package:firebase_auth_part/data/models/category/category_item.dart';
import 'package:firebase_auth_part/data/models/category/update_arguments.dart';
import 'package:firebase_auth_part/main.dart';
import 'package:firebase_auth_part/utils/constanta.dart';
import 'package:firebase_auth_part/views/admin/admin_page.dart';
import 'package:firebase_auth_part/views/admin/category/categories_admin_page.dart';
import 'package:firebase_auth_part/views/admin/doctor/doctor_add_page.dart';
import 'package:firebase_auth_part/views/login/login.dart';
import 'package:firebase_auth_part/views/login/register.dart';
import 'package:firebase_auth_part/views/profile/prifile_page.dart';
import 'package:firebase_auth_part/views/splesh_screen.dart';
import 'package:firebase_auth_part/views/tab/tab_box.dart';
import 'package:flutter/material.dart';

import '../data/models/doctors/doctors_item.dart';
import '../views/admin/category/category_add_page.dart';
import '../views/admin/category/category_update_page.dart';
import '../views/admin/doctor/doctor_admin_page.dart';
import '../views/doctor_detail/doctor_deteail_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case mainPage:
        return MaterialPageRoute(builder: (_) => MainPage());
        case homePage:
        return MaterialPageRoute(builder: (_) => TabBox());
      case profilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case adminPage:
        return MaterialPageRoute(builder: (_) => AdminPage());
      case adminCategories:
        return MaterialPageRoute(builder: (_) => CategoryAdminPage());

      case adminDoctors:
        return MaterialPageRoute(builder: (_)=> DoctorAdminPage());

      case addCategory:
        return MaterialPageRoute(builder: (_) => CategoryAddPage());

      case addDoctor:
        return MaterialPageRoute(builder: (_) => DoctorAddPage());

      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case doctorDetail:
        return MaterialPageRoute(
            builder: (_) => DoctorDetailPage(
                doctorsItem: settings.arguments as DoctorsItem));
      case updateCategory:
        return MaterialPageRoute(
            builder: (_) => CategoryUpdatePage(
                updateCategoryArgs: settings.arguments as UpdateCategoryArgs));


      default :
        return MaterialPageRoute(builder: (_)=> const Scaffold(
          body: Center(child:  Text("Route not found"),),
        ));
    }
  }

}
