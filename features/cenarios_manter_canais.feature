# language: pt

Funcionalidade: Manter Canais
Eu como ADTsys desejo manter canais para possibilitar a venda do produto através de uma rede de
parceiros sem necessidade de apoio da nossa área comercial.

#1
 Esquema do Cenario: Incluir canal pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys
    E desejo inclur um novo canal
    Quando clico no botão "Adicionar Novo Canal"
    Então o sistema redirecionar para a tela de "Adicionar novo canal" com os campos
        | Campos              |
        | Razão Social        |
        | Nome Fantasia       |
        | CNPJ                |
        | Email administrador |
        | Nome                |
        | Telefone            |
        | Email               |
        | Responsabilidade    |
    Quando não preencho um Campo obrigatorio
    E clico no botão salvar
    Então os sistema devera exibir a seguinte mensagem "Campo obrigatório"
    Quando preencho o campo <CAMPO>  com o seguinte valor invalido: <VALOR>
    Então o sistema devera exibir a seguinte mensagem <MENSAGEM>
    Quando preencho o campo "Razão Social" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "Nome Fantasia" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "CNPJ" com o seguinte valor: "19.111.127/0001-06"
    E preencho o campo "Email administrador" com o seguinte valor: "larissa.espinosa@adtsys.com.br"
    E preencho o campo "Nome" com o seguinte valor: "Larissa Sitta Espinosa"
    E preencho o campo "Telefone" com o seguinte valor: "(19)99786-8781"
    E preencho o campo "Email" com o seguinte valor: "larissa.espinosa@adtsys.com.br"
    E preencho o campo "Responsabilidade" com o seguinte valor: "Responsável pela venda do Orquestrador em Uberaba"
    E clico no botão "Salvar"
    Então o sistema exibe a seguinte mensagem "Cadastro criado com sucesso"
    E o sistema gera uma senha dinâmica
    E envia um email para o "larissa.espinosa@adtsys.com.br"

    Exemplos:
        | <CAMPO>              | <VALOR>            | <MENSAGEM>        |
        | CNPJ                 | 00.000.000/0000-00 | CNPJ inválido     |
        | Email administrador  | larisssa@larissa   | Email inválido    |
        | Email                | larisssa@larissa   | Email inválido    |
        | Telefone             | (19)1122           | Telefone inválido |

#2
Cenario: Listar canal(is) pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys
    E desejo visualizar o(s) canal(is) cadastrado(s)
    Então o(s) canal(is) cadastrado(s) é(são) listado(s), incluindo o(s) com status "inativo"

#3
Esquema do Cenario: Atualizar um canal pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys
    E já tenha um ou mais canais cadastrados
    Quando clico no canal "Larissa e Mariana Eletrônica ME"
    E clico no botão "Atualizar"
    Então o sistema devera redirecionar para a tela de "Atualizar canal" com os seguintes campos
        | Campos              |
        | Razão Social        |
        | Nome Fantasia       |
        | CNPJ                |
        | Email administrador |
        | Nome                |
        | Telefone            |
        | Email               |
        | Responsabilidade    |
    Quando apago um dos campos obrigatórios
    Então o sistema devera exibir a seguinte mensagem "Campo obrigatório"
    Quando eu atualizo o campo <CAMPO> de <VALOR_ANTERIOR> para <NOVO_VALOR>
    E clico no botão "Salvar"
    Então o sistema deve persistir a alteração
    E exibir a seguinte mensagem "Atualização realizada com sucesso"

    Exemplos:
        | <CAMPO>             | <VALOR_ANTERIOR>                                  | <NOVO_VALOR>                                       |
        | Razão Social        | Larissa e Mariana Eletrônica ME                   | Marina e Larissa Informática ME                    |
        | Nome Fantasia       | Larissa e Mariana Eletrônica ME                   | Marina e Larissa Informática ME                    |
        | CNPJ                | 19.111.127/0001-06                                | 27.593.329/0001-60                                 |
        | Email administrador | larissa.espinosa@adtsys.com.br                    | larissasitta.espinosa@hotmail.com                  |
        | Nome                | Larissa Sitta Espinosa                            | Larissa Espinosa                                   |
        | Telefone            | (19) 99786-8781                                   | (19) 99773-1976                                    |
        | Email               | larissa.espinosa@adtsys.com.br                    | larissasitta.espinosa@hotmail.com                  |
        | Responsabilidade    | Responsável pela venda do Orquestrador em Uberaba | Responsável pela venda do Orquestrador em Pedreira |

