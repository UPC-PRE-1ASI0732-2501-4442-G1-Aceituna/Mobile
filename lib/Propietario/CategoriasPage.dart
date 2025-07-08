import 'package:flutter/material.dart';
//import '../BottomNavBar.dart';  // Importa la función

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({Key? key}) : super(key: key);

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  //int _selectedIndex = 0;

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(context, '/pedidos');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/perfil');
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: Colors.green,
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            const Text(
              'Selecciona una Categoría',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
      //bottomNavigationBar: buildBottomNavigationBar(_selectedIndex, _onItemTapped), // Llama la función aquí
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Bike') {
          Navigator.pushNamed(context, '/categoria_bike'); // Navega a Bike
        } else if (title == 'Scooter Electrónico') {
          Navigator.pushNamed(context, '/categoria_scooter'); // Navega a Scooter
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
