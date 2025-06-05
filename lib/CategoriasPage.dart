import 'package:flutter/material.dart';

class CategoriasPage extends StatelessWidget {
  const CategoriasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            const Text(
              'Categorias',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 1.2,
                mainAxisSpacing: 24,
                children: [
                  _buildCategoryCard(
                    context,
                    'Bike',
                    'assets/images/bike.jpg', // tu imagen
                  ),
                  _buildCategoryCard(
                    context,
                    'Scooter Electrónico',
                    'assets/images/scooter.jpg', // tu imagen
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Bike') {
          // Navega a la pantalla de Bike (implementa esta ruta)
          Navigator.pushNamed(context, '/categoria_bike');
        } else if (title == 'Scooter Electrónico') {
          // Navega a la pantalla de Scooter
          Navigator.pushNamed(context, '/categoria_scooter');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
