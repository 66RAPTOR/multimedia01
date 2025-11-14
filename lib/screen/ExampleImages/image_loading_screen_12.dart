import 'package:flutter/material.dart';
// 💡 Importamos la pantalla de destino para poder navegar a ella.
import 'package:multimedia01/screen/ExampleImages/image_detail_screen_12.dart';

// 🖼️ Pantalla 12 (Origen): Contiene la imagen Hero pequeña.
class ImageLoadingScreen12 extends StatelessWidget {
  const ImageLoadingScreen12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation (Origen)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pulsa la imagen para ver la animación Hero:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // 1. Detección de Tap (para navegar)
            GestureDetector(
              onTap: () {
                // Navegamos a la pantalla de detalle al pulsar.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageDetailScreen12(),
                  ),
                );
              },
              // 2. WIDGET HERO (Punto de Origen)
              // Este es el widget que queremos que "vuele" a la siguiente pantalla.
              child: Hero(
                // 🔑 CLAVE: La etiqueta 'tag' debe ser ÚNICA en toda la aplicación
                // y debe coincidir EXACTAMENTE con el tag de la pantalla de destino.
                tag: 'hero-image-12',
                child: ClipRRect( // ClipRRect es opcional, pero mantiene las esquinas redondeadas en la transición.
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/karsten_g.jpg',
                    fit: BoxFit.cover,
                    width: 150, // Tamaño pequeño en la pantalla de origen.
                    height: 100,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}