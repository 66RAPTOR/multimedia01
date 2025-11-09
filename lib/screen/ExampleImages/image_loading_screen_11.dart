import 'package:flutter/material.dart';

// 👤 Pantalla 11: Imágenes Circulares (Avatares) y con Bordes
class ImageLoadingScreen11 extends StatelessWidget {
  const ImageLoadingScreen11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Imágenes Circulares y Bordes')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // --- Ejemplo 1: El Método Clásico (Container + BoxDecoration + ClipOval) ---
              const Text('1. Imagen Circular con Borde (ClipOval)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // 1.1 El Contenedor Exterior (Define el Borde)
              Container(
                width: 150,
                height: 150,
                // BoxDecoration se usa para definir el borde y la sombra.
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Importante: Da forma circular al borde.
                  border: Border.all(
                    color: Colors.blueAccent, // Color del borde.
                    width: 4, // Grosor del borde.
                  ),
                  boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26, offset: Offset(0, 5))],
                ),
                // 1.2 ClipOval (Define el Corte Circular)
                // ClipOval se asegura de que su hijo (la imagen) sea cortado en forma de óvalo (o círculo).
                child: ClipOval(
                  // El hijo debe ser un widget que se pueda cortar, generalmente una imagen.
                  child: Image.asset(
                    'assets/images/karsten_g.jpg', // Usa una imagen de tu carpeta 'assets'
                    fit: BoxFit.cover, // Asegura que la imagen llene el círculo sin distorsión.
                    width: 150,
                    height: 150,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // --- Ejemplo 2: El Método Rápido (CircleAvatar) ---
              const Text('2. Usando CircleAvatar (Más simple)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // CircleAvatar es un widget especializado para avatares, que incluye la forma circular.
              // Es más simple pero con menos control sobre el borde personalizado.
              CircleAvatar(
                radius: 60, // Define el radio de la imagen (y del círculo).
                backgroundColor: Colors.grey[200], // Color de fondo si la imagen no carga.
                child: ClipOval(
                  // El background image del CircleAvatar es típicamente un Image.network o similar.
                  child: Image.asset(
                    'assets/images/karsten_m.jpg', // Otra imagen de ejemplo.
                    fit: BoxFit.cover,
                    width: 120, // Doble del radio
                    height: 120, // Doble del radio
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // --- Ejemplo 3: Esquinas Redondeadas (ClipRRect) ---
              const Text('3. Esquinas Redondeadas (ClipRRect)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // ClipRRect (Clip Rounded Rectangle) se usa para cortar esquinas.
              ClipRRect(
                // borderRadius: Define el radio de las esquinas (cuanto más alto, más redondeadas).
                borderRadius: BorderRadius.circular(20.0), // Radio de 20 para un redondeo suave.
                child: Container(
                  width: 200,
                  height: 100,
                  // Ejemplo de imagen de red para demostrar la versatilidad.
                  child: Image.network('https://picsum.photos/id/237/200/100', fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
