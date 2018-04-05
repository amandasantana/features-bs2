#language: pt
#encoding UTF-8


Funcionalidade: Passo 4 de 5: Dados corretos e incorretos
   Como usuário do mobile banking bs2
   Quero validar meus dados
   Para continuar o fluxo de abertura de conta corrente

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

###Especificação dos campos###

#Nome completo: 60 caracteres
#teclado: alfanumérico
#obrigatório

#Filiação: 60 caracteres
#teclado: alfanumérico
#obrigatório

#Nascimento: Campo data (8 caracteres)
#teclado: numérico
#obrigatório

#Número do documento: 25 caracteres
#teclado: alfanumérico
#obrigatório

#País que nasceu: Não mapeado (considerando o campo Nacionalidade que foi mapeado: 20 caracteres)
#teclado: alfanumérico
#obrigatório

#Estado que nasceu: Não mapeado
#teclado: alfanumérico
#obrigatório

#Cidade que nasceu: 20 caracteres
#teclado: alfanumérico
#obrigatório

###Fim da especificação dos campos###

Cenário: Botão Dados corretos
    Dado que o usuário está na tela de suas informações
    Quando o usuário seleciona o botão "Dados corretos" e o serviço GET/propostas/contacorrente/termoaceite é chamado
    Então o usuário é direcionado para a tela de "Termo de Aceite"

Cenário: Não edição dos campos
    Dado que o usuário está na tela de suas informações
    Quando usuário tenta editar algum campo
    Então o aplicativo não deve permitir a edição

Cenário: Botão Dados incorretos
    Dado que o usuario está na tela de informações do usuário  
    Quando o usuário seleciona o botão "Dados incorretos"
    Então os botões da tela serão substituídos por "Cancelar" e "Enviar para análise"
    E todos os campos ficam editáveis

    Cenário: "Enviar para análise"
    	Dado que o usuário está na tela de alteração de dados 
	    Quando realizar a alteração nos campos desejados
	    E a opção "Enviar para análise" for selecionada
	    Então o usuário deve ser direcionado para tela "Estamos analisando sua solicitação Em breve mandaremos uma resposta."

	Cenário: Botão "Cancelar"  
    	Dado que o usuario está na tela de informações do usuário  
	    Quando ele selecionar o botão "Dados incorretos"
	    Então os botões da tela serão substituídos por "Cancelar" e "Enviar para análise"
	    E todos os campos ficam editáveis
	    Quando selecionar o botão "Cancelar"
	    Então usuário visualiza novamente a tela de informações com os botões "Dados incorretos" e "Dados corretos"
	    E todos os campos não ficam editáveis

    @erroGenerico
    Cenário: Erro genérico 
		Dado que o usuário está na tela de alteração de dados 
	    Quando realizar a alteração nos campos desejados
	    E a opção "Enviar para análise" for selecionada
		E o serviço retornar  erro genérico (verificar código)
		Então o usuário deve visualizar uma modal com a mensagem "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
		E a opção "Voltar"
		#OBS: Conferir o codigo de erro genérico
		Cenário: Usuário selecionar a opção "Voltar" no modal de erro genérico
			Dado que estou na modal de erro genérico
			Quando selecionar a opção "Voltar"
			Então o usuário é direcionado para tela de alteração de dados cadastrais

Cenário: Envio de Push e resposta positiva
    Dado que o usuário visualiza a tela "Estamos analisando sua solicitação Em breve mandaremos uma resposta."
    Quando a solicitação for atendida, um push deve ser enviado ao device do usuário, alertando a resposta positiva do processo
    Então quando o usuário tocar no push, o aplicativo deve carregar os serviços XX, YY
    E ser aberto na tela de "Dados corretos ou incorretos"  

Cenário: Envio de Push e resposta negativa
    Dado que o usuário visualiza a tela "Estamos analisando sua solicitação Em breve mandaremos uma resposta."
    Quando a solicitação for atendida, um push deve ser enviado ao device do usuário, alertando a resposta negativa do processo
    Então quando o usuário tocar no push, o aplicativo deve carregar os serviços XX, YY, ZZ 
    E ser aberto na tela de "Impossibilidade de abertura de conta"

Cenário: Botão Fechar dentro da tela "Impossibilidade de abertura de conta"
    Dado que o usuário está na tela de "Impossibilidade de abertura de conta"
    Quando ele selecionar o botão "Fechar"
    Então usuário deve ser deslogado e direcionado à tela de "Login"