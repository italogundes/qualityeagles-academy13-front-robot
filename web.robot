*** Settings ***
Library    SeleniumLibrary
Library    libs/get_fake_person.py
Library    libs/get_fake_client.py


*** Variables ***
${URL}    https://quality-eagles-front.qacoders.dev.br/login
${BROWSER}    Chrome

#Inputs
${input_fullName}    input[id=fullName]
${input_mail_user}    input[id=mail]
${accessProfile}    xpath=//select[@id="Perfil de Acesso*"]
${input_cpf}    input[id=cpf]
${input_password}    input[id=password]
${input_confirmPassword}    input[id=confirmPassword]
${input_email}   input[id=email] 
${input_senha}    input[id=password]
${input_razaoSocial}    input[id=companyName]
${input_nomeFantasia}    input[id=fantasyName]
${input_emailCompany}     input[id=companyMail]
${input_cnpj}     input[id=matriz]
${input_telefoneEmpresa}     input[id=telephone]
${input_telefone}     input[id=phone]
${input_descricaoServico}     input[id=serviceDescription]
${input_nomeResponsavel}     input[name=fullName]
${input_cep}     input[id=zipCode]
${input_pais}     input[id=country]
${input_cidade}     input[id=city]
${input_estado}     input[id=state]
${input_bairro}     input[id=district]
${input_rua}     input[id=street]
${input_numeroImovel}     input[id=number]
${input_complemento}     input[id=complement]
${input_dataNascimento}     input[id=birthDate]
${input_cargo}    input[id=currentRole]
${input_rg}    input[name=rg]

#Botões
${btn_usuarios}    xpath=//div[@id="Usuários"]
${btn_novo_cadastro}    xpath=//button[@id="Novo Cadastro"]
${btn_entrar}    button[class='css-mykr3j']
${btn_save}    button[id=save]
${btn_cancel}    button[id=cancel]
${btn_editar_usuario}    xpath=(//button[@id='edit'])[1]
${btn_aluno}    div[id=Aluno]
${btn_empresas}    div[id=Empresa]

#Listas
${listagem}    ul[class='css-18psgb0']
${listagemEmpresas}    div[class='css-nhyiur']
${lista_empresas}    css=div[class*="css-nhyiur"]
${lista_clientes}    css=div[class*=css-dy4jwo]

#Divs e Forms
${div_cadastros}    xpath=//div[@id="Cadastros"]
${form_usuario}    form[css='css-np5g2k']
${form_cadastro}     css=form[class*="css-ffwpz9"]

#Mensagens
${msg_sucesso_usuario}    [role='alert']
${msg_campo_invalido}    p[class='css-bbipig']

*** Test Cases ***
TC01 - Realizar Login com Sucesso
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}    timeout=30s
    Element Should Be Visible    ${div_cadastros}
    Capture Page Screenshot
    Fechar Navegador

#TC02 - Realizar Novo Cadastro de Usuário com Sucesso
#    ${person}    Get Fake Person
#    Preencher Form de Cadastro de Usuario    
#    ...    fullName=${person}[name]   
#    ...    email=${person}[email]       
#    ...    cpf=${person}[cpf]    
#    ...    password=1234@Test
#    ...    confirmPassword=1234@Test
#    Wait Until Element Is Visible    css=${msg_sucesso_usuario}
#    Element Should Be Visible    css=${msg_sucesso_usuario}
#    Capture Element Screenshot    css=${msg_sucesso_usuario}
#   Fechar Navegador

#TC03 - Realizar Novo Cadastro de Usuário com CPF Inválido
#    ${person}    Get Fake Person
#    Preencher Form de Cadastro de Usuario
#    ...    fullName=${person}[name]      
#    ...    email=invalid_email_uol.com
#    ...    cpf=${person}[cpf]
#    ...    password=1234@Test
#    ...    confirmPassword=1234@Test
#    Wait Until Element Is Visible    css=${msg_campo_invalido}
#   Element Should Be Visible    css=${msg_campo_invalido}
#   Capture Page Screenshot
#   Capture Element Screenshot    css=${msg_campo_invalido}
#    Fechar Navegador

#TC04 - Realizar Novo Cadastro de Usuário sem preencher campos obrigatórios
#   Preencher Form de Cadastro de Usuario
#   ...    fullName=
#   ...    email=
#    ...    cpf=
#    ...    password=
#    ...    confirmPassword=
#    Wait Until Element Is Visible    css=${msg_campo_invalido}
#    Element Should Be Visible    css=${msg_campo_invalido}
#    Capture Page Screenshot
#    Fechar Navegador

TC05 - Lista de Cadastro de Usuários com Sucesso
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}    timeout=50s
    Element Should Be Visible    ${div_cadastros}
    Sleep    5s 
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    ${btn_usuarios} 
    Click Element    ${btn_usuarios}
    Sleep    5s
    Wait Until Element Is Visible    css=${listagem}    timeout=50s
    Element Should Be Visible    css=${listagem}
    Capture Page Screenshot
    Capture Element Screenshot    css=${listagem}
    Fechar Navegador
    
TC08 - Lista de Cadastro de Aluno com Sucesso
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}    timeout=50s
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    css=${btn_aluno}
    Click Element    css=${btn_aluno}
    Sleep    3s
    Wait Until Element Is Visible    css=${listagem}    timeout=50s
    Capture Page Screenshot
    Capture Element Screenshot    css=${listagem}
    Fechar Navegador

TC09 - Lista de Empresas com Sucesso
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}    timeout=50s
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    css=${btn_empresas}
    Click Element    css=${btn_empresas}
    Sleep    3s
    Wait Until Element Is Visible    css=${listagem}    timeout=50s
    Capture Page Screenshot
    Capture Element Screenshot    css=${listagem}
    Fechar Navegador

