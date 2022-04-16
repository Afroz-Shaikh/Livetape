import 'package:flutter/material.dart';
import 'package:livetape/controllers/auth_controller.dart';
import 'package:livetape/screens/home_screen.dart';
import 'package:livetape/screens/widget/button.dart';
import 'package:livetape/utils/styles.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlue,
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Start or Join a Meeting ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Login or Signup to start or join a meeting ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.6)),
                ),
                Image.asset('assets/images/art01.png'),
                appButton(
                  text: 'Login',
                  onClick: () {
                    _authController.signinWithGoogle();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
