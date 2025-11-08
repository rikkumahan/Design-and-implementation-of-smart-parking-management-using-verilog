module smart_parking(
    input clk, rst,
    input entry, exit,
    output reg entry_gate, exit_gate,
    output reg [3:0] free_count,
    output reg full
);

    reg [7:0] slots; // 1 = occupied, 0 = free
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            slots <= 8'b00000000;   // all slots free
            free_count <= 8;
            full <= 0;
            entry_gate <= 0;
            exit_gate <= 0;
        end else begin
            entry_gate <= 0;
            exit_gate <= 0;

            // Car Entry
            if (entry && free_count > 0) begin
                for (i = 0; i < 8; i = i + 1) begin
                    if (slots[i] == 0) begin
                        slots[i] <= 1;
                        free_count <= free_count - 1;
                        entry_gate <= 1;
                        i = 8; // exit loop safely
                    end
                end
            end

            // Car Exit
            if (exit && free_count < 8) begin
                for (i = 7; i >= 0; i = i - 1) begin
                    if (slots[i] == 1) begin
                        slots[i] <= 0;
                        free_count <= free_count + 1;
                        exit_gate <= 1;
                        i = -1; // exit loop safely
                    end
                end
            end

            // FULL check
            full <= (free_count == 0) ? 1 : 0;
        end
    end
endmodule

module tb_smart_parking;

    reg clk, rst, entry, exit;
    wire entry_gate, exit_gate, full;
    wire [3:0] free_count;

    // Instantiate the Smart Parking module
    smart_parking uut (
        .clk(clk),
        .rst(rst),
        .entry(entry),
        .exit(exit),
        .entry_gate(entry_gate),
        .exit_gate(exit_gate),
        .free_count(free_count),
        .full(full)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        entry = 0;
        exit = 0;

        #10 rst = 0;  // Release reset

        // Simulate car entries
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0;
        #10 entry = 1; #10 entry = 0; // Now full

        #20; // Wait to observe full signal

        // Simulate car exits
        #10 exit = 1; #10 exit = 0;
        #10 exit = 1; #10 exit = 0;

        #50 $stop; // End simulation
    end
endmodule
