#language: pt
#encoding UTF-8


Funcionalidade: Passo 2 de 5: QUIZ
   #Como usuário do mobile banking bs2
   #Quero responder a um quiz 
   #Para aumentar a segurança e autenticidade do meu cadastro

Fundo: 
    Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada
    E todos os campos da tela "Criar perfil" forem preenchidos com dados válidos
    E  opcao "Continuar" for selecionada
    Então o  usuário é direcionado para tela "Vamos lá" e servico XXXX envia um SMS
    Quando for inserido o token recebido por SMS
    Então usuário é direcionado para a tela "Olá"
    Quando for inserido um CPF válido
    E selecionar a opção "Continuar"
    Então usuário é direcionado para tela "Criar conta"
    E selecionar a opção "Tirar foto do documento"  # ajustarr
    Então o usuário é direcionado para camera nativa do aparelho #ajustar
    Quando os documentos forem enviados #ajustar
    Então o usuário é direcionado para o "PASSO 2 DE 5"
    Quando a opção "Ok entendi" for selecionada
    Então o usuário é direcionado para tela do quiz "?"

Cenário: Usuário selecionou uma das respostas apresentadas no quiz 

    Dado que o usuário está na tela do quiz
    Então o usuário deve visualizar a primeira pergunta do quiz
    Quando uma das respostas for selecionada
    Então o usuario visualiza a próxima pergunta

    #OBS: Serão carregadas 5 perguntas provenientes do parceiro XXXXXX 
Cenário: Tempo de 20 segundos excedido e o usuário não selecionou uma resposta

    Dado que o usuário está na tela do quiz
    Quando o tempo de 20 segundos para resposta for excedido
    Então o usuario visualiza a próxima pergunta 
    E a pergunta não respondida deve ser enviada como uma resposta 'Errada'
#OBS:A regra atual é o usuário ter 20 segundos para responder cada pergunta apresentada - Esta regra é responsabilidade do parceiro fornecedor do quiz

Cenário: Sucesso na resposta de 3 ou  mais perguntas 
   
    Dado que o usuário está na tela do quiz
    Então o usuário deve visualizar a primeira pergunta do quiz
    E selecionar uma das respostas para cada pergunta apresentada
    Quando a ultima resposta for selecionada 
    E o serviço retornar sucesso
    Então o usuário é direcionado para o "PASSO 3 DE 5 "

    #OBS: A regra atual é que existe uma tolerância de 1 a 2 erros nas respostas do quiz, essa regra é um parâmetro configurável no parceiro XXXX. 

Cenário: Falha na resposta de 3 ou 4  perguntas, na primeira tentativa 
    Dado que o usuário está na tela do quiz
    Então o usuário deve visualizar a primeira pergunta do quiz
    E selecionar uma das respostas para cada pergunta apresentada
    Quando a ultima resposta for selecionada 
    E o serviço retornar falha XXX  ( retorno de perguntas incorretas)
    Então o usuário deve visualizar um novo conjunto de perguntas

    #OBS: A regra atual é a cada 3 ou 4  perguntas respondidas incorretamente é exibido um novo conjunto de 5 perguntas, essa regra é um parâmetro configurável no parceiro XXXX
Serão consideradas e enviadas ao serviço XXXXXX apenas as respostas do novo conjunto de perguntas. 


Cenário: Falha em todas as respostas do quiz, na primeira tentativa
    Dado que o usuário está na tela do quiz
    Então o usuário deve visualizar a primeira pergunta do quiz
    E selecionar uma das respostas para cada pergunta apresentada
    Quando a ultima resposta for selecionada 
    E o serviço retornar falha XXX  ( retorno de limite de tentativas excedidas)
    Então o usuário deve visualizar a mensagem "Não foi possível completar seu cadastro."
    E a opção "Voltar"

    #OBS: A regra atual é: na primeira tentativa caso o usuário erre de cara todas as questões é direcionado para tela de erro e tem  a proposta negada.  


Cenário: Falha  em 3 ou mais respostas do quiz, na segunda tentativa
    Dado que o usuário está na tela do quiz
    Então o usuário deve visualizar a primeira pergunta do quiz
    E selecionar uma das respostas para cada pergunta apresentada
    Quando a ultima resposta for selecionada 
    E o serviço retornar falha XXX  ( retorno de limite de tentativas excedidas)
    Então o usuário deve visualizar a mensagem "Não foi possível completar seu cadastro."
    E a opção "Voltar"

    #OBS: A regra atual é: na segunda chance, quando o usuário recebe o segundo bloco de respostas do quiz, caso  responda errado 3 ou mais perguntas é direcionado para tela "Não foi possível completar seu cadastro". 
    
    Cenário: Usuário seleciona a opção "Voltar"
        Dado que o usuário está na tela de " Não foi possível completar seu cadastro"
        Quando a opção "Voltar" for selecionada
        Então o usuário é direcionado para tela de "Login"


Cenário: Erro genérico ao carregar o quiz
    Dado que o usuário está na tela do quiz
    E o serviço retornar uma falha genérica
    Então o usuário deve visualizar a mensagem: "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde"
    E a opção "Voltar"
    #OBS: são considerados erros genéricos??


    Cenário: Usuário selecionar a opção "Voltar"
    Dado que o usuário está na modal de erro genérico
    Quando a opção "Voltar" for selecionada
    Então o usuário é direcionado para tela da primeira pergunta do quiz

Cenário: Erro genérico ao enviar respostas do quiz
    Dado que o usuário está na tela do quiz
    E o serviço retornar uma falha genérica
    Então o usuário deve visualizar a mensagem: "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde"
    E a opção "Voltar"
    #OBS: são considerados erros genéricos??

    Cenário: Usuário selecionar a opção "Voltar"
    Dado que o usuário está na modal de erro genérico
    Quando a opção "Voltar" for selecionada
    Então o usuário é direcionado para última pergunta do quiz
    E  é realizada nova tentativa de envio das respostas
   