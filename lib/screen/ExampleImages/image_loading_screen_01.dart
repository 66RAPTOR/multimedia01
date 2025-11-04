import 'package:flutter/material.dart';

// 🖼️ Pantalla de Carga de Imágenes (StatelessWidget)
// Se utiliza StatelessWidget porque el contenido de las imágenes no cambia
// durante el ciclo de vida de este widget (la carga y visualización son pasivas aquí).
class ImageLoadingScreen01 extends StatelessWidget {
  const ImageLoadingScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura visual básica (AppBar y body).
    return Scaffold(
      // AppBar es la barra de título superior.
      appBar: AppBar(title: const Text('Carga de Imágenes')),
      // body es el área principal de contenido.
      body: Center(
        // Center centra el contenido horizontal y verticalmente si es posible.
        child: SingleChildScrollView(
          // Permite que el contenido sea desplazable si excede el tamaño de la pantalla.
          padding: const EdgeInsets.all(16.0), // Relleno alrededor del contenido.
          child: Column(
            // Column organiza los widgets hijos de forma vertical.
            mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente los elementos dentro del espacio disponible.
            children: <Widget>[
              // --- 1. Imagen desde Assets (Local) ---
              const Text('1. Imagen Local (Asset):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10), // Espacio de 10 píxeles.
              // Widget Image.asset: Usado para cargar imágenes incluidas en la carpeta 'assets'
              // y declaradas en el archivo pubspec.yaml.
              Image.asset(
                'assets/images/karsten_g.jpg', // Ruta exacta del archivo local.
                width: 150,
                height: 150,
                fit: BoxFit.cover, // Recorta la imagen para llenar el espacio manteniendo la relación de aspecto.
              ),

              const SizedBox(height: 30), // Espacio de 30 píxeles entre secciones.
              // --- 2. Imagen desde Network (Web) ---
              const Text('2. Imagen de la Web (Network):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              // Widget Image.network: Usado para descargar y mostrar imágenes desde una URL.
              Image.network(
                'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?auto=compress&cs=tinysrgb&w=600', // URL de la imagen.
                width: 250,
                height: 180,
                fit: BoxFit.cover,
                // loadingBuilder: Opcional, permite mostrar un widget mientras la imagen se está descargando.
                loadingBuilder: (context, child, loadingProgress) {
                  // Si loadingProgress es null, significa que la carga terminó (exitosa o fallida).
                  if (loadingProgress == null) return child;
                  // Si aún está cargando, muestra un indicador de progreso.
                  return const SizedBox(
                    width: 250,
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(), // Indicador de carga.
                    ),
                  );
                },
                // errorBuilder: Opcional, permite mostrar un widget si la carga de la imagen falla (ej: URL incorrecta, sin conexión).
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 100, color: Colors.red);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
