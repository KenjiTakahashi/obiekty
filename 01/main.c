#include "zero3.h"

int main()
{
	Zespolone *l1=init(4,7);
	Zespolone *l2=init(5,3);
	Zespolone *w;
	int o;
	printf(":");
	scanf("%i",&o);
	switch(o)
	{
		case 0:
		break;
		case 1:
		w=dodawanie1(l1,l2);
		dodawanie2(l1,l2);
		printf("%f,%f,%f,%f",w->R,w->I,l1->R,l1->I);
		break;
		case 2:
		w=odejmowanie1(l1,l2);
		odejmowanie2(l1,l2);
		printf("%f,%f,%f,%f",w->R,w->I,l1->R,l1->I);
		break;
		case 3:
		w=mnozenie1(l1,l2);
		mnozenie2(l1,l2);
		printf("%f,%f,%f,%f",w->R,w->I,l1->R,l1->I);
		break;
		case 4:
		w=dzielenie1(l1,l2);
		dzielenie2(l1,l2);
		printf("%f,%f,%f,%f",w->R,w->I,l1->R,l1->I);
		break;
	}
	free(w);
	destroy(l1);
	destroy(l2);
	return 0;
}
