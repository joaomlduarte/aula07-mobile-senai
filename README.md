# S&M Hotel

Atividade de Aplicações Mobile do material `_A07 - APM.pdf(2).pdf` (capa: Aula 08). Aplicativo Flutter para calcular o valor de viagens.

## Executar

Requisitos: Flutter, Android SDK, emulador ou celular Android e Node.js com npm.

No CMD, dentro da pasta do projeto, inicie a API:

```cmd
cd api
npm install
npm start
```

Mantenha esse terminal aberto. Em outro CMD, na pasta principal do projeto:

```cmd
flutter pub get
flutter run
```

O endereço padrão da API é `http://10.0.2.2:3000`, para o emulador Android. Para celular físico, conecte o computador e o celular à mesma rede, consulte o IPv4 do computador com `ipconfig` e execute:

```cmd
flutter run --dart-define=API_URL=http://IP_DO_COMPUTADOR:3000
```

Substitua `IP_DO_COMPUTADOR` pelo IPv4 encontrado. O celular precisa conseguir acessar a porta 3000 do computador.

Na primeira execução, toque em **Cadastrar usuario**, preencha o cadastro e depois entre com os dados cadastrados. O banco começa vazio.

## Atividade implementada

- Login: consulta `GET /usuario` no JSON Server.
- Cadastro: `POST /cadastro-usuario`, direcionado à mesma coleção `usuario` pelo arquivo `api/routes.json`.
- `Home` é Stateless e usa Scaffold, AppBar e ListView.
- `Destino` é Stateful e recebe nome, imagem, valor da diária e valor por pessoa no construtor.
- Cada destino tem imagem em Container de 393 x 250, nome, preços e quatro botões: adicionar diária, adicionar acompanhante, calcular e limpar.
- `dias`, `n_pessoas`, `calctotal` e `limpar` são as funções dos botões.
- Provider mantém o carrinho. Calcular inclui ou atualiza o destino e abre o checkout.
- Checkout mostra os itens, subtotal, pagamento por cartão ou Pix, desconto e total a pagar.
- Pix aplica 10% de desconto sobre o total. Volte pela seta para consultar outros destinos.
- Limpar zera os contadores e o total do destino, removendo seu cálculo do carrinho.
- As dez imagens estão na pasta `imagens` e declaradas no `pubspec.yaml`. Créditos e licenças estão em `imagens/fontes.txt`.

## Preços e cálculo

| Destino | Diária | Por pessoa |
| --- | ---: | ---: |
| Angra dos Reis | R$ 384 | R$ 70 |
| Jericoacoara | R$ 571 | R$ 75 |
| Arraial do Cabo | R$ 534 | R$ 65 |
| Florianópolis | R$ 348 | R$ 85 |
| Madri | R$ 401 | R$ 85 |
| Paris | R$ 546 | R$ 95 |
| Orlando | R$ 616 | R$ 105 |
| Las Vegas | R$ 504 | R$ 110 |
| Roma | R$ 478 | R$ 85 |
| Chile | R$ 446 | R$ 95 |

```text
total = (n_diarias * valord) + (n_pessoas * valorp)
```

Contadores, preços e total antes do desconto são inteiros. O desconto e o valor final permitem centavos. O valor por pessoa não é multiplicado pelas diárias, conforme a fórmula do PDF.

O material usa `n_pessoas` para uma função e uma variável. A função tem esse nome no estado de `Destino`; o contador local se chama `acompanhantes`, e `ItemViagem.n_pessoas` armazena o número inteiro usado no cálculo.

Para Arraial do Cabo foi usado R$ 534, conforme a lista de requisitos da página 5; o exemplo de código da página 8 apresenta R$ 571. O exemplo visual do APP Delivery não está no material enviado; o checkout contém o resumo e a escolha de pagamento solicitados, usando os widgets básicos da atividade.

## Conferência

Validação realizada com Flutter 3.47.4 / Dart 3.13.3:

- `flutter pub get --offline`: dependências resolvidas.
- `flutter analyze`: nenhum problema encontrado.
- Três testes temporários de lógica e widgets passaram, cobrindo preços dos dez destinos, fórmula, carrinho, botões, checkout, Pix e limpeza. Não fazem parte dos arquivos da atividade.
- API executada: cadastro retornou 201; login aceitou a senha correta e rejeitou senha incorreta. Os dados temporários foram removidos.
- Os dez arquivos de imagem foram abertos e verificados.

A execução em aparelho/emulador Android e a geração de APK não foram verificadas neste ambiente, que não possui Android SDK.

O JSON Server é a simulação de API pedida na aula. Os cadastros ficam somente em `api/db.local.json`, ignorado pelo Git; o projeto não inclui usuários, senhas ou credenciais de acesso.
