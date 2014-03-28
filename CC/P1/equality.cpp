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
 busca:
  inc(0);					
  load(1, 0);
  dec(1);			
  cgoto(1, busca);
  reset(1);
 loop:
  inc(1);
  inc(0);
  for(int i=0;i<10;++i)
		std::cout<<" "<<m[i];
  std::cout<<std::endl;
  for(int i=0;i<5;++i)
  	std::cout<<" "<<r[i];
  std::cout<<std::endl;
  load(3,0);
  load(2,1);
  dec(3);
  dec(2);
    for(int i=0;i<10;++i)
		std::cout<<" "<<m[i];
  std::cout<<std::endl;
  for(int i=0;i<5;++i)
  	std::cout<<" "<<r[i];
  std::cout<<std::endl;
  cgoto(3,next);
  cgoto(2,badend);
  cgoto(0,end);
 next:
  cgoto(2,cont);
  cgoto(0,badend);
 cont:
  dec(2);
  dec(3);
  cgoto(2,pdos);
  cgoto(3,badend);
  cgoto(0,loop);
 pdos:
  cgoto(3,loop);
 badend:
  dec(4);
 end:
  inc(4);
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

  string b="", a = "";
  cout << "First input string? ";
  getline(cin, a);
  cout << "Second input string? ";
  getline(cin, b);

  // RAM initialization.

  initialize(5);		// Three registers.

  // RAM data input (memory initialization).
  for (string::size_type i = 0; i != a.size(); ++i)
    m[i + 1] = static_cast<unsigned char>(a[i])-'0';
  m[a.size() + 1] = 0;
  for (string::size_type i = 1; i <= b.size(); ++i)
    m[a.size() + i + 1] = static_cast<unsigned char>(b[i-1])-'0';
  m[a.size() + b.size()+ 2] = 0;
	for(int i=0;i<10;++i)
		cout<<" "<<m[i];
  // Program execution.
  program();

  // RAM data output (memory reading).

  integer l = m[0];

  // Data output through the standard output. 

  cout << "Size of the string: "<< r[0]<<" salida"<<l<< endl;
  cout << "The strings " << a << " & "<< b<< " are" << ((l==1)? " ":" not ")<<"shamelessly equal." << endl;  
}//©Luis Quintana -- All rights reserved.
