import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livetape/controllers/auth_controller.dart';
import 'package:livetape/screens/settings.dart';
import 'package:livetape/utils/styles.dart';
import 'package:livetape/utils/utils.dart';

import 'auth/login_screen.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

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
              Tilewidget(
                  icon: Icons.person,
                  title: 'Change Name',
                  onClick: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Theme(
                              data: ThemeData.dark(),
                              child: CupertinoAlertDialog(
                                title: Text('Still Under Testing'),
                                content: Text('Feature Not ready yet!'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'))
                                ],
                              ));
                        });
                  }),
              // Tilewidget(
              //     icon: Icons.delete,
              //     title: 'Change Name',
              //     onClick: () async {
              //       AuthController().deleteUser(context);
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => LoginScreen()));
              //     }),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return Theme(
                              data: ThemeData.dark(),
                              child: CupertinoAlertDialog(
                                title: Text('Delete Account '),
                                content: Text(
                                    'Do You Really want to Delete Account ? '),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        await AuthController()
                                            .deleteUser(context);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                      child: Text('OK'))
                                ],
                              ));
                        });
                  },
                  child: ListTile(
                    minVerticalPadding: 20,
                    tileColor: Colors.redAccent,
                    leading: Icon(Icons.delete),
                    title: Text('Delete Account'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
