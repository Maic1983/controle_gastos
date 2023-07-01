class Transacao {
  late double _valor;
  late String _menssagem;
  late String _tipoTransacao;

  double get getValor => this._valor;

  set setValor(double valor) => this._valor = valor;

  String get getMenssagem => this._menssagem;

  set stMenssagem(String menssagem) => this._menssagem = menssagem;

  String get getTipoTransacao => this._tipoTransacao;

  set setTipoTransacao(String tipoTransacao) =>
      this._tipoTransacao = tipoTransacao;
}
