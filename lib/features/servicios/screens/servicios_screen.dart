import 'package:flutter/material.dart';

import '../models/servicio_transporte_model.dart';
import '../utils/servicioTransporte_utils.dart';
import '../widgets/tarjeta_servicio_widget.dart';

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key});

  @override
  State<ServiciosScreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {
  late final Future<List<ServicioTransporte>> _serviciosFuture;

  @override
  void initState() {
    super.initState();
    _serviciosFuture = ServicioUtils.cargarServicios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios de transporte'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ServicioTransporte>>(
        future: _serviciosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('No se pudieron cargar los servicios'),
            );
          }

          final servicios = snapshot.data ?? [];

          if (servicios.isEmpty) {
            return const Center(child: Text('No hay servicios disponibles'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: servicios.length,
            itemBuilder: (context, index) {
              final servicio = servicios[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TarjetaServicio(
                  servicio: servicio,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'El detalle de ${servicio.nombre} está pendiente',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
