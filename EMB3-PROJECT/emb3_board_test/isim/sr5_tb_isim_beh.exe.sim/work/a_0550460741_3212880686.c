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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/sr5.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0550460741_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned char t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3232);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 5359);
    *((int *)t3) = 0;
    t4 = (t0 + 5363);
    *((int *)t4) = 3;
    t5 = 0;
    t6 = 3;

LAB5:    if (t5 <= t6)
        goto LAB6;

LAB8:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 3328);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t14 = *((char **)t8);
    *((unsigned char *)t14) = t2;
    xsi_driver_first_trans_delta(t1, 4U, 1, 0LL);
    goto LAB3;

LAB6:    xsi_set_current_line(40, ng0);
    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t7 = (t0 + 5359);
    t9 = *((int *)t7);
    t10 = (t9 - 4);
    t11 = (t10 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t7));
    t12 = (1U * t11);
    t13 = (0 + t12);
    t14 = (t8 + t13);
    t15 = *((unsigned char *)t14);
    t16 = (t0 + 5359);
    t17 = *((int *)t16);
    t18 = (t17 + 1);
    t19 = (t18 - 4);
    t20 = (t19 * -1);
    t21 = (1 * t20);
    t22 = (0U + t21);
    t23 = (t0 + 3328);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t15;
    xsi_driver_first_trans_delta(t23, t22, 1, 0LL);

LAB7:    t1 = (t0 + 5359);
    t5 = *((int *)t1);
    t3 = (t0 + 5363);
    t6 = *((int *)t3);
    if (t5 == t6)
        goto LAB8;

LAB9:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 5359);
    *((int *)t4) = t5;
    goto LAB5;

}

static void work_a_0550460741_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(45, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (4 - 4);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3392);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3248);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0550460741_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0550460741_3212880686_p_0,(void *)work_a_0550460741_3212880686_p_1};
	xsi_register_didat("work_a_0550460741_3212880686", "isim/sr5_tb_isim_beh.exe.sim/work/a_0550460741_3212880686.didat");
	xsi_register_executes(pe);
}
