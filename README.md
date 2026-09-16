# S&M Hotel

## Como rodar

É preciso ter o Flutter, o Android SDK e o Node.js instalados. Abra o projeto no VS Code e inicie um emulador Android.

No terminal, dentro da pasta do projeto, rode a API:

```cmd
cd api
npm install
npm start
```

Deixe esse terminal aberto. Abra outro terminal na pasta principal do projeto e rode:

```cmd
flutter pub get
flutter run
```

Na tela inicial, clique em **Cadastrar usuario**. Depois do cadastro, entre com o e-mail e a senha que você criou.

### Para rodar no celular

Conecte o celular por USB, ative a depuração USB e deixe o celular e o computador na mesma rede Wi-Fi.

No CMD, use `ipconfig` para ver o IPv4 do computador. Depois, na pasta do projeto, execute:

```cmd
flutter run --dart-define=API_URL=http://IP_DO_COMPUTADOR:3000
```

Troque `IP_DO_COMPUTADOR` pelo IPv4 encontrado. A API precisa continuar aberta e a porta 3000 deve estar liberada no firewall para a rede local.
