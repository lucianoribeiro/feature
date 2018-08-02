# language: pt

Funcionalidade: Criar área administrativa de canais
Eu como canal, desejo ter um sistema administrativo para visualizar e gerenciar os meus clientes.

Contexto:
    Dado os seguintes dados existentes na tabela "CANAL"
      | ID | EMAIL                             | SENHA           | STATUS  |
      | 1  | larissa.espinosa@adtsys.com.br    | 123456789123456 | Ativo   |
      | 2  | larissasitta.espinosa@hotmail.com | abcde           | Inativo |

#1
Esquema do Cenario: Validar acesso com os dados recebidos por email
  Dado que o novo canal recebeu email com  seguintes dados de acesso com os seguintes valores
    | Dado  | Valores                        |
    | Email | larissa.espinosa@adtsys.com.br |
    | Senha | 123456789123456                | 
  Quando preencho os dados de login com o seguinte email <EMAIL>
  E com a seguinte senha <SENHA>
  E clico no botão "Entrar"
  Então o sistema exibe a seguinte mensagem "Email ou/e senha invalido(s)"
  Quando preencho os dados de login com o seguinte email "larissa.espinosa@adtsys.com.br"
  E com a seguinte "123456789123456"
  E clico no botão "Entrar"
  Então o login é realizado com sucesso

  Exemplos:
    | EMAIL                          | SENHA           |
    | luana.espinosa@adtsys.com.br   | 124567896532145 |
    | larissa.espinosa@adtsys.com.br | 123456          | 

#2
Esquema do Cenario: Validar a redefinição de senha
  Dado que estou na area de login da area administrativa de canais
  Quando clico no link "Esqueceu sua senha?"
  Então abrira uma tela com os seguintes campos
    | CAMPO |
    | email |    
  Quando preencho o campo "email" com o seguinte email "luana.espinosa@adtsys.com.br"
  E clico no botão "Redefinir Senha"
  Então o sistema exibe a seguinte mensagem "Email não encontrado!"
  Quando preencho o campo "email" com o seguinte email "larissa.espinosa@adtsys.com.br"
  E clico no botão "Redefinir Senha"
  Então o sistema exibe a seguinte mensagem "Email com os dados de redefinição de senha enviado para larissa.espinosa@adtsys.com.br"
  E envia um email com o token de redefinição de senha
  Quando clico no link do email "Redfinir senha"
  Então sou redirecionada para a tela de redefinição de senha com os seguintes campos
    | CAMPO                |
    | Senha                |
    | Confirmação de Senha |
  E preencho o campo "Nova senha" com a seguinte senha <SENHA>
  E preencho o campo "Confirmação de senha" com a seguinte senha <CONFIRMAR_SENHA>
  E clico no botão "Alterar senha"
  Então o sistema exibe a seguinte mensagem <MENSAGEM>
  Quando tento logar com o seguinte email "larissa.espinosa@adtsys.com.br"
  E oom a seguinte senha antiga "124567896532145"
  Então o sistema deve exibir a seguinte mensagem "Email ou/e senha invalido(s)"
  Quando tento logar com o seguinte email "larissa.espinosa@adtsys.com.br"
  E com a seguinte senha nova "12456"
  Então o login é realizado com sucesso

  Exemplos:
    | SENHA  | CONFIRMAR_SENHA | MENSAGEM                           |
    | 123456 | 111111          | Senhas não conferem!               |
    | 123456 | 123456          | Atualização realizada com sucesso! |

#3
Cenario: Validar acesso de um canal inativo
  Dado que o novo canal está inativo
  Quando preencho os dados de login com o seguinte email "larissasitta.espinosa@hotmail.com"
  E com a seguinte senha "abcde"
  E clico no botão "Entrar"
  Então o sistema exibe a seguinte mensagem "Usuario Inativo"

#4
Cenario: Validar acesso de um canal com o status alterado para ativo
  Dado que realizo um update na tabela "CANAL"
  E altere o campo "status" para "ativo"    
    | ID | EMAIL                             | SENHA           | *STATUS |
    | 2  | larissasitta.espinosa@hotmail.com | abcde           | Ativo   |
  Quando preencho os dados de login com o seguinte email "larissasitta.espinosa@hotmail.com"
  E com a seguinte senha "abcde"
  E clico no botão "Entrar"
  Então o login é realizado com sucesso