#4
Cenario: Inativar um canal pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys com o perfil ADTsys
    E já tenha um ou mais canais cadastrados e ativos
    Quando clico no check "Inativar" do canal "Larissa e Mariana Eletrônica ME"
    Então o sistema deve exibir uma pop-up com a seguinte mensagem "Você tem certeza que deseja inativar esse registro?"
    Quando clico no botão "NÃO"
    Então o sistema deve manter o canal ativo
    Quando clico no botão "SIM"
    Então o sistema devera alterar o status do canal para inativo

#5
Cenario: Ativar um canal pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys com o perfil ADTsys
    E já tenha um ou mais canais cadastrados e inativos
    Quando clico no check "Ativar" do canal "Larissa e Mariana Eletrônica ME"
    Então o sistema deve exibir uma pop-up com a seguinte mensagem "Você tem certeza que deseja ativar esse registro?"
    Quando clico no botão "NÃO"
    Então o sistema deve manter o canal inativo
    Quando clico no botão "SIM"
    Então o sistema devera alterar o status do canal para ativo

#6
Cenario: Validar template de Email enviado para o canal criado
  Dado que o novo canal recebeu email com seus dados de acesso
  Então o template de email devera exibir os seguintes campos
    | Campos                                            |
    | Email administrador                               |
    | Senha                                             |
    | Link para acessar a área administrativa da ADTsys |

#7
Cenario: Visualizar informações de um canal pela área administrativa da ADTsys
    Dado que estou logado na área administrativa da adtsys
    E já tenha um ou mais canais cadastrados
    Quando clico no canal "Larissa e Mariana Eletrônica ME"
    E clico no botão "Visualizar"
    Então o sistema devera redirecionar para a tela de "Visualizar informações do canal"
    E com os seguintes campos e valores
        | Campos              | Valores                                           |
        | Razão Social        | Larissa e Mariana Eletrônica ME                   |
        | Nome Fantasia       | Larissa e Mariana Eletrônica ME                   |
        | CNPJ                | 19.111.127/0001-06                                |
        | Email administrador | larissa.espinosa@adtsys.com.br                    |
        | Nome                | Larissa Sitta Espinosa                            |
        | Telefone            | (19) 99786-8781                                   |
        | Email               | larissa.espinosa@adtsys.com.br                    |
        | Responsabilidade    | Responsável pela venda do Orquestrador em Uberaba |
    Quando clico no botão "Voltar"
    Então o sistema devera redirecionar para a tela inicial listanto todos os canais

#8
Cenario: Validar logout
  Dado que estou logado na área administrativa da adtsys
  Quando clico no botão "Logout"
  Então o sistema abre uma pop-up com a mensagem "Deseja mesmo sair?"
  Quando clico no botão "SIM"
  Então sou deslogada da aplicação

#9
Esquema do Cenario: Filtar resultados da listagem
    Dado que estou logado na área administrativa da adtsys
    E já tenha um ou mais canais cadastrados
    Quando digito a seguinte informação <INFORMACAO> no seguinte <CAMPO>
    E clico no botão "Pesquisar"
    Então o sistema devera trazer os dados correspondentes
    Exemplos:
        | <CAMPO>             | <INFORMACAO>                   |
        | Razão Social        | Larissa                        |
        | Nome Fantasia       | Mariana                        |
        | CNPJ                | 19.111.127/0001-06             |
        | Email administrador | larissa.espinosa@adtsys.com.br |
        | Nome                | Espinosa                       |
        | Telefone            | (19) 99786-8781                |
        | Email               | larissa.espinosa@adtsys.com.br |
        | Responsabilidade    | Responsável                    |

