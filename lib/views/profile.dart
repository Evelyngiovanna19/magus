/*import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Perfil Usuario"),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:MagusBook/main.dart';
 // Asegúrate de que el nombre del archivo sea correcto


class ProfileView extends StatefulWidget {
  final String userName; // Recibe el nombre del usuario como parámetro

  ProfileView({required this.userName}); // Constructor con userName

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late String userName;
  String userAvatar = "assets/album19.jpg"; // Imagen de perfil
  List<String> generatedImages = [
    "assets/album2.jpg",
    "assets/album20.jpg",
    "assets/album10.jpg",
  ];

  @override
  void initState() {
    super.initState();
    userName = widget.userName; // Asigna el nombre de usuario recibido
  }

  void _editProfile() {
    TextEditingController nameController = TextEditingController(text: userName);
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar Perfil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nuevo nombre de usuario"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Nueva contraseña"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("Guardar cambios"),
              onPressed: () {
                setState(() {
                  userName = nameController.text; // Actualiza el nombre
                  // Aquí podrías agregar lógica para actualizar la contraseña en Firebase
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

void _logout() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("¿Estás seguro de que quieres salir?"),
        actions: [
          TextButton(
            child: Text("Cancelar"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text("Salir"),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => IntermediateScreen()),
              ); // Redirige a IntermediateScreen
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
        title: Text("Perfil"),
        backgroundColor: const Color.fromARGB(255, 33, 3, 87),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _logout),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(userAvatar)),
            SizedBox(height: 10),
            Text(
              "Hola Lector$userName", // Muestra el nombre del usuario
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _editProfile,
              child: Text("Editar perfil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Imágenes generadas por tus lecturas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: generatedImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      generatedImages[index],
                      fit: BoxFit.cover,
                    ),
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
