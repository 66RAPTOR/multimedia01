import 'package:flutter/material.dart';
// 💡 Importamos el paquete Shimmer
import 'package:shimmer/shimmer.dart';

// ⏳ Pantalla 16: Simulación de Carga con Efecto Shimmer
class ImageLoadingScreen16 extends StatelessWidget {
  const ImageLoadingScreen16({super.key});

  // Función de ayuda para crear un placeholder de línea de texto.
  Widget _buildTextPlaceholder(double width) {
    return Container(
      // La altura y el color son clave para simular el texto que falta.
      height: 12.0,
      width: width,
      color: Colors.white, // El color base que será animado por Shimmer
      margin: const EdgeInsets.only(bottom: 8.0),
    );
  }

  // Función de ayuda para crear una Card completa (imagen + texto).
  Widget _buildCardPlaceholder() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1. Placeholder de Imagen (Cuadrado o Rectángulo)
          Container(width: 100.0, height: 100.0, color: Colors.white),
          const SizedBox(width: 15.0),

          // 2. Placeholder de Texto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Título (Línea más larga)
                _buildTextPlaceholder(double.infinity),
                const SizedBox(height: 10.0),
                // Líneas de contenido (Longitudes variables para realismo)
                _buildTextPlaceholder(200.0),
                _buildTextPlaceholder(150.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Efecto Shimmer de Carga')),
      // 🔑 WIDGET CLAVE: Shimmer.fromColors
      body: Shimmer.fromColors(
        // baseColor: El color estático de la estructura. Un gris oscuro.
        baseColor: Colors.grey.shade300,
        // highlightColor: El color que "barre" o "brilla" sobre la estructura. Un gris claro.
        highlightColor: Colors.grey.shade100,
        // period: Velocidad de la animación (opcional, 1.5s es el default).
        period: const Duration(seconds: 2),

        // child: Contiene la estructura (placeholders) que queremos animar.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Título principal simulado
              _buildTextPlaceholder(250.0),
              const SizedBox(height: 30.0),

              // Lista de 5 tarjetas simuladas que "cargan"
              _buildCardPlaceholder(),
              _buildCardPlaceholder(),
              _buildCardPlaceholder(),
              _buildCardPlaceholder(),
              _buildCardPlaceholder(),
            ],
          ),
        ),
      ),
    );
  }
}
