#include "ram.h"
#include <iostream>
// Sample RAM program (with symbolic labels).

// Compute the length of a zero-terminated string.
//
// Input:  m[1], m[2], ...	(the string)
// Output: m[0]			(the length)

void program()
{
  reset(0);
  reset(1);	
  reset(4);
  dec(4);
 busca:
  inc(0);					
  load(1, 0);
  dec(1);			
  cgoto(1, busca);
  reset(1);
 loop:
  inc(1);
  dec(0);
  load(3,0);
  cgoto(3,next);
  cgoto(0,end);
 next:
  load(2,1);
  store(4,1);
  dec(2);dec(2);
  dec(3);dec(3);
  cgoto(2,pdos);
  cgoto(3,badend);
  cgoto(0,loop);
 pdos:
  cgoto(3,loop);
 badend:
  dec(4);
 end:
  inc(4);inc(4);
  reset(2);
  store(4,2);
             
}

// Driver program.


#include <iomanip>
#include <sstream>

memory r, m(1024);

int main()
{
  using namespace std;

  // Data input through the standard input.

  string s = "";
  cout << "Input string? ";
  getline(cin, s);

  // RAM initialization.

  initialize(5);		// Three registers.

  // RAM data input (memory initialization).
  for (string::size_type i = 0; i != s.size(); ++i)
    m[i + 1] = static_cast<unsigned char>(s[i])-'0';
  m[s.size() + 1] = 0;

  // Program execution.
  program();

  // RAM data output (memory reading).

  integer l = m[0];

  // Data output through the standard output. 

  cout << "Size of the string: "<< r[0]<<" salida"<<l<< endl;
  cout << "The string " << s << " is" << ((l==1)? " ":" not ")<<"a shameless palindrome." << endl;  
}//®©Luis Quintana -- All rights reserved.
