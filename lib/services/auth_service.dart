import 'package:firebase_auth/firebase_auth.dart';

class FireAuthService {

  FirebaseAuth auth = FirebaseAuth.instance;

  login() async {
    try{
      var user = await auth.signInWithEmailAndPassword(
          email: 'yurigrams@gmail.com',
          password: '123456789');
      return user;
    }catch (e) {
      throw e;
    }
  }

  recoverPassword() async {
    try{
        await auth.sendPasswordResetEmail(
          email: 'yurigrams@gmail.com');
      return true;
    }catch (e) {
      throw e;
    }
  }
}