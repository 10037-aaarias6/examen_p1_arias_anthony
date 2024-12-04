import 'package:flutter/material.dart';
import 'screens/consumo_por_cien.dart';
import 'screens/consumo_por_kilometro.dart';
import 'screens/velocidad_media.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/consumo_por_cien': (context) => ConsumoPorCienScreen(),
        '/consumo_por_kilometro': (context) => ConsumoPorKilometroScreen(),
        '/velocidad_media': (context) => VelocidadMediaScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exámen Parcial I - Anthony Arias'),
        backgroundColor: Colors.blueAccent, // Cambié el color de la AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[100]!, Colors.white], // Gradiente de color de fondo
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Seleccione una opción de cálculo:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Card(
                  elevation: 8.0, // Da un efecto de sombra
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.local_gas_station, color: Colors.blueAccent),
                    title: Text(
                      'Consumo por 100 Km',
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/consumo_por_cien');
                    },
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.directions_car, color: Colors.blueAccent),
                    title: Text(
                      'Consumo por Km',
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/consumo_por_kilometro');
                    },
                  ),
                ),
                Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.speed, color: Colors.blueAccent),
                    title: Text(
                      'Velocidad Media',
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/velocidad_media');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
