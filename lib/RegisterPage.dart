import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool acceptedTerms = false;
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _correoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Método para guardar los datos en SharedPreferences
  Future<void> _registerUser() async {
    // Verificar que las contraseñas coincidan
    if (_passwordController.text == _confirmPasswordController.text) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Guardar los datos en SharedPreferences
      await prefs.setString('nombre', _nombreController.text);
      await prefs.setString('apellido', _apellidoController.text);
      await prefs.setString('correo', _correoController.text);
      await prefs.setString('password', _passwordController.text); // Contraseña en producción debe ser encriptada
      await prefs.setString('tipoUsuario', 'rentador'); // Por ejemplo, el tipo de usuario

      // Redirigir al usuario a la página de bienvenida
      Navigator.pushReplacementNamed(context, '/'); // Aquí redirige a la página de bienvenida
    } else {
      // Mostrar un error si las contraseñas no coinciden
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Las contraseñas no coinciden')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg', // cambia esta ruta a tu imagen
                fit: BoxFit.cover,
              ),
            ),
            // Contenido blanco con bordes redondeados
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'REGISTRARSE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Inputs con fondo color claro
                      _buildTextField('Nombres', controller: _nombreController),
                      const SizedBox(height: 10),
                      _buildTextField('Apellidos', controller: _apellidoController),
                      const SizedBox(height: 10),
                      _buildTextField('Correo electronico', controller: _correoController, keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 10),
                      _buildTextField('Contraseña', controller: _passwordController, obscureText: true),
                      const SizedBox(height: 10),
                      _buildTextField('Confirmar Contraseña', controller: _confirmPasswordController, obscureText: true),
                      const SizedBox(height: 16),
                      // Checkbox con texto
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: acceptedTerms,
                            onChanged: (val) {
                              setState(() {
                                acceptedTerms = val ?? false;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Expanded(
                            child: Text(
                              'Acepto los Términos de servicios y la Política de privacidad',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Botón confirmar
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: acceptedTerms ? _registerUser : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'CONFIRMAR',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Icono usuario + texto arriba a la izquierda
            Positioned(
              top: 30,
              left: 24,
              child: Row(
                children: [
                  const Icon(Icons.person_outline, size: 50, color: Colors.white),
                  const SizedBox(width: 16),
                  Text(
                    'INGRESA ESTA\nINFORMACION',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false, TextInputType keyboardType = TextInputType.text, required TextEditingController controller}) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.green[50],
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
