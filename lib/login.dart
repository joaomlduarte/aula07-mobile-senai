import 'package:flutter/material.dart';
import 'api.dart';
import 'cadastro.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final senha = TextEditingController();
  bool carregando = false;

  Future<void> login() async {
    if (email.text.trim().isEmpty || senha.text.isEmpty) {
      aviso('Preencha o e-mail e a senha.');
      return;
    }
    setState(() => carregando = true);
    try {
      final autorizado = await entrar(email.text.trim(), senha.text);
      if (!mounted) return;
      if (autorizado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        aviso('E-mail ou senha incorretos.');
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
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('S&M Hotel - Login')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'E-mail'),
          ),
          TextField(
            controller: senha,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Senha'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: carregando ? null : login,
            child: Text(carregando ? 'Entrando...' : 'Entrar'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Cadastro())),
            child: const Text('Cadastrar usuario'),
          ),
        ],
      ),
    );
  }
}
