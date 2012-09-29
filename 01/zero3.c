#include "zero3.h"

Zespolone *init(float R,float I)
{
	Zespolone *l=malloc(sizeof(struct ZESPOLONE));
	l->R=R;
	l->I=I;
	return l;
}

void destroy(Zespolone *l)
{
	free(l);
}

Zespolone *dodawanie1(Zespolone *l1,Zespolone *l2)
{
	Zespolone *w=malloc(sizeof(struct ZESPOLONE));
	w->R=l1->R+l2->R;
	w->I=l1->I+l2->I;
	return w;
}
void dodawanie2(Zespolone *l1,Zespolone *l2)
{
	l2->R+=l1->R;
	l2->I+=l1->I;
}
Zespolone *odejmowanie1(Zespolone *l1,Zespolone *l2)
{
	Zespolone *w=malloc(sizeof(struct ZESPOLONE));
	w->R=l1->R-l2->R;
	w->I=l1->I-l2->I;
	return w;
}
void odejmowanie2(Zespolone *l1,Zespolone *l2)
{
	l2->R-=l1->R;
	l2->I-=l1->I;
}

Zespolone *mnozenie1(Zespolone *l1,Zespolone *l2)
{
	Zespolone *w=malloc(sizeof(struct ZESPOLONE));
	w->R=(l1->R*l2->R)-(l1->I*l2->I);
	w->I=(l1->R*l2->I)+(l2->R*l1->I);
	return w;
}

void mnozenie2(Zespolone *l1,Zespolone *l2)
{
	Zespolone *tmp=malloc(sizeof(struct ZESPOLONE));
	tmp->R=l2->R;
	tmp->I=l2->I;
	l2->R=(l1->R*tmp->R)-(l1->I*tmp->I);
	l2->I=(l1->R*tmp->I)+(tmp->R*l1->I);
	free(tmp);
}

Zespolone *dzielenie1(Zespolone *l1,Zespolone *l2)
{
	Zespolone *w=malloc(sizeof(struct ZESPOLONE));
	w->R=((l1->R*l2->R)+(l1->I*l2->I))/((l2->R*l2->R)+(l2->I*l2->I));
	w->I=((l1->I*l2->R)-(l1->R*l2->I))/((l2->R*l2->R)+(l2->I*l2->I));
	return w;
}

void dzielenie2(Zespolone *l1,Zespolone *l2)
{
	Zespolone *tmp=malloc(sizeof(struct ZESPOLONE));
	tmp->R=l2->R;
	tmp->I=l2->I;
	l2->R=((l1->R*tmp->R)+(l1->I*tmp->I))/((tmp->R*tmp->R)+(tmp->I*tmp->I));
	l2->I=((l1->I*tmp->R)-(l1->R*tmp->I))/((tmp->R*tmp->R)+(tmp->I*tmp->I));
	free(tmp);
}
