@ECHO OFF
SETLOCAL EnableDelayedExpansion
TITLE Simple CRM - Ultimate Optimizer v6.0
COLOR 1F

:: ==============================================================================
:: 1. LOGGING SETUP
:: ==============================================================================
set "LOGFILE=%USERPROFILE%\Desktop\SimpleCRM_Log.txt"
echo JOURNAL D'OPTIMISATION SIMPLE CRM > "%LOGFILE%"
echo Date : %DATE% %TIME% >> "%LOGFILE%"
echo ------------------------------------------------ >> "%LOGFILE%"

:: ==============================================================================
:: 2. VERIFICATION ADMIN
:: ==============================================================================
net session >nul 2>&1
if %errorLevel% == 0 goto :ADMIN_OK

cls
COLOR 4F
echo.
echo  #####################################################################
echo  #                                                                   #
echo  #           ERREUR CRITIQUE : DROITS ADMINISTRATEUR REQUIS          #
echo  #                                                                   #
echo  #####################################################################
echo.
echo  Ce script modifie les reglages profonds de Windows (DNS, Priorite).
echo  Il ne peut pas fonctionner en mode standard.
echo.
echo  [SOLUTION] :
echo  Fermez cette fenetre, faites un CLIC-DROIT sur le fichier
echo  et choisissez "Executer en tant qu'administrateur".
echo.
pause
exit

:ADMIN_OK
:: ==============================================================================
:: 3. MENU PRINCIPAL
:: ==============================================================================
:MENU
cls
COLOR 0B
echo.
echo  ==============================================================================
echo   SIMPLE CRM - OPTIMISATION PERFORMANCE (v6.0 PRO)
echo   https://simple-crm.ai
echo  ==============================================================================
echo.
echo   [1] LANCER L'OPTIMISATION (Requiert acceptation des termes)
echo   [2] QUITTER
echo.
echo   [3] FAQ : EXPLICATIONS TECHNIQUES
echo   [4] DISCLAIMER COMPLET : MENTION JURIDIQUE
echo.
echo  ==============================================================================
set /p choix="> VOTRE CHOIX : "

if "%choix%"=="1" goto :TERMS_CHECK
if "%choix%"=="2" exit
if "%choix%"=="3" goto :FAQ
if "%choix%"=="4" goto :LEGAL
goto :MENU

:FAQ
cls
echo.
echo  ==============================================================================
echo   FAQ - COMPRENDRE LES OPTIMISATIONS
echo  ==============================================================================
echo.
echo   1. DNS CLOUDFLARE (1.1.1.1) :
echo      Reduit la latence de resolution des noms de domaine. Cloudflare est 
echo      actuellement le resolveur le plus rapide au monde.
echo.
echo   2. MTU (MAXIMUM TRANSMISSION UNIT) :
echo      Definit la taille maximale des paquets de donnees. Le reglage sur 1500
echo      evite la fragmentation et optimise les flux Fibre/Cable.
echo.
echo   3. TCP AUTOTUNING :
echo      Optimise la fenetre de reception des donnees Windows pour eviter le
echo      bridage de bande passante sur les applications Web.
echo.
echo   4. ZERO-COPY GASTERIZATION ^& GPU :
echo      Force Chrome a utiliser la carte graphique pour le rendu des pages,
echo      liberant le processeur pour les calculs de donnees CRM.
echo.
echo   5. PRIORITE CPU HAUTE :
echo      Indique a Windows que Chrome doit passer avant les processus de fond.
echo.
pause
goto :MENU

:LEGAL
cls
echo.
echo  ==============================================================================
echo   DISCLAIMER JURIDIQUE COMPLET
echo  ==============================================================================
echo.
echo   L'utilisation de ce script ("le Logiciel") est fournie "en l'etat", 
echo   sans garantie d'aucune sorte, expresse ou implicite. 
echo.
echo   1. EXCLUSION DE RESPONSABILITE : En aucun cas, l'editeur de Simple CRM, 
echo   ses developpeurs ou ayants droit ne pourront etre tenus responsables de 
echo   tout dommage direct, indirect, accessoire ou special (y compris, mais 
echo   sans s'y limiter, la perte de donnees, l'instabilite du systeme ou 
echo   l'interruption d'activite) resultant de l'utilisation de ce script.
echo.
echo   2. RISQUES TECHNIQUES : L'utilisateur reconnait que la modification des 
echo   parametres reseau (MTU/DNS) et CPU peut entrainer des conflits avec 
echo   certains logiciels tiers ou configurations reseau specifiques (VPN).
echo.
echo   3. ACCEPTATION : En lancant l'optimisation, l'utilisateur accepte d'assumer
echo   l'entiere responsabilite des modifications apportees a son systeme.
echo.
pause
goto :MENU

