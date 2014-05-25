// Clase para cronometrar.

#ifndef CRONOMETRO_H_ 
#define CRONOMETRO_H_

#include <ctime>
using std::clock;
using std::clock_t;

const double pps = CLOCKS_PER_SEC;

class cronometro {
public:
  cronometro(): activo(false) {}
  void activate() { activo = true; t0 = clock(); }
  void stop() { if (activo) { t1 = clock(); activo = false; } }
  double get_time() const { return ((activo ? clock() : t1) - t0) / pps; }
private:
  bool activo;	   // Estado de actividad del cronómetro.
  clock_t t0, t1;  // Tiempos inicial y final.
};


#endif
