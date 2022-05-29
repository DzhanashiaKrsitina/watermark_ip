/*
 * File Name:         hdl_prj\ipcore\watermark_ip_v1_0\include\watermark_ip_addr.h
 * Description:       C Header File
 * Created:           2022-05-12 17:02:14
*/

#ifndef WATERMARK_IP_H_
#define WATERMARK_IP_H_

#define  IPCore_Reset_watermark_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_watermark_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_watermark_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2205121702
#define  pixel_in_Data_watermark_ip      0x100  //data register for Inport pixel_in
#define  mes_in_Data_watermark_ip        0x104  //data register for Inport mes_in
#define  pixel_out_Data_watermark_ip     0x108  //data register for Outport pixel_out

#endif /* WATERMARK_IP_H_ */
