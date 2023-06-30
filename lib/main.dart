import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conta Bancária',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[700]!),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(title: 'Conta Bancária'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController depositarController = TextEditingController();
  TextEditingController sacarController = TextEditingController();
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
          const Card(
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
                        '\$ 95.000,00',
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
                children: [
                  buildCard(true),
                  buildCard(false),
                  buildCard(true),
                  buildCard(false),
                  buildCard(true),
                  buildCard(false),
                  buildCard(true),
                ],
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
          ],
        );
      },
    );
  }

  buildCard(bool colored) {
    return Container(
      color: colored ? Colors.grey[100] : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Compra 1',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              Text(
                '+ \$ 4.000,00',
                style: TextStyle(
                  color: Colors.black87,
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
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              Text(
                'Saque',
                style: TextStyle(
                  color: Colors.black87,
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
