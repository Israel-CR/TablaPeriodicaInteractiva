import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabla_periodica_interactiva/auth.dart';
import 'package:tabla_periodica_interactiva/principal.dart';

// import 'package:tabla_periodica/auth.dart';
// import 'package:tabla_periodica/principal.dart';

class EstadoAutenticar extends StatefulWidget {
  const EstadoAutenticar({super.key});

  @override
  State<StatefulWidget> createState() => _EstadoAutenticar();
}

class _EstadoAutenticar extends State<EstadoAutenticar> {

  

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: ListView(
          children:[
        Container(
          width: MediaQuery.of(context).size.width, // Ancho igual al ancho de la pantalla
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/img/fondo.jpg'), // Ruta de la imagen
              fit: BoxFit.cover, // Ajusta la imagen al tamaño del container
            ),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: email,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          icon: const Icon(Icons.person),
                          fillColor: Colors.blueGrey,
                          hintText: "Usuario:",
                          // ignore: prefer_const_constructors
                          hintStyle: const TextStyle(
                              color:  Colors.black38),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        controller: password,
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Icon(Icons.password),
                          fillColor: Colors.blueGrey,
                          hintText: "escribe tu contraseña:",
                          hintStyle: const TextStyle(
                              color: Colors.black38,)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextButton(
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
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(150, 40)),
                              backgroundColor:MaterialStateProperty.all(Colors.blue), // Cambia el color de fondo
                              ),
                          child: const Text("Iniciar Sesion",
                          style:TextStyle(
                            color: Colors.white
                          )
                          )),
                          Text("¿aun no tienes una cuenta?"),
                           TextButton(
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
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(150, 40)),
                              backgroundColor:MaterialStateProperty.all(Colors.blueGrey), // Cambia el color de fondo
                            ),
                          child: const Text("Registrate",
                          style:TextStyle(
                            color: Colors.white
                          )
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),])
      );
  }
}


