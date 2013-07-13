#include <stdio.h>
#include <stdlib.h>
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
							if(current_line<100)
								printf("%d\n",current_line);			
                            break;
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
	pre_process("/home/huangsu/Downloads/adult.data");
	printf("total lines:%d\ndiscard lines: %d\n",current_line,discard_lines);
	return 0;
}
