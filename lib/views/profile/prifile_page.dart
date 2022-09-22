import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_part/utils/constanta.dart';
import 'package:firebase_auth_part/utils/my_utils.dart';
import 'package:firebase_auth_part/view_models/auth_view_model.dart';
import 'package:firebase_auth_part/views/login/login.dart';
import 'package:firebase_auth_part/views/profile/widgets/profile_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/ui_needs/color.dart';
import '../../utils/ui_needs/style.dart';
import '../../view_models/file_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PlatformFile? pickedFile;
  String password = "";

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      pickedFile = result.files.first;
      context.read<FileViewModel>().uploadUserImage(
            pickedFile!,
            context,
          );
    } else {
      MyUtils.getMyToast(message: "File not picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<User?>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned(
            top: 0.h,
            left: 0.w,
            child: Container(
              width: 350.w,
              height: 450.h,
              decoration:  BoxDecoration(
                  gradient: RadialGradient(
                      center: const Alignment(-0.5, -0.2),
                      colors: const [
                        Color.fromARGB(99, 33, 216, 216),
                        Colors.white,
                      ],
                      radius: 0.6.r)),
            )),
        Positioned(
            top: 500.h,
            right: 0.w,
            child: Container(
              width: 350.w,
              height: 450.h,
              decoration:  BoxDecoration(
                  gradient: RadialGradient(
                      center: const Alignment(0.5, 0.1),
                      colors: const [
                        Color.fromARGB(44, 11, 255, 22),
                        Colors.white,
                      ],
                      radius: 0.6.r)),
            )),
        Padding(
          padding:  EdgeInsets.all(16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account Information",
                        style: MyTextStyle.sfProBold.copyWith(fontSize: 24.sp, color: MyColors.black),
                      ),
                       SizedBox(
                        width: 70.w,
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                adminAuthDialog(onChanged: (v) {
                                  setState(() {
                                    password = v;
                                  });
                                }, onTap: () {
                                  if (password == adminPassword) {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, adminPage);
                                  } else {
                                    MyUtils.showSnackBar(context, "Password Wrong");
                                    Navigator.pop(context);
                                  }
                                });
                              },
                              icon:  Icon(
                                Icons.person_pin,
                                size: 40.sp,
                                color: const Color(0xFF0EBE7F),
                              )),
                          Text(
                            "Admin",
                            style: MyTextStyle.sfProRegular.copyWith(color: const Color(0xFF0EBE7F)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                 SizedBox(height: 24.h),
                ClipOval(
                  child: (user!.photoURL != null)
                      ? Image.network(
                          user.photoURL!,
                          width: 124.h,
                          height: 124.h,
                          fit: BoxFit.cover,
                        )
                      :  Icon(
                          Icons.person,
                          size: 124.sp,
                          color: Colors.grey,
                        ),
                ),
                TextButton(
                    onPressed: () {
                      selectFile();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update profile image",
                          style: MyTextStyle.sfProRegular.copyWith(color: MyColors.C_0001FC, fontSize: 16.sp),
                        ),
                         SizedBox(width: 16.w),
                        const Icon(
                          Icons.edit,
                          color: MyColors.C_0001FC,
                        )
                      ],
                    )),
                 SizedBox(height: 50.h),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: MyTextStyle.sfProRegular.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
                ProfileInfoItem(
                    title: "Email",
                    subTitle: user.email ?? "",
                    onEditTap: () {
                      updateFieldDialog(
                          inputValue: (v) {
                            context.read<AuthViewModel>().updateEmail(
                                  context: context,
                                  email: v,
                                );
                          },
                          initialText: user.email ?? "");
                    }),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Full Name",
                      style: MyTextStyle.sfProRegular.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
                ProfileInfoItem(
                    title: "User Name",
                    subTitle: user.displayName ?? "",
                    onEditTap: () {
                      updateFieldDialog(
                          inputValue: (v) {
                            context.read<AuthViewModel>().updateDisplayName(
                                  context: context,
                                  displayName: v,
                                );
                          },
                          initialText: user.displayName ?? "");
                    }),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: MyTextStyle.sfProRegular.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
                ProfileInfoItem(
                    title: "Password",
                    subTitle: "******",
                    onEditTap: () {
                      updateFieldDialog(
                          inputValue: (v) {
                            context.read<AuthViewModel>().updatePassword(
                                  context: context,
                                  password: v,
                                );
                          },
                          initialText: "*******");
                    }),
                Row(
                  children: [
                    // const Expanded(child: SizedBox()),
                    Expanded(
                        child: TextButton(
                            onPressed: signOutTap,
                            child:  Text(
                              "Sign Out",
                              style: MyTextStyle.sfProRegular.copyWith(color: Color(0xFF0EBE7F), fontSize: 18.sp),
                            ))),
                     SizedBox(height: 20.h),
                    Expanded(
                      child: TextButton(
                          onPressed: deleteAccountTap,
                          child: Text(
                            "Delete Account",
                            style: MyTextStyle.sfProRegular.copyWith(color: Colors.red, fontSize: 18.sp),
                          )),
                    ),
                    // const SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void signOutTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  const Text("Are you sure you want to Sign Out?",style: TextStyle(color: Colors.black)),
          actions: [
            OutlinedButton(
              onPressed: () {
                context.read<AuthViewModel>().signOut(context);
                Navigator.pop(context, login);
              },
              child: const Text("Yes",style: TextStyle(color: Color(0xFF0EBE7F)),),
            ),
            OutlinedButton(
              onPressed: () async {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:( context)=> LoginScreen(onClickSignUp:
                    (){})));
              },
              child: const Text("No",style: TextStyle(color: Color(0xFF0EBE7F)),
            )
            )],
        );
      },
    );
  }

  void updateFieldDialog({required ValueChanged<String> inputValue, required String initialText}) {
    final TextEditingController controller = TextEditingController();
    controller.text = initialText;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            margin:  EdgeInsets.symmetric(horizontal: 6.w),
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel",style: TextStyle(color: Color(0xFF0EBE7F)),
                    )),
                    TextButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            inputValue.call(controller.text);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("Save",style: TextStyle(color: Color(0xFF0EBE7F))))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteAccountTap() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure you want to delete your account?"),
            actions: [
              OutlinedButton(
                onPressed: () {
                  context.read<AuthViewModel>().deleteAccount(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:( context)=> LoginScreen(onClickSignUp:
                  (){})));
                },
                child: const Text("Yes",style: TextStyle(color: Color(0xFF0EBE7F))),
              ),
              OutlinedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text("No",style: TextStyle(color: Color(0xFF0EBE7F))),
              )
            ],
          );
        });
  }

  void adminAuthDialog({required ValueChanged<String> onChanged, required VoidCallback onTap}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6.h),
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter admin password", hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
                    onChanged: (v) {
                      onChanged.call(v);
                    },
                    textAlign: TextAlign.center,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(onPressed: onTap, child: const Text("Login"))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
