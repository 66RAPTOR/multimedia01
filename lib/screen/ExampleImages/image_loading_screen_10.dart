import 'package:flutter/material.dart';
import 'dart:math' as math; // Importamos la librería 'dart:math' para usar la constante PI (π)

// 🌌 Pantalla 10: Gradiente de Barrido Rotatorio (Giro 360° Constante)
// Este es un StatefulWidget porque el fondo (el gradiente) cambia de estado (posición) con el tiempo.
class ImageLoadingScreen10 extends StatefulWidget {
  const ImageLoadingScreen10({super.key});

  @override
  State<ImageLoadingScreen10> createState() => _ImageLoadingScreen10State();
}

class _ImageLoadingScreen10State extends State<ImageLoadingScreen10>
        // El Mixin 'SingleTickerProviderStateMixin' es esencial. Proporciona el "reloj" (ticker)
        // que el AnimationController necesita para medir el tiempo y avanzar en la animación.
        with
        SingleTickerProviderStateMixin {
  // 1. EL MOTOR: AnimationController
  // Controla la duración, velocidad y repetición de la animación.
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // 2. Inicialización del Motor de Animación
    _controller = AnimationController(
      // vsync: 'this' enlaza el controlador al ciclo de vida de este Widget.
      vsync: this,
      // duration: El tiempo que le toma a la animación completar un ciclo (un giro de 360 grados).
      duration: const Duration(seconds: 3), // Giro lento y suave.
    );

    // 3. Comportamiento: Giro Infinito
    // .repeat() inicia la animación y la reinicia automáticamente al llegar al final,
    // garantizando un movimiento constante y sin pausas.
    _controller.repeat();
  }

  @override
  void dispose() {
    // 4. Liberación de Recursos
    // Es CRUCIAL detener el controlador cuando el widget ya no es visible (ej: al salir de la pantalla)
    // para evitar que siga consumiendo CPU y batería en segundo plano.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true asegura que el fondo ocupe el área detrás del AppBar.
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Gradiente de Giro 360° Constante'),
        backgroundColor: Colors.transparent, // AppBar transparente.
        elevation: 0,
      ),

      // 5. EL ESCUCHA: AnimatedBuilder
      // Este widget escucha el _controller y solo reconstruye su 'builder' (el Container)
      // cada vez que el valor del controlador cambia, optimizando el rendimiento.
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            // 6. DECORACIÓN DEL FONDO
            decoration: BoxDecoration(
              // SweepGradient (Gradiente de Barrido): Crea el patrón de color circular.
              gradient: SweepGradient(
                // colors: La secuencia de colores que giran. Debe incluir el color inicial al final
                // para que el ciclo se cierre suavemente.
                colors: const [
                  Color(0xFF6A1B9A), // Púrpura oscuro
                  Color(0xFF00E5FF), // Azul cian
                  Color(0xFFFFEA00), // Amarillo
                  Color(0xFF6A1B9A), // Cierra con púrpura
                ],
                // center: Define el punto desde el que irradia el patrón de color (el centro).
                center: Alignment.center,

                // 7. LA ROTACIÓN PERFECTA: GradientRotation
                // Esta es la clave. Rota el patrón de color INTERNO del gradiente,
                // a diferencia de Transform.rotate que rota el widget completo.
                // El valor 'angle' debe estar en radianes.
                // _controller.value: Da el progreso (0.0 a 1.0) en el ciclo de 10 segundos.
                // math.pi * 2: Es el equivalente a 360 grados en radianes.
                // Multiplicando el progreso por 360 grados obtenemos el ángulo actual de rotación.
                transform: GradientRotation(_controller.value * 2 * math.pi),
              ),
            ),
            // 8. Contenido de la Pantalla (Se coloca dentro del AnimatedBuilder para que el
            // gradiente de fondo lo contenga, pero no es animado en sí).
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Giro del Gradiente 10: Constante',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10.0, color: Colors.black, offset: Offset(4.0, 4.0))],
                    ),
                  ),
                  SizedBox(height: 50),
                  Icon(
                    Icons.autorenew,
                    size: 80,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 5.0, color: Colors.black, offset: Offset(2.0, 2.0))],
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
