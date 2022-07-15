import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:livetape/controllers/auth_controller.dart';
import 'package:livetape/controllers/firestore_controller.dart';

class JitsiCOntroller {
  final FirestoreController _firestoreController = FirestoreController();
  final AuthController _authController = AuthController();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideomuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();

      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty) {
        name = _authController.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        // Required, spaces will be trimmed
        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = _authController.user.displayName
        ..userEmail = _authController.user.email
        ..userAvatarURL = _authController.user.photoURL // or .png

        ..audioMuted = isAudioMuted
        ..videoMuted = isVideomuted;
      _firestoreController.addMeetingToFirestore(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {}
  }
}
