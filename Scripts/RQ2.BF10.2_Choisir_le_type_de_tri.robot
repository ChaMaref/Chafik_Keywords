*** Settings ***
Library    SeleniumLibrary
Variables    ../Ressources/Locators/Locators_Type_de_Tri.py
Resource    ../Ressources/Keywords/Keywords_Type_de_Tri.robot
*** Variables ***
${vURL}    http://localhost:8987/share/page/ 
${vBrowser}    chrome
${vUsername}    6191756
${vPassword}    12345678
${TIMEOUT}    5s
${vOptionDeTri}    Type MIME   
${lien_Originale}    Nom 
    
*** Test Cases ***
Test RQ2.BF10.2 Choisir le type de tri 
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Choisir le type de tri    Type MIME    Nom
    Logout 
*** Keywords ***
