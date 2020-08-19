#include "verilated.h"
#include "Vfibonacci_top.h"

// Main function
int main(int argc, char const *argv[]) {

  // Starts verilator
  Verilated::commandArgs(argc, argv);

  // Creates the state machine object
  Vfibonacci_top* state = new Vfibonacci_top;

  // Creates a constant to set the clock cycle maximum
  const int NCLOCKS = 100000;

  // Runs the simulation for the given clock cycles
  for (int cc = 0; cc < NCLOCKS; cc++){

    core

    // Evaluates the state machine
    state->eval();

  }

  exit(EXIT_SUCCESS);
}
