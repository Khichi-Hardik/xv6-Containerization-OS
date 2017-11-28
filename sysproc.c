#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "container.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

void sys_container_init(){
  container_init();
}

int sys_is_full(void){
  return is_full();
}

int sys_find(void){
  char* name;
  argstr(0, &name);

  return find(name);
}

void sys_get_name(void){

  char* name;
  argstr(0, &name);

  int vc_num;
  argint(1, &vc_num);

  get_name(name, vc_num);
  return;
}

int sys_get_max_proc(void){
  int vc_num;
  argint(0, &vc_num);


  return get_max_proc(vc_num);  
}

int sys_get_max_mem(void){
  int vc_num;
  argint(0, &vc_num);


  return get_max_mem(vc_num);
}

int sys_get_max_disk(void){
  int vc_num;
  argint(0, &vc_num);


  return get_max_disk(vc_num);

}

int sys_get_curr_proc(void){
  int vc_num;
  argint(0, &vc_num);


  return get_curr_proc(vc_num);
}

int sys_get_curr_mem(void){
  int vc_num;
  argint(0, &vc_num);


  return get_curr_mem(vc_num);
}

int sys_get_curr_disk(void){
  int vc_num;
  argint(0, &vc_num);


  return get_curr_disk(vc_num);
}

void sys_set_name(void){
  char* name;
  argstr(0, &name);

  int vc_num;
  argint(1, &vc_num);

  set_name(name, vc_num);
}

void sys_set_max_mem(void){
  int mem;
  argint(0, &mem);

  int vc_num;
  argint(1, &vc_num);

  set_max_mem(mem, vc_num);
}

void sys_set_max_disk(void){
  int disk;
  argint(0, &disk);

  int vc_num;
  argint(1, &vc_num);

  set_max_disk(disk, vc_num);
}

void sys_set_max_proc(void){
  int proc;
  argint(0, &proc);

  int vc_num;
  argint(1, &vc_num);

  set_max_proc(proc, vc_num);
}

void sys_set_curr_mem(void){
  int mem;
  argint(0, &mem);

  int vc_num;
  argint(1, &vc_num);

  set_curr_mem(mem, vc_num);
}

void sys_set_curr_disk(void){
  int disk;
  argint(0, &disk);

  int vc_num;
  argint(1, &vc_num);

  set_curr_disk(disk, vc_num);
}

void sys_set_curr_proc(void){
  int proc;
  argint(0, &proc);

  int vc_num;
  argint(1, &vc_num);

  set_curr_proc(proc, vc_num);
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
sys_getticks(void)
{
  return myproc()->ticks;
}
