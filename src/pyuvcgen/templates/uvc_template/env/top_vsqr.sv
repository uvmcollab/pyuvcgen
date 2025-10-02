`ifndef TOP_VSQR_SV
`define TOP_VSQR_SV

class top_vsqr extends uvm_sequencer;

  `uvm_component_utils(top_vsqr)

  {{ name }}_sequencer m_{{ vsqr_seq_name }}_sequencer;

  extern function new(string name, uvm_component parent);

endclass : top_vsqr


function top_vsqr::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

`endif // TOP_VSQR_SV
