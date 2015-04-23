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
static const char *ng0 = "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/preprocessor.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0349976516_3212880686_p_0(char *t0)
{
    char t14[16];
    char t16[16];
    char t21[16];
    char t28[16];
    char t30[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    char *t22;
    int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t29;
    char *t31;
    char *t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned char t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4504);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = (9 - 9);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t3 = (t4 + t7);
    t8 = (t0 + 1672U);
    t9 = *((char **)t8);
    t10 = (9 - 9);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t8 = (t9 + t12);
    t15 = ((IEEE_P_2592010699) + 4000);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 9;
    t18 = (t17 + 4U);
    *((int *)t18) = 7;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (7 - 9);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t18 = (t21 + 0U);
    t22 = (t18 + 0U);
    *((int *)t22) = 9;
    t22 = (t18 + 4U);
    *((int *)t22) = 7;
    t22 = (t18 + 8U);
    *((int *)t22) = -1;
    t23 = (7 - 9);
    t20 = (t23 * -1);
    t20 = (t20 + 1);
    t22 = (t18 + 12U);
    *((unsigned int *)t22) = t20;
    t13 = xsi_base_array_concat(t13, t14, t15, (char)97, t3, t16, (char)97, t8, t21, (char)101);
    t22 = (t0 + 1832U);
    t24 = *((char **)t22);
    t20 = (9 - 9);
    t25 = (t20 * 1U);
    t26 = (0 + t25);
    t22 = (t24 + t26);
    t29 = ((IEEE_P_2592010699) + 4000);
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 9;
    t32 = (t31 + 4U);
    *((int *)t32) = 7;
    t32 = (t31 + 8U);
    *((int *)t32) = -1;
    t33 = (7 - 9);
    t34 = (t33 * -1);
    t34 = (t34 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t34;
    t27 = xsi_base_array_concat(t27, t28, t29, (char)97, t13, t14, (char)97, t22, t30, (char)101);
    t34 = (3U + 3U);
    t35 = (t34 + 3U);
    t36 = (9U != t35);
    if (t36 == 1)
        goto LAB5;

LAB6:    t32 = (t0 + 4584);
    t37 = (t32 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t27, 9U);
    xsi_driver_first_trans_fast(t32);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 4648);
    t4 = (t1 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    memcpy(t13, t3, 9U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_size_not_matching(9U, t35, 0);
    goto LAB6;

}


extern void work_a_0349976516_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0349976516_3212880686_p_0};
	xsi_register_didat("work_a_0349976516_3212880686", "isim/top_isim_beh.exe.sim/work/a_0349976516_3212880686.didat");
	xsi_register_executes(pe);
}
