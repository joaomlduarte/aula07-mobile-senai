import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinho.dart';
import 'checkout.dart';

class Destino extends StatefulWidget {
  final String nome;
  final String img;
  final int valord;
  final int valorp;

  const Destino(this.nome, this.img, this.valord, this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_diarias = 0;
  int acompanhantes = 0;
  int total = 0;

  void dias() {
    setState(() => n_diarias++);
  }

  // O nome n_pessoas foi reservado para a funcao pedida na aula.
  void n_pessoas() {
    setState(() => acompanhantes++);
  }

  void calctotal() {
    final carrinho = context.read<Carrinho>();
    carrinho.calcular(
        widget.nome, n_diarias, acompanhantes, widget.valord, widget.valorp);
    setState(() {
      total =
          carrinho.itens.firstWhere((item) => item.nome == widget.nome).total;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Checkout()));
  }

  void limpar() {
    setState(() {
      n_diarias = 0;
      acompanhantes = 0;
      total = 0;
    });
    context.read<Carrinho>().limpar(widget.nome);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(widget.nome, style: const TextStyle(fontSize: 30)),
          Text('Diaria: ${dinheiro(widget.valord)}'),
          Text('Por pessoa: ${dinheiro(widget.valorp)}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Diarias: $n_diarias'),
              IconButton(
                  onPressed: dias,
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar diaria'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Acompanhantes: $acompanhantes'),
              IconButton(
                  onPressed: n_pessoas,
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar acompanhante'),
            ],
          ),
          Text('Total: ${dinheiro(total)}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: calctotal, child: const Text('Calcular')),
              ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
            ],
          ),
        ],
      ),
    );
  }
}
