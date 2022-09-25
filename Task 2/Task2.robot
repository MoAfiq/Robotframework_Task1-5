*** Settings ***
Library	SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Keywords ***
Login To Deriv
	Open Browser	https://app.deriv.com/	Chrome
	Maximize Browser Window
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button    
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']     putyouremailhere@besquare.com.my
    Input Text    //input[@type='password']    putyouremailhere@besquare.com.my
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@id='dt_core_account-info_acc-info'] 
    Page Should Contain Element    //div[contains(@id, "dt_CR")]
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    Click Element    //div[@class='dc-content-expander__content'] 
    Page Should Contain Element    //div[contains(@id, "dt_VRTC")]


*** Test Cases ***
Buy Rise Contract
    Login To Deriv
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //button[@id="dc_t_toggle_item"]
    Click Element    //input[@id="dt_amount_input"]
    Clear Element Text    //input[@id="dt_amount_input"]
    Input Text    //input[@id="dt_amount_input"]    clear=true    text=''    
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //button[@id="dt_purchase_call_button"]





    
  
