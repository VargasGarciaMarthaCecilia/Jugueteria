import 'package:flutter/material.dart';
import 'package:cejev/src/providers/produtos_provider.dart';
import 'package:cejev/src/models/producto_model.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final fomrKey = GlobalKey<FormState>();
  final productoProvider = new ProdutosProvider();

  JugueteriaModel jugueteriaModel = new JugueteriaModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jueguete'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: fomrKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearMarca(),
                _crearPrecioC(),
                _crearPrecioV(),
                _crearSKU(),
                _crearDisponible(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlertDialog() {
    return AlertDialog(
        title: Text('Notificaciones'),
        content:
            Text("¿Desea recibir notificaciones? Serán muy pocas de verdad"));
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: jugueteriaModel.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => jugueteriaModel.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del jueguete completo';
        } else {
          return value;
        }
      },
    );
  }

  Widget _crearMarca() {
    return TextFormField(
      initialValue: jugueteriaModel.marca,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Marca'),
      onSaved: (value) => jugueteriaModel.marca = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese especificamente la marca del Juguete';
        } else {
          return value;
        }
      },
    );
  }

  Widget _crearPrecioC() {
    return TextFormField(
      initialValue: jugueteriaModel.precioc,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Precio de Compra del Juguete'),
      onSaved: (value) => jugueteriaModel.precioc = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese correctamente el Precio de compra del juguete';
        } else {
          return value;
        }
      },
    );
  }

  Widget _crearPrecioV() {
    return TextFormField(
      initialValue: jugueteriaModel.preciov,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Precio de Venta del Juguete'),
      onSaved: (value) => jugueteriaModel.preciov = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese correctamente el Precio de venta del juguete';
        } else {
          return value;
        }
      },
    );
  }

  Widget _crearSKU() {
    return TextFormField(
      initialValue: jugueteriaModel.sku,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Stock en Existencia'),
      onSaved: (value) => jugueteriaModel.sku = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese correctamente de los juguetes en Existencia ';
        } else {
          return value;
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: jugueteriaModel.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        jugueteriaModel.disponible = true;
      }),
    );
  }

  Widget _crearBoton() {
    // ignore: deprecated_member_use
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );
  }

  void _submit() {
    if (fomrKey.currentState.validate()) return;
    fomrKey.currentState.save();
    productoProvider.crearJugueteria(jugueteriaModel);
    //Aqui vamos a guardar todo y asi jejejeje

    // Insertar
    String nom = jugueteriaModel.nombre.toString();
    String marca = jugueteriaModel.marca.toString();
    String precioc = jugueteriaModel.precioc.toString();
    String preciov = jugueteriaModel.preciov.toString();
    String sku = jugueteriaModel.sku.toString();
    String disponible = jugueteriaModel.disponible.toString();
    FirebaseFirestore.instance.collection('juguetes').doc().set({
      'nom': nom,
      'marca': marca,
      'precioc': precioc,
      'preciov': preciov,
      'sku': sku,
      'disponible': disponible
    });

    _buildAlertDialog();
  }
}
