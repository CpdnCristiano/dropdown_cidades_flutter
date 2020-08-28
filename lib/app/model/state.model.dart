// Classe que representa os estados
class State {
  // Ex: SP
  String sigla;

  // ex: São paulo
  String nome;

  // lista de cidades pertecente ao estado
  List<String> cidades;

  //contrutor
  State({this.sigla, this.nome, this.cidades});

  // contrutor de estado apatir de um json
  State.fromJson(Map<String, dynamic> json) {
    sigla = json['sigla'];
    nome = json['nome'];
    cidades = json['cidades'].cast<String>();
  }
}
