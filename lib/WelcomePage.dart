import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // color fondo oscuro para el notch iOS
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo (cubre toda la pantalla)
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg', // coloca tu imagen en assets/images
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

                    // Input correo
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline, color: Colors.green),
                        hintText: 'Correo electronico',
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

                    // Input contraseña
                    TextField(
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

                    // Olvidó contraseña
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {

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
                        onPressed: () {
                          Navigator.pushNamed(context, '/rol'); // Aquí está la navegación a RolPage
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Texto registro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿No tienes cuenta? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Registrate',
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // Logo centrado en la parte superior (aprox 40% altura)
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png', // coloca aquí el logo EcoMovil
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
