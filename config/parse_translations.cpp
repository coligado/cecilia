#include <iostream>
#include <fstream>
#include <cstring>

const int MAX_CHARS_PER_LINE = 50;
const char* const DELIMITER = " ";

int main() {
  ifstream fin;
  fin.open("name_translations.txt");
  if (!fin.good()) // good?
    return 1;

  while (!fin.eof()) {
    char buf[MAX_CHARS_PER_LINE];
    fin.getline(buf, MAX_CHARS_PER_LINE);
    int n = 0;
    const char* first_name = strtok(buf, DELIMITER);
    if (first_name) {
      char last_letter = first_name - 1;
      if (last_letter == 'A')
        cout << first_name << endl;
    }
    cout << "ALL DONE!" << endl;
    cout << endl;
  }
}