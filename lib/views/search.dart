/*import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> books = [
    {
      "title": "Los Juegos del Hambre",
      "image": "assets/album8.jpg",
    },
    {
      "title": "Cuentos de los Hermanos Grimm",
      "image": "assets/album7.jpg",
    },
    {"title": "1984", "image": "assets/album1.jpg"},
    {"title": "El Principito", "image": "assets/album2.jpg"},
    {
      "title": "Crónica de una muerte anunciada",
      "image": "assets/album3.jpg",
    },
  ];
  List<Map<String, String>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void _filterBooks(String query) {
    setState(() {
      filteredBooks =
          books
              .where(
                (book) =>
                    book["title"]!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Libros"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterBooks,
              decoration: InputDecoration(
                hintText: "Buscar libros...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child:
                  filteredBooks.isEmpty
                      ? Center(child: Text("No se encontraron resultados"))
                      : ListView.builder(
                        itemCount: filteredBooks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              filteredBooks[index]["image"]!,
                            ),
                            title: Text(filteredBooks[index]["title"]!),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              // Aquí puedes navegar a la vista de detalles del libro
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:MagusBook/views/home.dart';
import 'package:flutter/material.dart';
// Asegúrate de importar la vista Home

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> books = [
    {
      "title": "Los Juegos del Hambre",
      "image": "assets/album8.jpg",
    },
    {
      "title": "Cuentos de los Hermanos Grimm",
      "image": "assets/album7.jpg",
    },
    {"title": "1984", "image": "assets/album1.jpg"},
    {"title": "El Principito", "image": "assets/album2.jpg"},
    {
      "title": "Crónica de una muerte anunciada",
      "image": "assets/album3.jpg",
    },
  ];
  List<Map<String, String>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void _filterBooks(String query) {
    setState(() {
      filteredBooks =
          books
              .where(
                (book) =>
                    book["title"]!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Libros"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterBooks,
              decoration: InputDecoration(
                hintText: "Buscar libros...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child:
                  filteredBooks.isEmpty
                      ? Center(child: Text("No se encontraron resultados"))
                      : ListView.builder(
                        itemCount: filteredBooks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              filteredBooks[index]["image"]!,
                            ),
                            title: Text(filteredBooks[index]["title"]!),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              // Aquí puedes navegar a la vista de detalles del libro
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}


