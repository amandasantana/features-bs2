#language:pt
#encoding:UTF-8


Funcionalidade: Realizar Login(Onboarding)
    Como usuário do aplicativo BS2 já cadastrado
    Quero realizar login
    Para realizar acesso a conta corrente


Fundo: 
    Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Ja tenho cadastro" for selecionada
    Então o usuário é direcionado para tela de "Login"

OBS: a tela de "Walkthrough" só é exibida no primeiro acesso ao aplicativo. 
nas demais vezes, o usuário é direcionado para tela de Login direto.  

###Especificação dos campos###

#e-mail: 100 caracteres
#teclado: alfanumérico
#obrigatório

#Senha: 6 caracteres
#teclado: numérico
#obrigatório

###Fim da especificação dos campos###

Cenário: Exibição da tela de permissão de biometria
    Dado que o usuário está na tela de "Login"
    Quando o usuário realizar o primeiro login
    E o dispositivo possui sensor biométrico
    Então o usuário deve ver a modal(nativa) de permissão a biometria

    Cenário: Usuário selecionar a opção "Não permitir"
    Dado que o usuário está na modal de permissão de biometria
    Quando a opção  "Não permitir" for selecionada
    Então o usuário é direcionado para a Home

    Cenário: Usuário selecionar a opção "Ok"
       Dado que o usuário está na modal de permissão de biometria
       Quando a opção  "OK" for selecionada
       Então o usuário é direcionado para Home 


Cenário: Exibição da tela de permissão de biometria para dispositivo sem sensor biométrico
    Dado que o usuário está na tela de "Login"
    Quando o usuário realizar o primeiro login
   #possivel revisao
    E o dispositivo NÃO possui sensor biométrico
    Então o usuário NÃO visualiza a modal de permissão a biometria
    E visualiza a tela inicial da conta

Cenário: Exibição da tela de login após primeiro acesso para dispositivo sem sensor biométrico 
    Dado que o usuário está na tela de "Login"
    Quando o usuário realizar o primeiro login
    E o dispositivo NÃO possui sensor biométrico
    Então o usuário não visualiza a modal de permissão a biometria
    E visualiza a tela inicial da conta    

Cenário: Exibição da modal de digital  segundo acesso
    Dado que o usuário abre a aplicação
    Quando o usuário já realizou o primeiro login
    E o dispositivo já possui permissão ao sensor biométrico
    Então o usuário visualiza a modal de biometria logo após a exibição da splashscreen
    E a opção "Cancelar" é exibida na modal

    Cenário: Tela de Login cancelando opção de biometria
        Dado que estou no modal de biometria
        Quando a opção "Cancelar" for selecionada
        Então o usuário é direcionado para tela de login

Cenário: Login através da biometria
    Dado que o usuário está na tela de "Login"
    Quando o usuário já realizou o primeiro login
    E o dispositivo já possui permissão ao sensor biométrico
    E o usuário toca no sensor biométrico com digital válida
    Então a tela inicial da conta é exibida

#verificar o tratamento do sistema para o cenário
Cenário: Login com biometria inválida
    Dado que o usuário abre a aplicação
    Quando já possui conta
    E já realizou o primeiro login
    E o dispositivo possui sensor biométrico
    E o dispositivo já possui permissão ao sensor biométrico
    E o usuário toca no sensor biométrico com digital inválida
    Então o login não é realizado 
    E uma mensagem de erro é exibida para nova tentativa??? Ou direciona para login com senha?


#verificar descrição
Cenário: Informar e-mail com formato inválido
    Dado que o usuário está na tela de login
    Quando digito um e-mail com formato inválido
    Então é exibida a exceção para o campo de e-mail

#verificar descrição
Cenário: Informar e-mail sem conta criada
    Dado que o usuário está na tela de login
    Quando digito um e-mail que não possui conta criada
    E preencho o campo senha
    E toco na opção "Entrar"
    Então é exibida a exceção informando que os dados de login não são válidos

#verificar a descrição
Cenário: Informar senha com menos de 6 caracteres
    Dado que o usuário está na tela de login
    Quando digito uma senha utilizando menos de 6 caracteres
    Então o usuário é notificado para informar senha com 6 caracteres

#verificar descrição
Cenário: Informar e-mail com conta criada e senha inválida
    Dado que o usuário está na tela de login
    Quando digito um e-mail que possui conta criada
    E preencho o campo senha com uma senha inválida
    E toco na opção "Entrar"
    Então é exibida a exceção informando que a senha é inválida

#verificar descrição
Cenário: Informar e-mail com conta criada e senha não informada
    Dado que o usuário está na tela de login
    Quando digito um e-mail que possui conta criada
    E não preencho o campo senha 
    E toco na opção "Entrar"
    Então é exibida a exceção informando que a senha deve ser informada

Cenário: Entrar sem informar e-mail e senha
    Dado que o usuário está na tela de login
    Quando não preencho o campo e-mail
    E não preencho o campo senha
    Então opçaõ "Entrar" fica desabilitada 

Cenário: Exibição default para lembrar e-mail
    Dado que o usuário acessa a tela de login por senha
    Quando visualizo o campo "Lembrar e-mail"
    Então a opção é exibida desmarcada

Cenário: Exibição lembrar e-mail após seleção
    Dado que o usuário acessa a tela de login por senha
    Quando visualizo o campo "Lembrar e-mail"
    E toco na opção "Lembrar e-mail"
    Então a opção é exibida selecionada

Cenário: Exibição da tela de login com e-mail lembrado
    Dado que o usuário já tenha logado com a opção lembrar e-mail selecionada
    Quando visualizo a tela de login
    Então o campo e-mail é previamente preenchido

Cenário: Login com usário e senha válidos
    Dado que o usuário não opte pela biometria
    Quando informo dados de acesso válidos 
    E toco em "Entrar"
    Então a tela de inicial da conta do usuário é exibida

#Ainda não definida a tela para direcionamento para este link
Cenário: Exibição do link Esqueci minha senha
    Dado que o usuário não opte pela biometria
    Quando visualizar a tela de login
    Então a opção "Esqueci minha senha deve ser exibida" 

Cenário: Acesso a tela de cadastro pela tela de login
    Dado que o usuário não opte pela biometria
    Quando visualizar a tela de login
    E tocar no link "Primeiro acesso? Cadastre-se!"
    Então o usuário é direcionado para tela de "Criar Perfil"
