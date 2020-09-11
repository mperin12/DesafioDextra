*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Abre Navegador
Test Teardown     Fecha Navegador

*** Test Case ***
Teste 001: Validar e-mail ja cadastrado
    Conferir Home Page Exibida
    Acessar Cadastre-se
    Preencher Cadastro com email existente

Teste 002: Validar senha Fraca
    Conferir Home Page Exibida
    Acessar Cadastre-se
    Validar Senha Fraca

Teste 003: Inserir CPF invalido
    Conferir Home Page Exibida
    Acessar Cadastre-se
    Validar CPF invalido

Teste 004: Realizar Cadastro Correto
    Conferir Home Page Exibida
    Acessar Cadastre-se
    Realizar Cadastro Correto: "QATesteMarcelo22@hotmail.com", "23488505081"

Teste 005: Logar e Adicionar Produtos a Cesta de Compras
    Conferir Home Page Exibida
    Realizar Login: "QATesteMarcelo22@hotmail.com", Senha: "12QA3456271"
    Busca Produto: "Moto G6"
    Adiciona produto ao Carrinho
