import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        alerta(context, "el correo o la contraseña son incorrectos");
      }else if (e.code !='user-not-found'){
        alerta(context, "el correo o la contraseña es incorrecta");
      }

      if (e.code == 'wrond password') {
        alerta2(context, "la contraseña es muy corta");
      }
    }
      print(user);
    return user;
    
  }

  void alerta(BuildContext context, mensaje) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("alerta"),
          content: Text(mensaje),
        );
      });
}

void alerta2(BuildContext context, mensaje) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("alerta"),
          content: Text(mensaje),
        );
      });
}
