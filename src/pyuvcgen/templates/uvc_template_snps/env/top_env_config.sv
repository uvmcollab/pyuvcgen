`ifndef TOP_ENV_CONFIG_SV
`define TOP_ENV_CONFIG_SV

class top_env_config extends uvm_object;

  `uvm_object_utils(top_env_config)

  bit coverage_enable = 0;

  extern function new(string name = "");

endclass : top_env_config


function top_env_config::new(string name = "");
  super.new(name);
endfunction : new

`endif // TOP_ENV_CONFIG_SV
