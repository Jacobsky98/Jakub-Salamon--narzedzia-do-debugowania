#!/bin/bash

command=$1

#clone
if [ "$command" = "clone" ]; then
    echo [CLONE] Klonowanie repozytorium
    git clone https://github.com/Jacobsky98/Jakub-Salamon--narzedzia-do-debugowania.git
    cd Jakub-Salamon--narzedzia-do-debugowania
    chmod +x run_salamon_jakub.sh
fi

if [ "$command" = "run" ]; then
    echo [RUN]: zadania znajdują się w zadania/
    echo [RUN]: tresci zadan znajduja sie w komentarzach w plikach main.cpp
    docker build -t jakubsalamon:1.0 .
    docker run -it jakubsalamon:1.0
fi

if [ "$command" = "clean" ]; then
    if [[ ! -d "Jakub-Salamon--narzedzia-do-debugowania" ]]
    then
        echo [CLEAN]: Obecny katalog to Jakub-Salamon--narzedzia-do-debugowania
        cd .. 
    fi
    echo [CLEAN]: usuwanie katalogu Jakub-Salamon--narzedzia-do-debugowania
    rm -rf Jakub-Salamon--narzedzia-do-debugowania
fi



