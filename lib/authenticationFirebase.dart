import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabla_periodica_interactiva/principal.dart';

// import 'package:tabla_periodica/auth.dart';
// import 'package:tabla_periodica/principal.dart';



class EstadoAutenticar extends StatefulWidget {
  const EstadoAutenticar({super.key});

  @override
  State<StatefulWidget> createState() => _EstadoAutenticar();
}

class _EstadoAutenticar extends State<EstadoAutenticar> {

  Future<User?> loginUsingEmailPassword({required String email,
      required String password,required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print( "el correo o la contraseña son incorrectos");
      }else if (e.code !='user-not-found'){
        print("el correo o la contraseña es incorrecta");
      }

      if (e.code == 'wrond password') {
        print("la contraseña es muy corta");
      }
    }
      print(user);
    return user;
    
  }
  

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login-Registro',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Iniciar Sesion'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Icon(
                  Icons.person,
                  size: 250,
                )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: email,
                        obscureText: false,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Usuario',
                          icon: const Icon(Icons.person),
                          contentPadding: const EdgeInsets.all(20),
                          fillColor: Colors.greenAccent,
                          hintText: "Usuario:",
                          // ignore: prefer_const_constructors
                          hintStyle: const TextStyle(
                              color:  Color.fromARGB(255, 44, 201, 125)),
                        ),
                      ),
                      TextField(
                        controller: password,
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          icon: const Icon(Icons.password),
                          contentPadding: const EdgeInsets.all(20),
                          fillColor: Colors.greenAccent,
                          hintText: "Password:",
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 56, 133, 49)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () async {
                            User? user = await loginUsingEmailPassword(
                                email: email.text.trim(),
                                password: password.text.trim(),
                                context: context);
                            if (user != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const PantallaPrincipal()));
                            }
                          },
                          child: const Text("Iniciar Sesion")),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}


