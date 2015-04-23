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
static const char *ng0 = "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/ps2_rx_fsm.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0646338223_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4600);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 4712);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

}

static void work_a_0646338223_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB3, &&LAB4, &&LAB5, &&LAB6};

LAB0:    xsi_set_current_line(42, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 4904);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t6 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t6);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 4616);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 4776);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 4840);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 4904);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(50, ng0);
    goto LAB2;

}

static void work_a_0646338223_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB7, &&LAB8, &&LAB9, &&LAB6};

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4968);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 4632);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t8 = *((unsigned char *)t5);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB2;

LAB4:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t8 = (t3 == (unsigned char)3);
    if (t8 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB2;

LAB5:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t8 = (t3 == (unsigned char)3);
    if (t8 != 0)
        goto LAB43;

LAB45:
LAB44:    goto LAB2;

LAB6:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t8 = (t3 == (unsigned char)3);
    if (t8 != 0)
        goto LAB46;

LAB48:
LAB47:    goto LAB2;

LAB7:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB9:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB10:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(65, ng0);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 2568U);
    t7 = *((char **)t4);
    t10 = 1;
    if (8U == 8U)
        goto LAB17;

LAB18:    t10 = 0;

LAB19:    if (t10 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(66, ng0);
    t13 = (t0 + 4968);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)1;
    xsi_driver_first_trans_fast(t13);
    goto LAB15;

LAB17:    t11 = 0;

LAB20:    if (t11 < 8U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t4 = (t6 + t11);
    t12 = (t7 + t11);
    if (*((unsigned char *)t4) != *((unsigned char *)t12))
        goto LAB18;

LAB22:    t11 = (t11 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 2688U);
    t5 = *((char **)t1);
    t9 = 1;
    if (8U == 8U)
        goto LAB29;

LAB30:    t9 = 0;

LAB31:    if (t9 != 0)
        goto LAB26;

LAB28:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2808U);
    t4 = *((char **)t1);
    t3 = 1;
    if (8U == 8U)
        goto LAB37;

LAB38:    t3 = 0;

LAB39:    if (t3 != 0)
        goto LAB35;

LAB36:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 4968);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB27:    goto LAB24;

LAB26:    xsi_set_current_line(75, ng0);
    t7 = (t0 + 4968);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB27;

LAB29:    t11 = 0;

LAB32:    if (t11 < 8U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t1 = (t4 + t11);
    t6 = (t5 + t11);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB30;

LAB34:    t11 = (t11 + 1);
    goto LAB32;

LAB35:    xsi_set_current_line(77, ng0);
    t6 = (t0 + 4968);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)4;
    xsi_driver_first_trans_fast(t6);
    goto LAB27;

LAB37:    t11 = 0;

LAB40:    if (t11 < 8U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t1 = (t2 + t11);
    t5 = (t4 + t11);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB38;

LAB42:    t11 = (t11 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 4968);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB44;

LAB46:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 2448U);
    t5 = *((char **)t1);
    t9 = 1;
    if (8U == 8U)
        goto LAB52;

LAB53:    t9 = 0;

LAB54:    if (t9 != 0)
        goto LAB49;

LAB51:
LAB50:    goto LAB47;

LAB49:    xsi_set_current_line(91, ng0);
    t7 = (t0 + 4968);
    t12 = (t7 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    goto LAB50;

LAB52:    t11 = 0;

LAB55:    if (t11 < 8U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t1 = (t4 + t11);
    t6 = (t5 + t11);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB53;

LAB57:    t11 = (t11 + 1);
    goto LAB55;

}


extern void work_a_0646338223_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0646338223_3212880686_p_0,(void *)work_a_0646338223_3212880686_p_1,(void *)work_a_0646338223_3212880686_p_2};
	xsi_register_didat("work_a_0646338223_3212880686", "isim/top_isim_beh.exe.sim/work/a_0646338223_3212880686.didat");
	xsi_register_executes(pe);
}
