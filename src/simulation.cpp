
#include <fstream>
#include <iostream>
#include "verilated.h"
#include "Vfibonacci_top.h"

// Main function
int main(int argc, char const *argv[]) {

  // Starts verilator
  Verilated::commandArgs(argc, argv);

  // Creates the output file
  FILE *output_file;
  output_file = fopen("output_data.l0gic", "w");

  // Prints simulation
  std::fprintf(output_file, "CLOCK_CYCLE, LED_OUT", );

  // Creates the state machine object
  Vfibonacci_top* state = new Vfibonacci_top;

  // Creates a constant to set the clock cycle maximum
  const int NCLOCKS = 100000;

  // Variable to store the led output
  int led_val;

  // Runs the simulation for the given clock cycles
  for (int cc = 0; cc < NCLOCKS*2; cc++){

    // Assigns the clock cycle value
    if(cc % 2 == 0) {
      state->clock_in = 1;
    } else {
      state->clock_in = 0;
    }

    // Assigns the reset signal
    if (cc < 10 * 2){
      state->reset_in = 1;
    } else {
      state->reset_in = 0;
    }

    // Evaluates the state machine
    state->eval();

    // Gets the led value
    led_val = state->led_out;

    // Prints the sim out
    std::cout << led_val << std::endl;

  }

  fclose(output_file);

  exit(EXIT_SUCCESS);
}
