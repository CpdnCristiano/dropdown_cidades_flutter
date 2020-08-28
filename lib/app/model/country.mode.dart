import 'package:dropdown_cidades/app/model/state.model.dart';

// O pais bo caso o brasil
class Country {
  // A lista de estados do pais
  List<State> estados;

  // construtor
  Country({this.estados});

  // Construtor de pais apartir do json
  Country.fromJson(Map<String, dynamic> json) {
    if (json['estados'] != null) {
      estados = new List<State>();
      json['estados'].forEach((v) {
        estados.add(new State.fromJson(v));
      });
    }
  }
}
