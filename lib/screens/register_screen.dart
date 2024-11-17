import 'package:flutter/material.dart';
import 'package:is513_tarea2_2/widgets/clickable_text.dart';
import 'package:is513_tarea2_2/widgets/custom_button.dart';
import 'package:is513_tarea2_2/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variables regex para validar
  final _emailRegex = RegExp(r'^[a-zA-Z._-]+[a-zA-Z]+@(unah\.edu\.hn|unah\.hn)$');
  final _phoneRegex = RegExp(r'^[39]\d{7}$');
  final _passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\W).{8,}$');

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      print('Nombre: ${_nameController.text}');
      print('Correo: ${_emailController.text}');
      print('Teléfono: ${_phoneController.text}');
      print('Contraseña: ${_passwordController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Registro exitoso!')),
      );
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Icon(
                  Icons.person_add_alt_outlined,
                  size: 80,
                  color: Colors.white
                ),
                const SizedBox(height: 8),
                const Text(
                  'Crear cuenta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Nombre
                CustomTextField(
                  controller: _nameController,
                  labelText: 'Nombre',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    } else if (value.length < 3 || value.length > 10) {
                      return 'El nombre debe tener entre 3 y 10 caracteres';
                    } else {
                      return null;
                    }
                  },
                ),
            
                const SizedBox(height: 14),
                
                // Correo
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo es obligatorio';
                    } else if (!_emailRegex.hasMatch(value)) {
                      return 'El correo debe ser institucional (@unah.edu.hn o @unah.hn)';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 14),
                
                // Telefono
                CustomTextField(
                  controller: _phoneController,
                  labelText: 'Telefono',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El telefono es obligatorio';
                    } else if (!_phoneRegex.hasMatch(value)) {
                      return 'El telefono debe iniciar con 3 u 8, y tener solo 8 digitos';
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
                      return 'La contraseña es obligatoria';
                    } else if (value.length < 8) {
                      return 'La contraseña debe tener al menos 8 caracteres';
                    } else if (!_passwordRegex.hasMatch(value)) {
                      return 'La contraseña debe tener al menos una mayuscula y un caracter especial';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 14),
                
                // Repetir contraseña
                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirmar contraseña',
                  isPassword: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 14),
                
                // Boton registrarse
                CustomButton(
                  text: 'Registrarse',
                  onPressed: _register
                ),
                
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),
            
                // Opción para iniciar sesion
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Ya tienes una cuenta?'),
                    const SizedBox(width: 4),
                    ClickableText(
                      text: 'Inicia sesión',
                      onTap: _goToLogin
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
