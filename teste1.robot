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
    Acessar o home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"
    Verificar se aparece a categoria "TV e Cinema em Casa"
Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica uma pesquisa por um produto específico
    [Tags]             busca_produtos lista_busca
    Acessar o home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    verificar o resutado da pesquisa se listando o produto pesquisado