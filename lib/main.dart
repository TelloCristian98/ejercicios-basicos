import 'package:ejercicios_basicos/Pages/Exercise2.dart';
import 'package:flutter/material.dart';
import 'Pages/InputFormPage.dart';
import 'Pages/CaculadoraViaje.dart'; // Importa tu clase CalculadoraViaje

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios Basicos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios Basicos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Created by:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Cristian Tello',
              style: TextStyle(fontSize: 14.0),
            ),
            const Text(
              'Camila Morales',
              style: TextStyle(fontSize: 14.0),
            ),
            const Text(
              'Mateo Barriga',
              style: TextStyle(fontSize: 14.0),
            ),
            const Spacer(), 
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputFormPage()),
                      );
                    },
                    child: const Text('La Langosta Ahumada'),
                  ),
                  const SizedBox(height: 20), // Space between the buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Exercise2()),
                      );
                    },
                    child: const Text('Calculadora de Uva'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalculadoraViaje()),
                      );
                    },
                    child: const Text('Calculadora de Viaje'),
                  ),
                ],
              )
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
