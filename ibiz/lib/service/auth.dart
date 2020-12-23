import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibiz/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Sign out
  signOut() {
    _firebaseAuth.signOut();
  }

  //check credencial for otp
  Future<bool> signIn(AuthCredential authCredential) async {
    dynamic res = await _firebaseAuth.signInWithCredential(authCredential);
    return res;
  }

  //signInWithOtp
  signInWithOtp(smsCode, verid) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verid, smsCode: smsCode);
    signIn(authCredential);
  }
}
