`ifndef {{ name | upper }}_AGENT_SV
`define {{ name | upper }}_AGENT_SV

class {{ name }}_agent extends uvm_agent;

  `uvm_component_utils({{ name }}_agent)

  uvm_analysis_port #({{ name }}_sequence_item) analysis_port;

  {{ name }}_config    m_config;
  {{ name }}_sequencer m_sequencer;
  {{ name }}_driver    m_driver;
  {{ name }}_monitor   m_monitor;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : {{ name }}_agent


function  {{ name }}_agent::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void {{ name }}_agent::build_phase(uvm_phase phase);
  if ( !uvm_config_db #({{ name }}_config)::get(this, "", "config", m_config) ) begin
    `uvm_fatal(get_name(), "Could not retrieve {{ name }}_config from config db")
  end

  if (m_config.is_active == UVM_ACTIVE) begin
    m_sequencer = {{ name }}_sequencer::type_id::create("m_sequencer", this);
    m_driver    = {{ name }}_driver   ::type_id::create("m_driver",    this);
  end

  m_monitor = {{ name }}_monitor::type_id::create("m_monitor", this);
  analysis_port = new("analysis_port", this);
endfunction : build_phase


function void {{ name }}_agent::connect_phase(uvm_phase phase);
  if (m_config.is_active == UVM_ACTIVE) begin
    m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
  end

  m_monitor.analysis_port.connect(this.analysis_port);
endfunction : connect_phase

`endif // {{ name | upper }}_AGENT_SV
