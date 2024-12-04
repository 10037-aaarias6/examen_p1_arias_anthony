import 'package:flutter/material.dart';

class VelocidadMediaScreen extends StatefulWidget {
  @override
  _VelocidadMediaScreenState createState() => _VelocidadMediaScreenState();
}

class _VelocidadMediaScreenState extends State<VelocidadMediaScreen> {
  final TextEditingController kmController = TextEditingController();
  final TextEditingController horasController = TextEditingController();
  final TextEditingController minutosController = TextEditingController();

  String resultado = "";

  void calcular() {
    try {
      // Parseamos los valores ingresados
      double km = double.parse(kmController.text);
      int horas = int.parse(horasController.text);
      int minutos = int.parse(minutosController.text);

      // Calculamos el tiempo total en horas (con decimales)
      double tiempoTotalHoras = horas + (minutos / 60);

      if (tiempoTotalHoras > 0) {
        // Velocidad media en km/h
        double velocidadMediaKmH = km / tiempoTotalHoras;
        // Velocidad media en m/s
        double velocidadMediaMS = velocidadMediaKmH * 1000 / 3600;

        setState(() {
          resultado = '''
          Velocidad media:
          - Km/h: ${velocidadMediaKmH.toStringAsFixed(2)}
          - m/s: ${velocidadMediaMS.toStringAsFixed(2)}
          ''';
        });
      } else {
        setState(() {
          resultado = 'El tiempo total debe ser mayor que 0.';
        });
      }
    } catch (e) {
      setState(() {
        resultado = 'Error: Por favor ingresa valores válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Velocidad Media')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: kmController,
              decoration: InputDecoration(labelText: 'Kilómetros recorridos'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: horasController,
              decoration: InputDecoration(labelText: 'Horas empleadas'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: minutosController,
              decoration: InputDecoration(labelText: 'Minutos empleados'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
