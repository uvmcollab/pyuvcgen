`ifndef {{ name | upper }}_SEQUENCER_SV
`define {{ name | upper }}_SEQUENCER_SV

//typedef uvm_sequencer #({{ name }}_sequence_item) {{ name }}_sequencer;

class {{ name }}_sequencer extends uvm_sequencer #({{ name }}_sequence_item);

  `uvm_component_utils({{ name }}_sequencer)

  {{ name }}_config m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);

endclass : {{ name }}_sequencer


function {{ name }}_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void {{ name }}_sequencer::build_phase(uvm_phase phase);
  if (!uvm_config_db#({{ name }}_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve {{ name }}_config from config db")
  end
endfunction : build_phase

`endif // {{ name | upper }}_SEQUENCER_SV
