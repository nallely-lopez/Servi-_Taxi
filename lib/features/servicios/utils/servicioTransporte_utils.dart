import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/servicio_transporte_model.dart';

class ServicioUtils {
  static Future<List<ServicioTransporte>> cargarServicios() async {
    final String contenido = await rootBundle.loadString(
      'assets/data/servicios.json',
    );

    final List<dynamic> datos = jsonDecode(contenido);

    return datos
        .map(
          (dato) => ServicioTransporte.fromJson(dato as Map<String, dynamic>),
        )
        .toList();
  }
}
