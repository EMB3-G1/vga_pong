/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *UNISIM_P_3222816464;
char *IEEE_P_2717149903;
char *STD_TEXTIO;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *UNISIM_P_0947159679;
char *IEEE_P_1367372525;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *UTILITY_V01_00_A_P_3376496638;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    utility_v01_00_a_p_3376496638_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_2562466605_1496654361_init();
    unisim_a_1717296735_4086321779_init();
    unisim_a_3055263662_1392679692_init();
    unisim_a_0774281858_3731405331_init();
    unisim_a_3600803327_3731405331_init();
    unisim_a_4104775526_3752513572_init();
    unisim_a_2121384304_3723259517_init();
    unisim_a_0350208134_1521797606_init();
    unisim_a_2892212195_1521797606_init();
    unisim_a_3702704980_1602505438_init();
    unisim_a_1646226234_1266530935_init();
    unisim_a_3484885994_2523279426_init();
    work_a_3926497698_0632001823_init();
    work_a_0841067670_3212880686_init();
    work_a_0550460741_3212880686_init();
    work_a_0349976516_3212880686_init();
    unisim_a_2716262727_4282206764_init();
    unisim_a_2862668259_4282206764_init();
    unisim_a_3321449454_0621957688_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0285428104_3212880686_init();
    work_a_0646338223_3212880686_init();
    work_a_3300370831_3212880686_init();
    work_a_3388650670_3212880686_init();
    work_a_3823007873_3212880686_init();


    xsi_register_tops("work_a_3823007873_3212880686");

    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    UTILITY_V01_00_A_P_3376496638 = xsi_get_engine_memory("utility_v01_00_a_p_3376496638");

    return xsi_run_simulation(argc, argv);

}
