/************ Pthread Compatible *************/
pthread_mutex_t g_var_mutex =  PTHREAD_MUTEX_INITIALIZER;

void atomic_set(long* dest, const long src)
{
    pthread_mutex_lock(&g_var_mutex);
      *dest = src;
        pthread_mutex_unlock(&g_var_mutex);
}

long atomic_get(const long* src)
{
    long ret;
      pthread_mutex_lock(&g_var_mutex);
        ret = *src;
          pthread_mutex_unlock(&g_var_mutex);
            return ret; 
}

/************ File Exist Function *************/
bool file_exists(const char* filename)
{
  struct stat buf;
  return 0 == stat(filename, &buf);
}


/************ Signal Handle *************/
void sighandler_generic(int n)
{
  syslog(LOG_WARNING  , "PID %d got signal %d, exiting.\n", getpid(),  n);
  // RUN ANY CLEANUP CODE HERE IF NEEDED.
  exit(-1);
}

void setup_signals()
{
  signal(SIGINT  , sighandler_generic);
  signal(SIGTERM , sighandler_generic);
  signal(SIGHUP  , sighandler_generic);
  signal(SIGQUIT , sighandler_generic);
  signal(SIGILL  , sighandler_generic);
  signal(SIGABRT , sighandler_generic);
  signal(SIGFPE  , sighandler_generic);
  signal(SIGKILL , sighandler_generic);
  signal(SIGSEGV , sighandler_generic);
  signal(SIGPIPE , SIG_IGN);
}

/************ App Exit *************/
#define APP_EXIT(status) do{printf("Exit at %s:%d, status=%d\n", __FILE__, __LINE__,  status);\
   exit(status);}while(0)

/************ Malloc Check *************/
void *checked_malloc(const char* file, const int line, size_t size)
{
   void* ret = malloc(size);
    if(!ret){printf("Malloc returned NULL at %s:%d\n", file, line);}
     return ret;
}
#define MALLOC(size) checked_malloc(__FILE__, __LINE__, size)
