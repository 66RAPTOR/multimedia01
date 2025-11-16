import 'package:flutter/material.dart';
// 🔑 Paquete necesario para controlar la orientación (portrait/landscape)
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

// 🎬 Pantalla 03: Reproductor con Modo Pantalla Completa y Orientación
class VideoPlayerScreen03 extends StatefulWidget {
  const VideoPlayerScreen03({super.key});

  @override
  State<VideoPlayerScreen03> createState() => _VideoPlayerScreen03State();
}

class _VideoPlayerScreen03State extends State<VideoPlayerScreen03> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool _isFullScreen = false; // Nuevo estado: indica si estamos en modo Full Screen
  bool _controlsVisible = true;

  // Usamos el video de Google Drive que ya verificaste que funciona
  final String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);

    // Listener para actualizar la UI (barra de progreso y tiempo)
    _controller.addListener(() {
      if (mounted) {
        // Forzamos el redibujado solo si el controlador está listo
        if (_controller.value.isInitialized) {
          setState(() {});
        }
      }
    });

    _hideControlsAfterDelay();
  }

  @override
  void dispose() {
    // ⚠️ CLAVE: Antes de deshacerse del widget, restauramos la orientación por defecto.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _controller.dispose();
    super.dispose();
  }

  // --- LÓGICA DE PANTALLA COMPLETA ---

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      // 1. Ocultar barras de sistema (Status bar y Navigation bar)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

      // 2. Forzar orientación horizontal
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    } else {
      // 1. Mostrar barras de sistema
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

      // 2. Restaurar orientación vertical
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }

  // --- FUNCIONES Y WIDGETS DE CONTROL (Reutilizados del Ejemplo 02) ---

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying && !_isFullScreen) {
        // Oculta solo si no estamos en fullscreen.
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Widget _buildControlsOverlay() {
    if (!_controller.value.isInitialized) return const SizedBox.shrink();

    final currentPosition = _controller.value.position;
    final totalDuration = _controller.value.duration;

    return GestureDetector(
      onTap: () {
        setState(() {
          _controlsVisible = !_controlsVisible;
          if (_controlsVisible && _controller.value.isPlaying) {
            _hideControlsAfterDelay();
          }
        });
      },
      child: AnimatedOpacity(
        opacity: _controlsVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          color: Colors.black38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1. Botón de Pantalla Completa (Arriba a la derecha)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen, color: Colors.white, size: 30),
                  onPressed: _toggleFullScreen, // Llama a la nueva función
                ),
              ),

              // 2. Botón central de Play/Pause grande
              FloatingActionButton(
                backgroundColor: Colors.white70,
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    _hideControlsAfterDelay();
                  });
                },
                child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 40),
              ),

              // 3. Barra de Progreso y Tiempos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(currentPosition), style: const TextStyle(color: Colors.white, fontSize: 14)),
                        Text(_formatDuration(totalDuration), style: const TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 5),

                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(playedColor: Colors.red, bufferedColor: Colors.blueGrey, backgroundColor: Colors.white54),
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
    // Si estamos en Full Screen, no usamos el Scaffold estándar, usamos un Container
    // para maximizar el espacio de la pantalla (el Scaffold ya no es necesario).
    final Widget videoPlayer = Center(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: <Widget>[
                  VideoPlayer(_controller),
                  Positioned.fill(child: _buildControlsOverlay()),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );

    // 🔑 La salida principal del build cambia dependiendo del estado Full Screen
    if (_isFullScreen) {
      // Modo Full Screen: Devolvemos solo el reproductor, sin AppBar, usando_todo el espacio.
      return videoPlayer;
    } else {
      // Modo Normal: Devolvemos el Scaffold con AppBar.
      return Scaffold(
        appBar: AppBar(title: const Text('Reproductor con Full Screen')),
        body: videoPlayer,
      );
    }
  }
}
