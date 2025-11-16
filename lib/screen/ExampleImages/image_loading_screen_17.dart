import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Importamos la librería para el efecto de brillo.
import 'dart:async'; // Necesario para usar la clase Timer y simular el retraso.

// 📰 1. ESTRUCTURA DE DATOS: Define cómo es una noticia.
class NewsItem {
  final String title;
  final String content;
  final String imageUrl; // URL ficticia o path del asset.
  NewsItem(this.title, this.content, this.imageUrl);
}

// 📰 2. DATOS FICTICIOS: Lista de 10 noticias.
final List<NewsItem> dummyNews = [
  NewsItem('Flutter 5.0: Rendimiento Optimizado y Nueva VM', 'La última versión promete mejoras significativas en el rendimiento de rendering y una API simplificada para animaciones complejas en la web.', 'assets/images/noticia_flutter.jpg'),
  NewsItem('Avance en IA: Modelos Lingüísticos de Código Abierto (LLMs)', 'Grandes empresas tecnológicas liberan modelos de lenguaje (LLMs) que impulsarán la innovación en pequeños desarrolladores y startups.', 'assets/images/noticia_ia.jpg'),
  NewsItem(
    'Mercado de Criptomonedas: Análisis de Tendencias para 2025',
    'Los expertos debaten sobre las próximas regulaciones y las tecnologías emergentes (como DeFi y NFTs) que dominarán el panorama financiero digital.',
    'assets/images/noticia_cripto.jpg',
  ),
  NewsItem('Exploración Espacial: Nuevo Telescopio Webb Descubre Galaxia Antigua', 'El telescopio espacial capta imágenes de una galaxia que se formó apenas 400 millones de años después del Big Bang, un récord.', 'assets/images/noticia_espacio.jpg'),
  NewsItem('Tendencias en Desarrollo Móvil: El auge de la Multiplataforma', 'Se confirma el crecimiento exponencial de frameworks como Flutter y React Native, desplazando gradualmente al desarrollo nativo puro.', 'assets/images/noticia_movil.jpg'),
  NewsItem('Cambio Climático: La Cumbre de Emergencia Global en Ginebra', 'Líderes mundiales se reúnen para establecer nuevos objetivos de reducción de carbono antes de la fecha límite establecida por la ONU.', 'assets/images/noticia_clima.jpg'),
  NewsItem('Tecnología 6G: Pruebas Piloto y Velocidades Récord', 'Las primeras pruebas de la tecnología de sexta generación (6G) muestran velocidades de transmisión nunca antes vistas en entornos controlados.', 'assets/images/noticia_6g.jpg'),
  NewsItem(
    'Deportes Electrónicos: El Futuro del Entretenimiento y la Inversión',
    'El sector de eSports alcanza una valoración histórica, atrayendo inversiones masivas y una audiencia global que supera los 500 millones.',
    'assets/images/noticia_esports.jpg',
  ),
  NewsItem(
    'Medicina Personalizada: Avances en Secuenciación Genómica Rápida',
    'Nuevas herramientas de inteligencia artificial permiten a los hospitales secuenciar genomas en minutos, abriendo la puerta a tratamientos hechos a medida.',
    'assets/images/noticia_medicina.jpg',
  ),
  NewsItem(
    'Innovación en Hogar Inteligente: El Desafío de la Compatibilidad',
    'El mercado de dispositivos inteligentes se consolida, pero los usuarios aún enfrentan problemas de integración entre diferentes marcas y ecosistemas.',
    'assets/images/noticia_hogar.jpg',
  ),
];

// ⏳ 3. WIDGET DE ESTADO: El Shimmer necesita un StatefulWidget para manejar el cambio de estado.
class ImageLoadingScreen17 extends StatefulWidget {
  const ImageLoadingScreen17({super.key});

  @override
  State<ImageLoadingScreen17> createState() => _ImageLoadingScreen17State();
}