#10
Esquema do Cenario: Validar alteração dados unicos
  Dado que estou logado na área administrativa da adtsys
  E os seguintes dados existentes na tabela "CANAIS"
    | ID | RAZÃO SOCIAL                    | NOME FANTASIA                   | CNPJ               | EMAIL ADMINISTRADOR               | NOME                   | TELEFONE        | EMAIL                             | RESPONSABILIDADE                                   |
    | 1  | Larissa e Mariana Eletrônica ME | Larissa e Mariana Eletrônica ME | 19.111.127/0001-06 | larissa.espinosa@adtsys.com.br    | Larissa Sitta Espinosa | (19) 99786-8781 | larissa.espinosa@adtsys.com.br    | Responsável pela venda do Orquestrador em Uberaba  |
    | 2  | Marina e Larissa Informática ME | Marina e Larissa Informática ME | 27.593.329/0001-60 | larissasitta.espinosa@hotmail.com | Larissa Espinosa       | (19) 99773-1976 | larissasitta.espinosa@hotmail.com | Responsável pela venda do Orquestrador em Pedreira |
  Quando clico no canal "Larissa e Mariana Eletrônica ME"
  E clico no botão "Atualizar"  
  Então devera abrir uma tela de atualização, exibindo os campos editaveis
  Quando eu atualizo o campo <CAMPO> de <VALOR_ANTERIOR> para <NOVO_VALOR>
  E clico no botão "Salvar"
  Então o sistema deve exibir a seguinte mensagem de erro <MENSAGEM>
  
  Exemplos:
    | <CAMPO>             | <VALOR_ANTERIOR>                                  | <NOVO_VALOR>                                       | <MENSAGEM>                               |
    | CNPJ                | 19.111.127/0001-06                                | 27.593.329/0001-60                                 | CNPJ informado já existe!                |
    | Email administrador | larissa.espinosa@adtsys.com.br                    | larissasitta.espinosa@hotmail.com                  | Email administrador informado já existe! |

 #11
 Cenario: Incluir canal pela área administrativa da ADTsys sem contato
    Dado que estou logado na área administrativa da adtsys
    E desejo inclur um novo canal
    Quando clico no botão "Adicionar Novo Canal"
    Então o sistema redirecionar para a tela de "Adicionar novo canal" com os campos
        | Campos              |
        | Razão Social        |
        | Nome Fantasia       |
        | CNPJ                |
        | Email administrador |
        | Nome                |
        | Telefone            |
        | Email               |
        | Responsabilidade    |
    Quando preencho o campo "Razão Social" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "Nome Fantasia" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "CNPJ" com o seguinte valor: "19.111.127/0001-06"
    E preencho o campo "Email administrador" com o seguinte valor: "larissa.espinosa@adtsys.com.br"
    E clico no botão "Salvar"
    Então o sistema exibe a seguinte mensagem de erro "Contato é uma informação obrigatória"

 #12
 Cenario: Incluir canal pela área administrativa da ADTsys com dois contatos
    Dado que estou logado na área administrativa da adtsys
    E desejo inclur um novo canal
    Quando clico no botão "Adicionar Novo Canal"
    Então o sistema redirecionar para a tela de "Adicionar novo canal" com os campos
        | Campos              |
        | Razão Social        |
        | Nome Fantasia       |
        | CNPJ                |
        | Email administrador |
        | Nome                |
        | Telefone            |
        | Email               |
        | Responsabilidade    |
    Quando preencho o campo "Razão Social" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "Nome Fantasia" com o seguinte valor: "Larissa e Mariana Eletrônica ME"
    E preencho o campo "CNPJ" com o seguinte valor: "19.111.127/0001-06"
    E preencho o campo "Email administrador" com o seguinte valor: "larissa.espinosa@adtsys.com.br"
    E preencho o campo "Nome" com o seguinte valor: "Larissa Sitta Espinosa"
    E preencho o campo "Telefone" com o seguinte valor: "(19)99786-8781"
    E preencho o campo "Email" com o seguinte valor: "larissa.espinosa@adtsys.com.br"
    E preencho o campo "Responsabilidade" com o seguinte valor: "Responsável pela venda do Orquestrador em Uberaba"
    E adiciono mais um contato com as seguintes informações nos seguintes campos
        | Campos              | Informações                                        |
        | Nome                | Larissa Espinosa                                   |
        | Telefone            | (19)99786-8781                                     |
        | Email               | larissasitta.espinosa@hotmail.com                  |
        | Responsabilidade    | Responsável pela venda do Orquestrador em Pedreira |
    E preencho o campo "Nome" com o seguinte valor: "Larissa Espinosa"
    E preencho o campo "Telefone" com o seguinte valor: "(19)99786-8781"
    E preencho o campo "Email" com o seguinte valor: "larissasitta.espinosa@hotmail.com"
    E preencho o campo "Responsabilidade" com o seguinte valor: "Responsável pela venda do Orquestrador em Pedreira"
    E clico no botão "Salvar"
    Então o sistema exibe a seguinte mensagem "Cadastro criado com sucesso"
    E o sistema gera uma senha dinâmica
    E envia um email para o "larissa.espinosa@adtsys.com.br"
