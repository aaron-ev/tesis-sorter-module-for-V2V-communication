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
static const char *ng0 = "C:/Users/aaron/Desktop/git_tesis/xilinxWorkSpace/trueDualPortRam.v";



static void Always_21_0(char *t0)
{
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    int t26;
    char *t27;
    unsigned int t28;
    int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    int t34;

LAB0:    t1 = (t0 + 4968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(21, ng0);
    t2 = (t0 + 5536);
    *((int *)t2) = 1;
    t3 = (t0 + 5000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(22, ng0);

LAB5:    t4 = (t0 + 280);
    xsi_vlog_namedbase_setdisablestate(t4, &&LAB6);
    t5 = (t0 + 4776);
    xsi_vlog_namedbase_pushprocess(t4, t5);

LAB7:    xsi_set_current_line(23, ng0);
    t6 = (t0 + 2368U);
    t7 = *((char **)t6);
    t6 = (t7 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB8;

LAB9:
LAB10:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4048);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t13 = (t0 + 4048);
    t14 = (t13 + 64U);
    t17 = *((char **)t14);
    t18 = (t0 + 3008U);
    t19 = *((char **)t18);
    xsi_vlog_generic_get_array_select_value(t15, 16, t4, t7, t17, 2, 1, t19, 3, 2);
    t18 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t18, t15, 0, 0, 16, 0LL);
    t2 = (t0 + 280);
    xsi_vlog_namedbase_popprocess(t2);

LAB6:    t3 = (t0 + 4776);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB2;

LAB8:    xsi_set_current_line(24, ng0);
    t13 = (t0 + 2048U);
    t14 = *((char **)t13);
    t13 = (t0 + 4048);
    t17 = (t0 + 4048);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 4048);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 2848U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t24, 3, 2);
    t23 = (t15 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (!(t25));
    t27 = (t16 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    t30 = (t26 && t29);
    if (t30 == 1)
        goto LAB11;

LAB12:    goto LAB10;

LAB11:    t31 = *((unsigned int *)t15);
    t32 = *((unsigned int *)t16);
    t33 = (t31 - t32);
    t34 = (t33 + 1);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, *((unsigned int *)t16), t34, 0LL);
    goto LAB12;

}

static void Always_29_1(char *t0)
{
    char t15[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    int t26;
    char *t27;
    unsigned int t28;
    int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    int t34;

LAB0:    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 5552);
    *((int *)t2) = 1;
    t3 = (t0 + 5248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    t4 = (t0 + 576);
    xsi_vlog_namedbase_setdisablestate(t4, &&LAB6);
    t5 = (t0 + 5024);
    xsi_vlog_namedbase_pushprocess(t4, t5);

LAB7:    xsi_set_current_line(31, ng0);
    t6 = (t0 + 2528U);
    t7 = *((char **)t6);
    t6 = (t7 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB8;

LAB9:
LAB10:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4048);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t13 = (t0 + 4048);
    t14 = (t13 + 64U);
    t17 = *((char **)t14);
    t18 = (t0 + 3328U);
    t19 = *((char **)t18);
    xsi_vlog_generic_get_array_select_value(t15, 16, t4, t7, t17, 2, 1, t19, 3, 2);
    t18 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t18, t15, 0, 0, 16, 0LL);
    t2 = (t0 + 576);
    xsi_vlog_namedbase_popprocess(t2);

LAB6:    t3 = (t0 + 5024);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB2;

LAB8:    xsi_set_current_line(32, ng0);
    t13 = (t0 + 2208U);
    t14 = *((char **)t13);
    t13 = (t0 + 4048);
    t17 = (t0 + 4048);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 4048);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 3168U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t24, 3, 2);
    t23 = (t15 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (!(t25));
    t27 = (t16 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (!(t28));
    t30 = (t26 && t29);
    if (t30 == 1)
        goto LAB11;

LAB12:    goto LAB10;

LAB11:    t31 = *((unsigned int *)t15);
    t32 = *((unsigned int *)t16);
    t33 = (t31 - t32);
    t34 = (t33 + 1);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, *((unsigned int *)t16), t34, 0LL);
    goto LAB12;

}


extern void work_m_00000000001788963834_3269533161_init()
{
	static char *pe[] = {(void *)Always_21_0,(void *)Always_29_1};
	xsi_register_didat("work_m_00000000001788963834_3269533161", "isim/dotProduct_isim_beh.exe.sim/work/m_00000000001788963834_3269533161.didat");
	xsi_register_executes(pe);
}
