import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get instance => _auth;

  Future<dynamic> signUpEmailPassword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var data = await FirebaseFirestore.instance.collection('usuarios').add({
        'Nombre Completo': username,
        'email': email,
      });

      print(data.toString());

      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        return 'Contraseña muy débil, tiene que ser al menos 6 caracteres';
      }
      if (e.code == 'email-already-in-use') {
        return 'Este usuario ya se encuentra registrado';
      }
    }

    return null;
  }

  Future<dynamic> signInEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return 'Correo eléctronico o contraseña erronea';
    }
  }
}
