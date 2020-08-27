import 'package:dropdown_cidades/app/model/state.model.dart';

class Country {
  List<State> estados;

  Country({this.estados});

  Country.fromJson(Map<String, dynamic> json) {
    if (json['estados'] != null) {
      estados = new List<State>();
      json['estados'].forEach((v) {
        estados.add(new State.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.estados != null) {
      data['estados'] = this.estados.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

