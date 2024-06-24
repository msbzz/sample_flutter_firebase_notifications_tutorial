# sample_flutter_firebase_notifications

Este projeto é um aplicativo Flutter que utiliza Firebase para implementar notificações push e autenticação de usuários. O aplicativo é estruturado de forma a separar os serviços de controle (controladores) e as visualizações (views). Os principais componentes do projeto incluem:

1. **Autenticação de Usuários**: Utilizando Firebase Authentication para criar novas contas, fazer login e logout.
2. **Notificações Push**: Integração com Firebase Messaging para receber e exibir notificações, tanto em primeiro plano quanto em segundo plano.
3. **Firestore**: Salvamento de tokens FCM dos usuários no Firestore para gestão de notificações.
4. **Gerenciamento de Estado**: Navegação entre diferentes telas (login, cadastro, home, etc.) com base no estado de autenticação do usuário.
5. **Configurações Sensíveis**: Uso do pacote `flutter_dotenv` para gerenciar configurações sensíveis e variáveis de ambiente.


obs: esse projeto foi totalmente desenvolvido acompanhando a video aula no YOUTUBE do canal `Snehasis Ghosh` onde foi adaptado apenas o arquivo de configurações de variaveis de ambiente 

`Flutter Firebase Push Notifications Tutorial | 2024`

https://www.youtube.com/watch?v=JwFiALyfD-0

## Estrutura do Projeto

- **assets/.env**: Arquivo contendo variáveis de ambiente sensíveis.
- **lib/controllers**: Diretório contendo serviços de autenticação (`auth_service.dart`), CRUD (`crud_service.dart`), e notificações (`notification_service.dart`).
- **lib/views**: Diretório contendo as diferentes telas do aplicativo (`home_page.dart`, `login_page.dart`, `signup_page.dart`, etc.).
- **lib/main.dart**: Ponto de entrada principal do aplicativo, configuração do Firebase, inicialização de notificações e rotas.
- **lib/firebase_options.dart**: Configurações do Firebase separadas por plataforma (Android, iOS, web).

  
- **assets/.env**: Arquivo contendo variáveis de ambiente sensíveis.
- **lib/controllers**:
  - **auth_service.dart**: Serviço de autenticação utilizando Firebase Authentication.
  - **crud_service.dart**: Serviço CRUD para salvar tokens de usuário no Firestore.
  - **notification_service.dart**: Serviço para gerenciar notificações push com Firebase Messaging e Flutter Local Notifications.
- **lib/views**:
  - **home_page.dart**: Tela principal do aplicativo.
  - **login_page.dart**: Tela de login.
  - **signup_page.dart**: Tela de cadastro.
  - **message.dart**: Tela para exibir mensagens recebidas.
- **lib/main.dart**: Ponto de entrada do aplicativo, configuração do Firebase, inicialização de notificações e definição de rotas.
- **lib/firebase_options.dart**: Configurações do Firebase para diferentes plataformas.

## Funcionalidades

- **Autenticação de Usuários**: Criação de contas, login e logout utilizando Firebase Authentication.
- **Notificações Push**: Recebimento e exibição de notificações push em segundo plano e em primeiro plano utilizando Firebase Messaging e Flutter Local Notifications.
- **Firestore**: Salvamento de tokens FCM dos usuários no Firestore para gestão de notificações.


### Configuração do Firebase

1. Vá para o [Firebase Console](https://console.firebase.google.com/).
2. Crie um novo projeto ou use um projeto existente.
3. Adicione um novo aplicativo Android/iOS ao seu projeto Firebase.
4. Siga as instruções para baixar o arquivo `google-services.json` (para Android) ou `GoogleService-Info.plist` (para iOS) e coloque-o na pasta adequada (`android/app` ou `ios/Runner`).

### Configurando a Pasta `assets`

Habilitar a pasta `assets` é crucial para armazenar arquivos estáticos e sensíveis, como imagens, arquivos JSON, e o arquivo `.env`. Para habilitar a pasta, certifique-se de ter a seguinte estrutura:

```plaintext
sample_flutter_firebase_notifications/
│
├── assets/
│      └── .env
```

### Criando o Arquivo `.env`

O arquivo `.env` é usado para armazenar informações sensíveis do projeto, como chaves de API e IDs do Firebase. Crie o arquivo `.env` dentro da pasta `assets/` e adicione suas credenciais da seguinte forma:

```plaintext
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket
FIREBASE_MESSAGING_SENDER_ID=your_firebase_messaging_sender_id
FIREBASE_APP_ID=your_firebase_app_id
FIREBASE_MEASUREMENT_ID=your_firebase_measurement_id
```

### Atualizando o `pubspec.yaml`

Certifique-se de que o arquivo `pubspec.yaml` inclua a referência à pasta `assets`:

```yaml
flutter:
  assets:
    - assets/.env
```


## Configuração


1. Clone o repositório:
    ´´´bash
    git clone <URL_DO_REPOSITORIO>
    cd sample_flutter_firebase_notifications
    ´´´

2. Instale as dependências:
    ```bash
    flutter pub get
    ```

3. Configure as variáveis de ambiente no arquivo `assets/.env` com as informações do seu projeto Firebase.

4. Execute o aplicativo:
    ```bash
    flutter run
    ```
## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.