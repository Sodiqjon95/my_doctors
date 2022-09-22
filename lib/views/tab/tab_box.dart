import 'package:firebase_auth_part/views/profile/prifile_page.dart';
import 'package:firebase_auth_part/views/tab/categories_page/categories_page.dart';
import 'package:firebase_auth_part/views/tab/doctors/doctors_page.dart';
import 'package:flutter/material.dart';

import 'my_doctors/my_doctors_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;

  List<Widget> screens = [
    const CategoriesPage(),
    const DoctorsPage(),
    const MyDoctorsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
 body: IndexedStack(
   index: currentIndex,
   children: screens,
 ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 24,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle( color: Colors.green),
        items: [
          getItem(icon: Icons.category_sharp, labelTex: "Category"),
          getItem(icon: Icons.border_all_outlined, labelTex: "Doctors"),
          getItem(icon: Icons.stars_outlined, labelTex: "My Doctors"),
          getItem(icon: Icons.person, labelTex: "Profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem({
  required IconData icon, required String labelTex,}){
    return BottomNavigationBarItem(
      label: labelTex,
      icon: Icon(icon,color: Colors.black,),
    activeIcon: Icon(icon,color: const Color(0xFF0EBE7F),));
  }
}
