*** Settings ***
Documentation          Essa súite testa o site da Amazon.com.br
Resource               amazon_resources.robot
Test Setup             Abrir o navegador
Test Teardown          Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônico do site da Amazon.com.br
    ...                e verificar a categoria computadores e informáticas
    [Tags]             menus categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica uma pesquisa por um produto específico
    [Tags]             busca_produtos lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

caso de teste 03 - adicionar produto no carrinho 
    [Documentation]   Esse teste testa a inclusão de produtos no carrinho
    [Tags]            carrinho 
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Então será adicionado um produto "Xbox Series S" no carrinho
    E um Xbox Series S deve estar no carrinho

Caso de teste 04 - remover produto do carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho
    [Tags]            remover
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Então será adicionado um produto "Xbox Series S" no carrinho
    E um Xbox Series S deve estar no carrinho
    Então o Xbox Series deve ser removido do carrinho
    E o carrinho deve estar vazio   