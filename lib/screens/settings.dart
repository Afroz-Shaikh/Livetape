import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livetape/screens/auth/login_screen.dart';
import 'package:livetape/utils/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroun,
      appBar: AppBar(
        backgroundColor: AppColors.backgroun,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 31.sp),
            ),
            SizedBox(
              height: 42.h,
            ),
            // Tilewidget(
            //   title: 'Account',
            //   icon: Icons.person_outline_rounded,
            //   onClick: () {},
            // ),
            Tilewidget(
              title: 'Support Developer',
              icon: Icons.support,
              onClick: () {
                final snackBar = SnackBar(
                  backgroundColor: AppColors.lightBlue,
                  content: Text('Not abailable yet'),
                  duration: Duration(seconds: 4),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            Tilewidget(
              title: 'Help',
              icon: Icons.question_mark_rounded,
              onClick: () {},
            ),
            Tilewidget(
              title: 'About',
              icon: Icons.info_outline,
              onClick: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                          data: ThemeData.dark(),
                          child: CupertinoAlertDialog(
                            title: Text('Version: 0.70.1'),
                            content: Text('This  is a video calling app '),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'))
                            ],
                          ));
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                          data: ThemeData.dark(),
                          child: CupertinoAlertDialog(
                            title: Text('Do you want to Logout ?'),
                            actions: [
                              TextButton(
                                  // onPressed: () {
                                  //   Future<void> _signOut() async {
                                  //     await FirebaseAuth.instance.signOut();

                                  //     // Navigator.push(
                                  //     //     context,
                                  //     //     MaterialPageRoute(
                                  //     //         builder: (context) =>
                                  //     //             LoginScreen()));
                                  //   }
                                  // },
                                  onPressed: () {
                                    // FirebaseAuth.instance.signOut();
                                    final snackBar = SnackBar(
                                      backgroundColor: AppColors.lightBlue,
                                      content: Text('Could not sign out '),
                                      duration: Duration(seconds: 4),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'))
                            ],
                          ));
                    });
              },
              child: ListTile(
                minVerticalPadding: 20,
                tileColor: Color(0xff222222),
                title: Center(
                    child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.redAccent),
                )),
                trailing: Icon(
                  Icons.login,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Built by  ",
                    style: TextStyle(color: Colors.white, fontSize: 23.sp)),
                TextSpan(
                    text: "SHAIKH AFROZ",
                    style: TextStyle(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.sp)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class Tilewidget extends StatelessWidget {
  String title;
  IconData icon;
  final VoidCallback onClick;
  Tilewidget({required this.icon, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onClick,
        child: ListTile(
          minVerticalPadding: 20,
          tileColor: Color(0xff222222),
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
