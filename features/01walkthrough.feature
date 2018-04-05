#language:pt
#encoding:UTF-8

Funcionalidade: Verificar telas de Walkthrough
    Como usuário do aplicativo BS2
    Quero verificar as 2 telas de Walkthrough no primeiro acesso ao aplicativo
    Para ler informações do BS2

Cenario: Verificar a Primeira Tela de Walkthrough
    Dado que o aplicativo foi inicializado pela primeira vez
    Quando passo pela tela Splash
    E chego na primeira tela de Walkthrough
    Entao visualizo um texto informativo estático nessa tela

Cenario: Passar para a segunda tela de Walkthrough via touch na tela
    Dado que estou na primeira tela de Walkthrough
    Quando toco na tela
    Então a aplicação exibe a segunda tela de Walkthrough

Cenario: Passar para a segunda tela de Walkthrough via slide na tela
    Dado que estou na primeira tela de Walkthrough
    Quando deslizo o dedo na tela da direita para a esquerda
    Então a aplicação exibe a segunda tela de Walkthrough

Cenario: Verificar a Segunda Tela de Walkthrough
    Dado que estou na primeira tela de Walkthrough
    Quando passo para a segunda tela de Walkthrough
    Entao visualizo um texto informativo estático nessa tela
    E visualizo os botões "Abrir conta" e "Já tenho cadastro"

Cenario: Clicar em "Abrir conta" na segunda tela de Walkthrough
    Dado que estou na segunda tela de Walkthrough
    Quando clico em "Abrir conta"
    Então a aplicação direciona para a tela de "Criar Perfil"

Cenario: Clicar em "Já tenho cadastro" na segunda tela de Walkthrough
    Dado que estou na segunda tela de Walkthrough
    Quando clico em "Já tenho cadastro"
    Então a aplicação direciona para a tela de "Login"
   