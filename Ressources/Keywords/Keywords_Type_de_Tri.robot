*** Settings ***
Documentation    
Library    SeleniumLibrary
Library    Collections
Variables    ../Locators/Locators_Type_de_Tri.py
Resource    ../Keywords/Keywords_Type_de_Tri.robot


*** Keywords ***
Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    # vUsername contient le login
    # vPassword contient le mot de passe
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}    
    # Definir la valeur de timeout pour le cas de test
    #Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe
    Input text    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button    //button[@id='page_x002e_components_x002e_slingshot-login_x0023_default-submit-button']
    # S'assurer que la page est chargee
    Wait Until Element Is Visible    ${lblTitle}
    # S'assurer que l'utilisateur est connecte et que le tableau de bord est affiche
    Element Should Contain    ${lblTitle}    Tableau de bord de
Logout
    # Se deconnecter et fermer le navigateur
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    [Teardown]    Close Browser

Choisir le type de tri    
    [Arguments]    ${vOptionDeTri}    ${lien_Originale}
     Click Element    ${lien_Fichiers_Partagés} 
     Element Should Contain    ${lblTitle}    Fichiers partagés
     Sleep    2
#Cliquer sur le bouton tri
    Click Button    ${lien_Btn_Tri}
    Sleep    2
#Cliquer sur l'option voulue
    Click Element    ${lien_Option_Choisie1}${vOptionDeTri}${lien_Option_Choisie2}
    Sleep    2
#Revenir a l'option originale
    Click Button    ${btn_Tri1}${vOptionDeTri}${btn_Tri2}
    Click Element    ${lien_Option_Originale1}${lien_Originale}${lien_Option_Originale2}
    Sleep    2
    
