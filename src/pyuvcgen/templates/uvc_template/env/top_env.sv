`ifndef TOP_ENV_SV
`define TOP_ENV_SV

class top_env extends uvm_env;

  `uvm_component_utils(top_env)

  top_env_config    m_config;

  {{ name }}_config m_{{ name }}_config;
  {{ name }}_agent  m_{{ name }}_agent;

  top_vsqr          vsqr;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : top_env


function top_env::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void top_env::build_phase(uvm_phase phase);
  if (!uvm_config_db#(top_env_config)::get(this, "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve top_env_config from config db")
  end

  m_{{ name }}_config = {{ name }}_config::type_id::create("m_{{ name }}_config");
  m_{{ name }}_config.is_active = UVM_ACTIVE;
  uvm_config_db #({{ name }}_config)::set(this, "m_{{ name }}_agent*", "config", m_{{ name }}_config);
  m_{{ name }}_agent = {{ name }}_agent::type_id::create("m_{{ name }}_agent", this);

  vsqr = top_vsqr::type_id::create("vsqr", this);
endfunction : build_phase


function void top_env::connect_phase(uvm_phase phase);
  vsqr.m_{{ vsqr_seq_name }}_sequencer = m_{{ name }}_agent.m_sequencer;
endfunction : connect_phase

`endif // TOP_ENV_SV
