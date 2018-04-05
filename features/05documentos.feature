#language:pt


Funcionalidade: Cadastro do Documento no Onboarding
	Como usuário do aplicativo BS2 abrindo uma conta
	Quero enviar foto frente e verso da minha identidade ou CNH
	Para continuar o processo de abertura de conta 

Fundo: 
    Dado que o usuario visualizou o "Splash" 
    E o usuario está na segunda tela de "Walkthrough"
    Quando a opção "Não sou cadastrado" for selecionada
    E todos os campos da tela "Criar perfil" forem preenchidos com dados válidos
    E  opcao "Continuar" for selecionada
    E o device foi validado com sucesso na tela de token SMS
    Então usuário é direcionado para a tela "Olá"
    E a opção USperson desabilitada
    Quando o usuario inserir um CPF válido e elegível
    Então o usuário é direcionado para tela de "Envio de documentos"
	
# Seleção de tirar foto do RG   

Cenário: Exibição de mensagem para acesso à câmera nativa do aparelho
	Dado que o usuário está na tela de Envio de documentos
	E ainda não concedeu permissão de camera para o aplicativo
	Então é exibido um pop-up com uma mensagem de acesso à câmera
  #OBS: Os modais apresentados serão nativos de cada SO.

Cenário: Usuário não autorizou o acesso à câmera
	Dado que estou na tela de envio de foto do documento de identificação 
	E a modal de permissão de acesso à camera for apresentada
	Quando a opção 'Não Permitir' for selecionada
	Então um pop-up é exibido, explicando que é necessário permitir acesso à câmera para prosseguir
   
Cenário: Usuário ANDROID selecionou a opção "Não perguntar novamente"
	Dado que estou na tela de envio de foto do documento de identificação 
	E a modal de permissão de acesso à camera for apresentada
	Quando a opção "Não perguntar novamente' for marcada 
	E a opção "Não Permitir" for selecionada
	Então um pop-up é exibido, explicando que é necessário permitir acesso à câmera nas configurações do sistemas  #necessariorevisão

Cenário: Usuário autorizou o acesso à câmera
	Dado que estou na tela de envio de foto do documento de identificação
	E a modal de permissão de acesso à camera for apresentada
	Quando a opção 'OK' for selecionada
	Então o usuário visualiza a tela de documento de identificação 
	E nenhuma das opções "RG/CNH" selecionada

Cenário: Usuário selecionou a opção de RG no tipo de documento a ser enviado
	Dado que estou na tela de envio de foto do documento de idenficação
	E o usuário autorizou o acesso à câmera nativa do aparelho
	Quando a opção 'RG' for selecionada
	Então serão exibidos os botões 'Frente' e 'Verso'com check desabilitados 
	
Cenário: Usuário deseja tirar a foto de frente do RG
	Dado que estou na tela de envio de foto do documento de identificação ou na tela de foto da frente do RG
	E o usuário autorizou o acesso à câmera nativa do aparelho
	E o usuário selecionou a opção 'RG' para o tipo de documento a ser enviado
	Quando a opção 'Frente' for selecionada
	Então a câmera nativa do aparelho é acionada
	
Cenário: Usuário tirou a foto de frente do RG
	Dado que o usuário selecionou a opção 'RG' 
	E a opção 'Frente' for selecionada
	Quando o usuário tirar a foto
	Então a foto capturada é exibida para confirmação 
	E opções "Cancelar" e "OK"
#OBS: Como a tela de confirmação faz parte do componente nativo de cada SO o texto das opções "Cancelar" e "Ok" podem sofrer pequenas variações. 

#OBS: Caso o usuário selecione a opção "Cancelar" na confirmação de foto, poderá realizar nova captura
	

Cenário: Usuário realizou a captura da foto da "Frente" do RG com sucesso
	Dado que o usuário selecionou a opção "RG"
	Quando a foto for capturada
	E o usuário confirmar que a captura ficou boa
	Então o usuário visualiza a tela de envio de documentos com a opção "Frente" habilitada com check e o "Verso" com check desabilitado

	
Cenário: Usuário deseja tirar foto de verso do RG
	Dado que estou na tela de envio de foto do documento de identificação
	E o usuário selecionou a opção 'RG'
	Quando a opção 'Verso' for selecionada
	Então a câmera nativa do aparelho é acionada

Cenário: Confirmação de captura - verso
	Dado que o usuário selecionou a opção 'RG' 
	E a opção 'Verso' for selecionada
	Quando o usuário tirar a foto
	Então a foto capturada é exibida para confirmação 
	E opções "Cancelar" e "OK"
