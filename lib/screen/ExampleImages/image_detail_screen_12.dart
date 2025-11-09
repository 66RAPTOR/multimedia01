import 'package:flutter/material.dart';

// 🖼️ Pantalla 12 (Destino): Contiene la imagen Hero grande.
class ImageDetailScreen12 extends StatelessWidget {
  const ImageDetailScreen12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Imagen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // 1. WIDGET HERO (Punto de Destino)
          // Debe tener el MISMO 'tag' que el widget de origen.
          child: Hero(
            tag: 'hero-image-12', // 🔑 CLAVE: Etiqueta coincidente.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/karsten_g.jpg',
                // En esta pantalla, la imagen es mucho más grande (ej: 300x200).
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}