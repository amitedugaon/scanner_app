import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:scanner_app_flutter/const/color.dart';
import '../select_event_screen/select_event_screen.dart';
import '../widget/progress_dialog.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  login(String email, password) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return ProgressDialog(message: "Processing Please Wait...");
          },);
      Response response = await post(
          Uri.parse("https://tickets-mascon.madwartech.com/api/login"),
          body: {
            "email": email,
            "password": password,
          });

      if (response.statusCode == 200) {
        GetStorage box=GetStorage();
        box.write('loginStatus', true);
        Get.to(const SelectEventScreen());
              } else {
      Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text("Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Use Your credential and login your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54)),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "amit123@gmail.com",
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    } else if (!value.contains("@gmail.com")) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "*****",
                    border: OutlineInputBorder(),
                    labelText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(statusBarColor),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login(emailController.text.toString(),
                                passwordController.text.toString());
                          }



                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
