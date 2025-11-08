import 'package:flutter/material.dart';

// 🚀 Pantalla con Gradiente Animado (Keyframe-like)
// Usamos StatefulWidget porque el estado del gradiente (su posición) cambiará con el tiempo.
class ImageLoadingScreen07 extends StatefulWidget {
  const ImageLoadingScreen07({super.key});

  @override
  State<ImageLoadingScreen07> createState() => _ImageLoadingScreen07State();
}

class _ImageLoadingScreen07State extends State<ImageLoadingScreen07> with SingleTickerProviderStateMixin {
  // <-- Mixin necesario para AnimationController

  late AnimationController _animationController; // Controla la animación
  late Animation<Alignment> _topAlignmentAnimation; // Anima el punto 'begin'
  late Animation<Alignment> _bottomAlignmentAnimation; // Anima el punto 'end'

  @override
  void initState() {
    super.initState();

    // Inicializamos el AnimationController.
    // duration: Duración de una repetición de la animación.
    // vsync: 'this' es el SingleTickerProviderStateMixin que le dice a Flutter
    //        que este widget es el "ticker" para la animación.
    _animationController = AnimationController(
      duration: const Duration(seconds: 1), // La animación tardará 4 segundos
      vsync: this,
    );

    // Definimos el Tween para la animación del 'begin' del gradiente.
    // Irá de la esquina superior izquierda a la inferior izquierda.
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

    // Definimos el Tween para la animación del 'end' del gradiente.
    // Irá de la esquina inferior derecha a la superior derecha.
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

    // Escucha los cambios de la animación y redibuja la pantalla con setState.
    _animationController.addListener(() {
      setState(() {});
    });

    // Inicia la animación y la repite indefinidamente.
    _animationController.repeat();
  }

  @override
  void dispose() {
    // Es crucial liberar los recursos del AnimationController cuando el widget ya no está en uso.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Gradiente Animado (Keyframes)'), backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 💡 BoxDecoration usando los valores animdos para el gradiente.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Aquí usamos los valores de Alignment que provienen de las animaciones.
            begin: _topAlignmentAnimation.value,
            end: _bottomAlignmentAnimation.value,
            colors: const [
              Color(0xFF8EC5FC), // Un azul claro
              Color(0xFFE0C3FC), // Un morado claro
              Color(0xFFE0BBE4), // Un tono rosado
            ],
            stops: const [0.1, 0.5, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              const SizedBox(height: 50),
              const Icon(
                Icons.star,
                size: 80,
                color: Colors.amberAccent,
                shadows: [Shadow(blurRadius: 5.0, color: Colors.black, offset: Offset(2.0, 2.0))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
