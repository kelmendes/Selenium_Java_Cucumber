@Regression
Feature: Realizar operações para validar o carrinho

    Background: Login Aplicação
        Given Dado que consigo   carregar a aplicação

    @CartAddItems @R1
    Scenario: Adicionando Itens ao carrinho de compras
        And Informo o nome de "performance_glitch_user" e "secret_sauce" válidos
        And Clico no botão login
        And Devo ser redirecionado para tela inicial do Digital
        And Adiciono os itens clicando no botão Add to Cart:
            | Sauce Labs Backpack               |
            | Sauce Labs Bike Light             |
            | Sauce Labs Onesie                 |
            | Test.allTheThings() T-Shirt (Red) |
            | Sauce Labs Fleece Jacket          |
            | Sauce Labs Bolt T-Shirt           |
        When O contado de itens no carrinho deve mudar
        Then Então deve fazer logout

    @CartAddItems @R2
    Scenario: Adicionando Itens ao carrinho de compras - Aplicação com Problema
        And Informo o nome de "problem_user" e "secret_sauce" válidos
        And Clico no botão login
        And Devo ser redirecionado para tela inicial do Digital
        And Adiciono os itens clicando no botão Add to Cart:
            | Sauce Labs Backpack               |
            | Sauce Labs Bike Light             |
            | Sauce Labs Onesie                 |
            | Test.allTheThings() T-Shirt (Red) |
            | Sauce Labs Fleece Jacket          |
            | Sauce Labs Bolt T-Shirt           |
        When O contado de itens no carrinho deve mudar
        Then Então deve fazer logout

    @CartValidateItems @R3
    Scenario: Validando Itens ao carrinho de compras
        And Informo o nome de "performance_glitch_user" e "secret_sauce" válidos
        And Clico no botão login
        And Que o usuário tenha adicionado todos os itens ao carrinho
        When Validar que todos os estão adicionados
        Then Então deve fazer logout

    @CartCheckout @R4
    Scenario: Proceder para checkout
        And Informo o nome de "performance_glitch_user" e "secret_sauce" válidos
        And Clico no botão login
        And Que o usuário tenha adicionado todos os itens ao carrinho
        And Clico no botão de checkout
        And Informo os dados básicos para realizar o checkout
        And Clico em continuar com o checkout
        And valido a forma de pagamento, entrega e total da compra
        And clico em finish
        When Devo ser redirecionado para tela que minha ordem vai ser despachada
        Then Então deve fazer logout