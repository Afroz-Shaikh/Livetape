import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livetape/controllers/auth_controller.dart';
import 'package:livetape/controllers/jitsi_controller.dart';
import 'package:livetape/screens/widget/button.dart';
import 'package:livetape/utils/styles.dart';

class NewCallScreen extends StatefulWidget {
  @override
  State<NewCallScreen> createState() => _NewCallScreenState();
}

class _NewCallScreenState extends State<NewCallScreen> {
  late TextEditingController meetingID;

  late TextEditingController userID;

  final AuthController _authController = AuthController();
  final JitsiCOntroller _jitsiCOntroller = JitsiCOntroller();

  @override
  void initState() {
    // TODO: implement initState
    meetingID = TextEditingController();
    userID = TextEditingController(text: _authController.user.displayName);
    super.initState();
  }

  _joinMeeting() {
    _jitsiCOntroller.createMeeting(
        roomName: meetingID.text,
        isAudioMuted: true,
        isVideomuted: true,
        username: userID.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroun,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroun,
        title: Text('Join a  meeting'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: TextField(
              controller: meetingID,
              keyboardType: TextInputType.number,
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  // fillColor: AppColors.clearBlack.withOpacity(0.3),
                  fillColor: AppColors.clearBlack,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: TextStyle(color: Colors.white)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: TextField(
              controller: userID,
              keyboardType: TextInputType.name,
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  // fillColor: AppColors.clearBlack.withOpacity(0.3),
                  fillColor: AppColors.clearBlack,
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: TextStyle(color: Colors.red)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: appButton(text: 'Join', onClick: _joinMeeting),
          )
        ],
      ),
    );
  }
}
