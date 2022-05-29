
`timescale 1ns / 1ns

module gm_Watermarker_ref_dpi
( 
    input clk,
	input reset,
	input clk_enable,
    
/* Simulink signal name: 'pixel' */
input byte unsigned pixel ,
/* Simulink signal name: 'message' */
input byte unsigned message ,

/* Simulink signal name: 'dpi_1' */
output byte unsigned dpi_1 ,
/* Simulink signal name: 'dpi_2' */
output byte unsigned dpi_2 ,
/* Simulink signal name: 'dpi_3' */
output byte unsigned dpi_3 ,
/* Simulink signal name: 'pixel_out' */
output byte unsigned pixel_out 
); 

    parameter loop_factor = 1;
    parameter overclocking_factor = 5;
    reg [63:0] overclocking_counter;

    chandle objhandle=null;

byte unsigned  dpi_1_temp;
byte unsigned  dpi_2_temp;
byte unsigned  dpi_3_temp;
byte unsigned  pixel_out_temp;

    import "DPI-C" function chandle DPI_gm_Watermarker_ref_initialize(chandle existhandle);
    import "DPI-C" function void DPI_gm_Watermarker_ref_output(input chandle objhandle,
/*Simulink signal name: 'pixel'*/
input byte unsigned pixel,
/*Simulink signal name: 'message'*/
input byte unsigned message,
/*Simulink signal name: 'dpi_1'*/
inout byte unsigned dpi_1,
/*Simulink signal name: 'dpi_2'*/
inout byte unsigned dpi_2,
/*Simulink signal name: 'dpi_3'*/
inout byte unsigned dpi_3,
/*Simulink signal name: 'pixel_out'*/
inout byte unsigned pixel_out);
    import "DPI-C" function void DPI_gm_Watermarker_ref_update(input chandle objhandle,
/*Simulink signal name: 'pixel'*/
input byte unsigned pixel,
/*Simulink signal name: 'message'*/
input byte unsigned message);
    

	always @(reset) begin
        objhandle = DPI_gm_Watermarker_ref_initialize(objhandle);
        overclocking_counter <= 64'b1;
	end 

	always @(posedge clk) begin 
        if(clk_enable == 1'b1) begin
            if(overclocking_counter==1) begin
                for(int ii=0; ii < loop_factor; ii=ii+1) begin       
                    DPI_gm_Watermarker_ref_output(objhandle,
pixel, message, dpi_1_temp, dpi_2_temp, dpi_3_temp, pixel_out_temp);
                    DPI_gm_Watermarker_ref_update(objhandle,
pixel, message);   
                end
                dpi_1 <=dpi_1_temp;
dpi_2 <=dpi_2_temp;
dpi_3 <=dpi_3_temp;
pixel_out <=pixel_out_temp;

            end
            if(overclocking_counter == overclocking_factor)
                overclocking_counter <= 64'b1;
            else
                overclocking_counter <= overclocking_counter + 1'b1;
        end
	end

endmodule


