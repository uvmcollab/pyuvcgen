`ifndef TOP_ENV_PKG_SV
`define TOP_ENV_PKG_SV

package top_env_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import {{ name }}_pkg::*;
  `include "top_vsqr.sv"
  //`include "top_scoreboard.sv"
  //`include "top_coverage.sv"
  `include "top_env_config.sv"
  `include "top_env.sv"

endpackage : top_env_pkg

`endif // TOP_ENV_PKG_SV
