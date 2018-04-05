#language:pt
#encoding:UTF-8

Funcionalidade: Verificar tela Criar Perfil
    Como usuário do aplicativo BS2
    Quero verificar a tela de Criar Perfil
    Para inserir os primeiros dados para a criação da conta corrente

Fundo: 
	Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada

###Especificação dos campos###

#Como gostaria de ser chamado?: 60 caracteres
#teclado: alfabético (usuário não pode inserir números, pois serviço não está preparado para receber)
#obrigatório

#E-mail: 100 caracteres
#teclado: email
#obrigatório

#DDD+Celular: 11 caracteres
#teclado: numérico
#obrigatório

# Pode sofrer alteração (não mapeado)
#Senha: 6 caracteres
#teclado: numérico
#obrigatório

# Pode sofrer alteração (não mapeado)
#Digite sua senha novamente: 6 caracteres
#teclado: numérico
#obrigatório

###Fim da especificação dos campos###

Cenário: Não preencher os campos obrigatórios
    Dado que o usuário está na tela de Criar Perfil
    Quando ele não preencher os dados obrigatórios
    Então o botão "Continuar" permanece desabilitado

Cenário: Preencher o campo E-mail com valor inválido
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher o campo "E-mail" com valor inválido
    Então a aplicação exibe a mensagem de erro em forma de help text "Formato de e-mail inválido"

Cenário: Preencher o campo E-mail com valor já cadastrado
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher todos os campos, e o campo "E-mail" com valor já cadastrado
    E selecionar a opção "Continuar"
    Então a aplicação exibe a mensagem de erro retornada pelo serviço em um modal nativo "E-mail inválido. Tente novamente." e botão Voltar

     Cenário: Usuário selecionar a opção "Voltar"
        Dado que o usuário está na moldal de e-mail inválido
        Quando a opção "Voltar" for selecionada
        Então o usuário é retorna para tela de criar perfil, com o campo de e-mail em branco


Cenário: Preencher o campo Celular com valor inválido
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher o campo "Celular" com valor inválido
    Então a aplicação exibe a mensagem de erro em forma de help text "Isso não parece um número válido. Digite novamente."

Cenário: Preencher o campo Celular com valor já cadastrado
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher todos os campos, e o campo "Celular" com valor já cadastrado
    Então a aplicação exibe a mensagem de erro retornada pelo serviço em um modal nativo "Celular inválido. Tente novamente." e botão Voltar

     Cenário: Usuário selecionar a opção "Voltar"
        Dado que o usuário está na moldal de celular inválido
        Quando a opção "Voltar" for selecionada
        Então o usuário é retorna para tela de criar perfil, com o campo de celular em branco

###EM REVISÃO###
Cenário: Preencher o campo Senha com valor diferente do padrão
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher o campo "Senha" com valor diferente do padrão
    Então a aplicação exibe a mensagem de erro "Crie uma senha com 6 dígitos, que não podem ser números sequenciais. Utilize, no máximo, 3 dígitos repetidos. Evite usar dados como datas de nascimento, data da abertura de sua conta, seu telefone, o número da sua residência, partes de seu CPF etc)"

Cenário: Preencher o campo Digite sua senha novamente com valor diferente do inserido no campo Senha
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher o campo "Digite sua senha novamente" com valor diferente do inserido no campo "Senha"
    Então a aplicação exibe a mensagem de erro "As senhas que você digitou não conferem."

Cenário: Clicar em Voltar na parte superior da tela
    Dado que o usuário está na tela de Criar Perfil
    Quando ele clicar na seta de Voltar na parte superior da tela
    Então ele retorna para a tela de Login
#Obs: O componente de seta para Voltar será o nativo de acordo com a plataforma (Android/iOS)

Cenário: Preencher o formulário da tela Criar Perfil com dados válido e prosseguir no fluxo
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher todos os campos obrigatórios com dados válidos
    E clicar no botão "Continuar"
    Então é chamado o serviço /usuários para gravar as informações e a aplicação direciona para a tela de Vamos Lá

@erroGenerico
Cenário: Erro genérico ao gravar os dados do usuário (/usuarios)
    Dado que o usuário está na tela de Criar Perfil
    Quando ele preencher o formulário com dados válidos
    E clicar no botão "Continuar"
    E o serviço /usuarios de gravar dados devolve erro genérico
    Então é exibido um modal nativo com mensagem de erro genérico

    Cenário: Usuário selecionar a opção "Voltar"
        Dado que o usuário está na moldal de erro genérico
        Quando a opção "Voltar" for selecionada
        Então o usuário é retorna para tela de criar perfil, com todas as opções preenchidas
        E a opção "Continuar" habilitada


#Mensagem: Opa! Ocorreu um erro inesperado. Tente novamente mais tarde.
#Botão Voltar