TC10 - Realizar Cadastro de Aluno com Sucesso
    ${client}    Get Fake Client
    Preencher Form de Cadastro de Aluno    
    ...    nomeCompleto=${client}[name]    
    ...    dataNascimento=${client}[birthday] 
    ...    email=${client}[email]    
    ...    telefone=${client}[phone]    
    ...    cargo=Analista    
    ...    rg=${client}[rg]    
    ...    cpf=${client}[cpf]     
    ...    cep=${client}[zipCode]     
    ...    pais=BR     
    ...    cidade=${client}[city]     
    ...    estado=${client}[state]     
    ...    bairro=${client}[neighborhood]     
    ...    rua=${client}[street]     
    ...    numero=${client}[number]     
    ...    complemento=APT
    Capture Page Screenshot
    Fechar Navegador 
    
*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless")
    Maximize Browser Window

Fechar Navegador
    Close Browser

Realizar Login
    [Documentation]    Keyword utilizada para realizar login, é obrigatório 2 argumentos: [email] e [senha]
    [Arguments]    ${email}    ${senha}
    Abrir Navegador
    Input Text    css=${input_email}    ${email}
    Input Text    css=${input_senha}    ${senha}
    Click Button    css=${btn_entrar}

Preencher Form de Cadastro de Usuario
    [Documentation]    Keyword Utilizada para preencher o formulario de cadastro de um novo usuario
    [Arguments]       
    ...    ${fullName}    
    ...    ${email}        
    ...    ${cpf}    
    ...    ${password}    
    ...    ${confirmPassword}
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    ${btn_usuarios}
    Click Element    ${btn_usuarios}
    Wait Until Element Is Visible    ${btn_novo_cadastro}
    Element Should Be Visible    ${btn_novo_cadastro}
    Click Button    ${btn_novo_cadastro}
    Input Text    css=${input_fullName}    ${fullName}
    Input Text    css=${input_mail_user}    ${email}
    Select From List By Label    ${accessProfile}    Administrador
    Input Text    css=${input_cpf}    ${cpf}
    Input Text    css=${input_password}    ${password}
    Input Text    css=${input_confirmPassword}    ${confirmPassword}
    Click Element    css=${btn_save}

Realizar cadastro de empresa
    [Documentation]       Keyword usada para realizar cadastro de uma empresa
    [Arguments]    ${razaoSocial}    ${nomeFantasia}    ${emailCompany}    ${cnpj}    ${telefone}    ${descricaoServico}    ${nomeResponsavel}    ${cep}    ${pais}    ${cidade}    ${estado}    ${bairro}    ${rua}    ${numeroImovel}    ${complemento}    
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    css=${btn_empresas}
    Click Element    css=${btn_empresas}
    Wait Until Element Is Visible    ${lista_empresas}    timeout=30s 
    Click Button    css=${btn_novoCadastro}
    Wait Until Element Is Visible    ${form_cadastro}
    Input Text    css=${input_razaoSocial}    ${razaoSocial}
    Input Text    css=${input_nomeFantasia}    ${nomeFantasia}
    Input Text    css=${input_emailCompany}     ${emailCompany} 
    Input Text    css=${input_cnpj}      ${cnpj}
    Input Text    css=${input_telefoneEmpresa}     ${telefone}  
    Input Text    css=${input_descricaoServico}      ${descricaoServico}
    Input Text    css=${input_nomeResponsavel}     ${nomeResponsavel} 
    Input Text    css=${input_cep}     ${cep}
    Input Text    css=${input_pais}     ${pais}
    Input Text    css=${input_cidade}     ${cidade}
    Input Text    css=${input_estado}     ${estado}
    Input Text    css=${input_bairro}     ${bairro}
    Input Text    css=${input_rua}     ${rua} 
    Input Text    css=${input_numeroImovel}     ${numeroImovel}
    Input Text    css=${input_complemento}     ${complemento} 
    Click Button    css=${btn_save}

Preencher Form de Cadastro de Aluno
    [Documentation]       Keyword usada para realizar cadastro de um novo aluno
    [Arguments]    ${nomeCompleto}    ${dataNascimento}    ${email}    ${telefone}    ${cargo}    ${rg}    ${cpf}    ${cep}    ${pais}    ${cidade}    ${estado}    ${bairro}    ${rua}    ${numero}    ${complemento}
    Realizar Login    email=sysadmin@qacoders.com     senha=1234@Test
    Wait Until Element Is Visible    ${div_cadastros}    timeout=50s
    Click Element    ${div_cadastros}
    Wait Until Element Is Visible    css=${btn_aluno}
    Click Element    css=${btn_aluno}
    Wait Until Element Is Visible    css=${listagem}
    Click Button    ${btn_novo_cadastro}
    #Wait Until Element Is Visible    css=${form_cadastro}    timeout=30s
    Input Text    css=${input_fullName}    ${nomeCompleto}
    Input Text    css=${input_dataNascimento}    ${dataNascimento}
    Input Text    css=${input_mail_user}    ${email}
    Input Text    css=${input_telefone}    ${telefone}
    Input Text    css=${input_cargo}    ${cargo}
    Input Text    css=${input_rg}    ${rg}
    Input Text    css=${input_cpf}     ${cpf}
    Input Text    css=${input_cep}    ${cep}
    Input Text    css=${input_pais}    ${pais}
    Input Text    css=${input_cidade}    ${cidade}
    Input Text    css=${input_estado}    ${estado}
    Input Text    css=${input_bairro}     ${bairro}
    Input Text    css=${input_rua}    ${rua}
    Input Text    css=${input_numeroImovel}     ${numero}
    Input Text    css=${input_complemento}     ${complemento}
    Click Button    css=${btn_save}