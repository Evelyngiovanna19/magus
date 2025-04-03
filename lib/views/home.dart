/*import 'package:flutter/material.dart';
import 'package:MagusBook/widgets/album_card.dart';
import 'package:MagusBook/widgets/song_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 18, 26),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(100, 12, 96, 0.0), // Opacidad 0%
                    Color.fromRGBO(61, 6, 40, 0.9),  // Opacidad 90%
                    Color.fromRGBO(48, 3, 48, 1.0),  // Opacidad 100%
                    Color.fromRGBO(36, 1, 25, 1.0),  // Opacidad 100%
                    Colors.black, // Ya es opaco al 100%
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Leído Recientemente",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 16),
                              Icon(Icons.settings),
                            ],
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Populares",
                            image: AssetImage("assets/album7.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Lecturas Motivadoras",
                            image: AssetImage("assets/album2.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top 5 Libros-Global",
                            image: AssetImage("assets/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Superacion Personal",
                            image: AssetImage("assets/album1.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top libros - Global",
                            image: AssetImage("assets/album9.jpg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Categorias",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Top Libros - Global",
                                image: AssetImage("assets/top50.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Academicos",
                                image: AssetImage("assets/album20.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Poemas",
                                image: AssetImage("assets/album16.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Filosofico",
                                image: AssetImage("assets/album17.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Preferidos",
                                image: AssetImage("assets/album18.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Ciencia ficcion",
                                image: AssetImage("assets/album19.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Basado en tus lecturas recientes",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album20.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Libros recomendados",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album8.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album7.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album20.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album17.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:MagusBook/widgets/album_card.dart';
import 'package:MagusBook/widgets/song_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:MagusBook/widgets/album_card.dart';

class Libros extends StatefulWidget {
  @override
  _LibrosState createState() => _LibrosState();
}

class _LibrosState extends State<Libros> {
  final CollectionReference librosRef =
      FirebaseFirestore.instance.collection('libros');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Libros Disponibles')),
      body: StreamBuilder<QuerySnapshot>(
        stream: librosRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hay libros disponibles'));
          }

          var libros = snapshot.data!.docs;

          return ListView.builder(
            itemCount: libros.length,
            itemBuilder: (context, index) {
              var libro = libros[index].data() as Map<String, dynamic>? ?? {};

              return ListTile(
                leading: libro.containsKey('img') && libro['img'] != null
                    ? Image.network(
                        libro['img'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.book, size: 50), // En caso de error, muestra un ícono
                      )
                    : Icon(Icons.book, size: 50),
                title: Text(libro['titulo'] ?? 'Sin título'),
                subtitle: Text(libro['autor'] ?? 'Autor desconocido'),
                trailing: const Icon(Icons.picture_as_pdf, color: Colors.red),
                onTap: () => _abrirPDF(libro['pdfurl']),
              );
            },
          );
        },
      ),
    );
  }

  void _abrirPDF(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint("No se pudo abrir el PDF");
    }
  }
}



class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List<Color> _selectedColors = [
    Color.fromRGBO(100, 12, 96, 1.0),
    Color.fromRGBO(61, 6, 40, 1.0),
    Color.fromRGBO(48, 3, 48, 1.0),
    Color.fromRGBO(36, 1, 25, 1.0),
  ];
  String? _selectedFont;
  double _fontSize = 16.0;
  double _brightness = 1.0;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 16.0;
      _selectedFont = prefs.getString('selectedFont');
      _brightness = prefs.getDouble('brightness') ?? 1.0;
      for (int i = 0; i < _selectedColors.length; i++) {
      _selectedColors[i] = Color(prefs.getInt('color$i') ?? _selectedColors[i].toARGB32());

    }

    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', _fontSize);
    prefs.setDouble('brightness', _brightness);
    if (_selectedFont != null) prefs.setString('selectedFont', _selectedFont!);
    for (int i = 0; i < _selectedColors.length; i++) {
      prefs.setInt('color_$i', _selectedColors[i].toARGB32());
    }
  }

  void _pickColor(int index) {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = _selectedColors[index];
        return AlertDialog(
          title: Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: tempColor,
              onColorChanged: (color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                setState(() {
                  _selectedColors[index] = tempColor;
                  _savePreferences();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido a las configuraciones de MagusBook',
              style: TextStyle(fontSize: _fontSize + 4.0, fontWeight: FontWeight.bold, fontFamily: _selectedFont),
            ),
            SizedBox(height: 20),
            Text('Selecciona los colores para el degradado:', style: TextStyle(fontSize: _fontSize, fontFamily: _selectedFont)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () => _pickColor(index),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _selectedColors,
                      ),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Selecciona la fuente:', style: TextStyle(fontSize: _fontSize, fontFamily: _selectedFont)),
            DropdownButton<String>(
              value: _selectedFont,
              hint: Text('Selecciona una fuente'),
              items: ['Roboto', 'Arial', 'Times New Roman', 'Courier New', 'Georgia'].map((String font) {
                return DropdownMenuItem<String>(
                  value: font,
                  child: Text(font, style: TextStyle(fontFamily: font)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFont = newValue;
                  _savePreferences();
                });
              },
            ),
            SizedBox(height: 20),
            Text('Ajusta el tamaño de la letra:', style: TextStyle(fontSize: _fontSize, fontFamily: _selectedFont)),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              divisions: 20,
              label: _fontSize.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                  _savePreferences();
                });
              },
            ),
            SizedBox(height: 20),
            Text('Brillo de la pantalla:', style: TextStyle(fontSize: _fontSize, fontFamily: _selectedFont)),
            Slider(
              value: _brightness,
              min: 0.1,
              max: 1.0,
              divisions: 10,
              label: _brightness.toStringAsFixed(1),
              onChanged: (double value) {
                setState(() {
                  _brightness = value;
                  _savePreferences();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 18, 26),
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(100, 12, 96, 0.0), // Opacidad 0%
                    Color.fromRGBO(61, 6, 40, 0.9),  // Opacidad 90%
                    Color.fromRGBO(48, 3, 48, 1.0),  // Opacidad 100%
                    Color.fromRGBO(36, 1, 25, 1.0),  // Opacidad 100%
                    Colors.black, // Ya es opaco al 100%
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Leído Recientemente",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SettingsView(),
                                    ),
                                  );
                                },
                                child: Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Libros(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Ver Libros',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Populares",
                            image: AssetImage("assets/album7.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Lecturas Motivadoras",
                            image: AssetImage("assets/album2.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top 5 Libros-Global",
                            image: AssetImage("assets/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Superacion Personal",
                            image: AssetImage("assets/album1.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top libros - Global",
                            image: AssetImage("assets/album9.jpg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Categorias",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Top Libros - Global",
                                image: AssetImage("assets/top50.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Academicos",
                                image: AssetImage("assets/album20.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Poemas",
                                image: AssetImage("assets/album16.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Filosofico",
                                image: AssetImage("assets/album17.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Preferidos",
                                image: AssetImage("assets/album18.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Ciencia ficcion",
                                image: AssetImage("assets/album19.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Basado en tus lecturas recientes",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album20.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Libros recomendados",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album8.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album7.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album20.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album17.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(label)
          ],
        ),
      ),
    );
  }
}