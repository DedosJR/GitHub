import 'package:flutter/material.dart';
import 'package:maxiradiofm/pages/news.dart';
import 'package:maxiradiofm/pages/player_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Lista de páginas (por ahora solo demostración)
  final List<Widget> _pages = [
    Center(child: Text('Inicio', style: TextStyle(fontSize: 29))),
    PlayerScreen(),
    const NewsPage(),
    Center(child: Text('Buscar', style: TextStyle(fontSize: 29))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/M-app.png',
              width: 50, // Ruta del logo
              height: 50, // Tamaño del logo
            ),
            const SizedBox(width: 70), // Espacio entre logo y texto
            const Text(
              'MaxiRadioFM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: customGreen,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: customGreen,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Colores personalizados
const Color customGreen = Color(0xFF00C846);
const Color customYellow = Color(0xFFF2DB1D);
