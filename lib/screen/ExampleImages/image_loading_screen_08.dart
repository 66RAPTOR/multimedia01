import 'package:flutter/material.dart';
import 'dart:math' as math; // Importamos la librería matemática para usar la constante PI

// 🔄 Pantalla con Animación de Giro Infinito
class ImageLoadingScreen08 extends StatefulWidget {
  const ImageLoadingScreen08({super.key});

  @override
  State<ImageLoadingScreen08> createState() => _ImageLoadingScreen08State();
}

// -------------------------------------------------------------
// CLASE ESTADO (Donde ocurre la Animación)
// -------------------------------------------------------------
class _ImageLoadingScreen08State extends State<ImageLoadingScreen08>
    with SingleTickerProviderStateMixin {

  // 1. Declaración del Motor de Animación
  // 'late' indica que esta variable se inicializará en initState().
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // 2. Inicialización del AnimationController
    _controller = AnimationController(
      // vsync: 'this' le dice al controlador que use este widget como su "reloj".
      vsync: this,
      // duration: El tiempo que tarda una sola rotación completa.
      duration: const Duration(seconds: 1),
    );

    // 3. Inicio y Repetición de la Animación
    // .repeat() hace que la animación se ejecute una y otra vez de forma infinita.
    _controller.repeat();
  }

  @override
  void dispose() {
    // 4. Liberación de Recursos
    // MUY IMPORTANTE: Detener el motor cuando el widget se destruye para evitar
    // fugas de memoria y que siga consumiendo batería.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giro Infinito (Rotation)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'La imagen está girando infinitamente.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),

            // 5. El Widget Animador (AnimatedBuilder)
            // AnimatedBuilder reconstruye su 'child' (la imagen) CADA VEZ que el
            // _controller cambia de valor, SIN necesidad de usar setState().
            AnimatedBuilder(
              // animation: Le pasamos el controlador que queremos escuchar.
              animation: _controller,
              builder: (context, child) {
                // 6. Aplicación de la Transformación de Giro (Rotate)
                // Transform.rotate aplica una rotación.
                return Transform.rotate(
                  // angle: Es el ángulo de rotación, en radianes.
                  // _controller.value: Va de 0.0 a 1.0 durante la duración.
                  // math.pi * 2: Es 360 grados en radianes.
                  // Multiplicando 360° por el valor del controlador (ej: 0.5),
                  // obtenemos el ángulo actual (ej: 180°).
                  angle: _controller.value * 2 * math.pi,

                  // child: El widget que será afectado por la transformación (la imagen).
                  child: Image.asset(
                    'assets/images/karsten_m.jpg', // Usa una imagen que se note el giro (ej: tu logo).
                    width: 150,
                    height: 150,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}