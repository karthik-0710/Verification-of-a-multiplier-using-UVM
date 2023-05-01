class sequence1 extends uvm_sequence #(transaction);
`uvm_object_utils(sequence1)
transaction trans;

	function new(string name="sequence1");
		super.new(name);
	endfunction

	virtual task body();
	trans=transaction::type_id::create("trans");
	repeat(10) begin
	start_item(trans);
	trans.randomize; //with{a>2; b<7;};
	`uvm_info("seq",$sformatf("a=%0d,b=%0d",trans.a,trans.b),UVM_NONE)
	finish_item(trans);
	#10;
	end
	endtask

endclass
