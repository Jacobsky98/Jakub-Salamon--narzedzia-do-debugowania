#!/bin/sh
test=$1

    cd lib
    g++ -c mgmres.cpp
    cd ..
    rm ./a.out
    g++ main.cpp lib/*.o -lm 
    ./a.out
    rm map*.txt wektor*.txt testowa*.txt

if [ "$test" = "test" ]; then
    rm heaptrack*
    heaptrack ./a.out
    heaptrack --analyze heaptrack.a.out.* > wynik2.txt
    tail -1 wynik2.txt > wynik.txt
    rm wynik2.txt
    
    diff -q wynik.txt ../../test/wynik1.txt  >/dev/null
    comp_value=$?

    if [ $comp_value -eq 1 ]
    then
        echo ""
        echo ""
        echo ""
        echo "Zadanie zostalo zle rozwiazane"
        echo ""
    else
        echo ""
        echo ""
        echo ""
        echo "Zadanie zostalo dobrze rozwiazane"
        echo ""
    fi
fi
rm *.txt

