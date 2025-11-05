`ifndef {{ name | upper }}_SEQUENCER_SV
`define {{ name | upper }}_SEQUENCER_SV

class {{ name }}_sequencer extends uvm_sequencer #({{ name }}_sequence_item);

  `uvm_component_utils({{ name }}_sequencer)

  {{ name }}_config m_config;

  extern function new(string name, uvm_component parent);

endclass : {{ name }}_sequencer


function {{ name }}_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

`endif // {{ name | upper }}_SEQUENCER_SV
