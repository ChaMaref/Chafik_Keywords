*** Settings ***
Documentation    
Library    SeleniumLibrary
Library    Collections
Variables    ../Locators/Locators_Wiki.py
Resource    ../Keywords/Keywords_Wiki.robot


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

Créer une nouvelle page Wiki
    [Arguments]    ${vNomDuSite}    ${vNomPageWiki}
# Cliquer sur le lien Sites pour ouvrir son menu
    Sleep    2s
    Click Element    ${link_Sites_Menu}
    
# Cliquer sur le lien Mes sites pour afficher mes sites disponible
    Sleep    2    
    Click Element    ${lien_Mes_Sites}
    Element Should Contain    ${lbl_Title}    Listes des sites
     
# Cliquer sur le lien "Site de test" qui va afficher le site pris en exemple 
    Sleep    2
    Click Element    ${lien_Nom_du_site1}${vNomDuSite}${lien_Nom_du_site2}
    Sleep    2
    Click Element    ${lien_Wiki}
   
# Permet d'afficher le formulaire qui permet de créer une nouvelle page Wiki
    Click Button    ${btn_Nouvelle_Page}
    
# Remplir le formulaire
    Input Text    ${mettre_Le_Titre}    ${vNomPageWiki}
    
# Enregistrer le formulaire de création de la page Wiki
    Click Button    ${btn_Save}
    Sleep    2
    Element Should Contain    ${page_Wiki}    ${vNomPageWiki}
# Suprimer la nouvelle page Wiki
    Click Element    ${btn_Remove}
    Click Element    ${btn_Confirm} 
    Sleep    1
    Element Should Not Contain    ${lien_Wiki}    ${vNomPageWiki}   

    

    
