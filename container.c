// #include "user.h"
#include "container.h"
#include "types.h"
#include "defs.h"

#define NULL ((void*)0)
#define MAX_CONTAINERS 4

struct container containers[MAX_CONTAINERS];

void*
memcpy2(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
}

char* strcpy(char *s, char *t){
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

// struct con

void set_root_inode(char* name){

	containers[find(name)].root = namei(name);

}

void get_name(int vc_num, char* name){

	char* name2 = containers[vc_num].name;
	int i = 0;
	while(name2[i])
	{
		i++;
	}
	memcpy2(name, name2, i);
}

char* g_name(int vc_bun){
	return containers[vc_bun].name;
}

int is_full(){
	int i;
	for(i = 0; i < MAX_CONTAINERS; i++){
		if(strlen(containers[i].name) == 0){
			return i;
		}
	}
	return -1;
}

int find(char* name){
	//cprintf("in here");
	int i;
	for(i = 0; i < MAX_CONTAINERS; i++){
		if(strcmp(name, "") == 0){
			continue;
		}
		if(strcmp(name, containers[i].name) == 0){
			//cprintf("in hereI");
			return i;
		}
	}
	return -1;
}

int get_max_proc(int vc_num){
	struct container x = containers[vc_num];
	return x.max_proc;
}

struct container* get_container(int vc_num){
	struct container* cont = &containers[vc_num];
	// cprintf("vc num given is %d\n.", vc_num);
	// cprintf("The name for this container is %s.\n", cont->name);
	return cont;
}

int get_max_mem(int vc_num){
	struct container x = containers[vc_num];
	return x.max_mem; 
}

int get_max_disk(int vc_num){
	struct container x = containers[vc_num];
	return x.max_disk;
}

int get_curr_proc(int vc_num){
	struct container x = containers[vc_num];
	return x.curr_proc;
}

int get_curr_mem(int vc_num){
	struct container x = containers[vc_num];
	cprintf("curr mem is called. Val : %d.\n", x.curr_mem);
	return x.curr_mem; 
}

int get_curr_disk(int vc_num){
	struct container x = containers[vc_num];
	return x.curr_disk;	
}

void set_name(char* name, int vc_num){
	strcpy(containers[vc_num].name, name);
}

void set_max_mem(int mem, int vc_num){
	containers[vc_num].max_mem = mem;
}

void set_max_disk(int disk, int vc_num){
	containers[vc_num].max_disk = disk;
}

void set_max_proc(int procs, int vc_num){
	containers[vc_num].max_proc = procs;
}

void set_curr_mem(int mem, int vc_num){
	containers[vc_num].curr_mem = containers[vc_num].curr_mem + 1;
	// cprintf("Memory was %d, but now its %d pages.\n",containers[vc_num].curr_mem-1, containers[vc_num].curr_mem);	
}

void reduce_curr_mem(int mem, int vc_num){
	containers[vc_num].curr_mem = containers[vc_num].curr_mem - 1;
	// cprintf("Memory was %d, but now its %d pages.\n",containers[vc_num].curr_mem, containers[vc_num].curr_mem-1);	
}

void set_curr_disk(int disk, int vc_num){
	containers[vc_num].curr_disk += disk;
}

void set_curr_proc(int procs, int vc_num){
	containers[vc_num].curr_proc = procs;	
}

int max_containers(){
	return MAX_CONTAINERS;
}

void container_init(){
	int i;
	for(i = 0; i < MAX_CONTAINERS; i++){
		strcpy(containers[i].name, "");
		containers[i].max_proc = 4;
		containers[i].max_disk = 100;
		containers[i].max_mem = 100;
		containers[i].curr_proc = 1;
		containers[i].curr_disk = 0;
		containers[i].curr_mem = 0;
	}
}

void container_reset(int vc_num){
	strcpy(containers[vc_num].name, "");
	containers[vc_num].max_proc = 4;
	containers[vc_num].max_disk = 100;
	containers[vc_num].max_mem = 100;
	containers[vc_num].curr_proc = 1;
	containers[vc_num].curr_disk = 0;
	containers[vc_num].curr_mem = 0;
}



