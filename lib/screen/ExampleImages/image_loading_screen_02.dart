import 'package:flutter/material.dart';

// 🖼️ Pantalla de Ejemplo de Imágenes con Color de Fondo
class ImageLoadingScreen02 extends StatelessWidget {
  const ImageLoadingScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: Proporciona la estructura visual de la pantalla.
    return Scaffold(
      // 💡 Estableciendo el color de fondo usando el código hexadecimal:
      // El color #a3d284 se convierte a 0xFFA3D284.
      // FF = Opacidad (Alpha) completa.
      backgroundColor: const Color(0xFFA3D284),

      appBar: AppBar(
        title: const Text('Ejemplo de Color de Fondo'),
        // Es una buena práctica hacer la AppBar transparente si el color de fondo es clave,
        // o simplemente usar un color que contraste. Aquí lo dejaremos con un color por defecto.
        backgroundColor: const Color(0xFFA3D284),
      ),

      // body: Usaremos un Column centrado para poner algunos elementos de prueba.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Texto para confirmar el color.
            const Text(
              '¡Este es el fondo #a3d284!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color de texto que resalta.
              ),
            ),
            const SizedBox(height: 30),

            // Ejemplo de cómo una imagen resalta sobre este color de fondo.
            const Text('Imagen de prueba:', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 10),

            // Reutilizamos Image.asset de la pantalla anterior.
            Image.asset(
              'assets/images/karsten_g.jpg', // Asegúrate de tener esta imagen en tus assets/images
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
