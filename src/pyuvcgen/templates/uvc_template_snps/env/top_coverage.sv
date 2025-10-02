`ifndef TOP_COVERAGE_SV
`define TOP_COVERAGE_SV

class top_coverage extends uvm_component;

  `uvm_component_utils(top_coverage)

  // Transaction types
  {{ name }}_sequence_item m_trans;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  
  // Covergroups

endclass : top_coverage


function top_coverage::new(string name, uvm_component parent);
  super.new(name, parent);
  m_trans = {{ name }}_sequence_item::type_id::create("m_trans");
endfunction : new


function void top_coverage::build_phase(uvm_phase phase);
endfunction : build_phase


function void top_coverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("Final Coverage Score = 0"), UVM_MEDIUM)
endfunction : report_phase

`endif // TOP_COVERAGE_SV
