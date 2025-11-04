// lib/screen/menu_screen.dart
import 'package:flutter/material.dart';
// Importamos la pantalla a la que navegaremos
import 'ExampleImages/home_screen_images.dart';

// 🎯 Pantalla de Menú Principal
// Contiene la navegación a la siguiente capa (HomeScreen).
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal de Ejemplos'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido al Repaso Multimedia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Botón que lleva a la pantalla HomeScreen (Ejemplos de Multimedia)
            ElevatedButton.icon(
              icon: const Icon(Icons.folder_open),
              label: const Text('Ver Ejemplos de Multimedia', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.teal, // Color que contrasta con el AppBar
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Navega a HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreenImages(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}