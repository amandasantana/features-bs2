#language: pt
#encoding UTF-8


Funcionalidade: Tela Bem-vindo
   Como usuário do mobile banking bs2
   Quero visualizar meus dados de conta bancária
   Para começar a utilizar as funcionalidades do aplicativo

Fundo: 
	Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada
    E todos os campos da tela "Criar perfil" forem preenchidos com dados válidos
    E a opcao "Continuar" for selecionada
    Então o usuário é direcionado para tela "Vamos lá" e servico XXXX envia um SMS
    Quando for inserido o token recebido por SMS
    Então o usuário é direcionado para tela "Olá"
    Quando for inserido um CPF válido
    E a opcao "Continuar" for selecionada
    Então usuário é direcionado para tela "Enviar foto do documento"
    Quando o usuário seleciona o tipo do documento
    E o usuário permite acesso à câmera nativa do aparelho
    Quando o usuário envia a foto desse documento
    E a opcao "Continuar" for selecionada
    Então o usuário é direcionado para tela "Informativo Quiz"
    Quando a opção "Ok, entendi!" for selecionada
    E o usuário responde as perguntas do Quiz corretamente
    Quando a opção "Continuar" for selecionada
    E o usuário selecionar a opção "Dados corretos"
    Quando marcar o checkbox na tela "Termos de Aceite"
    E o processo de abertura de conta corrente ser finalizado com sucesso

Cenário: Informações da tela Bem-vindo.
    Dado que o usuário está na tela "Bem-vindo" e o serviço GET/propostas/contacorrente/termoaceite foi carregado com sucesso
    Então o usuário visualiza as informações de sua conta bancária recém-aberta "Bem-vindo. Agora você é BS2! Você tem um verdadeiro hub de serviços financeiros na palma da sua mão. 
        Para aproveitar tudo o que sua conta oferece, você pode fazer uma transferência usando esses dados:
        Banco: 000
        Agência: 0000-00
        Conta Corrente: 999999-9"
    E o botão "Começar"
    
Cenário: Botão Começar
    Dado que o usuário está na tela "Bem-vindo" e o serviço GET/propostas/contacorrente/termoaceite foi carregado com sucesso
    Então o usuário visualiza as informações de sua conta bancária recém-aberta
    E seleciona o botão "Começar"
    E o serviço ?? é carregado e direciona o usuário para a tela Home

@erroGenerico
Cenário: Erro genérico ao chamar o serviço ??
    Dado que o usuário está na tela "Bem-vindo" e o serviço GET/propostas/contacorrente/termoaceite foi carregado com sucesso
    Então o usuário visualiza as informações de sua conta bancária recém-aberta
    E seleciona o botão "Começar"
    Quando o serviço ?? retornar erro, um modal deve ser exibido: "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
    E for selecionado o botão "Voltar", o aplicativo deve direcionar o usuário para a tela de login