#language:pt
#encoding:UTF-8

Funcionalidade: Verificar tela Criar Perfil
    Como usuário do aplicativo BS2
    Quero preencher a tela de SMS com código válido
    Para continuar o fluxo de abertura de conta corrente

Fundo: 
	Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada
    E todos os campos da tela "Criar perfil" forem preenchidos com dados válidos
    E  opcao "Continuar" for selecionada

Cenário: Preencher o campo SMS com valor incorreto
    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
    Quando ele preencher o campo código com valor diferente daquele enviado
    Então o aplicativo deverá disparar a mensagem em um modal "Código PIN incorreto. Digite novamente o código enviado via SMS."
	E botão "Voltar"
	Então retorna para a tela "Vamos lá" 

Cenário: Preencher o campo SMS com valor válido
    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
    Quando ele preencher o campo SMS com o respectivo número válido 
	Então a aplicação direciona o usuário para a tela de inserção de CPF
	
Cenário: Leitura automática do SMS recebido no Device***(Comportamento exclusivo da plataforma Android)***
    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
    Então um SMS deve ser disparado ao seu número cadastrado anteriormente 
	E a aplicação deve preencher automaticamente o código pelo SMS recebido
	
Cenário: Usuário ter selecionado o botão "Não recebi"
    Dado que o usuário está na tela de SMS 
    E o servico ??? não enviar um código via SMS para o número informado pelo usuário
    Quando o usuário selecionar a opção "Não recebi"
	Então o aplicativo deverá apresentar a mensagem em uma modal "Confirme se esse é o número do seu celular. (XX) XXXXX XXXX" 
	E o botão "Reenviar SMS"
	
Cenário: Usuário editar o campo número do seu celular
    Dado que o usuário está na tela de SMS e o servico ??? não enviar um código via SMS para o número informado pelo usuário
    Quando o usuário selecionar a opção "Não recebi"
	Então o aplicativo deverá disparar a mensagem em um modal "Confirme se esse é o número do seu celular. (XX) XXXXX XXXX" 
    E o botão "Reenviar SMS"
	Então usuário deve conseguir alterar o número de celular dentro do modal
#OBS: Nesse momento deve ser consultado o serviço ???? que identifica se já existe uma proposta  para esse número de 

 	Cenário: Usuário inserir número de celular já cadastrado:
 		Dado que o usuário editou o número na modal de reenviar sms
 		Quando a opção "Reenviar Sms" for selecionada
 		E o serviço XXX devolver que o número já está cadastrado
 		Então o usuário deve visualizar  a mensagem: "Celular inválido. Tente novamente." e botão Voltar #possivelrevisao

 		Cenário: Usuário selecionar a opção "Voltar"
 		Dado que o usuário está na moldal de  número inválido
 		Quando a opção "Voltar" for selecionada
 		Então o usuário é direcionado para modal de reenviar sms, com o campo em branco #possivelrevisao

	
Cenário: Usuário não ter recebido SMS e tocar na opção "Reenviar SMS"
    Dado que o usuário o usuário está na modal "Reenviar SMS"
    E o número para envio do SMS já foi inserido
	Quando o usuário selecionar o botão "Reenviar SMS"
	E o servico ???? de envio de  SMS retornar sucesso
    Então o aplicativo deverá disparar a mensagem em um modal "SMS enviado com sucesso! Verifique se o código chegou."

    Cenário: Usuário selecionar a opção "Voltar"
    Dado que o usúário está na modal de "Sms enviado com sucesso!"
    Quando a opção "Voltar" for selecionada
    Então o usuário é direcionado para tela "Vamos lá" com os campos em branco. 
    #OBS: Nesse caso, ao carregar a tela novamente, não deve ser realizada chamada de serviço no serviço de envio de SMS.
	
Cenário: Usuário não ter digitado SMS 90 segundos
    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
    Quando o usuário não digitar o código do SMS em até 90 segundos
	Então o aplicativo deverá disparar a mensagem em um modal "Opa! Você perdeu o prazo pra digitaro código. Vamos enviar outro, mas fique atento porque ele só é válido por 90 segundos.", juntamente com o botão "Voltar".
	
@erroGenerico
#OBS: Conferir o codigo de erro genérico
Cenário: Ocorreu um erro no serviço de envio ou leitura de SMS
    Dado que o usuário está na tela de SMS 
    E o serviço ??? retornou um erro genérico (verificar código)
	Então o aplicativo deverá disparar a mensagem em um modal "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
	E o botão "Voltar"

	Cenário: Usuário selecionar a opção "Voltar"
 		Dado que o usuário está na moldal de erro genérico
 		Quando a opção "Voltar" for selecionada
 		Então o usuário é direcionado para modal de reenviar sms, com o campo em branco #possivelrevisao
 	#obs: nesse cenário a tela deve ser recarregada ( o serviço de envio de SMS deve ser chamado novamente). 


#Cenário: Reenvio de SMS 5 vezes
#    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
#    Quando o usuário selecionar a opção "Não recebi" mais que 5 vezes
#    Então o aplicativo deverá disparar a mensagem em um modal "Você excedeu o número máximo de tentativas. Por favor, tente novamente mais tarde."
#	Quando o usuário selecionar "Voltar" no modal
#	Então ao ser selecionado, usuário continua na tela de SMS.
#OBS: Conforme conversado não existe no back-end um limite de tentativas, neste caso este cenário não se aplica    

#Cenário: Código do SMS incorreto 5 vezes (Usuário é deslogado)
#    Dado que o usuário está na tela de SMS e o servico ??? enviar um código via SMS para o número informado pelo usuário
#    Quando ele preencher o campo código com valor diferente daquele enviado por mais de 5 vezes
#    Então o aplicativo deverá disparar a mensagem em um modal "Você excedeu o número máximo de tentativas. Tente novamente mais tarde."
#	Quando o usuário selecionar "Voltar" no modal
#	Então o usuário é deslogado.
#OBS: Conforme conversado não existe no back-end um limite de tentativas, neste caso este cenário não se aplica