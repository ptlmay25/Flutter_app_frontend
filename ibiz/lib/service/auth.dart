import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibiz/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid,contact: user.phoneNumber) : null;
  }

  //Sign out
  Future signOut() async {
    _firebaseAuth.signOut();
  }

  //check credencial for otp
  Future signIn(AuthCredential authCredential) async {
    await _firebaseAuth.signInWithCredential(authCredential);
  }

  //signInWithOtp
  Future signInWithOtp(smsCode, verid) async {
    try {
      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: verid, smsCode: smsCode);
      AuthResult result = await signIn(authCredential);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (eroor) {
      return null;
    }
  }
}
