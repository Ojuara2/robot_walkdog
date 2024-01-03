*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    smoke
    
    ${dog_walker}        Create Dictionary    
    ...    name=Pablo de Araujo
    ...    email=pablo@hotmail.com
    ...    cpf=00000014141
    ...    cep=25645343
    ...    street=Estrada da Independência
    ...    district=Independência
    ...    city_uf=Petrópolis/RJ
    ...    number=1000
    ...    details=Casa 30
    ...    cnh=toretto.jpg
    
    Go to signup page
    Fill signup form       ${dog_walker}
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.

    
Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv    

    ${dog_walker}        Create Dictionary    
    ...    name=Pablo de Araujo
    ...    email=pablo@hotmail.com
    ...    cpf=000000141aa
    ...    cep=25645343
    ...    street=Estrada da Independência
    ...    district=Independência
    ...    city_uf=Petrópolis/RJ
    ...    number=1000
    ...    details=Casa 30
    ...    cnh=toretto.jpg
    
    Go to signup page
    Fill signup form       ${dog_walker}
    Submit signup form
    Alert should be    expected_text=CPF inválido
  

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    # ${dog_walker}        Create Dictionary    
    # ...    name=Pablo de Araujo
    # ...    email=pablo@hotmail.com
    # ...    cpf=00000014141
    # ...    cep=25645343
    # ...    street=Estrada da Independência
    # ...    district=Independência
    # ...    city_uf=Petrópolis/RJ
    # ...    number=1000
    # ...    details=Casa 30
    # ...    cnh=toretto.jpg
    
    Go to signup page
    # Fill signup form       ${dog_walker}
    Submit signup form

    Alert should be        Informe o seu nome completo
    Alert should be        Informe o seu melhor email
    Alert should be        Informe o seu CPF
    Alert should be        Informe o seu CEP
    Alert should be        Informe um número maior que zero
    Alert should be        Adcione um documento com foto (RG ou CHN)

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary    
    ...    name=Dominic Toretto
    ...    email=toretto@gmail.com
    ...    cpf=00000014141
    ...    cep=25645343
    ...    street=Estrada da Independência
    ...    district=Independência
    ...    city_uf=Petrópolis/RJ
    ...    number=1000
    ...    details=Casa 30
    ...    cnh=toretto.jpg
    
    Go to signup page
    Fill signup form       ${dog_walker}
    Additional service      Cuidar
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary    
    ...    name=Araujo Pablo
    ...    email=araujo@yahoo.com
    ...    cpf=00000014141
    ...    cep=25645343
    ...    street=Estrada da Independência
    ...    district=Independência
    ...    city_uf=Petrópolis/RJ
    ...    number=1000
    ...    details=Casa 30
    ...    cnh=toretto.jpg
    
    Go to signup page
    Fill signup form       ${dog_walker}
    Additional service      Adestrar
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.





 



  