#ifndef DEBUG_H__
#define DEBUG_H__

#include <stdlib.h>

#define APP_EXIT(status) do{fprintf(stderr, "Exit at %s:%d, status=%d\n", __FILE__, __LINE__,  status);\
   exit(status);}while(0)

void *checked_malloc(const char* file, const int line, size_t size);
#define MALLOC(size) checked_malloc(__FILE__, __LINE__, size)

#endif
