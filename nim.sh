echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "||||||||||||||||| Bienvenue dans le jeu de Nim |||||||||||||||||"
echo "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo ""
echo "Chaque joueur devra choisir de 1 à 3 élément"
echo "le dernier gagne la partie !"
echo ""
while true
do
    echo "Combien d'éléments voulez-vous afficher (doit être un multiple de 4) ?"
    read nbItems
    if [ `expr $nbItems % 4` -eq 0 ]
    then
        break
    else
        echo "refaite votre choix"
    fi
done
echo ""
echo -n "vous allez jouer avec ($nbItems) éléments :"
for i in `seq 1 $nbItems`
do
    echo -n "|"
done
echo ""game_running=truewhile [ "$game_running" = true ]
do
    echo ""
    echo ""
    echo "============ Tour du Joueur ============"
    echo "choisissez entre 1 et 3 element."
    read choice
    if [ "$choice" -eq 1 ] || [ "$choice" -eq 2 ] || [ "$choice" -eq 3 ]
    then
        let "nbItems = nbItems - choice"
        echo -n "Il reste ($nbItems) élément :"
        for i in `seq 1 $nbItems`
        do
            echo -n "|"
        done
        echo ""
        echo ""
        echo "========== Tour de l'ordinateur =========="
        let "choiceIA = 4 - choice"
        echo "Il prend $choiceIA élément(s)"
        let "nbItems = nbItems - choiceIA"
        echo -n "Il reste ($nbItems) éléments :"
        for i in `seq 1 $nbItems`
        do
            echo -n "|"
        done
    else
        echo "Retirez seulement entre 1 et 3."
    fi    if [ "$nbItems" -eq 0 ]
    then
        echo ""
        echo "L'IA a saisit le dernier élément !"
        echo "Tu as perdu ! ;)"
        game_running=falses
    fi
done
