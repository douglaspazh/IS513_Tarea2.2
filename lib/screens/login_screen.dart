import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio de Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passwordController,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Iniciar sesión')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No tienes una cuenta?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Registrate')
                )
              ],
            )
          ],
        )),
    );
  }
}
