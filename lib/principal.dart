import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:tabla_periodica/controlador.dart';
import 'package:tabla_periodica_interactiva/modelo.dart';
import 'package:tabla_periodica_interactiva/widget_elemento.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  List<Elemento> listaElementos = [];

  final ScrollController _horizontalScrollController = ScrollController();
  // final ScrollController _verticalScrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    try {
      FirebaseFirestore.instance
          .collection('Elementos')
          .snapshots()
          .listen((QuerySnapshot querySnapshot) {
        listaElementos = querySnapshot.docs.map((document) {
          return Elemento(
              numAtomico: int.parse(document.id),
              nombre: document['propiedades']['nombre'],
              simbolo: document["propiedades"]["simbolo"] ?? '',
              grupo: document['propiedades']['grupo']);
        }).toList();
        // Actualiza el estado para reconstruir la interfaz de usuario
        setState(() {});
      });
    } catch (e) {
      print('Error al obtener datos de Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double? widhtContenedor;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 720) {
      widhtContenedor = screenWidth - 25;
    } else {
      widhtContenedor = 720;
    }

    if (listaElementos.isEmpty) {
      return const Scaffold(
         body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
                  LinearProgressIndicator(),
                  SizedBox(height: 16.0),
                  Text("Cargando datos...")// Indicador de carga lineal
              ],
                )
                );
    }else{

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Tabla periodica"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/img/fondo.jpg'), // Ruta de la imagen
              fit: BoxFit.cover, // Ajusta la imagen al tamaño del container
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  scrollDirection: Axis.horizontal,
                   controller: _horizontalScrollController,
                  child: Container(
                      width: widhtContenedor, //se ajusta segun la pantalla
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 18,
                                  mainAxisExtent: 50,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                  childAspectRatio: 1),
                          itemCount: listaElementos.length + 61,
                          itemBuilder: (context, int index) {
                            //ordenar la lista de elementos por el numero atomico
                            listaElementos.sort(
                                (a, b) => a.numAtomico.compareTo(b.numAtomico));
        
                            //condiciones para ordenar los elementos en la tabla periodica
                            if (index >= 0 && index < 1) {
                              return ElementoWidget(
                                  elemento: listaElementos[index]);
                            }
        
                            if (index >= 17 && index <= 19) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 16]);
                            }
                            if (index >= 30 && index <= 37) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 26]);
                            }
                            if (index >= 48 && index <= 92) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 36]);
                            }
                            if (index >= 93 && index <= 110) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 22]);
                            }
                            if (index >= 111 && index <= 125) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 8]);
                            }
                            if (index >= 147 && index <= 160) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 90]);
                            }
                            if (index >= 165 && index <= 178) {
                              return ElementoWidget(
                                  elemento: listaElementos[index - 76]);
                            }
        
                            return Text('');
                          }
                        )
                      )
                    ),
              
            ],
          ),
        ));}
  }
}
