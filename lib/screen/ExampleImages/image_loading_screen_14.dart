import 'package:flutter/material.dart';

// 🌅 Pantalla 14: Gradiente de Opacidad sobre una Imagen
// Objetivo: Crear un efecto de "fade-to-black" en la parte inferior de la imagen.
class ImageLoadingScreen14 extends StatelessWidget {
  const ImageLoadingScreen14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Extender el body detrás del AppBar para que la imagen sea el fondo completo.
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Gradiente sobre Imagen'), backgroundColor: Colors.transparent, elevation: 0),

      // El Stack es esencial para apilar la imagen (fondo) y el gradiente (capa superior).
      body: Stack(
        children: <Widget>[
          // 1. IMAGEN DE FONDO (Primer hijo del Stack)
          // Se usa Positioned.fill para asegurar que la imagen cubra_todo el espacio del Stack.
          Positioned.fill(
            child: Image.asset(
              'assets/images/karsten_g.jpg', // Usa una imagen que llene el fondo.
              fit: BoxFit.cover, // Cubre toda el área sin dejar espacios.
            ),
          ),

          // 2. GRADIENTE DE OPACIDAD (Segundo hijo del Stack)
          // Este Container se coloca encima de la imagen y aplica el efecto de sombra.
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // begin: Inicia la transición del gradiente arriba.
                  begin: Alignment.topCenter,
                  // end: Termina la transición del gradiente abajo.
                  end: Alignment.bottomCenter,

                  // colors: La lista de colores define la transición de opacidad.
                  colors: <Color>[
                    // CLAVE 1: Color completamente transparente arriba (alfa 0x00).
                    Colors.black.withOpacity(0.0),
                    // CLAVE 2: Color ligeramente visible a 3/4 de la imagen (ej: 0.2 de opacidad).
                    Colors.black.withOpacity(0.2),
                    // CLAVE 3: Color con opacidad media en la parte inferior (alfa 0x99 o 0.6 de opacidad).
                    Colors.black.withOpacity(0.8),
                  ],

                  // stops: Controla dónde ocurre la transición.
                  // Va de 0.0 (arriba) a 1.0 (abajo).
                  stops: const [0.0, 0.5, 1.0], // La opacidad comienza a la mitad (0.5) y se intensifica al final.
                ),
              ),
            ),
          ),

          // 3. CONTENIDO DE TEXTO (Tercer hijo del Stack)
          // Usamos SafeArea para asegurar que el texto se coloque DENTRO de los límites
          // de la pantalla visible, es decir, debajo del AppBar y la barra de estado.
          SafeArea(
            child: Align(
              // 💡 CAMBIO SOLICITADO 1: Alineamos el contenido en la parte superior.
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ocupa solo el espacio necesario.
                  children: const <Widget>[
                    Text(
                      'Texto Alineado Arriba',
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'La SafeArea impide que este texto se oculte bajo el AppBar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. CONTENIDO DE TEXTO (Tercer hijo del Stack)
          // Se coloca encima de la imagen y del gradiente, generalmente centrado o abajo.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ocupa solo el espacio necesario.
                children: const <Widget>[
                  Text(
                    'Gradiente de Sombra',
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'El fondo se oscurece para resaltar el texto inferior.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
