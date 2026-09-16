import 'package:flutter/material.dart';
import 'destino.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('S&M Hotel')),
      body: ListView(
        children: const [
          Destino('Angra dos Reis', 'imagens/angra.jpg', 384, 70),
          Destino('Jericoacoara', 'imagens/jeri.jpg', 571, 75),
          Destino('Arraial do Cabo', 'imagens/arraial.jpg', 534, 65),
          Destino('Florianópolis', 'imagens/flori.jpg', 348, 85),
          Destino('Madri', 'imagens/madri.jpg', 401, 85),
          Destino('Paris', 'imagens/paris.jpg', 546, 95),
          Destino('Orlando', 'imagens/orlando.jpg', 616, 105),
          Destino('Las Vegas', 'imagens/lasvegas.jpg', 504, 110),
          Destino('Roma', 'imagens/roma.jpg', 478, 85),
          Destino('Chile', 'imagens/chile.jpg', 446, 95),
        ],
      ),
    );
  }
}
