`ifndef {{ name | upper }}_CONFIG_SV
`define {{ name | upper }}_CONFIG_SV

class {{ name }}_config extends uvm_object;

  `uvm_object_utils({{ name }}_config)

  uvm_active_passive_enum  is_active = UVM_ACTIVE;

  extern function new(string name = "");

endclass : {{ name }}_config

function {{ name }}_config::new(string name = "");
  super.new(name);
endfunction : new

`endif // {{ name | upper }}_CONFIG_SV
