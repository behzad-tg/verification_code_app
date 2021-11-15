// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project6/Pages/verification_page.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

import '../animations.dart';
import '../clipper.dart';
import '../const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late CustomAnimationControl _routAnimationController;

  @override
  void initState() {
    _routAnimationController = CustomAnimationControl.play;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
      width: _width,
      height: _height,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300,
              width: _width,
              color: primaryColor.withOpacity(0.3),
            ),
          ),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 50,
              color: primaryColor,
            ),
          ), Padding(
            padding:
            const EdgeInsets.only(right: 20, left: 20, top: 200, bottom: 50),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RoutAnimation(
                    _routAnimationController,
                    0.0,
                    const Text("Sing In",
                        style:
                            TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  RoutAnimation(
                    _routAnimationController,
                    0.2,
                    const Text("Enter your number to continue",
                        style: TextStyle(fontSize: 15, color: Colors.black26)),
                  ),
                  const SizedBox(height: 50),
                  RoutAnimation(
                    _routAnimationController,
                    0.3,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: IntlPhoneField(
                        decoration: const InputDecoration(
                          hintText: "Phone Number",
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(),
                        ),
                        initialCountryCode: 'US',
                        iconPosition: IconPosition.trailing,
                        // textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                  )
                ],
              ),
              RoutAnimation(
                _routAnimationController,
                0.4,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const VerificationPage(),
                          transitionDuration: Duration.zero),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: primaryColor),
                    ),
                    child: const Center(
                      child: Text("Send SMS",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
        ),
          ),
        ]
      ),
      ),
    );
  }
}
