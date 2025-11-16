import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// 🎬 Pantalla 02: Reproductor con Controles Avanzados (Barra y Tiempo)
class VideoPlayerScreen02 extends StatefulWidget {
  const VideoPlayerScreen02({super.key});

  @override
  State<VideoPlayerScreen02> createState() => _VideoPlayerScreen02State();
}

class _VideoPlayerScreen02State extends State<VideoPlayerScreen02> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  // Variable para controlar la visibilidad de los controles (play/pause).
  bool _controlsVisible = true;

  @override
  void initState() {
    super.initState();
    //String urlVideo = 'https://drive.google.com/uc?export=download&id=15kTOaE2SEwpaENY35moMyJt9duZoadAb';
    String urlVideo = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

    _controller = VideoPlayerController.networkUrl(Uri.parse(urlVideo));

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
    _controller.setVolume(1.0);

    // 💡 Añadimos un listener para forzar el redibujado de la UI cada vez que
    // cambia el estado del video (como la posición de reproducción).
    _controller.addListener(() {
      if (mounted) {
        setState(() {}); // Redibuja para actualizar el tiempo y la barra.
      }
    });

    // Opcional: Ocultar los controles después de un tiempo si se está reproduciendo.
    _hideControlsAfterDelay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // --- FUNCIONES DE UTILIDAD ---

  // Función para ocultar los controles después de 3 segundos.
  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  // Función para formatear la duración a mm:ss (ej: 03:45)
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  // --- WIDGETS PERSONALIZADOS ---

  // 1. Interfaz de Control (Se superpone al video)
  Widget _buildControlsOverlay() {
    // Si el controlador no está inicializado, no mostramos nada
    if (!_controller.value.isInitialized) return const SizedBox.shrink();

    // Tiempo actual y duración total del video
    final currentPosition = _controller.value.position;
    final totalDuration = _controller.value.duration;

    // GestureDetector para mostrar/ocultar controles al tocar el video
    return GestureDetector(
      onTap: () {
        setState(() {
          _controlsVisible = !_controlsVisible; // Alterna la visibilidad
          if (_controlsVisible && _controller.value.isPlaying) {
            _hideControlsAfterDelay(); // Si se muestran, que se oculten de nuevo.
          }
        });
      },
      child: AnimatedOpacity(
        opacity: _controlsVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300), // Animación de fade para la opacidad
        child: Container(
          color: Colors.black38, // Fondo semi-transparente para resaltar los controles
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1. Barra superior vacía o para otros controles
              const SizedBox.shrink(),

              // 2. Botón central de Play/Pause grande
              Center(
                child: FloatingActionButton(
                  backgroundColor: Colors.white70,
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                        _hideControlsAfterDelay();
                      }
                    });
                  },
                  child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 40),
                ),
              ),

              // 3. Barra de Progreso y Tiempos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  children: [
                    // A. Tiempos (Actual / Total)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(currentPosition), // Tiempo actual
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          _formatDuration(totalDuration), // Duración total
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    // B. Indicador de Progreso
                    // VideoProgressIndicator es el widget oficial que maneja la barra y el buffer.
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true, // Permite al usuario arrastrar el indicador
                      colors: const VideoProgressColors(
                        playedColor: Colors.red, // Color de la parte ya reproducida
                        bufferedColor: Colors.blueGrey, // Color de la parte cargada
                        backgroundColor: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 2. Método_Build Principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reproductor con Controles')),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  // Stack para superponer los controles
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // 1. El Video
                    VideoPlayer(_controller),

                    // 2. Los Controles Personalizados
                    Positioned.fill(child: _buildControlsOverlay()),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
