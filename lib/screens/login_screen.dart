import 'package:flutter/material.dart';
import 'package:is513_tarea2_2/screens/home_screen.dart';
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
  bool _obscurePassword = true;

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

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _goToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
                isPassword: _obscurePassword,
                suffixIcon: IconButton(
                  onPressed: _togglePasswordVisibility,
                  icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debe ingresar su contraseña';
                  }
                  return null;
                },
              ),
          
              const SizedBox(height: 14),
          
              // Boton iniciar sesion
              ElevatedButton(
                onPressed: _login,
                child: const Text('Iniciar sesión')
              ),
              
              const SizedBox(height: 14),

              // Ir a registrarse
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes una cuenta?'),
                  TextButton(
                    onPressed: _goToRegister,
                    child: const Text('Registrate')
                  )
                ],
              )
            ],
          ),
        )),
    );
  }
}
