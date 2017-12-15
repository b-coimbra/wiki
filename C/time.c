#include <time.h>
char *w = "AAAA########+++///9999AA Good%s!\n\0morning\0day\0afternoon\0night";
int main() { time_t t = time(0); return printf(w+25, w+w[localtime(&t)->tm_hour]); }