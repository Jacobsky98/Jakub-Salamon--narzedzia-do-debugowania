#include <iostream>
#include <vector>
#include <algorithm>

/*
  1. Uzupelnij funcje, tak żeby zwracały najmniejszy dodatni element, który nie występuje w vectorze wejściowym. Ulatwij sobie napisanie poprawnego kodu przez uzywanie debugera gdb

  2. Do sprawdzenia poprawnosci dzialania programu uzyj funkcji test_rozwiazanie_optymalne() oraz test_rozwiazanie_nieoptymalne()
  
  3. Przeprowadz testy wydajnosci rozwiazan przy pomocy narzedzia perf. Przeprowadz 10 pomiarow i zobacz jak prezentuje sie srednia.
  Do testow przydadza ci sie funkcje perf_optymalne() oraz perf_nieoptymalne() (uruchom je osobno dla kazdego z pomiarow)
  Moga (ale nie musza) wystapic problemy z dostepnoscia perfa w dockerze, sprobuj wtedy zainstalowac go lokalnie. 
  W czasie testow sprawdz obciazenie systemu narzedziem dstat.

*/

int rozwiazanie_nieoptymalne(std::vector<int> &A) {

  return 0;

}

int rozwiazanie_optymalne(std::vector<int> &A) {

  return 0;
}

void test_rozwiazanie_optymalne() {
  std::vector<int> A = {1, 3, 6, 4, 1, 2};  // oczekiwany wynik 5
  std::vector<int> B = {1, 2, 3};  // oczekiwany wynik 4
  std::vector<int> C = {-1, -3}; // oczekiwany wynik 0

  std::cout << rozwiazanie_optymalne(A) << std::endl;
  std::cout << rozwiazanie_optymalne(B) << std::endl;
  std::cout << rozwiazanie_optymalne(C) << std::endl;
}

void test_rozwiazanie_nieoptymalne() {
  std::vector<int> A = {-50, 1, 3, 6, 4, 1, 2};  // oczekiwany wynik 5
  std::vector<int> B = {1, 2, 3};  // oczekiwany wynik 4
  std::vector<int> C = {-1, -3}; // oczekiwany wynik 0

  std::cout << rozwiazanie_nieoptymalne(A) << std::endl;
  std::cout << rozwiazanie_nieoptymalne(B) << std::endl;
  std::cout << rozwiazanie_nieoptymalne(C) << std::endl;
}
std::vector<int> generuj_dane() {
  std::vector<int> A = {};
  for(int i = 0; i < 58934; i++) {
    int value = (rand()%(int)1e6)*2 - 1e6 + 1;
    A.push_back(value);
  }
  return A;
}

void perf_optymalne() {
  std::vector<int> A = generuj_dane();
  rozwiazanie_optymalne(A);
}

void perf_nieoptymalne() {
  std::vector<int> A = generuj_dane();
  rozwiazanie_nieoptymalne(A);
}

int main(void)
{
  srand (time(NULL));
  test_rozwiazanie_nieoptymalne();
  test_rozwiazanie_optymalne();
  
  // testy wydajnosci przy pomocy perf
  // perf_nieoptymalne();
  // perf_optymalne()
    
  return 0;
}
