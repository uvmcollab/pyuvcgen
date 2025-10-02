`ifndef {{ name | upper }}_IF_SV
`define {{ name | upper }}_IF_SV

interface {{ name }}_if (
  input logic clk_i
);

  import {{ name }}_pkg::*;

  clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_drv

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon

  modport drv (clocking cb_drv);
  modport mon (clocking cb_mon);

endinterface : {{ name }}_if

`endif // {{ name | upper }}_IF_SV
