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
    Input Text    //input[@type='password']     @putyourpasswordhere
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@id='dt_core_account-info_acc-info'] 
    Page Should Contain Element    //div[contains(@id, "dt_CR")]
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    Click Element    //div[@class='dc-content-expander__content'] 
    Page Should Contain Element    //div[contains(@id, "dt_VRTC")]

Buy Lower Contract
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@class="contract-type-widget__display"]
    Wait Until Element Is Visible    //div[@id="dt_contract_high_low_item"]    30
    Click Element    //div[@id="dt_contract_high_low_item"]
    Click Element    //input[@class="dc-input__field"]
    Press Keys    //input[@class="dc-input__field"]    CTRL+a+BACKSPACE
    Clear Element Text    //input[@class="dc-input__field"]
    Input Text    //input[@class="dc-input__field"]    4
    Click Element    //button[@id="dc_payout_toggle_item"]
    Click Element    //input[@id="dt_amount_input"]
    Press Keys    //input[@id="dt_amount_input"]  CTRL+a+BACKSPACE  
    Clear Element Text    //input[@id="dt_amount_input"]
    Input Text    //input[@id="dt_amount_input"]    15.50
    Wait Until Page Contains Element     //div[@class="purchase-container" and contains(.,'Lower')]    30
    Click Element    //div[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]


*** Test Cases ***
Buy Lower Contract
    Login To Deriv
    Buy Lower Contract





    
  

  
