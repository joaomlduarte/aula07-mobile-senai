# S&M Hotel

## Como rodar

Instale o Flutter, o Node.js e o **Android Studio 2024.2.1.12 para Windows**, indicado pelo professor (`android-studio-2024.2.1.12-windows.exe`). Na configuração do Android Studio, instale também o Android SDK e o Android Emulator.

Abra o Android Studio e use o **Device Manager** para criar e iniciar um dispositivo virtual. Deixe o emulador aberto e abra a pasta do projeto no VS Code.

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

Se aparecer uma lista de dispositivos, escolha o emulador do Android Studio.

Na tela inicial, clique em **Cadastrar usuario**. Depois do cadastro, entre com o e-mail e a senha que você criou.

### Para rodar no celular

Conecte o celular por USB, ative a depuração USB e deixe o celular e o computador na mesma rede Wi-Fi.

No CMD, use `ipconfig` para ver o IPv4 do computador. Depois, na pasta do projeto, execute:

```cmd
flutter run --dart-define=API_URL=http://IP_DO_COMPUTADOR:3000
```

Troque `IP_DO_COMPUTADOR` pelo IPv4 encontrado. A API precisa continuar aberta e a porta 3000 deve estar liberada no firewall para a rede local.
