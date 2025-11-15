import 'package:flutter/material.dart';
import 'dart:ui' as ui; // Necesario para ImageFilter.blur

// 🧊 Pantalla 15: Cards con Efecto Liquid Glass (Vidrio Esmerilado)
class ImageLoadingScreen15 extends StatelessWidget {
  const ImageLoadingScreen15({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // La imagen de fondo cubrirá el AppBar
      appBar: AppBar(title: const Text('Cards con Efecto Liquid Glass'), backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: <Widget>[
          // 1. IMAGEN DE FONDO (Capas inferiores del Stack)
          // Cubre toda la pantalla.
          Positioned.fill(
            child: Image.asset(
              'assets/images/karsten_g.jpg', // Tu imagen de fondo
              fit: BoxFit.cover,
            ),
          ),

          // 2. GRADIENTE DE OPACIDAD (Encima de la imagen de fondo)
          // Un gradiente sutil para mejorar la legibilidad del texto en general.
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withOpacity(0.1), // Un poco de oscuridad arriba
                    Colors.black.withOpacity(0.4), // Más oscuridad abajo
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),

          // 3. CONTENIDO PRINCIPAL (Centrado, con las Cards)
          // Usamos un SingleChildScrollView para poder desplazarnos si hay muchas cards.
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Card 1: Con Efecto Liquid Glass ---
                  _buildGlassCard(
                    context,
                    title: 'Notificación Importante',
                    content: 'Recuerda que tu suscripción premium se renueva en 3 días. ¡Aprovecha nuestras ofertas exclusivas!',
                    icon: Icons.notifications_active,
                    blurAmount: 5.0, // Cantidad de desenfoque para esta card
                  ),
                  const SizedBox(height: 20),

                  // --- Card 2: Otra Card con Efecto Liquid Glass ---
                  _buildGlassCard(
                    context,
                    title: 'Próximo Evento',
                    content: 'No te pierdas el webinar sobre "Flutter Avanzado" este jueves. Regístrate ahora y asegura tu lugar.',
                    icon: Icons.event,
                    blurAmount: 8.0, // Un poco más de desenfoque para variar
                  ),
                  const SizedBox(height: 20),

                  // --- Card 3: Card Adicional (para demostrar scroll) ---
                  _buildGlassCard(context, title: '¡Descubre Novedades!', content: 'Explora las nuevas funcionalidades y mejoras en la última actualización de la aplicación. ¡Hay mucho por ver!', icon: Icons.new_releases, blurAmount: 6.0),

                  const SizedBox(height: 20),

                  // --- Card 4: NUEVA CARD ---
                  _buildGlassCard(context, title: 'Oferta Exclusiva', content: 'Solo por hoy, obtén un 25% de descuento en todos los complementos. ¡No dejes pasar esta oportunidad!', icon: Icons.local_offer, blurAmount: 7.0),
                  const SizedBox(height: 20),

                  // --- Card 5: NUEVA CARD ---
                  _buildGlassCard(context, title: 'Soporte 24/7 Disponible', content: 'Nuestro equipo de soporte está listo para ayudarte con cualquier duda o problema. ¡Estamos a tu servicio!', icon: Icons.support_agent, blurAmount: 5.5),
                  const SizedBox(height: 40), // Espacio extra al final para el scroll.
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNCIÓN DE AYUDA: Crea una Card con Efecto Liquid Glass ---
  Widget _buildGlassCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required double blurAmount, // Parámetro para controlar la intensidad del blur
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas para la card
      child: BackdropFilter(
        // filter: Aquí aplicamos el desenfoque (blur).
        filter: ui.ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
        child: Container(
          // Decoration del contenedor para darle un color semi-transparente
          // y un borde para el efecto de "cristal".
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Fondo blanco semi-transparente
            border: Border.all(
              color: Colors.white.withOpacity(0.3), // Borde blanco sutil
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width * 0.85, // 85% del ancho de la pantalla
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Título de la Card
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 28),
                  const SizedBox(width: 15),
                  Expanded(
                    // Expanded para que el texto no se salga si es muy largo
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 5, color: Colors.black38)],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white54, height: 30),
              // Contenido de la Card
              Text(
                content,
                style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.4),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              // Botón de acción
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Ver Más',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
