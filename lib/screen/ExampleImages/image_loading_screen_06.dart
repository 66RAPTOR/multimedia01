import 'package:flutter/material.dart';

// 🌌 Pantalla con Gradiente de Alto Contraste usando 'stops'
class ImageLoadingScreen06 extends StatelessWidget {
  const ImageLoadingScreen06({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Gradiente con Control Fino (Stops)'),
        backgroundColor: Colors.transparent,
        elevation: 0

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 💡 BoxDecoration con LinearGradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Dirección: De la esquina superior central hacia abajo.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            // Colores: Tres tonos, de oscuro a claro.
            colors: [
              Color(0xFF000033), // 1. Azul muy oscuro (casi negro)
              Color(0xFF1E88E5), // 2. Azul medio vibrante
              Color(0xFF4FC3F7), // 3. Azul celeste brillante
            ],

            // 🛑 Propiedad Clave: stops
            // El primer color (oscuro) dominará hasta el 40% del área.
            // Esto crea un cielo oscuro amplio y un horizonte brillante.
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Texto que resalta bien sobre el gradiente oscuro/brillante
              const Text(
                'Gradiente con Puntos de Parada (Stops)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // Ejemplo de una imagen con forma circular que resalta.
              ClipOval(
                child: Image.asset(
                  'assets/images/karsten_g.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}