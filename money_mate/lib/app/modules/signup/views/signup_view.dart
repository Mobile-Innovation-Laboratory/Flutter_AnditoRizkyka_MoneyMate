import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_mate/app/services/authServices.dart';
import 'package:money_mate/app/widget/authfield.dart';
import 'package:money_mate/app/widget/buttonApp.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/lastlogo-bg.png",
                  width: 60,
                ),
                Gap.h12,
                Text(
                  'Hello Momates!',
                  style: TypographyApp.headline1,
                ),
                Gap.h8,
                Text(
                  'Signup to your account',
                  style: TypographyApp.text1,
                ),
                Gap.h24,
                AuthTextField(
                  title: "Fullname",
                  controller: nameController,
                ),
                Gap.h12,
                AuthTextField(
                  title: "Email",
                  controller: emailController,
                ),
                Gap.h12,
                AuthTextField(
                  title: "Password",
                  isObsecure: true,
                  controller: passwordController,
                ),
                Gap.h12,
                Gap.h12,
                ButtonApp(
                    action: "Sign-Up",
                    onTap: () async {
                      await Authservices().signup(
                        fullname: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }),
                Gap.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signin');
                      },
                      child: Text(
                        'Sign In',
                        style: TypographyApp.text1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
