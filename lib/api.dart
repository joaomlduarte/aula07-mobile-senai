import 'dart:convert';
import 'package:http/http.dart' as http;

// No emulador Android, 10.0.2.2 representa o computador que executa a API.
const apiUrl = String.fromEnvironment(
  'API_URL',
  defaultValue: 'http://10.0.2.2:3000',
);

Future<bool> entrar(String email, String senha) async {
  final url = Uri.parse('$apiUrl/usuario').replace(
    queryParameters: {'email': email, 'senha': senha},
  );
  final resposta = await http.get(url).timeout(const Duration(seconds: 10));
  if (resposta.statusCode != 200) {
    throw Exception('Nao foi possivel consultar os usuarios.');
  }
  return (jsonDecode(resposta.body) as List).isNotEmpty;
}

Future<bool> cadastrar(String nome, String email, String senha) async {
  final resposta = await http
      .post(
        Uri.parse('$apiUrl/cadastro-usuario'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nome': nome, 'email': email, 'senha': senha}),
      )
      .timeout(const Duration(seconds: 10));
  return resposta.statusCode == 201;
}
