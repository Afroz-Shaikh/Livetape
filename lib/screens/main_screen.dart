import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livetape/controllers/auth_controller.dart';
import 'package:livetape/controllers/jitsi_controller.dart';
import 'package:livetape/screens/new_call_screen.dart';
import 'package:livetape/screens/widget/iconButton.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final AuthController _authController = AuthController();

  final JitsiCOntroller _jitsiCOntroller = JitsiCOntroller();

  createNewMeet() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiCOntroller.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideomuted: true);
  }

  joinMeet() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => NewCallScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          // color: Colors.amberAccent,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Hi',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  _authController.user.displayName.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                  child: Container(
                    // color: Colors.red,
                    height: 180,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ButtonContainer(
                            onClick: createNewMeet,
                            label: 'New Meeting',
                            icon: Icons.add_box,
                          ),
                          SizedBox(
                            width: 44.w,
                          ),
                          ButtonContainer(
                            onClick: joinMeet,
                            label: 'Join Meeting',
                            icon: Icons.videocam,
                          )
                          // IconButton()
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Latest Meetings',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                  child: Center(child: Image.asset('assets/images/nod.png')),
                ),
                Center(
                    child: Text(
                  'No Meetings available',
                  style: TextStyle(color: Colors.black),
                )),
                Container(
                  color: Colors.blue,
                  height: 400.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
