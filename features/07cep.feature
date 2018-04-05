#language:pt
#encoding:UTF-8

Funcionalidade: Verificar tela de inserir dados adicionais e CEP
    Como usuário do aplicativo BS2
    Quero verificar a tela de inserir dados adicionais e CEP
    Para preencher o formulário do Passo 3 no processo de criação da conta corrente

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

###Especificação dos campos###

    #Nome do cônjuge: 60 caracteres
    #teclado: alfanumérico
    #obrigatório se selecionar "Casado" ou "União Estável"

    #Onde você trabalha: 40 caracteres
    #teclado: alfanumérico
    #obrigatório se selecionar uma Profissão na lista

    #CEP: 8 caracteres
    #teclado: numérico
    #obrigatório

    #Logradouro: 50 caracteres
    #teclado: alfanumérico
    #obrigatório

    #Número: 10 caracteres
    #teclado: alfanumérico
    #obrigatório

    #Complemento: 20 caracteres
    #teclado: alfanumérico
    #não obrigatório

    #Bairro: 20 caracteres
    #teclado: alfanumérico
    #obrigatório

###Fim da especificação dos campos###

###Os seguintes campos não terão validação (campo inválido), conforme alinhado com PO:###

    #Nome do cônjuge
    #Onde você trabalha
    #Logradouro/Bairro/Estado/Cidade caso usuário edite e fiquem diferente do CEP informado

###Fim###

Cenário: Não preencher os campos obrigatórios
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele não preencher os dados obrigatórios
    Então o botão "Continuar" permanece desabilitado

###PODE SER QUE ESSA INFORMAÇÃO SAIA###
Cenário: Selecionar opção "Casado" ou "União Estável" no select Estado Civil
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele selecionar a opção "Casado" ou "União Estável" no select Estado Civil após o serviço /listas/estadoscivis carregar a lista
    Então deve ser exibido o campo obrigatório "Nome do cônjuge"

Cenário: Selecionar uma Profissão da lista
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele selecionar uma opção do select Profissão após o serviço /listas/profissoes/{descricao} carregar a lista
    Então deve ser exibido o campo obrigatório "Onde você trabalha"

###Mudar cenário: SERVIÇO PRECISA SER INFORMADO SE É AUTONOMO ou NÃO TRABALHA - PRECISA INCLUIR NA LISTA DE PROFISSÕES, NÃO NO CHECKBOX###
Cenário: Marcar checkbox "Não trabalho no momento"
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele marcar o checkbox "Não trabalho no momento"
    Então os campos "Profissão" e "Onde você trabalha" não são obrigatórios
    E o campo "Onde você trabalha" deixa de ser exibido
    E o select "Profissão" é limpado caso o usuário tenha escolhido uma opção anteriormente
# ***Dúvida!! O mesmo acontecerá para o checkbox "Sou profissional liberal/autônomo"?
# ***Verificar se o serviço pode receber as informações Profissão/Empresa e Profissional liberal simultaneamente

Cenário: Digitar valor válido no campo CEP
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele inserir um valor válido no campo "CEP"
    Então é feita uma pesquisa no serviço listas/endereco/{cep} e são expandidos na tela os campos "Logradouro", "Número", "Complemento", "Bairro", "Estado" e "Cidade"
# Obs: Os campos "Logradouro", "Bairro", "Estado" e "Cidade" virão preenchidos com os dados retornados pelo serviço do Correios
# Obs2: Caso seja um CEP municipal, o serviço traz as informações "Estado" e "Cidade" e o usuário edita os outros campos

Cenário: Mensagem de CEP não encontrado
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando o usuário preencher o campo "CEP" e ele não for encontrado
    Então a aplicação exibe a mensagem de erro do serviço em um modal nativo "CEP não localizado. Tente novamente." com botão Voltar

Cenário: Mensagem de CEP inválido
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando o usuário preencher o campo "CEP" com valor inválido
    Então a aplicação exibe a mensagem de erro "CEP inválido."

###VALIDAÇÕES DE LOGRADOURO/BAIRRO/ESTADO/CIDADE SE EDITAR E FICAR DIFERENTE DO CEP???
#Alinhado com a PO que a princípio não terá validação

Cenário: Preencher o formulário da tela de inserir dados adicionais e CEP com dados válido e prosseguir no fluxo
    Dado que o usuário está na tela de inserir dados adicionais e CEP
    Quando ele preencher todos os campos obrigatórios com dados válidos
    E clicar no botão "Continuar"
    Então a aplicação direciona para a tela de Dados Corretos