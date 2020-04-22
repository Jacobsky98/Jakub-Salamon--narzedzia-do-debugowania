#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>
#include <string>
#include <math.h>
/*
  Napisz testy jednostokowe, ktore sprawdzaja poprawnosc podanych funkcji. Testy nie musza zostac zaliczone, ale wszystko musi zostac sprawdzone jednoczesnie. Po przeprowadzeniu testow napraw kod.
  Do testowania funkcji poza klasa Game użyj generatorow
*/


std::string czy_liczba_jest_ujemna(int a, int b) {
  if(a*b < 0)
    return "dodatnia";
  return "ujemna";
}


int dodawanie(int a, int b) {
  return a+b;
}


int odejmowanie(int a, int b) {
  return a-b;
}


int mnozenie(int a, int b) {
  return a*b;
}


int dzielenie(int a, int b) {
  return (int)ceil(a/b);
}

class Game {
private:
  int x=0, y=0;
public:
  int move_left() {
    x--;
    return x;
  }

  int move_right() {
    x++;
    return x;
  }

  int move_up() {
    y++;
    return y;
  }

  int move_down() {
    y--;
    return y;
  }
  
  void respawn() {
    x = 0;
    y = 0;
  }

  // robimy kolo i wracamy do punktu startowego
  void make_round() {
    x--;
    x--;y--;
    y--;
    y--;
    y--;x++;
    x++;
    x++;
    x++;y--;
    y++;
    y++;
    y++; x--;
  }

  int get_x() const { return x; }
  int get_y() const { return y; }
};



using namespace Catch::Matchers;


