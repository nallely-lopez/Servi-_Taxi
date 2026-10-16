import 'package:flutter/material.dart';

import '../models/servicio_transporte_model.dart';

class TarjetaServicio extends StatelessWidget {
  final ServicioTransporte servicio;
  final VoidCallback onTap;

  const TarjetaServicio({
    super.key,
    required this.servicio,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              servicio.imagen,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: Icon(Icons.local_taxi, size: 64)),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    servicio.nombre,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(servicio.descripcion),
                  const SizedBox(height: 12),
                  Text('Capacidad: ${servicio.capacidad} pasajeros'),
                  const SizedBox(height: 4),
                  Text(
                    'Tarifa base: \$${servicio.tarifaBase.toStringAsFixed(2)}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
