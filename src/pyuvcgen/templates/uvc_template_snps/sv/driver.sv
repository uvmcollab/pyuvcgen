`ifndef {{ name | upper }}_DRIVER_SV
`define {{ name | upper }}_DRIVER_SV

class {{ name }}_driver extends uvm_driver #({{ name }}_sequence_item);

  `uvm_component_utils({{ name }}_driver)

  virtual {{ name }}_if vif;
  {{ name }}_config     m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_drive();

endclass : {{ name }}_driver


function {{ name }}_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void {{ name }}_driver::build_phase(uvm_phase phase);
  if ( !uvm_config_db #(virtual {{ name }}_if)::get(get_parent(), "", "vif", vif) ) begin
    `uvm_fatal(get_name(), "Could not retrieve {{ name }}_if from config db")
  end

  if ( !uvm_config_db #({{ name }}_config)::get(get_parent(), "", "config", m_config) ) begin
    `uvm_fatal(get_name(), "Could not retrieve {{ name }}_config from config db")
  end
endfunction : build_phase


task {{ name }}_driver::run_phase(uvm_phase phase);
  forever begin
    seq_item_port.get_next_item(req);
    do_drive();
    seq_item_port.item_done();
  end
endtask : run_phase


task {{ name }}_driver::do_drive();
  `uvm_info(get_type_name(), "PUT THE DRIVER CODE HERE", UVM_MEDIUM)
endtask : do_drive

`endif // {{ name | upper }}_DRIVER_SV
