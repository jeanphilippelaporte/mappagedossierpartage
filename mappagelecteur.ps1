function newpsdrive()
    {
    net use
    $namemappage=Read-Host "Saisir la lettre du partage"
    $cheminpartage=Read-Host "Saisir le chemin réseau du partage"
    $idcredential=Read-Host "Saisir l'identifiant du partage distant"
    net use $namemappage':' $cheminpartage /user:$idcredential
    net use
    }

function retirermappage()
    {
    net use
    $namemappage=Read-Host "Saisir la lettre du lecteur à enlever"
    net use $namemappage /delete
    net use
    }


function problemuac()
    {
    Write-Host "Attention l'ordinateur va redemarrer apres le lancement de la modification , Veuillez fermer toutes vos applications"
    pause
    Set-GPPrefRegistryValue -context User  -key HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows/CurrentVersion/Policies/System -ValueName EnableLinkedConnections -value 1 -type DWord -Action Create
    shutdown -r -t 0
    }


function menu()
    {
    clear-host
    write-host 
    "     ********** TEST MAPPAGE LECTEUR *************
     *                                 *
     ***********************************"
    Write-Host "1: mappage lecteur réseau ?"
    Write-Host "2: enlever lecteur réseau ?"
    Write-Host "3: probleme affichage UAC ?"
    Write-Host "Q: Quitter le script ?"
    $choix=Read-Host "Votre choix ?"
    switch ($choix)
        {
            1 {newpsdrive;pause;menu}
            2 {retirermappage;pause;menu}
            3 {problemuac;pause;menu}
            Q {exit}
            default {menu}
        }
    }
    menu



