import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scanner_app_flutter/select_event_screen/select_event_screen.dart';
import 'login_screen/login_screen.dart';
import 'package:get_storage/get_storage.dart';
Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scanner App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        if(checkUserLogin()){
          Get.off(const SelectEventScreen());
        }
        else{
          Get.off(const LoginScreen());
        }
      },
    );
  }


  bool checkUserLogin(){
    GetStorage box=GetStorage();
    if(box.read('loginStatus')!=null) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "image/splash.png",
          width: 200,
        ),
      ),
    );
  }
}
