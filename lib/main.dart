// main.dart

// 1. Importación de la librería fundamental de Flutter para construir interfaces de usuario.
import 'package:flutter/material.dart';
// 2. Importación del archivo que contiene el widget principal (HomeScreen) 
//    de la aplicación.
import 'package:multimedia01/screen/ExampleImages/home_screen_images.dart';
import 'package:multimedia01/screen/menu_screen.dart'; // Asegúrate que 'multimedia01' sea el nombre de tu proyecto

// 3. Función principal de Dart: El punto de entrada de la aplicación.
void main() {
  // runApp toma el widget raíz (MyApp) y lo infla, haciendo que la aplicación se muestre en la pantalla.
  runApp(const MyApp());
}

// 4. Widget Raíz (StatelessWidget): MyApp
//    La mayoría de las aplicaciones Flutter comienzan con un StatelessWidget o StatefulWidget.
//    Usamos StatelessWidget porque este widget solo define la configuración base de la aplicación 
//    (título, tema) y su estado no cambia.
class MyApp extends StatelessWidget {
  // Constructor con clave (key) para identificar el widget en el árbol de widgets.
  const MyApp({super.key});

  // El metodo build describe cómo se ve este widget y sus subwidgets.
  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget raíz de una aplicación que sigue el diseño de Material Design (Android/Web).
    // Define la estructura visual y de navegación base.
    return MaterialApp(
      // 'title': Título que aparece en el gestor de tareas del sistema operativo, no en la app.
      title: 'Manejo de Imágenes',
      // 'theme': Define el tema de color y estilo para toda la aplicación.
      theme: ThemeData(
        // primarySwatch define la paleta de colores base para widgets como AppBar, botones, etc.
        primarySwatch: Colors.blue,
      ),
      // 'home': Especifica el widget que debe mostrarse primero al iniciar la aplicación.
      // Aquí dirigimos la aplicación a nuestro widget modularizado HomeScreen.
      home: const MenuScreen(),
    );
  }
}
