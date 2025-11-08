import 'package:flutter/material.dart';
import 'dart:math' as math; // Para usar la constante PI

// 🔄 Pantalla con Gradiente de Barrido que Gira 360 Grados
// Combina la sensación de movimiento y el giro infinito.
class ImageLoadingScreen09 extends StatefulWidget {
  const ImageLoadingScreen09({super.key});

  @override
  State<ImageLoadingScreen09> createState() => _ImageLoadingScreen09State();
}

class _ImageLoadingScreen09State extends State<ImageLoadingScreen09> with SingleTickerProviderStateMixin {
  // 1. Declaración del Motor de Animación
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // 2. Inicialización del AnimationController
    _controller = AnimationController(
      vsync: this,
      // Duración de un giro completo. Lo hacemos un poco lento (12 segundos) para ver el efecto de barrido.
      duration: const Duration(seconds: 3),
    );

    // 3. Inicio de la Animación
    // Inicia el giro y lo repite indefinidamente (360° -> reinicio).
    _controller.repeat();
  }

  @override
  void dispose() {
    // 4. Liberación de Recursos
    // Siempre detener el motor al salir.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Gradiente de Barrido Giratorio (SweepGradient)'), backgroundColor: Colors.transparent, elevation: 0),

      // 5. El Corazón de la Animación: AnimatedBuilder
      // AnimatedBuilder redibuja el Container cada vez que el _controller avanza.
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            // 6. El Widget que se Anima
            decoration: BoxDecoration(
              // Usamos SweepGradient para crear un gradiente giratorio.
              gradient: SweepGradient(
                // Los colores que se usarán en el barrido (ejemplo: tonos de galaxia).
                colors: const [
                  Color(0xFF3A1C71), // Morado oscuro
                  Color(0xFFD76D77), // Rosa quemado
                  Color(0xFFFFAF7B), // Naranja suave
                  Color(0xFF3A1C71), // Morado oscuro (para cerrar el ciclo)
                ],
                // El centro donde comienza el barrido.
                center: Alignment.center,

                // 7. La Rotación del Gradiente
                // startAngle: Define dónde comienza el barrido, en radianes.
                // _controller.value: Va de 0.0 a 1.0.
                // math.pi * 2: 360 grados.
                // Al animar el ángulo de inicio con el valor del controlador,
                // logramos que el patrón de color gire 360 grados constantemente.
                startAngle: 0.0, // Comienza en 0 grados
                endAngle: _controller.value * 2 * math.pi,
                // endAngle: math.pi * 2, // Si no quieres que el barrido se anime, mantienes fijo el endAngle

                // Corrección importante para que gire 360 grados:
                // Animamos 'transform' en lugar de 'startAngle' para un giro más limpio de 360 grados
                transform: GradientRotation(_controller.value * 2 * math.pi),
              ),
            ),
            // 8. Contenido estático sobre el fondo.
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Gradiente de Barrido en Rotación',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 8.0, color: Colors.black, offset: Offset(4.0, 4.0))],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
