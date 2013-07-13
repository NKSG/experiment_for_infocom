#include <map>
#include <fstream>
#include <string>
#include <stdio.h>
#include <iostream>
using namespace std;

struct item{
	int d1;
	char s2[32];
	int d3;
	char s4[32];
	int d5;
	char s6[32],s7[32],s8[32],s9[32],s10[32];
	int d11,d12,d13;
	char s14[32],s15[32];
	
};

#define Get_string_count(map,str) do{  \
	if(map.count(str)>0)           \
		map[str]++;            \
	else                           \
		map[str] = 1;	       \
}while(0)          


#define MAX_LEN 1024

static unsigned int discard_lines=0;
static unsigned int current_line=0;

bool pre_process(const char* filename)
{
    FILE *f=NULL,*fnew=NULL;
    char buf[MAX_LEN];
    unsigned int read=0,len;

    f = fopen(filename,"r");
    fnew = fopen("fnew.data","w");
    if(!f){
        return false;
    }
    if(!fnew){
        fclose(f);
        return false;
    }

    while(!feof(f)){
       if( fgets(buf,MAX_LEN,f)!=NULL)
       {
            char *p = buf;
            bool discard_flag = false;
			++current_line;  
			  	

		    while(*p!='\n')
            {
                    
                    if(*p=='?')
                    {
                            discard_lines++;
                            discard_flag=true;	
                            break;
                    }else if(*p==','){
			*p =' ';
		    }
                    p++;
            }
            if(!discard_flag)
            {
                    fputs(buf,fnew);
            }
       }
    }
    fclose(f);
    fclose(fnew);
}




int main()
{
	FILE *f=NULL;
	ofstream out("statistic.data");
	char buf[1024];
	struct item entry;
	map<string,int> stat[8];
	
	pre_process("adult.data");
	printf("total lines:%d\ndiscard lines: %d\n",current_line,discard_lines);


	f = fopen("fnew.data","r");
	while(!feof(f))
	{
		fscanf(f,"%d  %s  %d  %s  %d  %s  %s  %s  %s  %s  %d  %d  %d  %s  %s",\ 
		&entry.d1,entry.s2,&entry.d3,entry.s4,&entry.d5,entry.s6,\
		entry.s7,entry.s8,entry.s9,entry.s10,&entry.d11,&entry.d12,&entry.d13,entry.s14,entry.s15);	   		
		string str = entry.s2;
		Get_string_count(stat[0],str);
		str = entry.s4;
		Get_string_count(stat[1],str);
		str = entry.s6;
		Get_string_count(stat[2],str);
		str = entry.s7;
		Get_string_count(stat[3],str);
		str = entry.s8;
		Get_string_count(stat[4],str);
		str = entry.s9;
		Get_string_count(stat[5],str);
		str = entry.s10;
		Get_string_count(stat[6],str);
		str = entry.s14;
		Get_string_count(stat[7],str);
		
	}
	for(int i=0;i<8;i++)
	{
		for(map<string,int>::iterator p = stat[i].begin();p!=stat[i].end();p++)
		{
			out<<"属性："<<p->first<<" 出现次数："<<p->second<<endl;
		}
		out<<"................."<<endl;
	}

	return 0;
}
