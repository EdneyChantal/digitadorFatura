*** Settings ***
Library    Browser
Library    RPA.Excel.Files
Library    String


*** Variables ***
${EXCEL}=  C:/Users/gestor/Downloads/gastos_unico.xlsx
${SHEET}=  Gastos
#${PAGE} =   http://177.71.229.111:8080/
${PAGE} =   http://localhost:8081/
${XPATH_INPUT_CATEGORIA}=     xpath=//*[@id="field_natureplan"]

*** Keywords ***
abrir pagina
    New Browser    chromium    headless=False
    New Page    ${PAGE}
    Wait For Elements State    xpath=/html/body/jhi-main/div[2]/div/jhi-home/div[2]/div/div/div/span[2]    visible    timeout=20s

tela de login 
    Click    xpath=/html/body/jhi-main/div[2]/div/jhi-home/div[2]/div/div/div/a
    Wait For Elements State    xpath=//*[@id="username"]    visible    timeout=20s
fazer login
    Set Browser Timeout    20 s
    Fill Text    xpath=//*[@id="username"]    chantal
    Fill Text    xpath=//*[@id="password"]    emdias@1911
    Wait For Elements State    id=empresa    attached
    Wait For Elements State    id=empresa    visible
    Wait For Elements State    id=empresa    enabled
    Browser.Select Options By    xpath=//*[@id="empresa"]    Label      Financas Pessoais Edney
    Click   xpath=/html/body/jhi-main/div[2]/div/jhi-login/div/div/div/form/button
    Wait For Elements State     xpath=/html/body/jhi-main/div[2]/div/jhi-home/div[1]/div/jhi-shortcuts/div/div/a[1]
entrar tela compromissos
    Click    xpath=/html/body/jhi-main/div[2]/div/jhi-home/div[1]/div/jhi-shortcuts/div/div/a[4]
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[1]    visible    timeout=20s


abrir relatorio itau
    ${url}=     Catenate    ${PAGE}commitment/person/2753/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Itaú Card Tit Edney")]     visible    timeout=20s
abrir relatorio carrefour
    ${url}=     Catenate    ${PAGE}commitment/person/13101/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Carrefour ")]     visible    timeout=20s
abrir relatorio elo
    ${url}=     Catenate    ${PAGE}commitment/person/9403/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Elo Cetelen ")]     visible    timeout=20s    
abrir relatorio carrefour adriana
    ${url}=     Catenate    ${PAGE}commitment/person/13102/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Carrefour Adriana ")]     visible    timeout=20s    
abrir relatorio mercado pago adriana
    ${url}=     Catenate    ${PAGE}commitment/person/5551/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Mercado Pago Adriana ")]     visible    timeout=20s    
abrir relatorio renner adriana
    ${url}=     Catenate    ${PAGE}commitment/person/6401/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Rener Adriana ")]     visible    timeout=20s  
abrir relatorio mercado pago
    ${url}=     Catenate    ${PAGE}commitment/person/5351/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Mercado Pago ")]     visible    timeout=20s  
abrir relatorio casas bahia
    ${url}=     Catenate    ${PAGE}commitment/person/24351/P
    Go To   ${url}
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- cartao casa bahia ")]     visible    timeout=20s  



abrir formulario 
    Click    xpath=//*[@id="jh-create-entity"]
    Wait For Elements State    xpath=//*[@id="jhi-commitment-heading"][contains(text(), "Criar ou editar Compromisso")]     visible    timeout=20s
espera relatorio itau
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Itaú Card Tit Edney")]     visible    timeout=20s
espera relatorio carrefour
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Carrefour ")]     visible    timeout=20s
espera relatorio elo
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Elo Cetelen ")]     visible    timeout=20s
espera relatorio carrefour adriana 
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Carrefour Adriana ")]     visible    timeout=20s
espera relatorio mercado pago adriana 
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Mercado Pago Adriana ")]     visible    timeout=20s    
espera relatorio renner adriana 
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Rener Adriana ")]     visible    timeout=20s  
espera relatorio mercado pago
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- Cartão Mercado Pago ")]     visible    timeout=20s  
espera relatorio casa bahia
    Wait For Elements State    xpath=//*[@id="page-heading"]/span[contains(text(), "Compromissos a Pagar- cartao casa bahia ")]     visible    timeout=20s  




