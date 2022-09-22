import 'package:firebase_auth_part/utils/ui_needs/color.dart';
import 'package:firebase_auth_part/utils/ui_needs/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlatAppBar extends StatelessWidget implements PreferredSize{
  const FlatAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      title: Text(
        title,
        style: MyTextStyle.sfProSemibold.copyWith(fontSize: 20, color: MyColors.black),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),

    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 56);
}
