import 'package:flutter/material.dart';

//Inicializacion
class CalculadoraViaje extends StatefulWidget {
  const CalculadoraViaje({super.key});

  @override
  _CalculadoraViajeState createState() => _CalculadoraViajeState();
}

// Logica del programa
class _CalculadoraViajeState extends State<CalculadoraViaje> {
  final TextEditingController _numStudentsController = TextEditingController();
  String _costoEstudiante = '';
  String _costoTotal = '';

  void _calculateCost() {
    final int numStudents = int.tryParse(_numStudentsController.text) ?? 0;
    double costoEstuidante;
    double costoTotal;

    if (numStudents >= 100) {
      costoEstuidante = 65.0;
      costoTotal = numStudents * costoEstuidante;
    } else if (numStudents >= 50) {
      costoEstuidante = 70.0;
      costoTotal = numStudents * costoEstuidante;
    } else if (numStudents >= 30) {
      costoEstuidante = 95.0;
      costoTotal = numStudents * costoEstuidante;
    } else {
      costoEstuidante = 0.0;
      costoTotal = 4000.0;
    }

    setState(() {
      _costoEstudiante = costoEstuidante > 0 ? '\$${costoEstuidante.toStringAsFixed(2)}' : 'N/A';
      _costoTotal = '\$${costoTotal.toStringAsFixed(2)}';
    });
  }

//Diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Costo del Viaje de Estudios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numStudentsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número de alumnos',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateCost,
              child: Text('Calcular costo'),
            ),
            SizedBox(height: 20),
            Text(
              'Costo por alumno: $_costoEstudiante',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Costo total: $_costoTotal',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
