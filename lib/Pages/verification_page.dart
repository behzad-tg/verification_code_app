import 'package:flutter/material.dart';

import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:simple_animations/stateless_animation/custom_animation.dart';

import '../animations.dart';
import '../clipper.dart';
import '../const.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 200, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RoutAnimation(
                        _routAnimationController,
                        0.0,
                        const Text("Verification",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                      RoutAnimation(
                        _routAnimationController,
                        0.1,
                        const Text("Please enter the 4 digit code sent to",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black26)),
                      ),
                      const SizedBox(height: 5),
                      RoutAnimation(
                        _routAnimationController,
                        0.2,
                        const Text("+98 905 609 7079",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black26)),
                      ),
                      const SizedBox(height: 20),
                      RoutAnimation(
                        _routAnimationController,
                        0.3,
                        VerificationCode(
                          textStyle:
                              TextStyle(fontSize: 20.0, color: Colors.red[900]),
                          underlineColor: Colors.amber,
                          keyboardType: TextInputType.number,
                          length: 4,
                          onCompleted: (String value) {},
                          onEditing: (bool value) {},
                        ),
                      ),
                      const SizedBox(height: 20),
                      RoutAnimation(
                        _routAnimationController,
                        0.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't resive the SMS?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black26)),
                            const SizedBox(width: 5),
                            Text("Resend",
                                style: TextStyle(
                                    fontSize: 15, color: primaryColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RoutAnimation(
                    _routAnimationController,
                    0.5,
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: primaryColor),
                      ),
                      child: const Center(
                        child: Text("Verify",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
