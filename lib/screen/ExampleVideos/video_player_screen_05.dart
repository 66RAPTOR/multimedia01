import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// 🎬 Pantalla 05: Video de Fondo
class VideoPlayerScreen05 extends StatefulWidget {
  const VideoPlayerScreen05({super.key});

  @override
  State<VideoPlayerScreen05> createState() => _VideoPlayerScreen05State();
}

class _VideoPlayerScreen05State extends State<VideoPlayerScreen05> {
  late VideoPlayerController _controller;

  // 🔑 RUTA LOCAL: Define la ruta a tu archivo .mp4 dentro de la carpeta assets
  final String videoPath = 'assets/videos/video01.mp4';

  @override
  void initState() {
    super.initState();

    // 1. Inicializar el controlador con la URL
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        // 🔑 2. CLAVE: Reproducción Automática y Loop
        // Se ejecuta una vez que el video está cargado y listo para reproducir.
        _controller.setLooping(true); // Repetir el video indefinidamente
        _controller.play(); // Iniciar la reproducción inmediatamente
        setState(() {}); // Forzar redibujo para que el VideoPlayer se muestre
      });

    // Ponemos el volumen al mínimo, ya que un video de fondo no suele tener audio.
    _controller.setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Quitamos el AppBar para una experiencia inmersiva
      body: Stack(
        // 🔑 Stack: El widget que permite apilar capas.
        children: <Widget>[
          // =======================================================
          // CAPA 1: VIDEO (Fondo)
          // =======================================================

          // Positioned.fill: Indica que este widget debe estirarse y llenar_todo el Stack.
          Positioned.fill(
            // FutureBuilder espera a que el video se inicialice antes de intentar mostrarlo.
            child: FutureBuilder(
              future: _controller.initialize(),
              builder: (context, snapshot) {
                // Si el video está listo
                if (snapshot.connectionState == ConnectionState.done) {
                  return
                  // FittedBox: Controla cómo el VideoPlayer llena el espacio.
                  FittedBox(
                    // 🔑 BoxFit.cover: Estira el video para cubrir toda el área,
                    // incluso si necesita recortar los bordes.
                    fit: BoxFit.cover,
                    child: SizedBox(
                      // El tamaño del SizedBox debe coincidir con la proporción del video
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  // Muestra un widget de carga mientras se inicializa el video
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                }
              },
            ),
          ),

          // =======================================================
          // CAPA 2: OSCURECIMIENTO (Para mejorar la legibilidad del texto)
          // =======================================================
          Positioned.fill(
            child: Container(
              // Color negro con 40% de opacidad.
              color: Colors.black45,
            ),
          ),

          // =======================================================
          // CAPA 3: CONTENIDO DE LA PANTALLA (Texto y Botones)
          // =======================================================
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Este es un fondo animado con un video en loop.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Acción de ejemplo para el botón
                    },
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), backgroundColor: Colors.redAccent),
                    child: const Text('Entrar a la Aplicación', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
