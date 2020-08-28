import 'dart:convert';

import 'package:dropdown_cidades/app/model/country.mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownCidades extends StatefulWidget {
  // Call onChanged dropdown city;
  final Function(String) onChangedCity;

  // Call  onChanged dropdown state;
  final Function(String) onChangedState;

  // Width to dropdown state
  final double widthDropdownCity;

  // Width to dropdown state
  final double widthDropdownState;

  @override
  _DropdownCidadesState createState() => _DropdownCidadesState();

  // Widget responsável por mostrar os estados.
  DropdownCidades(
      {this.onChangedCity,
      this.onChangedState,
      this.widthDropdownCity,
      this.widthDropdownState});
}

class _DropdownCidadesState extends State<DropdownCidades> {
  Country _brasil;
  int _estadoSelecionado;
  String _cidadeSelecionada;

  getDados() async {
    String json = await rootBundle
        .loadString('packages/dropdown_cidades/assets/brasil.json');
    _brasil = Country.fromJson(jsonDecode(json));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _brasil == null
            ? Container()
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: widget.widthDropdownState ??
                        MediaQuery.of(context).size.width * (30 / 100),
                    child: DropdownButton(
                      isExpanded: true,
                      value: _estadoSelecionado,
                      hint: Text("Selecione um estado"),
                      onChanged: (int newValue) {
                        setState(() {
                          _estadoSelecionado = newValue;
                          _cidadeSelecionada = null;
                        });
                        widget.onChangedState
                            ?.call(_brasil.estados[_estadoSelecionado].nome);
                      },
                      items: _brasil.estados != null
                          ? List.generate(_brasil.estados.length, (index) {
                              return DropdownMenuItem(
                                  child: Text(_brasil.estados[index].nome),
                                  value: index);
                            })
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (3 / 100),
                  ),
                  SizedBox(
                    width: widget.widthDropdownCity ??
                        MediaQuery.of(context).size.width * (50 / 100),
                    child: DropdownButton(
                      isExpanded: true,
                      value: _cidadeSelecionada,
                      hint: Text("Selecione uma cidade"),
                      elevation: 16,
                      onChanged: (String newValue) {
                        widget.onChangedCity?.call(newValue);
                        setState(() {
                          _cidadeSelecionada = newValue;
                        });
                      },
                      items: _estadoSelecionado != null
                          ? List.generate(
                              _brasil.estados[_estadoSelecionado].cidades
                                  .length, (index) {
                              return DropdownMenuItem(
                                  child: Text(_brasil
                                      .estados[_estadoSelecionado]
                                      .cidades[index]),
                                  value: _brasil.estados[_estadoSelecionado]
                                      .cidades[index]);
                            })
                          : null,
                    ),
                  ),
                ],
                //child:
              ),
      ),
    );
  }
}
