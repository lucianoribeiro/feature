# language: pt

Funcionalidade: Configurar bucket de billing na conta de provedor
Eu, como cliente, desejo configurar onde será gerado o meu arquivo de billing no Cloud Provider 
para que possa ser possível visualizar o billing no CloudHit. 

#1
Cenário: Vincular bucket a uma conta de provedor
    Dado que estou logado no sistema Orquestrador
    E já possua uma conta configurada
    Quando seleciono menu "Contas de Provedores"
    E clico no menu lateral da conta 
    E clico na opção "Configurar Bucket"
    Então o sistema devera exibir uma pop-up "Configurar Bucket"
    E devera conter os seguintes campos 
        | Campos                    |
        | Nome do bucket            |
    E a seguinte mensagem "Você sabe como habilitar as configurações de billing no cloud provider? Caso não saiba clique aqui para aprender como" 
    Quando clico no link "clique aqui" da mensagem
    Então sou redirecionada para a wiki "/help"
    Quando não preencho o campo "Nome do bucket"
    Então o botão "Vincular" não deve estar habilitado
    Quando preencho todos os campos obrigatorios 
    E clico no botão "Vincular"
    Então o sistema devera vincular o bucket a conta corretamente
    E será possivel ver o bucket configurado através da url "http://localhost:3001/sidekiq/cron"

#2
Esquema do Cenário: Visualizar wiki para configurar bucket de billing <PROVEDOR> 
    Dado que estou logado no sistema Orquestrador
    E estou na pagina de wiki "/help"
    Quando seleciono  "Configurar <PROVEDOR>" no menu lateral
    Então devera abrir o passo a passo para configurar <PROVEDOR>
    E deve conter um link para o site <SITE>
    Quando leio os passos para configurar um Bucket
    Então sou capaz de configurar o billing
    E configurar o bucket <PROVEDOR>

    Exemplos:
        | PROVEDOR     | SITE                              |
        | AWS          | https://aws.amazon.com/pt/        |
        | Google Cloud | https://console.cloud.google.com/ |

#3
Cenário: Editar nome Bucket
    Dado que estou logado no sistema Orquestrador
    E já possua uma conta configurada
    E um bucket configurado "bucket-1"
    Quando seleciono menu lateral na opção "Configurar Bucket"
    Então o sistema devera exibir uma pop-up "Configurar Bucket" com o nome configurado "bucket-1"
    Quando altero o campo "Nome do bucket" com o seguinte nome "bucket-teste"
    E clico no botão "ALTERAR"
    Então o sistema deverá alterar o nome do bucket corretamente
    E exibir a seguinte mensagem "Nome do bucket alterado com sucesso"
    E o nome do bucket configurado devera também ser alterado na url "http://localhost:3001/sidekiq/cron"

#4
Cenário: Excluir Conta já configurada 
    Dado que estou logado no sistema Orquestrador
    E já possua uma conta configurada
    E um bucket configurado "bucket-1"
    Quando seleciono menu lateral na opção "Excluir Conta"
    Então o sistema deverá excluir a conta 
    E excluir o bucket 
    E o bucket não aparecerá mais através da url "http://localhost:3001/sidekiq/cron"
 
#5
Cenário: Configurar bucket de billing na AWS
    Dado que estou logado na URL: https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Instances:sort=instanceId
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
    Quando seleciono as tags kdesejadas
    E clico no botão "Ativar"
    Então os status das tags selecionadas são alteradas para "Active"

#6    
Cenário: Configurar bucket de billing no Google Cloud
    Dado que estou logado na URL:https://console.cloud.google.com/getting-started?project=&folder=&organizationId=920088595402
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

#7
Cenário: Não ter configurado bucket no provedor
    Dado que estou logado no sistema Orquestrador
    Quando seleciono a opção "Faturamento" do menu
    E não tenha um bucket configurado 
    Então o sistema deverá exibir a seguinte mensagem "Você sabe como habilitar as configurações de billing no cloud provider? Caso não saiba clique aqui para aprender como" 
    Quando clico no link "clique aqui" da mensagem
    Então sou redirecionada para a wiki "/help"