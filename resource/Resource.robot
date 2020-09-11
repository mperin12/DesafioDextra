*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${URL}                      https://www.americanas.com.br/
${BROWSER}                  chrome

*** Keywords ***
Abre Navegador
    Open Browser            ${URL}  ${BROWSER}  options=add_argument("--start-maximized")

Fecha Navegador
    Close Browser

Conferir Home Page Exibida
    Title Should Be         Americanas - Tudo. A toda hora. Em qualquer lugar.

Acessar Cadastre-se
    Click Element           //*[@id="h_usr-link"]/span[2]
    Sleep                   2s
    Click Element           //*[@id="h_user"]/span[2]/div/a[2]
    Sleep                   2s
    Page Should Contain Element  //*[@id="root"]/div/div[2]/h2/span
    Page Should Contain Element  //*[@id="icon-user-wrapper"]

Preencher Cadastro com email existente
    Input Text              //*[@id="email-input"]       teste@hotmail.com
    Input Text              //*[@id="password-input"]    QASenha121520
    Input Text              //*[@id="cpf-input"]         36843795064
    Input Text              //*[@id="name-input"]        QAT Teste
    Input Text              //*[@id="birthday-input"]    10071994
    Click Element           //*[@id="gender"]/div[1]/label
    Input Text              //*[@id="phone-input"]       41996909090
    Click Element           //*[@id="root"]/div/div[2]/form/button
    Sleep                   60s
    Page Should Contain Element  //*[@id="email"]/div

Validar Senha Fraca
    Input Text              //*[@id="email-input"]       QATesteMarcelo22@hotmail.com
    Input Text              //*[@id="password-input"]    12
    Input Text              //*[@id="cpf-input"]         36843795064
    Input Text              //*[@id="name-input"]        QAT Teste
    Input Text              //*[@id="birthday-input"]    10071994
    Click Element           //*[@id="gender"]/div[1]/label
    Input Text              //*[@id="phone-input"]       41996909090
    Click Element           //*[@id="root"]/div/div[2]/form/button
    Sleep                   60s
    Page Should Contain Element  //*[@id="password"]/div[2]

Validar CPF invalido
    Input Text              //*[@id="email-input"]       QATesteMarcelo22@hotmail.com
    Input Text              //*[@id="password-input"]    12QA3456271
    Input Text              //*[@id="cpf-input"]         17058798000
    Input Text              //*[@id="name-input"]        QAT Teste
    Input Text              //*[@id="birthday-input"]    10071994
    Click Element           //*[@id="gender"]/div[1]/label
    Input Text              //*[@id="phone-input"]       41996909090
    Click Element           //*[@id="root"]/div/div[2]/form/button
    Sleep                   60s
    Page Should Contain Element  //*[@id="cpf"]/div

Valida login com sucesso
    Title Should Be         Americanas - Tudo. A toda hora. Em qualquer lugar.
    Click Element           //*[@id="h_usr-link"]/span[2]
    Sleep                   2s
    Page Should Contain Element  //*[@id="h_user"]/span[2]/div/ul/li[1]/a
    Click Element           //*[@id="h_user"]/span[2]/div/ul/li[1]/a
    Sleep                   2s
    Page Should Contain Element  //*[@id="root"]/div/header/div/h1
    Click Element           //*[@id="brd-link"]

Realizar Cadastro Correto: "${email}", "${CPF}"
    Input Text              //*[@id="email-input"]       ${email}
    Input Text              //*[@id="password-input"]    12QA3456271
    Input Text              //*[@id="cpf-input"]         ${CPF}
    Input Text              //*[@id="name-input"]        QAT Teste
    Input Text              //*[@id="birthday-input"]    10071994
    Click Element           //*[@id="gender"]/div[1]/label
    Input Text              //*[@id="phone-input"]       41996909090
    Click Element           //*[@id="root"]/div/div[2]/form/button
    Sleep                   60s
    Valida login com sucesso

Realizar Login: "${email}", Senha: "${senha}"
    Click Element           //*[@id="h_user"]/span[1]/div
    Sleep                   2s
    Click Element           //*[@id="h_usr-signin"]
    Sleep                   2s
    Page Should Contain Element  //*[@id="root"]/div/div[2]/h1/span
    Input Text              //*[@id="email-input"]       ${email}
    Input Text              //*[@id="password-input"]    ${senha}
    Click Element           //*[@id="login-button"]
    Sleep                   60s
    Valida login com sucesso

Busca Produto: "${produto}"
    Input Text              //*[@id="h_search-input"]    ${produto}
    Click Element           //*[@id="h_search-btn"]
    Sleep                   5s
    Page Should Contain Element  //*[@id="content-middle"]/div[1]/div/div/h1
    Page Should Contain Image  //*[@id="content-middle"]/div[6]/div/div/div/div[1]/div[2]/div/div[2]/a/section/div[1]/div/div/picture/img

Adiciona produto ao Carrinho
    Click Image             //*[@id="content-middle"]/div[6]/div/div/div/div[1]/div[2]/div/div[2]/a/section/div[1]/div/div/picture/img
    Sleep                   5s
    Page Should Contain Element  //*[@id="image-gallery-product"]/div[1]/div/div[1]/div[1]/div/div[1]/div/div/div/div[1]/div/img
    Page Should Contain Element  //*[@id="btn-buy"]
    Click Element           //*[@id="btn-buy"]
    Sleep                   5s
    Page Should Contain Element  //*[@id="content"]/div/div/main/div[2]/div/div/div[1]/div/div[1]/div/div[1]/div/img
    Page Should Contain Element  //*[@id="content"]/div/div/main/div[2]/div/div/div[1]/div/div[1]/div/div[2]/span[1]
    Page Should Contain Element  //*[@id="content"]/div/div/main/div[2]/div/div/div[1]/div/div[2]/div/div[1]/div
    Click Element           //*[@id="btn-continue"]
    Sleep                   5s
    Page Should Contain Element  //*[@id="app"]/section/section/header/h2
    Page Should Contain Element  //*[@id="app"]/section/section/div[2]/div/h3
    Page Should Contain Element  //*[@id="app"]/section/section/div[2]/div/div[1]/div
