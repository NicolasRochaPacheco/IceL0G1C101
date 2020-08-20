
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
  output_file = fopen("output_data.csv", "w");

  // Prints simulation
  std::fprintf(output_file, "CLOCK_CYCLE, STATE, LED_OUT \n");

  // Creates the state machine object
  Vfibonacci_top* state = new Vfibonacci_top;

  // Creates a constant to set the clock cycle maximum
  const int NCLOCKS = 100000;

  // Variable to store the clock cycle
  int cc_val;

  // Variable to store the led output
  int led_val;

  // Runs the simulation for the given clock cycles
  for (int cc = 0; cc < NCLOCKS*2; cc++){

    // Configures the clock cycle value
    if(cc % 2 == 0) {
      cc_val = 1;
    } else {
      cc_val = 0;
    }

    // Assigns the clock cycle value
    state->clock_in = cc_val;

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
    std::fprintf(output_file, "%06d, %01d, %01d \n", cc_val, state->state_out, led_val);

  }

  fclose(output_file);

  exit(EXIT_SUCCESS);
}
