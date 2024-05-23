
import 'package:flutter/material.dart';

//Inicializacion
class Exercise2 extends StatefulWidget {
  const Exercise2 ({super.key});

  @override
  _Exercise2State createState() => _Exercise2State();
}

// logica del programa
class _Exercise2State extends State<Exercise2> {
  final TextEditingController _uvasController = TextEditingController();
  final TextEditingController _costoController = TextEditingController();
  String? _seleccionarTipo;
  double _costotipoA1 = 20;
  double _costotipoA2= 30;
  double _costotipoB1 = 30;
  double _costotipoB2= 50;
  String? _seleccionarTamanio;
  double kiloUva=0.0;
  double costoKilo=0.0;
  double? _resultado;



  void _calculos(){
    if(_seleccionarTamanio==null || _seleccionarTipo==null || _uvasController.text.isEmpty || _uvasController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ingrese todos los campos")),
      );
      return;
    }
    kiloUva=double.tryParse(_uvasController.text)?? 0.0;
    costoKilo=double.tryParse(_costoController.text)?? 0.0;
    double result;
    if(_seleccionarTipo=="A" && _seleccionarTamanio=="1"){
      result=_costotipoA1+kiloUva*costoKilo;
    } else if(_seleccionarTipo=="A" && _seleccionarTamanio=="2"){
      result=_costotipoA2+kiloUva*costoKilo;
    }else if(_seleccionarTipo=="B" && _seleccionarTamanio=="1"){
      result=kiloUva*costoKilo-_costotipoB1;
    }else if(_seleccionarTipo=="B" && _seleccionarTamanio=="2"){
      result=kiloUva*costoKilo-_costotipoB2;}
    else{
      result=0.0;
    }

    setState(() {
      _resultado=result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Calculadora de uvas")),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Seleccionar tipo: "),
              DropdownButton<String>(
                value:_seleccionarTipo,
                items: const [
                  DropdownMenuItem(child: Text("A"), value: "A"),
                  DropdownMenuItem(child: Text("B"),value: "B"),
                ],
                onChanged: (value){
                  setState(() {
                    _seleccionarTipo=value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Seleccionar tamaño: "),
              DropdownButton<String>(
                value: _seleccionarTamanio,
                items:const [
                  DropdownMenuItem(child: Text("1"), value:"1"),
                  DropdownMenuItem(child: Text("2"),value: "2"),
                ],
                onChanged: (value){
                  setState(() {
                    _seleccionarTamanio=value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _uvasController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Ingrese el peso en kg"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _costoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Ingrese costo del kilo"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _calculos, child: const Text("Calcular"),
              ),
              const SizedBox(height: 16),
              if(_resultado!=null)
                Text("El costo total es de: \$${_resultado!.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        )

    );
  }

}