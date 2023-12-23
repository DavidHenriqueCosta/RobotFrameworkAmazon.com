*** Settings ***
Library        SeleniumLibrary


*** Variables ***

${URL}    http://www.amazon.com.br
${MENU_ELETRÔNICOS}         //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRÔNICOS}       //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_ELETRONICO}         Eletrônicos e Tecnologia
${BARRA_PESQUISA}           //input[contains(@type,'text')]
${PESQUISA_XBOX}            //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${BOTÃO_PESQUISA}            //input[@value='Ir']
${TÍTULO_PESQUISA}            //span[@class='a-size-medium-plus a-color-base a-text-bold'][contains(.,'Resultados')]
${CARRINHO}                    //input[contains(@name,'submit.add-to-cart')]
${ICONE_CARRINHO}               nav-cart
${PRODUTO_NO_CARRINHO}         //span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]
${EXCLUIR_DO_CARRINHO}            //input[contains(@value,'Excluir')]
${MENSAGEM_CARRINHO_VAZIO}        //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
*** Keywords ***
Abrir o navegador
        Open Browser    browser=chrome
        Maximize Browser Window


Fechar o navegador
        Capture Page Screenshot
        Close Browser

Acessar o home page do site Amazon.com.br
        Go To    url=${URL}
        Wait Until Element Is Visible      locator=${MENU_ELETRÔNICOS}


Entrar no menu "Eletrônicos"
        Click Element    locator=${MENU_ELETRÔNICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
        Wait Until Page Contains           text=${TEXTO_ELETRONICO} 
        Wait Until Element Is Visible      locator=${HEADER_ELETRÔNICOS}

Verificar se o título da página fica "${TÍTULO}"
        Title Should Be                    title=${TÍTULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
        Page Should Contain Image          locator=//img[contains(@alt,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
        Input Text                         locator=${BARRA_PESQUISA}    text=${PRODUTO}
        Click Button                       locator=${BOTÃO_PESQUISA}
        Wait Until Element Is Visible      locator=${TÍTULO_PESQUISA}
        
verificar o resutado da pesquisa se listando o produto pesquisado
        Page Should Contain Element        locator=${PESQUISA_XBOX}
# GHERKIN STEPS

verificar título xbox series
        Title Should Be    title=Amazon.com.br : Xbox Series S

Dado que estou na home page da Amazon.com.br
    Acessar o home page do site Amazon.com.br
    
    

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
     Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    verificar título xbox series

E um produto da linha "Xbox Series S" deve ser mostrado na página
    verificar o resutado da pesquisa se listando o produto pesquisado

Então será adicionado um produto "Xbox Series S" no carrinho
    Click Element                    locator=${PESQUISA_XBOX}
    Wait Until Element Is Visible    locator=${CARRINHO}
    Click Element                    locator=${CARRINHO}

E um Xbox Series S deve estar no carrinho
    Click Element                locator=${ICONE_CARRINHO}
    Element Should Be Visible    locator=${PRODUTO_NO_CARRINHO}

Então o Xbox Series deve ser removido do carrinho
    Click Element                locator=${EXCLUIR_DO_CARRINHO}

E o carrinho deve estar vazio
    Wait Until Element Is Visible    locator=${MENSAGEM_CARRINHO_VAZIO}