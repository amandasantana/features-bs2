#language: pt
#encoding UTF-8


Funcionalidade: Tela Bem-vindo
   Como usuário do mobile banking bs2
   Quero que o processo de abertura de conta seja concluído
   Para utilizar as funcionalidades disponíveis de cliente BS2

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

Cenário: Fluxo de sucesso na abertura de conta corrente
    Dado que o usuário está na tela "Aguarde, estamos quase terminando." e a chamada do serviço /propostas/contacorrente/conclusao retornou sucesso em menos de 1 minuto
    E retornou as informações de Banco, Agência e Conta Corrente
    Então a apliacação direciona o usuário para a tela "Bem-vindo"

Cenário: Fluxo de não retorno das informações Banco, Agência e Conta Corrente
    Dado que o usuário está na tela "Aguarde, estamos quase terminando." e a chamada do serviço /propostas/contacorrente/conclusao retornou sucesso em menos de 1 minuto
    E não retornou as informações de Banco, Agência e Conta Corrente
    Então a apliacação direciona o usuário para a tela "Estamos analisando sua solicitação"    

Cenário: Fluxo de Estamos analisando sua solicitação
    Dado que o usuário está na tela "Aguarde, estamos quase terminando." e a chamada do serviço /propostas/contacorrente/conclusao demorou mais de 1 minuto
    Então a apliacação direciona o usuário para a tela "Estamos analisando sua solicitação"

@erroGenerico
Cenário: Erro genérico ao chamar o serviço /propostas/contacorrente/conclusao
    Dado que o usuário está na tela "Aguarde, estamos quase terminando." e a chamada do serviço /propostas/contacorrente/conclusao falhou
    Então um modal deve ser exibido: "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
    E ao selecionr o botão "Voltar", o aplicativo deve direcionar o usuário para a mesma tela "Aguarde, estamos quase terminando." e realizar uma nova chamada ao serviço /propostas/contacorrente/conclusao