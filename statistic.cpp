#include <map>
#include <fstream>
#include <string>
#include <stdio.h>
using namespace std;
typedef struct{
	unsigned int age;
	char s1[32];
	double d1;
	char s2[32];
	
};

int main()
{
	FILE *f=NULL;
	ofstream out("statistic.data");
	char buf[1024];
	
	f = fopen("fnew.data","r");
	fscanf("%d,%s,%g,%s,%d,%s,%s,%s,%s,%s,%d,%d,%d,%s,%s",);		
	
	
	return 0;
}
