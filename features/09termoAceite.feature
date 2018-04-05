#language: pt
#encoding UTF-8


Funcionalidade: Passo 5 de 5: Dados corretos e incorretos
   Como usuário do mobile banking bs2
   Quero aceitar os termos de aceite
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
    E o usuário selecionar a opção "Dados corretos"

Cenário: Botão Finalizar desabilitado
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Então o botão "Finalizar" deve estar desabilitado

Cenário: Botão Finalizar habilitado
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Quando o usuário marcar o checkbox de acordo e autorização
    Então o botão "Finalizar" deve ficar habilitado, e ao ser selecionado, 
          os serviços POST/propostas/contacorrente/termoaceite e POST/propostas/contacorrente/conclusao devem ser chamados
    E ele será direcionado para à tela "Aguarde, estamos quase terminando."

Cenário: Scroll da lista
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Quando o usuário arrastar para cima o texto dentro da lista
    Então a lista deve se movimentar e o restante da tela se manter estático

Cenário: Texto do checkbox
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Então o usuário deve visualizar o seguinte texto para o checkbox: "Concordo e autorizo a emissão de meu cartão virtual vinculado à minha conta. Autorizo a troca de informações entre as empresas BS2. Enviamos uma cópia para seu e-mail"

#Erro serviço POST/propostas/contacorrente/termoaceite
@erroGenerico
Cenário: Erro genérico ao chamar o serviço POST/propostas/contacorrente/termoaceite
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Quando o usuário marcar o checkbox de acordo e autorização
    E o botão "Finalizar" deve ficar habilitado, e ao ser selecionado, 
          os serviços POST/propostas/contacorrente/termoaceite e POST/propostas/contacorrente/conclusao retornem erros ao serem chamados
    Então um modal deve ser exibido "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
    E ao selecionar a opção "Voltar" de dentro do modal
    Então usuário é retornado para a mesma tela em questão, porém com o checkbox desmarcado e botão desabilitado

#Erro serviço GET/propostas/contacorrente/termoaceite
@erroGenerico
Cenário: Erro genérico ao chamar o serviço GET/propostas/contacorrente/termoaceite
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite não foi chamado com sucesso
    Então um modal deve ser exibido "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
    E ao selecionar a opção "Voltar" de dentro do modal
    Então usuário é deslogado e direcionado para a tela de login

Cenário: Alteração da versão de termos na lista
    Dado que o usuário está na tela Termo de Aceite e o serviço GET/propostas/contacorrente/termoaceite foi chamado com sucesso
    Mas a versão do Termo de Aceite foi atualizada durante o momento que o usário está na tela 
    Quando o usuário marcar o checkbox de acordo e autorização
    Então o botão "Finalizar" deve ficar habilitado, e ao ser selecionado, 
          o serviço POST/propostas/contacorrente/termoaceite retorna código 400
    Então será exibida um modal "A versão de termo de aceite informada não é a versão vigente."
    Quando o usuário selecionar "Voltar" dentro do modal
    Então usuário é retornado para a mesma tela em questão, porém com o checkbox desmarcado e botão desabilitado
#OU Então usuário é retornado para a mesma tela em questão, porém com o checkbox marcado e botão habilitado