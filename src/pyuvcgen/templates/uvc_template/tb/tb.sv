module tb;

  timeunit      1ns;
  timeprecision 1ps;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import top_test_pkg::*;

  // Clock signal
  logic clk_i = 0;
  localparam int unsigned ClkPeriod = 10_000; // 100 MHz -> 10 ns
  always #( (ClkPeriod / 2) * 1ps) clk_i = ~clk_i;

  // Reset signal
  logic rst_i = 1;
  initial begin
    repeat(5) @(posedge clk_i);
    rst_i = 0;
  end

  // Interface
  {{ name }}_if {{ name }}_vif (clk_i);

  // DUT Instantiation
  buffer dut (
    .clk_i (clk_i),
    .rst_i (rst_i),
    .d_i   (),
    .q_o   ()
  );

  initial begin
    $timeformat(-12, 0, "ps", 10);
    uvm_config_db #(virtual {{ name }}_if)::set(null, "uvm_test_top.m_env.m_{{ name }}_agent", "vif", {{ name }}_vif);
    run_test();
  end

endmodule : tb
