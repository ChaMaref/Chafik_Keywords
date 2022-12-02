*** Settings ***
Library    SeleniumLibrary
Variables    ../Ressources/Locators/Locators_Wiki.py
Resource    ../Ressources/Keywords/Keywords_Wiki.robot
*** Variables ***
${vURL}    http://localhost:8987/share/page/ 
${vBrowser}    chrome
${vUsername}    6191756
${vPassword}    12345678
${TIMEOUT}    5s
${vNomDuSite}    Site RNS510
${vNomPageWiki}    Page Wiki
*** Test Cases ***
Test creer une page Wiki
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Créer une nouvelle page Wiki    Site RNS510    Page Wiki 
    Logout 



*** Keywords ***
