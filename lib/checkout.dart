import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinho.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<Carrinho>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Resumo da viagem', style: TextStyle(fontSize: 24)),
          for (final item in carrinho.itens)
            ListTile(
              title: Text(item.nome),
              subtitle: Text(
                  '${item.n_diarias} diaria(s) x ${dinheiro(item.valord)}\n'
                  '${item.n_pessoas} acompanhante(s) x ${dinheiro(item.valorp)}'),
              trailing: Text(dinheiro(item.total)),
              isThreeLine: true,
            ),
          const Divider(),
          const Text('Forma de pagamento'),
          DropdownButton<String>(
            value: carrinho.pagamento,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: 'Cartao', child: Text('Cartao')),
              DropdownMenuItem(
                  value: 'Pix', child: Text('Pix - 10% de desconto')),
            ],
            onChanged: (valor) {
              if (valor != null) carrinho.escolherPagamento(valor);
            },
          ),
          Text('Subtotal: ${dinheiro(carrinho.total)}'),
          Text('Desconto: ${dinheiro(carrinho.desconto)}'),
          const SizedBox(height: 12),
          Text('Total a pagar: ${dinheiro(carrinho.totalPagar)}',
              style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
