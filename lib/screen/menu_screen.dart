// lib/screen/menu_screen.dart
import 'package:flutter/material.dart';
// Importamos las pantallas
import 'ExampleImages/home_screen_images.dart';
import 'ExampleVideos/home_screen_videos.dart';

// 🎯 Pantalla de Menú Principal
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal de Ejemplos'), backgroundColor: Colors.indigo),
      // 🔑 WIDGET CLAVE: SingleChildScrollView
      // Se utiliza para que el contenido sea deslizable si excede la altura de la pantalla.
      body: SingleChildScrollView(
        // 💡 Centramos el contenido deslizable.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Agregamos un poco de padding vertical para no pegar el contenido a los bordes.
            children: <Widget>[
              const SizedBox(height: 50), // Espacio inicial
              const Text('Bienvenido al Repaso Multimedia', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),

              // 1. Botón de Módulo de Imágenes
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.image),
                  label: const Text('Ver Ejemplos de Imágenes', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenImages()));
                  },
                ),
              ),

              const SizedBox(height: 20),

              // 2. Botón de Módulo de Videos
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.videocam),
                  label: const Text('Módulo de Videos', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenVideos()));
                  },
                ),
              ),

              // 💡 Si agregas muchos más botones aquí, la pantalla se desplazará
              // automáticamente en lugar de desbordarse.
              const SizedBox(height: 50), // Espacio final
            ],
          ),
        ),
      ),
    );
  }
}
