import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Controladores para los campos de texto de login
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Variables para el usuario almacenado
  String _storedEmail = '';
  String _storedPassword = '';
  String _userName = '';
  
  // Método para obtener los datos almacenados en SharedPreferences
  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedEmail = prefs.getString('correo') ?? '';
      _storedPassword = prefs.getString('password') ?? '';
      _userName = prefs.getString('nombre') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();  // Cargar los datos almacenados cuando la página se inicie
  }

  // Método para verificar el login del usuario
  void _loginUser() {
    if (_emailController.text == _storedEmail && _passwordController.text == _storedPassword) {
      // Si el correo y la contraseña coinciden, redirige al usuario
      Navigator.pushNamed(context, '/rol');  // Aquí puedes cambiar la ruta al destino adecuado
    } else {
      // Mostrar mensaje de error si las credenciales no coinciden
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Color fondo oscuro para el notch iOS
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg', // Coloca tu imagen en assets/images
                fit: BoxFit.cover,
              ),
            ),
            
            // Fondo blanco con bordes redondeados y contenido formulario
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'INGRESAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campo de correo
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline, color: Colors.green),
                        hintText: 'Correo electrónico',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Campo de contraseña
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.green),
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Olvidó contraseña (actualmente no tiene funcionalidad)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Aquí puedes añadir funcionalidad para recuperar contraseña
                        },
                        child: const Text(
                          '¿Has olvidado tu contraseña?',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 20),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Botón Login
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Login', style: TextStyle(fontSize: 18)),
                        onPressed: _loginUser, // Llamar al método de login
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Texto de registro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿No tienes cuenta? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Logo centrado en la parte superior (aproximadamente 40% altura)
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png', // Coloca tu logo aquí
                  height: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
