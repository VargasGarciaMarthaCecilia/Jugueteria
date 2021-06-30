// To parse this JSON data, do
//
//     final libreriaModel = libreriaModelFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
JugueteriaModel JugueteriaModelFromJson(String str) =>
    JugueteriaModel.fromJson(json.decode(str));

String jugueteriaModelToJson(JugueteriaModel data) =>
    json.encode(data.toJson());

class JugueteriaModel {
  JugueteriaModel({
    this.id,
    this.nombre = '',
    this.marca = '',
    this.precioc = '',
    this.preciov = '',
    this.sku = '',
    this.disponible = true,
    this.fotoUrl,
  });

  String id;
  String nombre;
  String marca;
  String precioc;
  String preciov;
  String sku;
  bool disponible;
  String fotoUrl;

  factory JugueteriaModel.fromJson(Map<String, dynamic> json) =>
      JugueteriaModel(
        id: json["id"],
        nombre: json["nombre"],
        marca: json["marca"],
        precioc: json["precio de compra"],
        preciov: json["precio de venta"],
        sku: json["En existencia"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "marca": marca,
        "precioc": precioc,
        "preciov": preciov,
        "sku": sku,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
      };
}
