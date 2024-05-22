import 'package:flutter/material.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  _InputFormPageState createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  final TextEditingController _guestController = TextEditingController();
  double _costPerPerson = 0.0;
  double _totalCost = 0.0;

  void _calculateCost() {
    int guests = int.tryParse(_guestController.text) ?? 0;

    if (guests <= 200) {
      _costPerPerson = 95.0;
    } else if (guests <= 300) {
      _costPerPerson = 85.0;
    } else {
      _costPerPerson = 75.0;
    }

    setState(() {
      _totalCost = _costPerPerson * guests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Cost'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _guestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Guests',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateCost,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Cost per person: \$$_costPerPerson'),
            Text('Total cost: \$$_totalCost'),
          ],
        ),
      ),
    );
  }
}
