import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 246, 244, 235);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: TelaPrincipal.routeName,
      routes: {
        TelaPrincipal.routeName: (context) => const TelaPrincipal(),
        TelaDaCor.routeName: (context) => const TelaDaCor(),
      },
    );
  }
}

class Cor {
  const Cor(this.cor, this.nomeDaCor);

  final Color cor;
  final String nomeDaCor;
}

class TelaPrincipal extends StatelessWidget {
  static const routeName = '/';

  const TelaPrincipal({super.key});

  final cores = const [
    Cor(Colors.red, "Vermelho"),
    Cor(Colors.green, "Verde"),
    Cor(Colors.blue, "Azul"),
    Cor(Colors.purple, "Roxo"),
    Cor(Colors.orange, "Laranja")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha uma cor')),
      body: ListView.builder(
        itemCount: cores.length,
        itemBuilder: (context, i) {
          final item = cores[i];
          return WidgetCor(item.cor, item.nomeDaCor);
        },
      ),
    );
  }
}

class TelaDaCor extends StatelessWidget {
  static const routeName = '/cor';

  const TelaDaCor({super.key});

  // final Color cor;
  // final String nomeDaCor;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cor;
    return Scaffold(
      appBar: AppBar(title: Text(args.nomeDaCor)),
      body: Container(
        color: args.cor,
      ),
    );
  }
}

class WidgetCor extends StatelessWidget {
  const WidgetCor(this.cor, this.nomeDaCor, {super.key});

  final Color cor;
  final String nomeDaCor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(TelaDaCor.routeName, arguments: Cor(cor, nomeDaCor));
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: cor,
        child: Center(
          child: Text(nomeDaCor),
        ),
      ),
    );
  }
}
