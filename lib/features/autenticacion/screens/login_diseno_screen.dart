import 'package:flutter/material.dart';

class LoginDisenoScreen extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController claveController;
  final bool cargando;
  final VoidCallback onIngresar;

  const LoginDisenoScreen({
    super.key,
    required this.usuarioController,
    required this.claveController,
    required this.cargando,
    required this.onIngresar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servi Taxi'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_taxi, size: 80),
                const SizedBox(height: 20),
                const Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: claveController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: cargando ? null : onIngresar,
                  child: cargando
                      ? const CircularProgressIndicator()
                      : const Text('Ingresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}