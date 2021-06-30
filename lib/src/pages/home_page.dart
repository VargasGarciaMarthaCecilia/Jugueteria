import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla Principal')),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }
}

_crearBoton(BuildContext context) {
  return FloatingActionButton(
    child: Icon(Icons.add),
    backgroundColor: Colors.deepPurple,
    onPressed: () => Navigator.pushNamed(context, 'juguete'),
  );
}
