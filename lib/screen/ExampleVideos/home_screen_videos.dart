import 'package:flutter/material.dart';
import 'package:multimedia01/screen/ExampleVideos/video_player_screen_03.dart';
// Importamos la primera pantalla de video que acabamos de crear
import 'video_player_screen_01.dart';
import 'video_player_screen_02.dart';

class HomeScreenVideos extends StatelessWidget {
  const HomeScreenVideos({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el ancho para que los botones se vean bien
    final double buttonWidth = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      appBar: AppBar(title: const Text('Módulo de Videos y Multimedia'), backgroundColor: Colors.purple, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ejemplos de Reproducción de Videos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Divider(),

              //--------------------------------------------------------------------------------
              // Ir al widget de Videos (VideoPlayerScreen01)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- Botón de Videos 01 (Reproductor Básico de Red) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.play_circle_filled),
                  label: const Text('Videos 01: Reproductor Básico (Red)', style: TextStyle(fontSize: 16)),
                  // Usamos el estilo simple solicitado por ti
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen01()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de Videos (VideoPlayerScreen02)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- Botón de Videos 02 (Controles Avanzados) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.control_point),
                  label: const Text('Videos 02: Controles Avanzados y Barra', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen02()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de Videos (VideoPlayerScreen03)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- Botón de Videos 02 (Controles Avanzados) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.control_point),
                  label: const Text('Videos 02: Controles Avanzados y Barra', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoPlayerScreen03()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
