import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibiz/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String verificationId;
  bool codeSent = false;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, contact: user.phoneNumber) : null;
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //Sign out
  Future signOut() async {
    _firebaseAuth.signOut();
  }

  //check credencial for otp
  Future signIn(AuthCredential authCredential) async {
    try {
      AuthResult result =
          await _firebaseAuth.signInWithCredential(authCredential);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      return error;
    }
  }

  //signInWithOtp
  Future signInWithOtp(smsCode) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: this.verificationId, smsCode: smsCode);
      await signIn(authCredential);
    } catch (error) {
      return error;
    }
  }

  Future verifyPhone(String phoneNumber) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authCredential) async {
      await signIn(authCredential);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('PhoneVerificationFailed ${authException.message}');
    };

    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      this.codeSent = true;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsOTPSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }
}
