@Regression
Feature: Validação do Login

    Background: Abrir o webdriver e Aplicação
        Given Dado que consigo   carregar a aplicação

    @LoginValidUser @R1
    Scenario Outline: Validação do Login com usuário ativo
        And Informo o nome de "<nome_user>" e "<passwd_user>" válidos
        And Clico no botão login
        When Devo ser redirecionado para tela inicial do Digital
        Then Então deve fazer logout
        Examples:
            | nome_user       | passwd_user   |
            | standard_user   | secret_sauce  |
            | performance_glitch_user | secret_sauce  |

    @LoginUserBlock @R2
    Scenario: Validação do Login com usuário bloqueado
        And Informo o nome de "locked_out_user" e "locked_out_user" válidos
        When Clico no botão login
        Then Devo ser exibido um alerta que o esse usuario está bloqueado

    @LoginInvalidUser @R3
    Scenario: Validação do Login com usuário errado
        And Informo o nome de "locked_out_user" e "senha_errada" válidos
        When Clico no botão login
        Then Devo ser exibido um alerta que o esse usuario ou senha está errado
