import 'package:flutter/material.dart';
// Importamos el paquete flutter_svg
import 'package:flutter_svg/flutter_svg.dart';

// 🖼️ Pantalla de Imagen SVG de Fondo
class ImageLoadingScreen04 extends StatelessWidget {
  const ImageLoadingScreen04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar.
      appBar: AppBar(
        title: const Text('Ejemplo de Imagen SVG de Fondo'),
        backgroundColor: Colors.transparent, // Para que el fondo SVG se vea por detrás.
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          // 1. Capa de la Imagen SVG de Fondo (Capa Inferior)
          // Usamos SvgPicture.asset para cargar el archivo SVG desde los assets.
          SvgPicture.asset(
            'assets/images/mountain.svg', // Ruta de tu archivo SVG.
            width: double.infinity, // Ocupa_todo el ancho.
            height: double.infinity, // Ocupa_todo el alto.
            fit: BoxFit.cover, // Cubre el espacio disponible sin distorsionar.
            // Puedes añadir un colorFilter para tintar el SVG si es necesario.
            // colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),

          // 2. Capa del Contenido (Capa Superior)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  '¡Texto sobre un fondo SVG!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 7.0, color: Colors.black, offset: Offset(3.0, 3.0))],
                  ),
                ),
                SizedBox(height: 50),
                // Podrías poner otro SVG aquí como ícono.
                // SvgPicture.asset(
                //   'assets/images/logo_svg.svg',
                //   width: 80,
                //   height: 80,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
