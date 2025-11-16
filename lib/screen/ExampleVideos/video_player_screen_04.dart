import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart'; // Para control de orientación

// 🎬 Pantalla 04: Reproductor de Video Local (Assets)
class VideoPlayerScreen04 extends StatefulWidget {
  const VideoPlayerScreen04({super.key});

  @override
  State<VideoPlayerScreen04> createState() => _VideoPlayerScreen04State();
}

class _VideoPlayerScreen04State extends State<VideoPlayerScreen04> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  // 🔑 RUTA LOCAL: Define la ruta a tu archivo .mp4 dentro de la carpeta assets
  final String localVideoPath = 'assets/videos/video01.mp4';

  bool _isFullScreen = false;
  bool _controlsVisible = true;

  @override
  void initState() {
    super.initState();

    // 🔑 CAMBIO CLAVE: Usamos VideoPlayerController.asset()
    _controller = VideoPlayerController.asset(localVideoPath);

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    // Listener y lógica de control (igual al ejemplo 03)
    _controller.addListener(() {
      if (mounted && _controller.value.isInitialized) {
        setState(() {});
      }
    });

    _hideControlsAfterDelay();
  }

  @override
  void dispose() {
    // Restaurar orientación al salir
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  // --- LÓGICA DE FULL SCREEN (Reutilizada del ejemplo 03) ---
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  // --- Funciones de Utilidad (formatDuration) y _buildControlsOverlay (Iguales al ejemplo 03) ---

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying && !_isFullScreen) {
        setState(() {
          _controlsVisible = false;
        });
      }
    });
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
              const SizedBox.shrink(),

              // 1. Botón de Pantalla Completa (Arriba a la derecha)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _toggleFullScreen,
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
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 40,
                ),
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


  // 3. Método Build Principal
  @override
  Widget build(BuildContext context) {
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
                  Positioned.fill(
                    child: _buildControlsOverlay(),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );

    if (_isFullScreen) {
      return videoPlayer;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Reproductor de Video Local (Assets)'),
        ),
        body: videoPlayer,
      );
    }
  }
}