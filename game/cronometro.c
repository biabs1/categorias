#include <unistd.h>
int cronometro(int seg) {
    for (seg;;seg--) {
        printf("\r00:%02d", seg);
        printf("\n");
        if(seg == 0){
            
            return 0;
        }
        sleep(1);
    }
    return 0;
}

