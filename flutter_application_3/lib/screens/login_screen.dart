import 'package:flutter_application_2/core/data/user_data.dart';
import '/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/entities/user.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';


  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(users: users),
    );
  }
}

class _LoginView extends StatelessWidget {
  final List<User> users;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _LoginView({required this.users});

  bool usuarioExiste(String usuario, String password) {
    for (User user in users) {
      if (user.nombre == usuario && user.contrasena == password) {
        return true; // Usuario encontrado
      }
    }
    return false; // Usuario no encontrado
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
  onPressed: () {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      // Campos incompletos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos.'),
        ),
      );
    } else if (!usuarioExiste(username, password)) {
      // Datos incorrectos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos.'),
        ),
      );
    } else {
      // Usuario validado, continuar con la navegación
      context.pushNamed(HomeScreen.name, extra: username);
    }
  },
          child: const Text('Login'),
        ),
      ],
    );
  }
}