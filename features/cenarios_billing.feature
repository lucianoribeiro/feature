# language: pt

Funcionalidade: Validar o resumo geral de faturamento de acordo com o mês escolhido 

Contexto: 
    * Lançar no mínimo 2 ambientes nos provedores nos provedores (Google e AWS);
  
 #1
Cenário: Configurar bucket de billing na AWS
    Dado que estou logado na URL: "https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:sort=instanceId"
    E clico no link "S3" em Storage
    E clico no botão "Create bucket"
    Então é exibido a pop-up "Create bucket"
    Quando informo os seguintes campos
       |campos     |
       |Bucket name|
       |Region     |
    E clico no botão "Create"
    Então o bucket é criado com sucesso
    Quando clico no Bucket criado
    E clico no link "Permissions"
    E clico no link "Bucket Policy"
    Então o provedor exibe a página para adicionar a política
    Quando informo a política de segurança
    E clico no botâo "Save"
    Então a politica é criado com sucesso
    Quando clico no menu login > My Billing Dashboard
    Então exibe a tela "Painel de gerenciamento de custos e faturamento"
    Quando clico no link "Preferências"
    Então exibe a página de Preferências
    Quando seleciono o item "Receber relatórios de faturamento"
    E adiciono o nome do bucket criado 
    Quando clico no botão "verificar"
    Então o bucket é validado com sucesso
    Quando clico no botão "Salvar preferências"
    Então a preferência é salva com sucesso
    Quando clico no menu "login" > "My Billing Dashboard"
    Então exibe a página "Painel de gerenciamento de custos e faturamento"
    E clico no link "Tags de alocação de custos"
    Então exibe a página "Tags de alocaçao de custos"
    Quando clico no botão "Ativar"
    Então a ativação é realizada com sucesso
    Quando seleciono as tags desejadas
    E clico no botão "Ativar"
    Então os status das tags selecionadas são alteradas para "Active"

#2    
Cenário: Configurar bucket de billing no Google Cloud
    Dado que estou logado na URL: "https://console.cloud.google.com/getting-started?project=&folder=&organizationId=920088595402"
    E clico no menu de navegação em "Storage"
    E clico no botão "Criar Intervalo"
    Então é exibido a tela "Criar um intervalo"
    Quando informo os seguintes campos
       |campos                          |
       | Nome                           |
       | Classe de armazenamento padrão |
       | Local                          |
    E clico no botão "Criar"
    Então o intervalo é criado com sucesso
    Quando clico no menu de navegação em "Faturamento"
    E clico no botão "Ir para a conta de faturamento vinculada"
    E clico no menu "Exportação de faturamento"
    E clico no link "Exportação de arquivo"
    E clico no botão "Editar Configurações"
    Então o provedor exibe um formulario a ser preenchido
    Quando informo os seguintes campos
        | Campos               | 
        | Nome do intervalo    |
        | Prefixo do relatório |
        | Formato              | 
    E clico no botão salvar  
    Então as informações são salvas com sucesso 
    E a Exportação de faturamento altera o statas para "Ativada"

#3
Cenário: Visualizar Faturamento pelo Orquestrador
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    Então os graficos "TOTAL MENSAL", "RESUMO POR PROVEDOR", "RESUMO POR AMBIENTE" e "RESUMO POR CONTA" deverão ser exibidos de acordo com o mês corrente 

#4
Cenário: Visualizar Faturamento de um mês anterior
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    E seleciono no combo "Mês" um mês anterior 
    Então os graficos "TOTAL MENSAL", "RESUMO POR PROVEDOR", "RESUMO POR AMBIENTE" e "RESUMO POR CONTA" deverão exibir os valores de acordo com o faturamento do mês anterior

#5
Cenário: Validar a label por mês e ano 
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    E altero o mês do combo "Mês"
    Então a label "resumo geral" deve estar de acordo com o mês selecionado
    E o periodo deve estar de acordo com o mês selecionado

#6
Cenário: Validar as informações do grafico "TOTAL MENSAL" 
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    E posiciono o mouse sobre o mês do grafico "TOTAL MENSAL"
    Então devera exibir o valor total mês

#7
Cenário: Validar as informações do grafico "RESUMO POR PROVEDOR" 
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    E posiciono o mouse sobre o grafico "RESUMO POR PROVEDOR" dos seguintes provedores "AWS" e "GOOGLE"
    Então devera exibir o valor total em $ (dolar) por provedor
    E devera estar igual ao descrito na legenda 

#8
Cenário: Validar as informações do grafico "RESUMO POR CONTA" 
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    E posiciono o mouse sobre o grafico "RESUMO POR CONTA"
    Então devera exibir o valor total em $ (dolar) por conta
    E devera estar igual ao descrito na legenda 

#9
Cenário: Validar as informações do grafico "RESUMO POR AMBINTE" 
    Dado que estou logado no sistema Orquestrador
    Quando seleciono menu "Faturamento"
    Então devera exibir o valor total em $ (dolar) por ambiente
    E devera estar igual ao descrito na legenda 

#10
Cenário: Validar a somatoria de todos os valores dos provedores com o valor total mensal
    Dado que estou logado no sistema Orquestrador
    E seleciono menu "Faturamento"
    Quando realizo a somatoria de todos os valores dos provedores
    E comparo com o valor total mensal 
    Então os valores devem ser identicos

#11
Cenário: Validar a somatoria de todos os valores por conta com o valor total mensal 
    Dado que estou logado no sistema Orquestrador
    E seleciono menu "Faturamento"
    Quando realizo a somatoria de todos os valores por conta
    E comparo com o valor total mensal 
    Então os valores devem ser identicos

#12
Cenário: Validar a somatoria de todos os valores por ambiente com o valor total mensal
    Dado que estou logado no sistema Orquestrador
    E seleciono menu "Faturamento"
    Quando realizo a somatoria de todos os valores por ambiente
    E comparo com o valor total mensal 
    Então os valores devem ser identicos

#13
Cenário: Validar valor total de contas de um provedor 
    Dado que estou logado no sistema Orquestrador
    E seleciono menu "Faturamento"
    Quando realizo a somatoria de todas as contas de um provedor 
    E comparo com o valor total por provedor 
    Então os valores devem ser identicos

#14
Cenário: Validar valores da conta por mês com provedor AWS
    Dado que estou logado no sistema Orquestrador
    E seleciono menu "Faturamento"
    Quando comparo os valores da conta por mês com o valor do provedor(es) da AWS
    Então os valores devem ser identicos

#15
Cenário: Validar exclusão de ambiente já sincronizado sem alterar "RESUMO POR AMBIENTE"
    Dado que estou logado no sistema Orquestrador
    E seleciono um ambiente já sincronizado que estaja aparecendo na tela de faturamento
    Quando clico no botão para "excluir" 
    E excluo o ambiente
    E retorno para a tela de faturamento 
    Então o ambiente devera continuar sendo exibido no "RESUMO POR AMBIENTE"

#16
Cenário: Validar alteração nome de ambiente já sincronizado
    Dado que estou logado no sistema Orquestrador
    E seleciono um ambiente já sincronizado que estaja aparecendo na tela de faturamento
    Quando clico no botão para "editar" 
    E edito o nome do ambiente
    E retorno para a tela de faturamento 
    Então o ambiente devera alterar o nome no "RESUMO POR AMBIENTE"
