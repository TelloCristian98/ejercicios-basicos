import 'package:flutter/material.dart';
import 'Pages/InputFormPage.dart';

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
            const Spacer(), // Add a spacer to push the button to the center
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputFormPage()),
                  );
                },
                child: const Text('La Langosta Ahumada'),
              ),
            ),
            const Spacer(), // Add a spacer to push the button to the center
          ],
        ),
      ),
    );
  }
}
