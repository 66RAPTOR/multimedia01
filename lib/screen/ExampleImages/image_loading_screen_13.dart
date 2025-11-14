import 'package:flutter/material.dart';
import 'dart:ui' as ui; // Necesario para usar ImageFilter (especialmente el desenfoque)

// 🖼️ Pantalla 13: Aplicación de Filtros a Imágenes
class ImageLoadingScreen13 extends StatelessWidget {
  const ImageLoadingScreen13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros de Imagen y Desenfoque'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- 1. FILTRO DE COLOR (ColorFiltered) ---
            const Text(
              '1. Aplicación de Filtros de Color (Blanco y Negro)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // ColorFiltered aplica un filtro de color a toda su sub-estructura.
            ColorFiltered(
              // colorFilter: Define el tipo y los parámetros del filtro.
              colorFilter: const ColorFilter.mode(
                Colors.grey, // El color base (gris).
                BlendMode.saturation, // BlendMode.saturation elimina el color, dejando escala de grises.
              ),
              child: Image.asset(
                'assets/images/karsten_g.jpg',
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),

            // --- 2. DESENFOQUE (BackdropFilter) ---
            const Text(
              '2. Desenfoque (Blur) detrás de un Widget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Stack es necesario para que el desenfoque (el BackdropFilter) se superponga
            // a la imagen de fondo.
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // 2.1 Imagen de Fondo (La que se va a desenfocar)
                Image.asset(
                  'assets/images/karsten_g.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                // 2.2 BackdropFilter (La Ventana de Desenfoque)
                // Se coloca encima de la imagen.
                ClipRect(
                  // ClipRect es crucial: asegura que el desenfoque solo se aplique dentro
                  // de los límites del widget BackdropFilter.
                  child: BackdropFilter(
                    // filter: Define el tipo y la intensidad del filtro.
                    filter: ui.ImageFilter.blur(
                      sigmaX: 5.0, // Intensidad del desenfoque horizontal (eje X).
                      sigmaY: 5.0, // Intensidad del desenfoque vertical (eje Y).
                    ),
                    // child: Un Container semitransparente que simula la ventana de vidrio esmerilado.
                    // Sin este Container (o uno similar), el desenfoque se aplica pero no es visible.
                    child: Container(
                      width: 300,
                      height: 200,
                      alignment: Alignment.center,
                      // Se agrega un color muy sutil para mejorar la visibilidad del desenfoque.
                      color: Colors.black.withOpacity(0.1),
                      child: const Text(
                        '¡Desenfoque aplicado!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [BoxShadow(blurRadius: 5)],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}