import 'package:firebase_auth/firebase_auth.dart';
import 'package:maisxbox/domain/usecases/sign_in/i_sign_in_anonymous.dart';

class SignInAnonymous implements ISignInAnonymous {
  @override
  Future<void> execute() async {
    await FirebaseAuth.instance.signInAnonymously();
  }
}