class _ImageLoadingScreen17State extends State<ImageLoadingScreen17> {
  // 🔑 4. ESTADO CLAVE: Controla si mostramos el placeholder (true) o el contenido (false).
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 🔑 5. INICIALIZACIÓN: Apenas se crea el Widget, iniciamos la simulación.
    _simulateLoading();
  }

  void _simulateLoading() {
    // 🔑 6. SIMULACIÓN DE LATENCIA (API Call): Usamos Timer para introducir un retraso artificial.
    // Esto simula el tiempo que la aplicación esperaría por una respuesta de la base de datos o API.
    Timer(const Duration(seconds: 2), () {
      // 7. SEGURIDAD: Comprobamos si el widget sigue visible antes de cambiar el estado.
      if (mounted) {
        // 🔑 8. CAMBIO DE ESTADO: Actualizamos la variable y obligamos a Flutter a redibujar (re-ejecutar build).
        setState(() {
          _isLoading = false; // ¡La carga ha terminado!
        });
      }
    });
  }

  // --- FUNCIONES DE AYUDA PARA LA INTERFAZ ---

  // 9. Placeholder de línea de texto para el Shimmer.
  Widget _buildTextPlaceholder(double width) {
    return Container(
      height: 12.0,
      width: width,
      color: Colors.white, // Fundamental: debe ser blanco para que Shimmer lo "pinte".
      margin: const EdgeInsets.only(bottom: 8.0),
    );
  }

  // 10. Estructura de Card para el Shimmer.
  Widget _buildShimmerCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // Placeholder de Imagen
            width: 100.0,
            height: 80.0,
            color: Colors.white,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextPlaceholder(double.infinity), // Título: línea completa
                const SizedBox(height: 10.0),
                _buildTextPlaceholder(200.0), // Contenido: línea más corta
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 11. Card con el contenido real.
  Widget _buildRealNewsCard(NewsItem item) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Imagen Real (simulada)
            Container(
              width: 100.0,
              height: 70.0,
              color: Colors.blueGrey,
              child: const Icon(Icons.article, color: Colors.white70, size: 40),
            ),
            const SizedBox(width: 15.0),
            // Texto Real
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 5.0),
                  Text(
                    item.content,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 12.?MÉTODO_BUILD: Aquí se decide qué mostrar al usuario.
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLoading ? 'Cargando Noticias con Shimmer...' : 'Noticias Actuales')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            // 🔑 WIDGET CLAVE: AnimatedSwitcher
            // ----------------------------------------------------
            // 1. duration: Define cuánto tiempo durará la transición (ej: 500ms).
            // 2. child: El widget que está cambiando (nuestra lógica ternaria).
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800), // Duración de la transición.
              // Transición por defecto: El nuevo widget se desvanece mientras el viejo se va.
              transitionBuilder: (Widget child, Animation<double> animation) {
                // Opción por defecto que aplica Fade (desvanecimiento)
                return FadeTransition(opacity: animation, child: child);
              },
              child: _isLoading
                  // ----------------------------------------------------
                  // RAMA 1: MOSTRAR SHIMMER
                  // ----------------------------------------------------
                  ? Shimmer.fromColors(
                      // 🔑 CLAVE: La Key debe ser única para el AnimatedSwitcher.
                      // Usamos un valor constante (key: ValueKey(true)) para cuando está cargando.
                      key: const ValueKey<bool>(true),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Column(children: [...List.generate(dummyNews.length, (index) => _buildShimmerCard())]),
                    )
                  // ----------------------------------------------------
                  // RAMA 2: MOSTRAR CONTENIDO REAL
                  // ----------------------------------------------------
                  : Column(
                      // 🔑 CLAVE: La Key debe ser diferente a la del Shimmer.
                      // Usamos un valor constante (key: ValueKey(false)) para cuando ha cargado.
                      key: const ValueKey<bool>(false),
                      children: dummyNews.map((item) => _buildRealNewsCard(item)).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
