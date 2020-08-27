class State {
  String sigla;
  String nome;
  List<String> cidades;

  State({this.sigla, this.nome, this.cidades});

  State.fromJson(Map<String, dynamic> json) {
    sigla = json['sigla'];
    nome = json['nome'];
    cidades = json['cidades'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sigla'] = this.sigla;
    data['nome'] = this.nome;
    data['cidades'] = this.cidades;
    return data;
  }
}