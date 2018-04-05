# language: pt
# encoding UTF-8

Funcionalidade: Cadastro de CPF
	#Como usuario do aplicativo BS2
	#Quero inserir o número do meu CPF
	#Para iniciar o processo de criação da conta corrente

Fundo: 
    Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada
    E todos os campos da tela "Criar perfil" forem preenchidos com dados válidos
    E  opcao "Continuar" for selecionada
    E o device foi validado com sucedsso na tela de token SMS
    Então usuário é direcionado para a tela "Olá"
    E a opção USperson desabilitada

### Especificação dos campos ###
#campo CPF obrigatório 11 caracteres
### Fim da especificação dos campos ###

Cenario: CPF vazio
    Dado que estou na tela de "Olá!"
	Quando não preencher o campo CPF
	Então o botão "Continuar" deve continuar desabilitado

Cenario: CPF inválido
    Dado que estou na tela de "Olá!"
	Quando preencher o campo CPF com cpf inválido <CPF>
	Então abaixo do campo CPF deve ser emitido um help text "CPF incorreto"
	E o botão "Continuar" deve continuar desabilitado
	|   CPF		|
	|1			|
	|12			|
	|123 		|
	|1234   	|
	|12345      |
	|123456     |
	|1234567    |
	|12345678   |
	|123456789  |
	|1234567890 |
	|12345678901|

Cenário: CPF já encontrado na base
	Dado que estou na tela de "Olá!"
	E preencher o campo CPF com cpf válido, 
	Quando selecionar a opção "Continuar"
	E o serviço retornar CPF já cadastrado (verificar código)
	Então o usuário deve visualizar a mensagem: "CPF inválido. Tente novamente" 
	E a opção Voltar 

  #OBS: Conferir o codigo de cpf ja cadastrado
	Cenário: Usuário selecionar a opção Voltar no modal de CPF inválido
		Dado que estou na modal de Cpf inválido
		Quando selecionar a opção "Voltar"
		Então o usuário é direcionado para tela de CPF com o campo em branco
		E a opção "Continuar" desabilitada

Cenário: CPF  não aprovado
	Dado que estou na tela de "Olá!"
	E preencher o campo CPF com cpf válido, 
	Quando selecionar a opção "Continuar"
	E o serviço retornar CPF não elegível (verificar código)
	Então o usuário deve visualizar a modal com a mensagem: "Que pena! Neste momento, não conseguimos abrir a sua conta corrente."
	E a opção "Voltar"
	#OBS: Conferir o codigo de cpf não aprovado
	Cenário: Usuário selecionar a opção "Voltar" no modal de CPF inválido
		Dado que estou na modal de Cpf inválido
		Quando selecionar a opção "Voltar"
		Então o usuário é direcionado para tela de CPF com o campo em branco
		E a opção "Continuar" desabilitada

Cenário: CPF  válido elegível
	Dado que estou na tela de "Olá!"
	E preencher o campo CPF com cpf válido, 
	Quando selecionar a opção "Continuar"
	E o serviço retornar CPF elegível
	Então o usuário deve ser direcionado para a tela de "Envio de documentos"

Cenário: Erro genérico ao validar CPF 
	Dado que estou na tela de "Olá!"
	E preencher o campo CPF com cpf válido, 
	Quando selecionar a opção "Continuar"
	E o serviço retornar  erro genérico (verificar código)
	Então o usuário deve visualizar uma modal com a mensagem "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
	E a opção "Voltar"
	#OBS: Conferir o codigo de  erro genérico
	Cenário: Usuário selecionar a opção "Voltar" no modal de erro genérico
		Dado que estou na modal de erro genérico
		Quando selecionar a opção "Voltar"
		Então o usuário é direcionado para tela de CPF com o campo em branco
		E a opção "Continuar" desabilitada


Cenário: Seleção da opção "?"
	Dado que estou na tela de "Olá!"
	Quando selecionar a opção "?"
	Então o usuário deve visualizar uma modal com a mensagem: "US Persons são pessoas que possuem cidadania e passaporte norte-americanos, ainda que residam fora dos Estados Unidos."
	E a opção "Voltar"

Cenário: Habilitar a opção US Person
    Dado que estou na tela de "Olá!"
	Quando selecionar o toggle "Us Person"
	Então devo visualizar a opção habilitada

