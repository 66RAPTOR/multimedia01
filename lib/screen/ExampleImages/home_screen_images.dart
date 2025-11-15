// Importación de la librería fundamental de Flutter para construir interfaces de usuario.
import 'package:flutter/material.dart';
// Importación de la pantalla específica a la que navegaremos (ejemplo de imágenes).
// Nota: Asegúrate que 'multimedia01' sea el nombre de tu proyecto.
import 'package:multimedia01/screen/ExampleImages/image_loading_screen_01.dart';
import 'package:multimedia01/screen/ExampleImages/image_loading_screen_02.dart';
import 'package:multimedia01/screen/ExampleImages/image_loading_screen_03.dart';
import 'package:multimedia01/screen/ExampleImages/image_loading_screen_04.dart';

import 'image_loading_screen_05.dart';
import 'image_loading_screen_06.dart';
import 'image_loading_screen_07.dart';
import 'image_loading_screen_08.dart';
import 'image_loading_screen_09.dart';
import 'image_loading_screen_10.dart';
import 'image_loading_screen_11.dart';
import 'image_loading_screen_12.dart';
import 'image_loading_screen_13.dart';
import 'image_loading_screen_14.dart';
import 'image_loading_screen_15.dart';

// Función principal de Dart: El punto de entrada de la aplicación.
void main() {
  // runApp toma el widget raíz (MyApp) y lo infla, mostrando la aplicación.
  runApp(const MyApp());
}

// 1. Widget Raíz (MyApp): Define la configuración base de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura la aplicación para usar el diseño de Material Design.
    return MaterialApp(
      title: 'App Multimedia Flutter', // Título para el gestor de tareas del sistema.
      theme: ThemeData(
        // Define el tema de color principal de la aplicación.
        primarySwatch: Colors.teal,
      ),
      // Define qué widget debe mostrarse primero al iniciar la aplicación.
      home: const HomeScreenImages(),
    );
  }
}

// ---------------------------------------------------------------------

// 2. Pantalla Principal (HomeScreen): El contenido visible del inicio.
//    Es un StatelessWidget porque su contenido (el botón y el texto) no necesita cambiar internamente.
class HomeScreenImages extends StatelessWidget {
  const HomeScreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el factor de ancho (80% de la pantalla)
    final double screenWidth = MediaQuery.of(context).size.width;
    const double buttonWidthFactor = 0.9;
    final double buttonWidth = screenWidth * buttonWidthFactor;

    // Scaffold proporciona la estructura visual básica (AppBar, body, etc.).
    return Scaffold(
      // AppBar es la barra de navegación superior.
      appBar: AppBar(title: const Text('Menu : Multimedia IMAGENES')),
      // body es el área principal de contenido de la pantalla.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),

        // Center centra su único hijo en la pantalla.
        child: Center(
          child: Column(
            // Column organiza sus hijos verticalmente.
            mainAxisAlignment: MainAxisAlignment.center, // Centra los hijos en el eje vertical.
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Texto informativo.
              const Text('Pulsa el botón para ver el ejemplo de Imágenes', style: TextStyle(fontSize: 18)),
              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen01)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 02 (Color de Fondo) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.image), // Ícono de imagen.
                  label: const Text('Ir a Imágenes', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    // Estilos para el relleno interno del botón.
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  // Acción que ocurre cuando se presiona el botón.
                  onPressed: () {
                    // Navigator.push es la función para navegar a una nueva pantalla.
                    // MaterialPageRoute define cómo se animará la transición a la nueva pantalla.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: Crea la instancia del widget de la pantalla de destino.
                        builder: (context) => const ImageLoadingScreen01(),
                      ),
                    );
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen02)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 02 (Color de Fondo) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.palette),
                  label: const Text('Imágenes 02: Color Fondo', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    //backgroundColor: const Color(0xFFa3d284).withOpacity(0.8), // Color similar al fondo de destino
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Navegación a la nueva pantalla
                        builder: (context) => const ImageLoadingScreen02(),
                      ),
                    );
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen03)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 03 (Fondo) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.wallpaper),
                  label: const Text('Imágenes 03: Fondo', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    //backgroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen03()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen04)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 04 ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.picture_as_pdf), // Un ícono que sugiera gráficos vectoriales
                  label: const Text('Imágenes 04: Fondo SVG', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    //backgroundColor: Colors.purple
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen04()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen05)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 05 (Fondo Gradiente) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.gradient), // Ícono que sugiere gradientes
                  label: const Text('Imágenes 05: Fondo Gradiente', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    //backgroundColor: const Color(0xFF4CAF50), // Color base del botón para que coincida o contraste.
                    //foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen05()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen06)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 06 (Gradiente con Stops) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.settings_input_svideo), // Icono que sugiere control fino
                  label: const Text('Imágenes 06: Gradiente con Stops', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    //backgroundColor: const Color(0xFF1E88E5), // Color base del botón.
                    //foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen06()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen07)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 07 (Gradiente Animado) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.motion_photos_on), // Icono de animación
                  label: const Text('Imágenes 07: Gradiente Animado', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen07()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen08)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 08 (Giro Infinito) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Imágenes 08: Giro Infinito', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen08()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen09)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 09 (Gradiente de Barrido 360°) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.cached), // Ícono que sugiere rotación y caché
                  label: const Text('Imágenes 09: Gradiente de Barrido', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen09()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen10)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 10 (Giro Constante) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.star_half),
                  label: const Text('Imágenes 10: Giro Gradiente CONSTANTE', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen10()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen11)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),
              // --- NUEVO: Botón de Imágenes 11 (Avatares y Bordes) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('Imágenes 11: Avatares Circulares', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen11()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen12)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),
              // --- NUEVO: Botón de Imágenes 12 (Hero Animation) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.flight_takeoff), // Icono que sugiere un vuelo (transición)
                  label: const Text('Imágenes 12: Hero Animation', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    //backgroundColor: Colors.indigo,
                    // foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen12()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen13)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 13 (Filtros y Blur) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.filter_hdr), // Icono de filtro
                  label: const Text('Imágenes 13: Filtros y Desenfoque', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    //backgroundColor: Colors.blueGrey,
                    //foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen13()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen13)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 14 (Gradiente de Opacidad) ---
              SizedBox(
                width: buttonWidth, // Usamos el ancho adaptativo
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.layers), // Icono que sugiere apilamiento de capas.
                  label: const Text('Imágenes 14: Gradiente sobre Imagen', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen14()));
                  },
                ),
              ),

              //--------------------------------------------------------------------------------
              // Ir al widget de imágenes (ImageLoadingScreen15)
              //--------------------------------------------------------------------------------

              // Espacio vertical para separar elementos.
              const SizedBox(height: 20),

              // --- NUEVO: Botón de Imágenes 15 (Liquid Glass Cards) ---
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.blur_on), // Ícono que sugiere desenfoque/vidrio
                  label: const Text('Imágenes 15: Liquid Glass Cards', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageLoadingScreen15()));
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
