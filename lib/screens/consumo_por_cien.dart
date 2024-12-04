import 'package:flutter/material.dart';

class ConsumoPorCienScreen extends StatefulWidget {
  @override
  _ConsumoPorCienScreenState createState() => _ConsumoPorCienScreenState();
}

class _ConsumoPorCienScreenState extends State<ConsumoPorCienScreen> {
  final TextEditingController kmController = TextEditingController();
  final TextEditingController precioGasolinaController = TextEditingController();
  final TextEditingController dineroGastadoController = TextEditingController();

  String resultado = "";

  void calcular() {
    double km = double.parse(kmController.text);
    double precioGasolina = double.parse(precioGasolinaController.text);
    double dineroGastado = double.parse(dineroGastadoController.text);

    double litrosGastados = dineroGastado / precioGasolina;
    double litrosPorCienKm = (litrosGastados / km) * 100;
    double pelasPorCienKm = litrosPorCienKm * precioGasolina;

    setState(() {
      resultado = '''
        Consumo por 100 km:
        - Litros: ${litrosPorCienKm.toStringAsFixed(2)}
        - Pesetas: ${pelasPorCienKm.toStringAsFixed(2)}
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo por 100 Km')),
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
              controller: precioGasolinaController,
              decoration: InputDecoration(labelText: 'Precio por litro de gasolina'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dineroGastadoController,
              decoration: InputDecoration(labelText: 'Dinero gastado en gasolina'),
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
