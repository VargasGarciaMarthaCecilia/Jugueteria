import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:cejev/src/models/producto_model.dart';

class ProdutosProvider {
  final String _url = 'https://juguete-lib-default-rtdb.firebaseio.com';

  Future<bool> crearJugueteria(JugueteriaModel libro) async {
    final String url = '$_url/libros.json';

    final resp =
        await http.post(Uri.parse(url), body: jugueteriaModelToJson(libro));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}
