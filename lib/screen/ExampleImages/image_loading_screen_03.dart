import 'package:flutter/material.dart';

// 🖼️ Pantalla de Imagen de Fondo
class ImageLoadingScreen03 extends StatelessWidget {
  const ImageLoadingScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    // Stack: Permite apilar widgets uno encima del otro.
    return Scaffold(
      // Extendemos el contenido del cuerpo bajo el AppBar para que el fosddndo cubra_todo.
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          // 1. Capa de la Imagen de Fondo (Capa Inferior)
          // Colocamos un Image.asset que cubre_todo el espacio disponible
          Image.asset(
            'assets/images/fondo01.jpg', // ¡Asegúrate de tener esta imagen!
            width: double.infinity, // Ocupa_todo el ancho disponible.
            height: double.infinity, // Ocupa_todo el alto disponible.
            fit: BoxFit.cover, // Propiedad clave: Asegura que la imagen cubra el área sin deformarse.
          ),

          // 2. Capa del Contenido (Capa Superior)
          // Colocamos un Center para situar el texto sobre la imagen.
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  '¡Texto sobre la Imagen de Fondo!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // Añadimos una sombra para que el texto resalte sobre cualquier color de la imagen.
                    shadows: [Shadow(blurRadius: 5.0, color: Colors.black, offset: Offset(2.0, 2.0))],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
