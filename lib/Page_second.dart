import 'package:flutter/material.dart';
import 'package:tabla_periodica_interactiva/conversacion.dart';
import 'package:tabla_periodica_interactiva/elemento.dart';
class SecondPage extends StatefulWidget {
  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Elemento'),
              background: Image.network(
                'https://s3.eu-central-1.amazonaws.com/studysmarter-mediafiles/media/7196463/summary_images/image_zIJYnVK.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA4OLDUDE42UZHAIET%2F20231024%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20231024T182712Z&X-Amz-Expires=90000&X-Amz-SignedHeaders=host&X-Amz-Signature=e43e9bd74aeaf9e6134fff5a1a58b1d059e6a1929ea8ecd4db01eddf5d698c2a',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              final elemento = elementosQuimicos[index];
              return ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text('Número Atómico: ${elemento.numeroAtomico}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                            'Masa Atómica: ${elemento.masaAtomica.toStringAsFixed(3)}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                        child: Text('Grupo: ${elemento.grupo}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                        child: Text('Período: ${elemento.periodo}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                      'Configuración Electrónica: ${elemento.configuracionElectronica}',
                      style: TextStyle(fontSize: 25),
                    )),
                    SizedBox(height: 20),
                    Center(
                        child: Text('Estado natural: ${elemento.estadoFisico}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                            'Punto de ebullición: ${elemento.ebullicion}',
                            style: TextStyle(fontSize: 25))),
                    SizedBox(height: 20),
                    Center(
                      child: Text('Punto de fusión: ${elemento.fusion}',
                          style: TextStyle(fontSize: 25)),
                    ),
                    SizedBox(height: 30),
                    Center(child:
                    ElevatedButton(
                      onPressed: () {
                        print("errer");
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => menuConversaciones()),
    // );
  },
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble),
                        SizedBox(width: 8),
                        Text("ChatGPT")
                      ],
                     ))),
                  ],
                ),
              );
            }, childCount: elementosQuimicos.length),
          ),
        ],
      ),
    );
  }
}
