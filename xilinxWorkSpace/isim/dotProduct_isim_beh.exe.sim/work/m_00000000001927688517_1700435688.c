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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/aaron/Desktop/git_tesis/xilinxWorkSpace/mul2ab.v";



static void Cont_9_0(char *t0)
{
    char t5[8];
    char t8[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(9, ng0);
    t2 = (t0 + 1184U);
    t3 = *((char **)t2);
    t2 = (t0 + 1344U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    xsi_vlog_unsigned_multiply(t5, 16, t3, 8, t4, 8);
    t2 = (t0 + 1184U);
    t6 = *((char **)t2);
    t2 = (t0 + 1344U);
    t7 = *((char **)t2);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_multiply(t8, 16, t6, 8, t7, 8);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 16, t5, 16, t8, 16);
    t2 = (t0 + 3064);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memset(t13, 0, 8);
    t14 = 65535U;
    t15 = t14;
    t16 = (t9 + 4);
    t17 = *((unsigned int *)t9);
    t14 = (t14 & t17);
    t18 = *((unsigned int *)t16);
    t15 = (t15 & t18);
    t19 = (t13 + 4);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 | t14);
    t21 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t21 | t15);
    xsi_driver_vfirst_trans(t2, 0, 15);
    t22 = (t0 + 2984);
    *((int *)t22) = 1;

LAB1:    return;
}


extern void work_m_00000000001927688517_1700435688_init()
{
	static char *pe[] = {(void *)Cont_9_0};
	xsi_register_didat("work_m_00000000001927688517_1700435688", "isim/dotProduct_isim_beh.exe.sim/work/m_00000000001927688517_1700435688.didat");
	xsi_register_executes(pe);
}
