#ifndef __ZERO3_H__
#define __ZERO3_H__

#include <stdio.h>
#include <stdlib.h>

typedef struct ZESPOLONE
{
	float R;
	float I;
} Zespolone;

Zespolone *init(float R,float I);
void destroy(Zespolone *l);

Zespolone *dodawanie1(Zespolone *l1,Zespolone *l2);
void dodawanie2(Zespolone *l1,Zespolone *l2);

Zespolone *odejmowanie1(Zespolone *l1,Zespolone *l2);
void odejmowanie2(Zespolone *l1,Zespolone *l2);

Zespolone *mnozenie1(Zespolone *l1,Zespolone *l2);
void mnozenie2(Zespolone *l1,Zespolone *l2);

Zespolone *dzielenie1(Zespolone *l1,Zespolone *l2);
void dzielenie2(Zespolone *l1,Zespolone *l2);

#endif
