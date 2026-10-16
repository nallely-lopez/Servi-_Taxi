import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/usuario_model.dart';

class UsuarioUtils {
  static Future<List<Usuario>> cargarUsuarios() async {
    final String contenido = await rootBundle.loadString(
      'assets/data/usuarios.json',
    );

    final List<dynamic> datos = jsonDecode(contenido);

    return datos
        .map((dato) => Usuario.fromJson(dato as Map<String, dynamic>))
        .toList();
  }
}