import 'package:flutter/material.dart';
import 'package:MagusBook/views/home.dart';
/*import 'package:MagusBook/views/library.dart';*/
import 'package:MagusBook/views/profile.dart';
import 'package:MagusBook/views/search.dart';

class Tabbar extends StatefulWidget {
  final String userName;

  Tabbar({required this.userName}); // Constructor con parámetro requerido

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeView(),
      SearchView(),
      ProfileView(userName: widget.userName), // Pasamos userName correctamente
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
      body: Stack(
        children: List.generate(
          _pages.length,
          (index) => renderView(index, _pages[index]),
        ),
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
