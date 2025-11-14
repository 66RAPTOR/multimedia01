import 'package:flutter/material.dart';

// 🛍️ Pantalla 12 (Destino): Vista de Detalle de Producto ENRIQUECIDA
class ImageDetailScreen12 extends StatelessWidget {
  const ImageDetailScreen12({super.key});

  // Datos ficticios del producto, ahora más completos.
  final String productName = 'Cámara Profesional Mirrorless Fx-Z9';
  final String productSku = 'SKU: PRO-FXZ9-BLC';
  final String productPrice = '\$1,999.00 USD';
  final double productRating = 4.8;
  final int reviewsCount = 1450;
  final String productDescription =
      'La cámara Fx-Z9 es la joya de la corona, ofreciendo una combinación perfecta de resolución Full-Frame y velocidad de procesamiento. Con un cuerpo de aleación de magnesio y sellado contra clima, está diseñada para resistir las condiciones más extremas sin sacrificar calidad de imagen. Es el equipo ideal para profesionales de la fotografía y el video que exigen lo mejor.';

  // Especificaciones clave separadas para mejor presentación.
  final List<String> highlights = const [
    'Sensor Full-Frame de 45 Megapíxeles',
    'Grabación de Video 8K/30p y 4K/120p',
    'Estabilización de Imagen de 5 Ejes (IBIS)',
    'Sistema de Autoenfoque con Detección Ocular',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Cámara Fx-Z9'),
        // Añadimos un ícono de favoritos para más realismo.
        actions: const [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: null, // Acción ficticia
          ),
        ],
      ),
      // Usamos SingleChildScrollView para asegurar que el contenido se pueda desplazar.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. WIDGET HERO (La Imagen que "Aterriza")
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Hero(
                  // CLAVE: Misma etiqueta 'tag' que la pantalla de origen.
                  tag: 'hero-image-12',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/images/karsten_g.jpg',
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // ----------------------------------------------------
            // 2. INFORMACIÓN BÁSICA, PRECIO Y VALORACIÓN
            // ----------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre y SKU
                  Text(productName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(productSku, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  const SizedBox(height: 15),

                  // Precio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productPrice,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.indigo,
                        ),
                      ),
                      // Valoración (Rating)
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            '${productRating.toStringAsFixed(1)} (${reviewsCount})', // Muestra 4.8 (1450)
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // 2.3 SECCIÓN DE OPCIONES DE MODELO/COLOR

                  /*const Text(
                    'Opciones de Modelo:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Fila de Chips para seleccionar modelos
                  Row(
                    children: [
                      _buildModelChip('Cuerpo', Colors.indigo, true), // Modelo seleccionado
                      const SizedBox(width: 10),
                      _buildModelChip('Kit 24-70mm', Colors.grey, false),
                      const SizedBox(width: 10),
                      _buildModelChip('Kit 70-200mm', Colors.grey, false),
                    ],
                  ),
                  const Divider(height: 30),*/


                  // 2.4 DESCRIPCIÓN EXTENDIDA
                  const Text(
                    'Descripción General:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDescription,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),


                  // 2.5 CARACTERÍSTICAS (HIGHLIGHTS)
                  const Text(
                    'Características Destacadas:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Uso de Column con Row y Icono para listar puntos importantes
                  ...highlights.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(item, style: const TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 100), // Espacio extra para que el último contenido no se esconda detrás del bottom bar.
          ],
        ),
      ),

      // ----------------------------------------------------
      // 3. BARRA INFERIOR DE ACCIÓN (Fixed Bottom Bar)
      // ----------------------------------------------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Botón de Contacto/Preguntas
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                side: const BorderSide(color: Colors.indigo, width: 2),
              ),
              child: const Icon(Icons.chat_bubble_outline, color: Colors.indigo),
            ),
            const SizedBox(width: 15),
            // Botón de Compra Principal
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('¡Cámara añadida al Carrito!')),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart, size: 20),
                label: const Text('Comprar Ahora', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función de ayuda para construir los chips de selección de modelo.
  Widget _buildModelChip(String label, Color color, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: color.withOpacity(0.2),
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? color : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: isSelected ? BorderSide(color: color, width: 2) : BorderSide.none,
      ),
      onSelected: (bool selected) {
        // En un estado real, se usaría setState para cambiar el modelo seleccionado.
      },
    );
  }
}