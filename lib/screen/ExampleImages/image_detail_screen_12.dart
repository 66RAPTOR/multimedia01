import 'package:flutter/material.dart';

// 🛍️ Pantalla 12 (Destino): Vista de Detalle de Producto
class ImageDetailScreen12 extends StatelessWidget {
  const ImageDetailScreen12({super.key});

  // Datos ficticios del producto para rellenar la información.
  final String productName = 'Cámara Profesional Fx-Z9';
  final String productPrice = '\$1,999.00 USD';
  final String productDescription =
      'La cámara Fx-Z9 combina un sensor de fotograma completo (full-frame) con una velocidad de enfoque automática ultra-rápida. Ideal para fotografía deportiva y de naturaleza, ofrece video 8K y una durabilidad extrema.';
  final String productSpecs =
      'Sensor: Full-Frame, 45MP\nVideo: 8K/30p, 4K/120p\nISO: 64-25600\nResistencia: Sellado contra clima (weather-sealed)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Producto'),
      ),
      // Usamos SingleChildScrollView para asegurar que todo el contenido sea visible en pantallas pequeñas.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido a la izquierda.
          children: <Widget>[
            // 1. EL WIDGET HERO (La transición vuela hasta aquí)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Hero(
                  // CLAVE: Misma etiqueta 'tag' que la pantalla de origen (ImageLoadingScreen12).
                  tag: 'hero-image-12',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/images/karsten_g.jpg',
                      width: MediaQuery.of(context).size.width * 0.9, // 90% del ancho de la pantalla.
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // ----------------------------------------------------
            // 2. INFORMACIÓN DEL PRODUCTO (Detalles)
            // ----------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2.1 Nombre del Producto
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 2.2 Precio del Producto
                  Text(
                    productPrice,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo, // El mismo color que el botón Hero original.
                    ),
                  ),
                  const SizedBox(height: 25),

                  // 2.3 Sección de Descripción
                  const Text(
                    'Descripción:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    productDescription,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 25),

                  // 2.4 Sección de Especificaciones
                  const Text(
                    'Especificaciones Clave:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  // Se usa Text para mostrar las especificaciones separadas por saltos de línea.
                  Text(
                    productSpecs,
                    style: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ----------------------------------------------------
      // 3. BARRA INFERIOR (Botón de Acción)
      // ----------------------------------------------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: () {
            // Acción ficticia al pulsar comprar.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Producto añadido al carrito!')),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Añadir al Carrito', style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}