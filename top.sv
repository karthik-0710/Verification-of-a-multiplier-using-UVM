`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "driver.sv"
`include "scoreboard.sv"
`include "monitor.sv"
//`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"


module tb();
	add_if aif();
	
	adder dut (.a(aif.a),.b(aif.b),.mul(aif.mul));

	initial begin
		uvm_config_db #(virtual add_if)::set(null,"uvm_test_top.e.a*","aif",aif); 
		//`uvm_info("top","unable to access interface",UVM_NONE)
		run_test("test");
	end	

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		#500; $finish;
	end

endmodule