#OBS: Como a tela de confirmação faz parte do componente nativo de cada SO o texto das opções "Cancelar" e "Ok" podem sofrer pequenas variações.  
#OBS: Caso o usuário selecione a opção "Cancelar" na confirmação de foto, poderá realizar nova captura

Cenário: Usuário realizou a captura da foto da "Verso" do RG com sucesso
	Dado que o usuário selecionou a opção "RG"
	E selecionou a opção "Frente" para iniciar a captura
	Quando a foto for capturada
	E o usuário confirmar que a captura ficou boa
	Então o usuário visualiza a tela de envio de documentos com a opção "Frente" habilitada com check e o "Verso" habilitado com check
	E a opção "Continuar" é habilitada


Cenário: Usuário selecionar a opção "Continuar"

	Dado que o  estou na tela de envio dos documentos
	E o usuário já realizou captura das fotos
	Quando a opção "Continuar" for selecionada
	Então o usuário é direcionado para tela "Explicativa do Quiz"


#OBS: Ao selecionar a opção continuar deve ser chamado o (OCR-pendente definição), e realizado o envio dos documentos pelo propostas/documentos.
#OBS: Caso o OCR se comporte de maneira divergente do acertado até então, deve ser realizado alteração, atualmente a cada foto capturada e confirmada é realziado o envio para o serviço. 

 # Opção 'CNH' selecionada

Cenário: Usuário selecionou a opção de CNH no tipo de documento a ser enviado
	Dado que estou na tela de envio de foto do documento de idenficação
	E o usuário autorizou o acesso à câmera nativa do aparelho
	Quando a opção 'CNH' for selecionada
	Então será exibida a opção 'Frente'  ícone de check desabilitado
	
Cenário: Usuário deseja tirar a foto de frente do CNH
	Dado que estou na tela de envio de foto do documento de identificação ou na tela de foto da frente do CNH
	E o usuário autorizou o acesso à câmera nativa do aparelho
	E o usuário selecionou a opção 'RCNHG' para o tipo de documento a ser enviado
	Quando a opção 'Frente' for selecionada
	Então a câmera nativa do aparelho é acionada
	
Cenário: Usuário capturou a foto de frente do CNH
	Dado que o usuário selecionou a opção 'CNH' 
	E a opção 'Frente' for selecionada
	Quando o usuário tirar a foto
	Então a foto capturada é exibida para confirmação 
	E opções "Cancelar" e "OK"
#OBS: Como a tela de confirmação faz parte do componente nativo de cada SO o texto das opções "Cancelar" e "Ok" podem sofrer pequenas variações. 

#OBS: Caso o usuário selecione a opção "Cancelar" na confirmação de foto, poderá realizar nova captura
	

Cenário: Usuário realizou a captura da foto da "Frente" da CNH com sucesso
	Dado que o usuário selecionou a opção "CNH
	Quando a foto for capturada
	E o usuário confirmar que a captura ficou boa
	Então o usuário visualiza a tela de envio de documentos com a opção "Frente" habilitada com check 

Cenário: Usuário selecionar a opção "Continuar"

	Dado que o  estou na tela de envio dos documentos
	E o usuário já realizou captura das fotos
	Quando a opção "Continuar" for selecionada
	Então o usuário é direcionado para tela "Explicativa do Quiz"


#OBS: Ao selecionar a opção continuar deve ser chamado o (OCR-pendente definição), e realizado o envio dos documentos pelo propostas/documentos.
#OBS: Caso o OCR se comporte de maneira divergente do acertado até então, deve ser realizado alteração, atualmente a cada foto capturada e confirmada é realziado o envio para o serviço. 
#OBS: Após definição da OCR será necessário mapear os possíveis erros que podem ser devolvidos. 

Cenário: Erro genérico

 	Dado que estou na tela de envio dos documentos
	E o usuário já realizou captura das fotos
	Quando a opção "Continuar" for selecionada
	E o serviço retornar erro genérico 
	Então o usuário deve visualizar a mensagem: "Opa! Ocorreu um erro inesperado. Tente novamente mais tarde."
	E a opção "Voltar"
 	
 	Cenário: Usuário selecionar a opção "Voltar"
 	Dado que estou na modal de erro genérico
 	Quando a opção "Voltar" for selecionada
 	Então o usuário permanece na tela de "Envio de foto do documentos de identificação" #possivelrevisao 

 #OBS: - Incluir regra para esclarecer que a validação das fotos tiradas será realizada pelo OCR. (Dúvida: como se dará o retorno para o usuário de erro na validação dos documentos pelo OCR?) 
#OBS: - Incluir regra para salvar as fotos confirmadas e enviar para o OCR.