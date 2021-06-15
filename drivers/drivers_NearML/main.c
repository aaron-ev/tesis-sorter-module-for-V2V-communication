
#include <stdio.h>
#include <stdlib.h>
#include "stdint.h"
//  @modulations
#define QPSK      0
#define QAM_16    1
#define QAM_64    2

typedef enum
{
    busy,
    done,
}status;

/*
    input : @modulations
*/
void detector_writeConfReg(uint8_t mod);
void detector_writeMemIn(char *str);
uint8_t detector_readMemOut(void);
status detector_readStatus(void);

int main()
{
    printf("Hello world!\n");
    return 0;
}
