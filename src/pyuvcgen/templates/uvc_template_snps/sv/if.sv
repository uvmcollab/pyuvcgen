`ifndef {{ name | upper }}_IF_SV
`define {{ name | upper }}_IF_SV

interface {{ name }}_if (
  input logic clk_i
);

  import {{ name }}_pkg::*;

  // ================================= INPUTS ================================= //

  // ================================ OUTPUTS ================================= //

  // ============================= INITIAL VALUES ============================= //

  initial begin
    // Initialize signals here
  end

  // ============================ CLOCKING BLOCKS ============================= //
  
  clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_drv

  clocking cb_drv_neg @(negedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_drv_neg

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon

  clocking cb_mon_neg @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon_neg

endinterface : {{ name }}_if

`endif // {{ name | upper }}_IF_SV
