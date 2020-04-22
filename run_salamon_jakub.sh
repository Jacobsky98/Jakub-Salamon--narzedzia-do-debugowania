#!/bin/bash

command=$1

#clone
if [ "$command" = "clone" ]; then
    echo [CLONE] Klonowanie repozytorium
    git clone https://github.com/Jacobsky98/Jakub-Salamon--narzedzia-do-debugowania.git
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
        echo [CLEAN]: Obecny katalog to Jakub-Salamon--narzedzia-do-debuggowania
        cd .. 
    fi
    echo [CLEAN]: usuwanie katalogu Jakub-Salamon--narzedzia-do-debuggowania
    rm -rf Jakub-Salamon--narzedzia-do-debuggowania
fi


if [ "$command" = "solution" ]; then
    wget http://www.perfectmotors.pl/solution_jakub_salamon.zip
    unzip solution_jakub_salamon.zip
fi
