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
static const char *ng0 = "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/sliding_average.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_3307759752501539734_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0841067670_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(79, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5920);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5776);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0841067670_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(96, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5984);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 5792);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0841067670_3212880686_p_2(char *t0)
{
    char t17[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    int t18;
    unsigned int t19;
    int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(108, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5808);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(109, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 6112);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 10U);
    xsi_driver_first_trans_delta(t1, 0U, 10U, 0LL);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t13 = (0 - 0);
    t14 = (t13 * 1);
    t15 = (10U * t14);
    t16 = (0 + t15);
    t1 = (t3 + t16);
    t4 = (t17 + 0U);
    t7 = (t4 + 0U);
    *((int *)t7) = 9;
    t7 = (t4 + 4U);
    *((int *)t7) = 0;
    t7 = (t4 + 8U);
    *((int *)t7) = -1;
    t18 = (0 - 9);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t7 = (t4 + 12U);
    *((unsigned int *)t7) = t19;
    t2 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t1, t17, 128);
    if (t2 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 3368U);
    t3 = *((char **)t1);
    t13 = *((int *)t3);
    t18 = (t13 + 1);
    t1 = (t0 + 3368U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t18;

LAB9:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 3248U);
    t4 = *((char **)t1);
    t13 = *((int *)t4);
    t18 = (t13 - 1);
    t20 = (t18 - 0);
    t14 = (t20 * 1);
    t15 = (10U * t14);
    t16 = (0 + t15);
    t1 = (t3 + t16);
    t7 = (t17 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 9;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t21 = (0 - 9);
    t19 = (t21 * -1);
    t19 = (t19 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t19;
    t2 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t1, t17, 128);
    if (t2 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 3368U);
    t3 = *((char **)t1);
    t13 = *((int *)t3);
    t18 = (t13 - 1);
    t1 = (t0 + 3368U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t18;

LAB12:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 3248U);
    t3 = *((char **)t1);
    t13 = *((int *)t3);
    t18 = (t13 - 1);
    t1 = (t0 + 11160);
    *((int *)t1) = 1;
    t4 = (t0 + 11164);
    *((int *)t4) = t18;
    t20 = 1;
    t21 = t18;

LAB14:    if (t20 <= t21)
        goto LAB15;

LAB17:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 3488U);
    t3 = *((char **)t1);
    t13 = *((int *)t3);
    t1 = (t0 + 3248U);
    t4 = *((char **)t1);
    t18 = *((int *)t4);
    t20 = (t18 + 1);
    t21 = (t20 / 2);
    t5 = (t13 > t21);
    if (t5 == 1)
        goto LAB22;

LAB23:    t1 = (t0 + 3488U);
    t7 = *((char **)t1);
    t22 = *((int *)t7);
    t1 = (t0 + 3248U);
    t8 = *((char **)t1);
    t23 = *((int *)t8);
    t24 = (t23 + 1);
    t25 = (t24 / 2);
    t6 = (t22 == t25);
    t2 = t6;

LAB24:    if (t2 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(134, ng0);
    t1 = (t0 + 11178);
    t4 = (t0 + 6176);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 10U);
    xsi_driver_first_trans_fast_port(t4);

LAB20:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(110, ng0);
    t3 = xsi_get_transient_memory(14U);
    memset(t3, 0, 14U);
    t7 = t3;
    memset(t7, (unsigned char)2, 14U);
    t8 = (t0 + 6048);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 14U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(116, ng0);
    t7 = (t0 + 3488U);
    t8 = *((char **)t7);
    t20 = *((int *)t8);
    t21 = (t20 + 1);
    t7 = (t0 + 3488U);
    t9 = *((char **)t7);
    t7 = (t9 + 0);
    *((int *)t7) = t21;
    goto LAB9;

LAB11:    xsi_set_current_line(122, ng0);
    t8 = (t0 + 3488U);
    t9 = *((char **)t8);
    t22 = *((int *)t9);
    t23 = (t22 - 1);
    t8 = (t0 + 3488U);
    t10 = *((char **)t8);
    t8 = (t10 + 0);
    *((int *)t8) = t23;
    goto LAB12;

LAB15:    xsi_set_current_line(128, ng0);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t7 = (t0 + 11160);
    t22 = *((int *)t7);
    t23 = (t22 - 1);
    t24 = (t23 - 0);
    t14 = (t24 * 1);
    xsi_vhdl_check_range_of_index(0, 10, 1, t23);
    t15 = (10U * t14);
    t16 = (0 + t15);
    t9 = (t8 + t16);
    t10 = (t0 + 11160);
    t25 = *((int *)t10);
    t26 = (t25 - 0);
    t19 = (t26 * 1);
    t27 = (10U * t19);
    t28 = (0U + t27);
    t11 = (t0 + 6112);
    t12 = (t11 + 56U);
    t29 = *((char **)t12);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t9, 10U);
    xsi_driver_first_trans_delta(t11, t28, 10U, 0LL);

LAB16:    t1 = (t0 + 11160);
    t20 = *((int *)t1);
    t3 = (t0 + 11164);
    t21 = *((int *)t3);
    if (t20 == t21)
        goto LAB17;

LAB18:    t13 = (t20 + 1);
    t20 = t13;
    t4 = (t0 + 11160);
    *((int *)t4) = t20;
    goto LAB14;

LAB19:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 11168);
    t10 = (t0 + 6176);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t29 = (t12 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t1, 10U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB20;

LAB22:    t2 = (unsigned char)1;
    goto LAB24;

}

static void work_a_0841067670_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(141, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6240);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 5824);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0841067670_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(90, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6304);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 5840);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0841067670_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0841067670_3212880686_p_0,(void *)work_a_0841067670_3212880686_p_1,(void *)work_a_0841067670_3212880686_p_2,(void *)work_a_0841067670_3212880686_p_3,(void *)work_a_0841067670_3212880686_p_4};
	xsi_register_didat("work_a_0841067670_3212880686", "isim/SlidingAverage_isim_beh.exe.sim/work/a_0841067670_3212880686.didat");
	xsi_register_executes(pe);
}
