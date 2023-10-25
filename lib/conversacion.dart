import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class menuConversaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final DatabaseReference _questionsRef = FirebaseDatabase.instance.reference().child('preguntas');
  final DatabaseReference _answersRef = FirebaseDatabase.instance.reference().child('respuestas');
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _questionsRef.onChildAdded.listen((event) {
      setState(() {
        _messages.add(event.snapshot.value.toString());
      });
    });

    _answersRef.onChildAdded.listen((event) {
      setState(() {
        _messages.add('Respuesta: ${event.snapshot.value.toString()}');
      });
    });
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      _questionsRef.push().set(message);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