:TERMS_CHECK
cls
echo.
echo  ==============================================================================
echo   AVANT DE CONTINUER...
echo  ==============================================================================
echo.
echo   AVERTISSEMENT : Ce script va modifier des parametres systeme.
echo   Veuillez lire le DISCLAIMER COMPLET [Option 4] avant de valider.
echo.
echo   L'utilisation de cet outil se fait a vos propres risques et perils.
echo   L'editeur se degage de toute responsabilite en cas de dysfonctionnement.
echo.
set /p accept="> Acceptez-vous ces conditions et les risques ? (O/N) : "
if /I "%accept%"=="O" goto :STEP_INTERFACE
goto :MENU

:STEP_INTERFACE
:: ==============================================================================
:: 4. CHOIX INTERFACE (IDENTIQUE AU CODE PRECEDENT)
:: ==============================================================================
cls
echo.
echo  ETAPE 1/6 : SELECTION DU RESEAU
echo  ---------------------------------------------------------
echo  Voici vos connexions actives :
echo.
netsh interface show interface | findstr "Connect"
echo.
echo  ---------------------------------------------------------
echo  Recopiez le nom exact de la colonne "Nom de l'interface"
echo  (Exemple : Ethernet  ou  Wi-Fi)
echo.
set /p interface="> NOM : "

echo Interface Cible : %interface% >> "%LOGFILE%"

:: ==============================================================================
:: 5. EXECUTION LINEAIRE (IDENTIQUE AU CODE PRECEDENT)
:: ==============================================================================

:: --- POWER ---
cls
echo.
echo  [==          ] 10%% - Mode Energie
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >> "%LOGFILE%" 2>&1

:: --- TCP ---
cls
echo.
echo  [====        ] 30%% - Optimisation TCP
netsh interface tcp set global autotuninglevel=normal >> "%LOGFILE%" 2>&1
netsh interface tcp set global rss=enabled >> "%LOGFILE%" 2>&1

:: --- DNS/MTU ---
cls
echo.
echo  [======      ] 50%% - Reseau (%interface%)
netsh interface ip set dns name="%interface%" source=static address=1.1.1.1 >> "%LOGFILE%" 2>&1
netsh interface ip add dns name="%interface%" addr=1.0.0.1 index=2 >> "%LOGFILE%" 2>&1
netsh interface ipv4 set subinterface "%interface%" mtu=1500 store=persistent >> "%LOGFILE%" 2>&1
ipconfig /flushdns >> "%LOGFILE%" 2>&1

:: --- CLEANING ---
cls
echo.
echo  [========    ] 70%% - Nettoyage Chrome
taskkill /F /IM chrome.exe /T >> "%LOGFILE%" 2>&1
timeout /t 2 /nobreak >nul
set "CACHE_DIR=%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
if exist "%CACHE_DIR%" del /q /s "%CACHE_DIR%\*.*" >> "%LOGFILE%" 2>&1

:: --- LAUNCH ---
cls
echo.
echo  [==========  ] 90%% - Lancement Chrome Boost
set FLAGS=--start-maximized --enable-features=ParallelDownloading,GpuRasterization,CanvasOopRasterization,ZeroCopyRasterizer --enable-quic --ignore-gpu-blocklist --disable-background-networking --enable-high-resolution-time
start "" "chrome.exe" %FLAGS%

:: --- CPU ---
cls
echo.
echo  [============] 100%% - Priorite CPU
timeout /t 5 /nobreak >nul
wmic process where name="chrome.exe" CALL setpriority "High Priority" >> "%LOGFILE%" 2>&1

:: ==============================================================================
:: 6. FIN
:: ==============================================================================
cls
COLOR 0A
echo.
echo  ==============================================================================
echo   OPTIMISATION TERMINEE AVEC SUCCES !
echo  ==============================================================================
echo.
echo   Simple CRM est maintenant configure pour une vitesse maximale.
echo.
echo   Un rapport (log) a ete depose sur votre Bureau.
echo.
echo   MERCI D'UTILISER SIMPLE CRM
echo   https://simple-crm.ai
echo  ==============================================================================
pause
exit