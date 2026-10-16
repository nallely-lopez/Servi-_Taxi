import 'package:flutter/material.dart';

import '../models/usuario_model.dart';
import '../utils/usuario_utils.dart';
import 'login_diseno_screen.dart';
import '../../servicios/screens/servicios_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usuarioController = TextEditingController();

  final TextEditingController _claveController = TextEditingController();

  bool _cargando = false;

  Future<void> _iniciarSesion() async {
    final usuarioIngresado = _usuarioController.text.trim();
    final claveIngresada = _claveController.text;

    if (usuarioIngresado.isEmpty || claveIngresada.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    setState(() {
      _cargando = true;
    });

    try {
      final List<Usuario> usuarios = await UsuarioUtils.cargarUsuarios();

      if (!mounted) return;

      Usuario? usuarioEncontrado;

      for (final usuario in usuarios) {
        if (usuario.usuario == usuarioIngresado &&
            usuario.claveAcceso == claveIngresada) {
          usuarioEncontrado = usuario;
          break;
        }
      }

      if (usuarioEncontrado != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServiciosScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectos')),
        );
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudieron cargar los usuarios')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _cargando = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    _claveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginDisenoScreen(
      usuarioController: _usuarioController,
      claveController: _claveController,
      cargando: _cargando,
      onIngresar: _iniciarSesion,
    );
  }
}
