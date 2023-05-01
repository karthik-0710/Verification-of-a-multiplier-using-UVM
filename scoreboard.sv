
class scoreboard  extends uvm_scoreboard ;
`uvm_component_utils(scoreboard)
transaction trans;
uvm_analysis_imp #(transaction,scoreboard) rec;

	function new(string name="scoreboard",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		trans=transaction::type_id::create("trans");
		rec=new("rec",this);
	endfunction

	virtual function void write(input transaction tr);
		trans=tr;
		if(trans.mul==trans.a*trans.b) begin
			$display("-------------------------------------------------");	
			`uvm_info("Scoreboard","Test passed!",UVM_NONE)
			$display("-------------------------------------------------");
		end
		else begin
			$display("-------------------------------------------------");
			`uvm_info("Scoreboard","Test failed :-(!",UVM_NONE)
			$display("-------------------------------------------------");
		end
	endfunction

endclass
