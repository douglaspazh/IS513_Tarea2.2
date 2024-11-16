import 'package:flutter/material.dart';
import 'package:is513_tarea2_2/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'douglas.paz@unah.hn' && password == '20232000878') {
      Navigator.popAndPushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales incorrectas'))
      );
    }
  }

  void _goToRegister() {
    Navigator.popAndPushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Correo
            CustomTextField(
              controller: _emailController,
              labelText: 'Correo',
              keyboardType: TextInputType.emailAddress,
            ),
            // Constraseña
            CustomTextField(
              controller: _passwordController,
              labelText: 'Contraseña',
              isPassword: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar sesión')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No tienes una cuenta?'),
                TextButton(
                  onPressed: _goToRegister,
                  child: const Text('Registrate')
                )
              ],
            )
          ],
        )),
    );
  }
}
