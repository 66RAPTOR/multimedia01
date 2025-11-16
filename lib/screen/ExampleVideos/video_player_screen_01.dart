import 'package:flutter/material.dart';
// 🔑 Importamos el controlador oficial de videos
import 'package:video_player/video_player.dart';

// 🎬 Pantalla 01: Reproductor Básico
// Necesita ser un StatefulWidget porque el estado del video (pausado, reproduciendo, listo) cambia.
class VideoPlayerScreen01 extends StatefulWidget {
  const VideoPlayerScreen01({super.key});

  @override
  State<VideoPlayerScreen01> createState() => _VideoPlayerScreen01State();
}

class _VideoPlayerScreen01State extends State<VideoPlayerScreen01> {
  // 🔑 Variable para controlar el video. Se usa para inicializar, pausar, reproducir, etc.
  late VideoPlayerController _controller;
  // Bandera para saber si el controlador ha terminado de inicializarse y el video está listo.
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // 1. Inicialización del Controlador:
    // Creamos el controlador, especificando la fuente (en este caso, una URL de internet).
    _controller = VideoPlayerController.networkUrl(
      // Usamos un video de ejemplo de dominio público.
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );

    // 2. Espera de Inicialización:
    // Llamamos a initialize() y guardamos el Future. Esto prepara el video para la reproducción.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 3. Loop: Opcionalmente, podemos indicar que el video se repita al terminar.
    _controller.setLooping(true);

    // 4. Controles de Volumen (opcional):
    _controller.setVolume(1.0); // 1.0 es el volumen máximo.
  }

  @override
  void dispose() {
    // ⚠️ CLAVE: Siempre se debe liberar el controlador de video cuando el widget se destruye.
    // Esto evita fugas de memoria y libera recursos nativos.
    _controller.dispose();
    super.dispose();
  }

  // 3. WIDGET BUILD: Renderiza el reproductor.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player Básico')),
      body: FutureBuilder(
        // FutureBuilder espera a que el video se inicialice.
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          // Si el futuro está listo (ConnectionState.done)...
          if (snapshot.connectionState == ConnectionState.done) {
            // 4. Mostrar el Video:
            return AspectRatio(
              // AspectRatio: Ajusta el widget a las dimensiones originales del video (ej: 16:9).
              aspectRatio: _controller.value.aspectRatio,
              // VideoPlayer: El widget que muestra el frame del video.
              child: VideoPlayer(_controller),
            );
          } else {
            // Si el video aún está cargando (ConnectionState.waiting)...
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      // 5. Botón de Control (Play/Pause):
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Usamos setState para redibujar el widget y cambiar el ícono.
          setState(() {
            // Alterna entre Play y Pause.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        // Icono: Muestra Play si está pausado, o Pause si está reproduciendo.
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
