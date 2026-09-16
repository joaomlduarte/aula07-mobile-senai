import 'package:flutter/material.dart';

class ItemViagem {
  final String nome;
  final int n_diarias;
  final int n_pessoas;
  final int valord;
  final int valorp;

  ItemViagem(
      this.nome, this.n_diarias, this.n_pessoas, this.valord, this.valorp);

  // Formula da aula: o valor por pessoa nao e multiplicado pelas diarias.
  int get total => (n_diarias * valord) + (n_pessoas * valorp);
}

class Carrinho extends ChangeNotifier {
  final List<ItemViagem> itens = [];
  String pagamento = 'Cartao';

  int get total => itens.fold(0, (soma, item) => soma + item.total);
  double get desconto => pagamento == 'Pix' ? total * 0.10 : 0;
  double get totalPagar => total - desconto;

  void calcular(String nome, int diarias, int pessoas, int valord, int valorp) {
    final item = ItemViagem(nome, diarias, pessoas, valord, valorp);
    final indice = itens.indexWhere((item) => item.nome == nome);
    if (indice == -1) {
      itens.add(item);
    } else {
      itens[indice] = item;
    }
    notifyListeners();
  }

  void limpar(String nome) {
    itens.removeWhere((item) => item.nome == nome);
    notifyListeners();
  }

  void escolherPagamento(String forma) {
    pagamento = forma;
    notifyListeners();
  }
}

String dinheiro(num valor) =>
    'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
