#!/bin/bash

command=$1

#clone 
if [ "$command" = "clone" ]; then
    echo [INFO]: Skrypt mozna zaktualizowac poleceniem update
    echo
    echo [CLONE] Klonowanie repozytorium
    git clone https://github.com/Jacobsky98/Jakub-Salamon--narzedzia-do-debugowania.git
    rm Jakub-Salamon--narzedzia-do-debugowania/run_salamon_jakub.sh
    cp run_salamon_jakub.sh Jakub-Salamon--narzedzia-do-debugowania/run_salamon_jakub.sh
    cd Jakub-Salamon--narzedzia-do-debugowania
    exec bash
fi

if [ "$command" = "run" ]; then
    echo [INFO]: Skrypt mozna zaktualizowac poleceniem update
    echo
    echo [RUN]: Uruchamianie dockera
    echo W przypadku trudnosci nalezy uruchomić :
    echo sudo groupadd docker
    echo sudo usermod -aG docker \$USER
    echo sudo chown \"\$USER\":\"\$USER\" /home/\"\$USER\"/.docker -R
    echo sudo chmod g+rwx \"/home/\$USER/.docker\" -R
    echo newgrp docker
    echo 
    echo 
    echo [RUN]: zadania znajdują się w zadania/
    echo [RUN]: tresci zadan znajduja sie w komentarzach w plikach main.cpp
    docker build -t jakubsalamon:1.0 .
    docker run -it jakubsalamon:1.0
fi

if [ "$command" = "clean" ]; then
    echo [INFO]: Skrypt mozna zaktualizowac poleceniem update
    echo
    if [[ ! -d "Jakub-Salamon--narzedzia-do-debugowania" ]]
    then
        echo [CLEAN]: Obecny katalog to Jakub-Salamon--narzedzia-do-debugowania
        cd .. 
    fi
    echo [CLEAN]: usuwanie katalogu Jakub-Salamon--narzedzia-do-debugowania
    rm -rf Jakub-Salamon--narzedzia-do-debugowania
    docker ps -a -q -f status=exited | xargs docker rm
    docker rmi jakubsalamon:1.0 
    docker rmi debian
fi




if [ "$command" = "update" ]; then
    
    wget http://www.perfectmotors.pl/update_ws_jakub_salamon.zip
    unzip update_ws_jakub_salamon.zip
    chmod +x run_salamon_jakub_new.sh
    echo [INFO]: Nowy skrypt znajduje sie pod nazwa run_salamon_jakub_new.sh
    ./run_salamon_jakub_new.sh info
fi
