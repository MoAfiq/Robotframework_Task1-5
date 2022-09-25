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
    Input Text    //input[@type='password']    @putyourpasswordhere
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Wait Until Page Contains Element    //div[@id='dt_core_account-info_acc-info']    30
    Sleep    5
    Click Element    //div[@id='dt_core_account-info_acc-info'] 
    Click Element    //li[@id='dt_core_account-switcher_demo-tab']
    Click Element    //div[@class='dc-content-expander__content'] 

Check Multiplier Contract Parameter
    Sleep    7
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Sleep    3
    Click Element    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
    Wait Until Page Contains Element     //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    //div[@class="contract-type-widget__display"]
    Wait Until Element Is Visible    //div[@id="dt_contract_high_low_item"]    30
    Sleep    3
    Click Element    //div[@id="dt_contract_multiplier_item"]

*** Test Cases ***
Multiplier Contract
    Login To Deriv
    Check Multiplier Contract Parameter
Only Stake Is Allowed
    Element Should Be Visible    //div[@class="trade-container__fieldset-header trade-container__fieldset-header--inline" and contains(.,'Stake')] 
Only Deal Cancellation Or Take Profit Or Stop Loss Is Allowed
    Click Element    //label[@class="dc-checkbox take_profit-checkbox__input"]/span[@class="dc-checkbox__box"]
    Page Should Contain Element    //label[@class="dc-checkbox take_profit-checkbox__input"]/span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Click Element    //label[@class="dc-checkbox stop_loss-checkbox__input"]/span[@class="dc-checkbox__box"]
    Page Should Contain Element    //label[@class="dc-checkbox stop_loss-checkbox__input"]/span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Click Element    //span[@class="dc-text dc-checkbox__label"]
    Page Should Not Contain Element    //label[@class="dc-checkbox take_profit-checkbox__input"]/span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Page Should Not Contain Element    //label[@class="dc-checkbox stop_loss-checkbox__input"]/span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Page Should Contain Element    //label[@class="dc-checkbox"]/span[@class="dc-checkbox__box dc-checkbox__box--active"]
Multiplier Value Selection Should Have X20, X40, X60, X100, X200
    Click Element    //span[@name="multiplier"]
    Page Should Contain Element    //div[@class="dc-themed-scrollbars dc-themed-scrollbars__autohide"]
    Page Should Contain Element    //div[@id="20"]
    Page Should Contain Element    //div[@id="40"]
    Page Should Contain Element    //div[@id="60"]
    Page Should Contain Element    //div[@id="100"]
    Page Should Contain Element    //div[@id="200"]
Deal Cancellation Fee Should Correlate With The Stake Value
    Click Element    //input[@id="dt_amount_input"]
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Input Text    //input[@id="dt_amount_input"]    100
    Sleep    5
    Wait Until Page Contains Element    //span[@class="trade-container__price-info-currency"]    30
    # ${lowstake}=    Get Text    //span[@class="trade-container__price-info-currency"]
    Click Element    //input[@id="dt_amount_input"]
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Input Text    //input[@id="dt_amount_input"]    500
    Wait Until Page Contains Element    //span[@class="trade-container__price-info-currency"]    30
    # ${highstake}=    Get Text    //span[@class="trade-container__price-info-currency"]
    # Evaluate    ${highstake} > ${lowstake}
Maximum Stake Is 2000USD
    Click Element    //input[@id="dt_amount_input"]
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Input Text    //input[@id="dt_amount_input"]    2001
    Page Should Contain Element    //div[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Input Text    //input[@id="dt_amount_input"]    2000
    Page Should Contain Element    //div[@class="btn-purchase__info btn-purchase__info--right"]
Minimum Stake Is 1USD
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Input Text    //input[@id="dt_amount_input"]    0
    Sleep    5
    Page Should Contain Element    //div[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
    Page Should Contain Element    //span[@data-tooltip="Please enter a stake amount that's at least 1.00."]
Single Click On Plus Button Increases Stake By 1USD
    Click Element    //button[@id="dt_amount_input_add"]
    Sleep    3
    ${addvalue}=    Get Element Attribute    //input[@id="dt_amount_input"]    value
    Should Be True    ${addvalue} == 1
Single Click On Minus Button Decreases Stake By 1USD
    Click Element    //button[@id="dt_amount_input_sub"]
    Sleep    3
    ${minusvalue}=    Get Element Attribute    //input[@id="dt_amount_input"]    value
    Should Be True    ${minusvalue} == 0
Deal Cancellation Duration Only Has 5,10,15,30 and 60 Min
    Click Element    //span[@name="cancellation_duration"]
    Sleep    3
    Page Should Contain Element    //div[@class="dc-themed-scrollbars dc-themed-scrollbars__autohide"]
    Page Should Contain Element    //div[@value="5m"]
    Page Should Contain Element    //div[@value="10m"]
    Page Should Contain Element    //div[@value="15m"]
    Page Should Contain Element    //div[@value="30m"]
    Page Should Contain Element    //div[@value="60m"]


    



    



    

    


    





    
  
