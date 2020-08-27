import 'package:dropdown_cidades/app/widgets/dropdown_cidades.widgwt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdonw cidades example'),
      ),
      body: Center(
        child: SizedBox(
          child: DropdownCidades(
            onChangedCity: (value) {
              print('A cidade selecionada é: $value');
            },
            onChangedState: (value) {
              print('O Estado selecionada é: $value');
            },
          ),
        ),
      ),
    );
  }
}
