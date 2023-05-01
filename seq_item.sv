

class transaction extends uvm_sequence_item;
	rand bit [3:0] a;
	rand bit [3:0] b;
	bit [4:0] mul;

	constraint data{a inside {[0:10]}; b inside {[2:7]};}

	`uvm_object_utils_begin(transaction)
	`uvm_field_int(a,UVM_DEFAULT)
	`uvm_field_int(b,UVM_DEFAULT)
	`uvm_field_int(mul,UVM_DEFAULT)
	`uvm_object_utils_end

	function new(string name="transaction");
		super.new(name);
	endfunction

endclass
