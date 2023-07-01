import 'package:conta_bancaria/trasacao.dart';
import 'package:flutter/material.dart';

import 'conta.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController depositarController = TextEditingController();
  TextEditingController sacarController = TextEditingController();
  var conta = Conta();
  void sacar(double valor) {
    setState(() {
      conta.setSaldo = conta.getSaldo - valor;
      addTransacao(valor, "S");
    });
    Navigator.pop(context);
    sacarController.clear();
  }

  void addTransacao(double valor, String tipo) {
    List<Transacao> listTransacao = [];
    listTransacao.addAll(conta.getTransacao);
    var transacao = Transacao();
    transacao.setValor = valor;
    transacao.stMenssagem = tipo == "S" ? "Saque" : "Deposito";
    transacao.setTipoTransacao = tipo;
    listTransacao.add(transacao);
    conta.setTransacao = listTransacao;
  }

  void depositar(double valor) {
    setState(() {
      conta.setSaldo = conta.getSaldo + valor;
      addTransacao(valor, "D");
    });
    Navigator.pop(context);
    depositarController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 14, 78, 255),
            margin: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Saldo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        conta.getSaldo.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: conta.getTransacao.map((e) => buildCard(e)).toList(),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 14, 78, 255),
                    ),
                    onPressed: () => showTextEditDepositarDialog(),
                    child: const Text(
                      'DEPOSITAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 109, 255),
                    ),
                    onPressed: () => showTextEditSacarDialog(),
                    child: const Text(
                      'SACAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showTextEditDepositarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Depositar"),
          content: const Text("Informe quanto quer depositar:"),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextField(
              controller: depositarController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 109, 255),
              ),
              onPressed: () =>
                  depositar(double.parse(depositarController.text)),
              child: const Text(
                'CONFIRMAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  showTextEditSacarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Sacar"),
          content: const Text("Informe quanto quer sacar"),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextField(
              controller: sacarController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 55, 109, 255),
              ),
              onPressed: () => sacar(double.parse(sacarController.text)),
              child: const Text(
                'CONFIRMAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget buildCard(Transacao transacao) {
    return Container(
      color: transacao.getTipoTransacao == "S"
          ? Colors.red.withAlpha(100)
          : Colors.green.withAlpha(100),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transacao.getMenssagem,
                style: TextStyle(
                  color: transacao.getTipoTransacao == "S"
                      ? Colors.red
                      : Colors.green,
                  fontSize: 16,
                ),
              ),
              Text(
                '+ \$ ${transacao.getValor.toString()}',
                style: TextStyle(
                  color: transacao.getTipoTransacao == "S"
                      ? Colors.red
                      : Colors.green,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '30 de junho',
                style: TextStyle(
                  color: transacao.getTipoTransacao == "S"
                      ? Colors.red
                      : Colors.green,
                  fontSize: 14,
                ),
              ),
              Text(
                transacao.getTipoTransacao == "S" ? 'Saque' : "Deposito",
                style: TextStyle(
                  color: transacao.getTipoTransacao == "S"
                      ? Colors.red
                      : Colors.green,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
