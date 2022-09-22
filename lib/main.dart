import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_part/routes/routes.dart';
import 'package:firebase_auth_part/utils/constanta.dart';
import 'package:firebase_auth_part/view_models/auth_view_model.dart';
import 'package:firebase_auth_part/view_models/category_view_model.dart';
import 'package:firebase_auth_part/view_models/doctor_view_model.dart';
import 'package:firebase_auth_part/view_models/file_view_model.dart';
import 'package:firebase_auth_part/view_models/my_doctors_view_model.dart';
import 'package:firebase_auth_part/views/auth_page.dart';
import 'package:firebase_auth_part/views/tab/tab_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final fireStore = FirebaseFirestore.instance;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider<AuthViewModel>(
              create: (_) => AuthViewModel(auth: FirebaseAuth.instance),
            ),
            StreamProvider(
              create: (context) => context.read<AuthViewModel>().authState(),
              initialData: null,
            ),
            Provider<CategoryViewModel>(
              create: (_) => CategoryViewModel(fireStore: fireStore),
            ),
            Provider<DoctorViewModel>(
              create: (_) => DoctorViewModel(fireStore: fireStore),
            ),
            Provider<MyDoctorsViewModel>(
              create: (_) => MyDoctorsViewModel(fireStore: fireStore),
            ),
            Provider<FileViewModel>(
              create: (_) => FileViewModel(),
            ),
            StreamProvider(
              create: (context) => context.read<AuthViewModel>().userInfoChanges,
              initialData: null,
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: splash,
            onGenerateRoute: MyRouter.generateRoute,
          ),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const TabBox();
    }
    return const AuthPage();
  }
}
