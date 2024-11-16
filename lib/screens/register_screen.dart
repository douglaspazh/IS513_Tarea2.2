import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
            ),
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _phoneController,
            ),
            TextField(
              controller: _passwordController,
            ),
            TextField(
              controller: _confirmPasswordController,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Registrarse')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ya tienes una cuenta?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Iniciar sesión'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
