import 'package:flutter/material.dart';

// 🚀 Pantalla con Gradiente Animado (Movimiento Constante)
class ImageLoadingScreen07 extends StatefulWidget {
  const ImageLoadingScreen07({super.key});

  @override
  State<ImageLoadingScreen07> createState() => _ImageLoadingScreen07State();
}

class _ImageLoadingScreen07State extends State<ImageLoadingScreen07> with SingleTickerProviderStateMixin {
  // 1. Declaración de Componentes
  late AnimationController _animationController; // Controla la duración y repetición.
  late Animation<Alignment> _topAlignmentAnimation; // Anima el punto 'begin'.
  late Animation<Alignment> _bottomAlignmentAnimation; // Anima el punto 'end'.

  @override
  void initState() {
    super.initState();

    // 2. Inicialización del Motor (AnimationController)
    // MODIFICACIÓN CLAVE 1: Duración aumentada a 8 segundos.
    // Una duración más larga asegura que el movimiento sea percibido como lento y continuo.
    _animationController = AnimationController(
      duration: const Duration(seconds: 3), // Antes era 1 segundo, lo que causaba el efecto "nervioso".
      vsync: this,
    );

    // 3. Definición del Camino (TweenSequence)
    // Esta secuencia define la ruta del gradiente (esquina a esquina).
    // El 'weight: 1' en cada segmento asegura que cada paso tome exactamente el mismo tiempo.
    _topAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
    ]).animate(_animationController);

    // Definimos el Tween para el punto 'end' (simétrico al 'begin').
    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
        weight: 1,
      ),
    ]).animate(_animationController);

    // 4. Mecanismo de Redibujado
    // Este addListener obliga a Flutter a ejecutar el build() en cada "frame" de la animación.
    _animationController.addListener(() {
      setState(() {});
    });

    // 5. Arranque y Repetición
    // .repeat() garantiza el giro infinito sin pausas.
    _animationController.repeat();
  }

  @override
  void dispose() {
    // Liberar recursos para evitar fugas de memoria.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Gradiente Animado (Movimiento Constante)'), backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 💡 Aplicación del Gradiente Animado en el build()
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // El 'begin' y 'end' ahora toman el valor actual de la animación (movimiento continuo).
            begin: _topAlignmentAnimation.value,
            end: _bottomAlignmentAnimation.value,
            colors: const [
              Color(0xFF8EC5FC), // Un azul claro
              Color(0xFFE0C3FC), // Un morado claro
              Color(0xFFE0BBE4), // Un tono rosado
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            /* children: <Widget>[
              const Text(
                '¡Fondo con Gradiente Animado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 10.0, color: Colors.black, offset: Offset(4.0, 4.0))],
                ),
              ),
            ],
*/
          ),
        ),
      ),
    );
  }
}
