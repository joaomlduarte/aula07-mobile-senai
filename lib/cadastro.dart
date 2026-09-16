import 'package:flutter/material.dart';
import 'api.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool carregando = false;

  Future<void> salvar() async {
    if (nome.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        senha.text.isEmpty) {
      aviso('Preencha todos os campos.');
      return;
    }
    setState(() => carregando = true);
    try {
      final salvo =
          await cadastrar(nome.text.trim(), email.text.trim(), senha.text);
      if (!mounted) return;
      if (salvo) {
        Navigator.pop(context);
      } else {
        aviso('Nao foi possivel cadastrar.');
      }
    } catch (erro) {
      if (mounted) aviso('Nao foi possivel conectar ao JSON Server.');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  void aviso(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  @override
  void dispose() {
    nome.dispose();
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de usuario')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
              controller: nome,
              decoration: const InputDecoration(labelText: 'Nome')),
          TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'E-mail')),
          TextField(
              controller: senha,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: carregando ? null : salvar,
            child: Text(carregando ? 'Salvando...' : 'Cadastrar'),
          ),
        ],
      ),
    );
  }
}
