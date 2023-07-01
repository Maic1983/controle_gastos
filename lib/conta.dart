import 'package:conta_bancaria/trasacao.dart';

class Conta {
  double _saldo = 0;
  List<Transacao> _transacao = [];

  List<Transacao> get getTransacao => this._transacao;

  set setTransacao(List<Transacao> transacao) => this._transacao = transacao;

  double get getSaldo => this._saldo;

  set setSaldo(double saldo) => this._saldo = saldo;
}
