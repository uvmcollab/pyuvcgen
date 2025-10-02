`ifndef {{ name | upper }}_PKG_SV
`define {{ name | upper }}_PKG_SV

package {{ name }}_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "{{ name }}_types.sv"
  `include "{{ name }}_sequence_item.sv"
  `include "{{ name }}_config.sv"
  `include "{{ name }}_sequencer.sv"
  `include "{{ name }}_driver.sv"
  `include "{{ name }}_monitor.sv"
  `include "{{ name }}_agent.sv"

  `include "{{ name }}_sequence_base.sv"

endpackage : {{ name }}_pkg

`endif // {{ name | upper }}_PKG_SV
