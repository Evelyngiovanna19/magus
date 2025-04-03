/*import 'package:flutter/material.dart';
import 'package:MagusBook/widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider? image;

  const AlbumView({Key? key, this.image}) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerInitialHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    super.initState();
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          imageSize = (initialSize - scrollController.offset).clamp(0.0, initialSize);
          containerHeight = (containerInitialHeight - scrollController.offset).clamp(0.0, containerInitialHeight);
          imageOpacity = imageSize / initialSize;
          showTopBar = scrollController.offset > 224;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.5 * 255).toInt()),
                          offset: const Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: widget.image != null
                        ? Image(
                            image: widget.image!,
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover,
                          )
                        : Container(), // Manejo de imagen nula
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha((0.0 * 255).toInt()),
                          Colors.black.withAlpha((0.0 * 255).toInt()),
                          Colors.black.withAlpha((1.0 * 255).toInt()),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Image(
                                      image: AssetImage('assets/logo.png'),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    Text("MAGUSBOOK"),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "1,888,00 Lectores",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite),
                                        SizedBox(width: 16),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Los cuentos más famosos de los hermanos Grimm"),
                        const SizedBox(height: 32),
                        Text(
                          "También te puede gustar",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/album20.jpg"),
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // App bar animado
          Positioned(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              color: showTopBar ? const Color(0xFFC61855) : const Color(0xFFC61855).withAlpha(0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SafeArea(
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 38,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: showTopBar ? 1 : 0,
                        child: Text(
                          "Tus Mejores Lecturas",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 80 - containerHeight.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff14D860),
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 38,
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.shuffle,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:MagusBook/widgets/album_card.dart';

// Vista de detalle del libro
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path/path.dart' as path;
import 'dart:async';

import 'package:path_provider/path_provider.dart';

class BookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libro Detalle'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 100, 9, 65), // Cambia el color de fondo aquí
        child: FutureBuilder<File>(
          future: _loadPdf(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return PDFView(
                  filePath: snapshot.data!.path,
                );
              } else {
                return const Center(child: Text("No se pudo cargar el PDF"));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }


Future<File> _loadPdf() async {
  final byteData = await rootBundle.load("assets/grid.pdf");
  final tempDir = await getTemporaryDirectory(); // Obtiene el directorio temporal correcto
  final tempPath = path.join(tempDir.path, "grid.pdf");
  final file = File(tempPath);
  await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
  return file;
}
}

class AlbumView extends StatefulWidget {
  final ImageProvider? image;

  const AlbumView({Key? key, this.image}) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerInitialHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  // Estado para los íconos de "favorite" y "more_horiz"
  bool isFavorite = false;
  bool isMoreOptions = false;

  @override
  void initState() {
    super.initState();
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          imageSize = (initialSize - scrollController.offset).clamp(0.0, initialSize);
          containerHeight = (containerInitialHeight - scrollController.offset).clamp(0.0, containerInitialHeight);
          imageOpacity = imageSize / initialSize;
          showTopBar = scrollController.offset > 224;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          // Contenedor de la imagen y scroll
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.5 * 255).toInt()),
                          offset: const Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: widget.image != null
                        ? Image(
                            image: widget.image!,
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),

          // Scroll de contenido
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Título y contenido de la vista
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha((0.0 * 255).toInt()),
                          Colors.black.withAlpha((0.0 * 255).toInt()),
                          Colors.black.withAlpha((1.0 * 255).toInt()),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  children: const [
                                    Image(
                                      image: AssetImage('assets/logo.png'),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    Text("MAGUSBOOK"),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const Text("1,888,00 Lectores"),
                                const SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isFavorite = !isFavorite; // Cambia el estado
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: isFavorite ? Colors.red : Colors.white, // Cambia el color al hacer clic
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isMoreOptions = !isMoreOptions; // Cambia el estado
                                            });
                                          },
                                          child: Icon(
                                            Icons.more_horiz,
                                            color: isMoreOptions ? Colors.blue : Colors.white, // Cambia el color al hacer clic
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Sugerencias de otros libros
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Los cuentos más famosos de los hermanos Grimm"),
                        const SizedBox(height: 32),
                        const Text("También te puede gustar", style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/album20.jpg"),
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image: const AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Barra superior animada con icono de navegación
           Positioned(
            bottom: 80,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookView()),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 32,
                child: Icon(Icons.play_arrow, size: 38, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

   
