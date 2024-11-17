import 'package:flutter/material.dart';
import 'package:is513_tarea2_2/screens/home_screen.dart';
import 'package:is513_tarea2_2/widgets/clickable_text.dart';
import 'package:is513_tarea2_2/widgets/custom_button.dart';
import 'package:is513_tarea2_2/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      if (email == 'douglas.paz@unah.hn' && password == '20232000878') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(email: email))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Credenciales incorrectas'),
            action: SnackBarAction(
              label: 'Reintentar',
              onPressed: () {
                _emailController.clear();
                _passwordController.clear();
              },
            ),
          ),
        );
      }
    }
  }

  void _goToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                
                const Icon(
                  Icons.person_outline,
                  size: 80,
                  color: Colors.white
                ),
                const SizedBox(height: 8),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Correo
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe ingresar su correo';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 14),
                
                // Constraseña
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Contraseña',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe ingresar su contraseña';
                    }
                    return null;
                  },
                ),
            
                const SizedBox(height: 14),
            
                // Boton iniciar sesion
                CustomButton(
                  text: "Iniciar sesión",
                  onPressed: _login,
                ),
                
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),
            
                // Ir a registrarse
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tienes una cuenta?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    ClickableText(
                      text: 'Registrate',
                      onTap: _goToRegister
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
