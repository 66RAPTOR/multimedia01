import 'package:flutter/material.dart';

// 🖼️ Pantalla de Ejemplo de Imágenes con Gradiente de Fondo
class ImageLoadingScreen05 extends StatelessWidget {
  const ImageLoadingScreen05({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Extiende el cuerpo detrás del AppBar.
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Ejemplo de Gradiente de Fondo'),
        backgroundColor: Colors.transparent, // AppBar transparente para que el gradiente se vea completo.
        elevation: 0,
      ),
      // El 'body' contendrá un Container que tendrá el gradiente.
      body: Container(
        // Aseguramos que el Container ocupe toda la pantalla.
        width: double.infinity,
        height: double.infinity,
        // 💡 Aquí definimos el gradiente usando BoxDecoration.
        decoration: const BoxDecoration(
          // LinearGradient crea un gradiente de línea recta.
          gradient: LinearGradient(
            // Define el punto de inicio del gradiente (arriba a la izquierda).
            begin: Alignment.topLeft,
            // Define el punto final del gradiente (abajo a la derecha).
            end: Alignment.bottomRight,
            // Lista de colores que formarán el gradiente.
            // Usamos colores de ejemplo, puedes cambiarlos por los que prefieras.
            colors: [
              Color(0xFF4CAF50), // Un verde vibrante
              Color(0xFF8BC34A), // Un verde más claro
              Color(0xFFCDDC39), // Un amarillo verdoso
            ],
            // Opcional: stops define la posición de cada color (de 0.0 a 1.0).
            // Si no se especifica, los colores se distribuyen uniformemente.
            // stops: [0.0, 0.5, 1.0],
          ),
        ),
        // El contenido que estará SOBRE el gradiente.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '¡Fondo con Gradiente Mágico!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 8.0, color: Colors.black54, offset: Offset(3.0, 3.0))],
                ),
              ),
              const SizedBox(height: 50),
              // Puedes añadir una imagen o cualquier otro widget aquí para ver cómo resalta.
              Image.asset(
                'assets/images/karsten_g.jpg', // Imagen de ejemplo sobre el gradiente
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                // Puedes aplicar un borde para que resalte más si es necesario
                // package:decorated_box - para borde
              ),
            ],
          ),
        ),
      ),
    );
  }
}