preencher formulario
    [Arguments]  ${data}  ${valor}  ${historia}  ${repeticao}  ${categoria}  ${cartao}
    
    
    Fill Text    xpath=//*[@id="field_dia"]     ${data}
    
    Wait For Elements State   xpath=//*[@id="field_valor"]     visible    timeout=10s
    Wait For Elements State   xpath=//*[@id="field_valor"]     editable
    Clear Text                xpath=//*[@id="field_valor"] 
    ${texto}=    Convert To String    ${valor}
    ${novo_valor}=    Replace String    ${texto}    .    ,
    Fill Text    xpath=//*[@id="field_valor"]   ${texto}
    Press Keys                xpath=//*[@id="field_valor"]    Tab
    Focus   xpath=//*[@id="field_valor"]
    Fill Text    xpath=//*[@id="field_historia"]   ${historia}
    Fill Text    xpath=//*[@id="field_nrepeat"]   ${repeticao}
    Wait For Elements State    ${XPATH_INPUT_CATEGORIA}    attached
    Wait For Elements State    ${XPATH_INPUT_CATEGORIA}    visible
    Wait For Elements State    ${XPATH_INPUT_CATEGORIA}    enabled
    Browser.Select Options By  ${XPATH_INPUT_CATEGORIA}    Label     ${categoria}
    
    #Sleep   3s
    


    Click    xpath=//*[@id="save-entity"]
    #Sleep   6s
    IF  '${cartao}' == "Carrefour Adriana"
            espera relatorio carrefour adriana
    ELSE IF  '${cartao}' == "Elo Cetelen"
            espera relatorio elo
    ELSE IF  '${cartao}' == "Mercado Pago Adriana"
            espera relatorio mercado pago adriana
    ELSE IF  '${cartao}' == "Mercado Pago"
            espera relatorio mercado pago        
    ELSE IF  '${cartao}' == "Rener Adriana"
            espera relatorio renner adriana
    ELSE IF  '${cartao}' == "Itau Card"
            espera relatorio itau
    ELSE IF  '${cartao}' == "Carrefour"
            espera relatorio carrefour
    ELSE IF  '${cartao}' == "Casas Bahia" 
            espera relatorio casa bahia       
    END
   
ler a planilha 
    [Arguments]  ${arquivo}   ${sheet_name} 
    Open Workbook    ${arquivo}
    ${dados}=   Read Worksheet As Table    header=True    name=${sheet_name}
    Close Workbook
    FOR    ${row}    IN    @{dados}
       
        ${data}=        Set Variable        ${row['Data']}
        ${valor}=       Set Variable        ${row['Valor']}
        ${historia}=    Set Variable        ${row['Descrição']}
        ${cartao}=      Set Variable        ${row['Cartão']}
        ${matches}=     Get Regexp Matches    ${historia}    (\\d{1,2})/(\\d{1,2})
        ${tamanho}=     Get Length    ${matches}

        IF  '${cartao}' == "Carrefour Adriana"
            abrir relatorio carrefour adriana
        ELSE IF  '${cartao}' == "Elo Cetelen"
            abrir relatorio elo
        ELSE IF  '${cartao}' == "Mercado Pago Adriana"
            abrir relatorio mercado pago adriana
        ELSE IF  '${cartao}' == "Mercado Pago"
            abrir relatorio mercado pago
        ELSE IF  '${cartao}' == "Rener Adriana"
            abrir relatorio renner adriana
        ELSE IF  '${cartao}' == "Itau Card"
            abrir relatorio itau
        ELSE IF  '${cartao}' == "Carrefour"
            abrir relatorio carrefour
        ELSE IF  '${cartao}' == "Casas Bahia" 
            abrir relatorio casas bahia    
        END

        abrir formulario

        IF  ${tamanho} == 0
           ${repeticao}=    Set Variable    0
        ELSE
           ${partes}=      Split String    ${matches[0]}    /
           ${repeticao}=     Set Variable    ${partes[1]}
        END
        ${categoria}=    Set Variable    ${row['Categoria']} 
        preencher formulario    ${data}    ${valor}    ${historia}    ${repeticao}   ${categoria}  ${cartao}
    END
    
Separar Numeros
    ${historia}=    Set Variable    ViaSport, MACEIO-1/2
    ${matches}=     Get Regexp Matches    ${historia}    (\\d{1,2})/(\\d{1,2})
    ${partes}=      Split String    ${matches[0]}    /
    ${primeiro}=    Set Variable    ${partes[0]}
    ${segundo}=     Set Variable    ${partes[1]}
    


*** Test Cases ***
Abrir Página Robot Framework
    [Documentation]    Este teste abre o site oficial do Robot Framework.
    abrir pagina
    tela de login
    fazer login
    entrar tela compromissos
    ler a planilha    ${EXCEL}    ${SHEET}
    Take Screenshot
    Close Browser
