#include "Daemon.h"

int main(int argc, char **argv)
{
	//调用方式检查
	if(argc != 1)
	{
		printf("调用方法：直接执行Daemon\n");
		return -1;
	}

	printf("main begin ...\n");

	//调用守护进程启动函数
	if(!DaemonStart())
		printf("DaemonStart succ\n");
	else
		printf("DaemonStart fail\n");

	printf("main end\n");

	return 0;
}

//启动守护进程 
int DaemonStart()
{
	//int i;
	//int pid;
/* 
	pid = fork();
	if(pid > 0)
	{
		exit(0);
	}
	else if(pid < 0) { 
		return -1;
	}
 
	setsid();
 
	pid=fork();
	if( pid > 0) {
		exit(0);
	}
	else if( pid< 0) {
		return -1;
	}
 
	for(i=0;i< NOFILE;close(i++));
 
	chdir("/mnt/hgfs/lalala/test");
 
	umask(0);
 
	signal(SIGCHLD,SIG_IGN); 
*/
	return TRUE;
}
