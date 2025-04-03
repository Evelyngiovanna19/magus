// ignore_for_file: unused_import

import 'package:MagusBook/firebase_options.dart';
import 'package:MagusBook/views/home.dart';
import 'package:MagusBook/views/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:MagusBook/navigations/tabbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes")),
      body: Center(child: Text("Configuraciones")),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCGYd2o7NNWq72i61MycrTAJWa5hSGp7mk",
      authDomain: "magusb-4e1c9.firebaseapp.com",
      projectId: "magusb-4e1c9",
      storageBucket: "magusb-4e1c9.appspot.com",
      messagingSenderId: "81343272216",
      appId: "1:81343272216:web:b12eb9f21e88db9e117a6d",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: SplashScreen(),
    );
  }
}

Widget buildGradientBackground(Widget child) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF4B1D3F), // Dark purple
          Color.fromARGB(255, 114, 42, 69), // Pink
          Color.fromARGB(255, 65, 41, 78), // Dark blue
        ],
      ),
    ),
    child: child,
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IntermediateScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350, // Contenedor más grande
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4B1D3F),
                      Color.fromARGB(255, 114, 42, 69),
                      Color.fromARGB(255, 65, 41, 78),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo más grande
                    Image.asset('assets/Logo.png', width: 260),

                    SizedBox(height: 8), // Espacio reducido
                    // Título con texto más grande
                    Text(
                      "MAGUSBOOK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28, // Texto más grande
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25), // Espacio entre título y línea de carga
              // Línea de progreso en color morado
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: LinearProgressIndicator(
                  backgroundColor: const Color.fromARGB(78, 161, 57, 165),
                  color: Color.fromARGB(255, 66, 10, 59), // Morado
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Ventana 1
class IntermediateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Logo.png', width: 150),
              SizedBox(height: 20),
              Text(
                "BIENVENIDO \n A \n MAGUSBOOK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),
              // Login button
              _customButton(
                context,
                "Iniciar sesión",
                Colors.grey[300]!,
                Colors.black,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
              ),

              SizedBox(height: 30),
              // Registration button
              _customButton(
                context,
                "Registrarse",
                Colors.grey[300]!,
                Colors.black,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//  v-2
class RegistrationInfoScreen extends StatefulWidget {
  @override
  _RegistrationInfoScreenState createState() => _RegistrationInfoScreenState();
}

class _RegistrationInfoScreenState extends State<RegistrationInfoScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String? errorMessage;

  Future<void> registerUser() async {
    if (userNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      setState(() {
        errorMessage = "No pueden haber campos vacíos";
      });
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        errorMessage = "Las contraseñas no coinciden";
      });
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      
      // Navega a la pantalla de perfil y pasa el nombre de usuario
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SurveyScreen(),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4B1D3F),
              Color.fromARGB(255, 114, 42, 69),
              Color.fromARGB(255, 65, 41, 78),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            
          ),
        ),
        child: Center(
          
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Text(
                  "REGISTRO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(userNameController, "Nombre de Usuario", false),
                SizedBox(height: 10),
                _buildTextField(emailController, "Correo Electrónico", false),
                SizedBox(height: 10),
                _buildTextField(passwordController, "Contraseña", true),
                SizedBox(height: 10),
                _buildTextField(confirmPasswordController, "Confirmar Contraseña", true),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    "Registrarse",
                    style: TextStyle(
                      color: Color(0xFF4B1D3F),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    bool isPassword,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 176, 176).withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          color: const Color.fromARGB(221, 53, 50, 50),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(134, 29, 28, 28),
          ),
        ),
      ),
    );
  }
} 
// V-3
class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Text(
                "TÉRMINOS Y CONDICIONES DE MAGUSBOOK",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(83, 85, 10, 95),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      '''
1. Aceptación de términos
Al acceder o utilizar la plataforma MAGUSBOOK, usted acepta estar sujeto a estos términos y condiciones. Si no está de acuerdo con todos estos términos, no debe utilizar la plataforma.

2. Descripción del servicio
MAGUSBOOK es una plataforma diseñada para facilitar la creación, edición y publicación de contenido literario y educativo, así como la interacción entre clientes, autores, lectores, diseñadores, desarrolladores, docentes y financieros.

3. Registro de usuario
- Es necesario registrarse para acceder a ciertas funciones.
- Se debe proporcionar información precisa y actualizada.
- Cada usuario es responsable de su cuenta.

4. Uso de la Plataforma
- No se permite publicar contenido ilegal u ofensivo.
- No está permitido alterar, hackear o realizar ingeniería inversa.

5. Propiedad Intelectual
Los derechos sobre los diseños, textos, gráficos y cualquier otro contenido publicado en MAGUSBOOK son propiedad de sus respectivos autores y de la plataforma.

6. Contenido del usuario
Al publicar contenido, concede a MAGUSBOOK una licencia para usar y distribuir dicho contenido.

7. Limitación de Responsabilidad
MAGUSBOOK no será responsable por daños derivados del uso de la plataforma.

8. Modificaciones de los Términos
MAGUSBOOK puede modificar estos términos en cualquier momento.

9. Ley Aplicable
- Ley de 1887 de 2018_Gestor normativo (Colombia)

10. Contacto
Para consultas, contáctenos en [correo o información de contacto].
                      ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromARGB(255, 236, 236, 236),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationInfoScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      "Aceptar",
                      style: TextStyle(
                        color: Color(0xFF4B1D3F),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(
                        (255 * 0.3).toInt(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      "Volver",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// V-4
/*class UserTypeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo en la parte superior
                  Image.asset('assets/logo.png', width: 150),
                  SizedBox(height: 20),

                  Text(
                    "BIENVENIDO,\nA ESTE NUEVO UNIVERSO, \n DESCUBRE TODO LO QUE \n  TENEMOS PARA TI ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Botones de selección de usuario
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 320,
                        child: _customButton(
                          context,
                          "Lector",
                          Colors.white,
                          Colors.black,
                        ),
                      ),
                      /*SizedBox(height: 20),
                      SizedBox(
                        width: 320,
                        child: _customButton(
                          context,
                          "Creador de contenido",
                          Colors.white,
                          Colors.black,
                        ),
                      ),*/
                    ],
                  ),
                ],
              ),
            ),

            // Botón "Atrás" en la parte inferior izquierda
            Positioned(
              left: 20,
              bottom: 20,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntermediateScreen(),
                    ),
                  );
                },
                child: Text(
                  "Atrás",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BirthDateScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}*/

// V-5
/*class BirthDateScreen extends StatefulWidget {
  @override
  _BirthDateScreenState createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends State<BirthDateScreen> {
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.deepPurple, // Color de selección
              onPrimary: Colors.white, // Texto en botones de selección
              surface: Color.fromARGB(
                248,
                30,
                9,
                36,
              ), // Color del fondo del calendario
              onSurface: Colors.white, // Color del texto
            ),
            dialogTheme: DialogTheme(
              backgroundColor: Color.fromARGB(
                255,
                49,
                20,
                50,
              ), // 🔹 Color de fondo modificable
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
          ),
          child: child ?? SizedBox.shrink(),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4B1D3F),
              Color.fromARGB(255, 114, 42, 69),
              Color.fromARGB(255, 65, 41, 78),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿CUÁL ES TU FECHA DE NACIMIENTO?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  Image.asset('assets/logo.png', width: 150),
                  SizedBox(height: 20),

                  Text(
                    "Indica tu fecha de nacimiento, esto no \n afectará en tu navegación, solo será \n tomada en cuenta.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  // 🔹 Selector de fecha con tamaño reducido
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 8,
                    ),
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: SizedBox(
                          height: 50, // 🔹 Reduciendo la altura
                          width: 450, // 🔹 Reduciendo el ancho
                          child: TextField(
                            controller: dateController,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            textAlign: TextAlign.center, // Centrar texto
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: "DD/MM/AAAA",
                              hintStyle: TextStyle(color: Colors.white70),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botón "Siguiente"
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NameAndGenderScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Siguiente",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Botón "ATRÁS" en la parte inferior izquierda
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "ATRÁS",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

// V-6
/*class NameAndGenderScreen extends StatefulWidget {
  @override
  _NameAndGenderScreenState createState() => _NameAndGenderScreenState();
}

class _NameAndGenderScreenState extends State<NameAndGenderScreen> {
  TextEditingController nameController = TextEditingController();
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo antes de todo el texto
                  Image.asset(
                    "assets/logo.png", // Reemplaza con la ruta correcta de tu logo
                    height: 100, // Ajusta el tamaño según sea necesario
                  ),
                  SizedBox(height: 20), // Espacio entre logo y título

                  Text(
                    "NOMBRE DE PILA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Esta información es confidencial y solo se \n usará para los fines específicos para los \n cuales fue proporcionada. No será \n compartida con terceros sin su \n consentimiento previo, excepto cuando \n sea requerido por la ley. Nos \n comprometemos a proteger su privacidad \n y a manejar sus datos personales de \n manera segura y responsable.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Campo de Nombre
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Nombre",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Selección de Género
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DropdownButtonFormField<String>(
                      value: selectedGender.isNotEmpty ? selectedGender : null,
                      dropdownColor: Colors.purple,
                      items: [
                        DropdownMenuItem(
                          child: Text("Femenino"),
                          value: "Femenino",
                        ),
                        DropdownMenuItem(
                          child: Text("Masculino"),
                          value: "Masculino",
                        ),
                        DropdownMenuItem(child: Text("Otros"), value: "Otros"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Género",
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Botón "Siguiente"
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UsernameAndGenderScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Siguiente",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Botón "ATRÁS"
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "ATRÁS",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

// V.7
/*class UsernameAndGenderScreen extends StatefulWidget {
  @override
  _UsernameAndGenderScreenState createState() =>
      _UsernameAndGenderScreenState();
}

class _UsernameAndGenderScreenState extends State<UsernameAndGenderScreen> {
  TextEditingController usernameController = TextEditingController();
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo antes de todo el texto
                  Image.asset(
                    "assets/logo.png", // Ruta correcta del logo
                    height: 100, // Ajusta el tamaño según sea necesario
                  ),
                  SizedBox(height: 20), // Espacio entre logo y título

                  Text(
                    "NOMBRE DE USUARIO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Este será tu nombre con el que te identificaras \n dentro de la aplicacion.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Campo de Nombre de Usuario
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Nombre de Usuario",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Selección de Género
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DropdownButtonFormField<String>(
                      value: selectedGender.isNotEmpty ? selectedGender : null,
                      dropdownColor: Colors.purple,
                      items: [
                        DropdownMenuItem(
                          child: Text("Femenino"),
                          value: "Femenino",
                        ),
                        DropdownMenuItem(
                          child: Text("Masculino"),
                          value: "Masculino",
                        ),
                        DropdownMenuItem(child: Text("Otros"), value: "Otros"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Género",
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Botón "Siguiente"
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    RegistrationMethodSelectionScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Siguiente",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Botón "ATRÁS"
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "ATRÁS",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

// V-8
/*class RegistrationMethodSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo antes del texto principal
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150, // Ajusta el tamaño si es necesario
              ),
              SizedBox(height: 20),

              // Texto principal
              Text(
                "PARA REGISTRARTE, \n PUEDES USAR:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),


              SizedBox(height: 50, width: 4500),

              // Botón "ATRÁS"
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "ATRÁS",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para los botones de selección de método de registro
  Widget _customButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    Widget nextScreen,
  ) {
    return SizedBox(
      width: 450,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreen),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}*/



// V-10
class ConfirmationCodeScreen extends StatelessWidget {
  final String email; // Correo electrónico del usuario

  ConfirmationCodeScreen({required this.email});

  Future<void> sendPasswordResetEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Se ha enviado un enlace de recuperación a $email"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: No se pudo enviar el correo. Verifica la dirección."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground( // Asegura que usa el mismo fondo que las demás pantallas
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Logo.png', width: 150),
              SizedBox(height: 20),
              Text(
                "Este es tu correo de restablecimiento de contraseña: \n$email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => sendPasswordResetEmail(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Enviar a correo",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Atrás",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// V-11
class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Logo.png', width: 150),
              SizedBox(height: 20),
              Text(
                "TE REGISTRASTE EXITOSAMENTE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SurveyScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Finalizar",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// V-12
class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<Map<String, String>> genres = [
    {"name": "Terror", "image": "assets/terror.png"},
    {"name": "Misterio", "image": "assets/misterio.png"},
    {"name": "Ficción", "image": "assets/ciencia.png"},
    {"name": "Romance", "image": "assets/romance.png"},
  ];

  List<String> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Column(
          children: [
            SizedBox(height: 40), // Espaciado para el notch
            // Logo
            Image.asset("assets/Logo.png", width: 80),

            SizedBox(height: 15),

            // Descripción del formulario
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Nos gustaría conocerte un poco mejor,  para poder hacerte sugerencias de lectura personalizadas. "
                "A continuación, puedes seleccionar los géneros de lectura que prefieras, \ncon el fin de personalizar tu experiencia en MAGUSBOOK.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),

            SizedBox(height: 20),

            // Título "FORMULARIO"
            Text(
              "FORMULARIO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            // Lista de géneros con imágenes
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ), // Espaciado en los bordes
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:
                      10, // Aumenta el espacio horizontal entre imágenes
                  mainAxisSpacing:
                      10, // Aumenta el espacio vertical entre imágenes
                  childAspectRatio: 0.85, // Ajuste para mejorar el tamaño
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  String genreName = genres[index]["name"]!;
                  String imagePath = genres[index]["image"]!;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedGenres.contains(genreName)) {
                          selectedGenres.remove(genreName);
                        } else {
                          selectedGenres.add(genreName);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color:
                              selectedGenres.contains(genreName)
                                  ? Colors.white
                                  : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 520, // Aumenta el tamaño de la imagen
                            height: 520, // Aumenta el tamaño de la imagen
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit:
                                    BoxFit
                                        .cover, // Ajuste para mejor visualización
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            genreName,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),

            // Botón Guardar
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    ),
                  );
                },
                child: Text(
                  "Guardar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            // Botón Atrás
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                "ATRÁS",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

//V-13
/*class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono de candado
              Image.asset(
                'assets/Logo.png', // Asegúrate de tener esta imagen en tu carpeta assets
                width: 120,
                height: 120,
              ),
              SizedBox(height: 20),

              // Título
              Text(
                "CREA UNA CONTRASEÑA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              // Descripción
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Crea una contraseña que tenga al menos 6 letras o números. Debe ser algo difícil",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              // Campo de contraseña
              _buildPasswordField("Contraseña", passwordController),

              SizedBox(height: 15),

              // Campo de verificar contraseña
              _buildPasswordField(
                "Verificar contraseña",
                confirmPasswordController,
              ),

              SizedBox(height: 20),

              // Botón siguiente
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: () {
                    if (passwordController.text.length >= 6 &&
                        passwordController.text ==
                            confirmPasswordController.text) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ), // Reemplazar con la siguiente pantalla
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Las contraseñas no coinciden o son muy cortas.",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Siguiente",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Botón atrás
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "ATRÁS",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir los campos de contraseña
  Widget _buildPasswordField(String hint, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white70,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    );
  }
}

// V-F*/

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String? errorMessage;

  // 🔹 Método para iniciar sesión con Firebase
  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Si el inicio de sesión es exitoso, navega a la pantalla principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Tabbar(userName: userNameController.text.trim())),
      );
    } catch (e) {
      setState(() {
        errorMessage = "ERROR: Usuario o contraseña incorrectos.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGradientBackground(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('assets/assets/Logo.png', width: 150),
              Image.asset('assets/Logo.png', width: 150),
              SizedBox(height: 20),
              Text(
                "BIENVENIDO A MAGUSBOOK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Correo electrónico", emailController, false),
              SizedBox(height: 20),
              _buildTextField("Contraseña", passwordController, true),
              SizedBox(height: 10),

              // Muestra el mensaje de error si existe
              if (errorMessage != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),

              SizedBox(height: 20),
              _buildLoginButton(),

              SizedBox(
                height: 10,
              ),
              _buildTextButton("¿Olvidaste tu contraseña?", () {
                String email = emailController.text.trim();

                if (email.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Por favor, ingresa tu correo electrónico."),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationCodeScreen(email: email),
                    ),
                  );
                }
              }),

              _buildTextButton("Crear cuenta", () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationInfoScreen()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Widget para los campos de texto
  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Container(
      height: 40,
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white24,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // 🔹 Widget para el botón de inicio de sesión
  Widget _buildLoginButton() {
    return Container(
      height: 40,
      width: 300,
      child: ElevatedButton(
        onPressed: signIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Iniciar sesión",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 🔹 Widget para los textos de "¿Olvidaste tu contraseña?" y "Crear cuenta"
  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
