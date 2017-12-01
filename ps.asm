
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"


int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
	ps();
   6:	e8 91 03 00 00       	call   39c <ps>
	exit();
   b:	e8 54 02 00 00       	call   264 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	8a 12                	mov    (%edx),%dl
  56:	88 10                	mov    %dl,(%eax)
  58:	8a 00                	mov    (%eax),%al
  5a:	84 c0                	test   %al,%al
  5c:	75 e4                	jne    42 <strcpy+0xd>
    ;
  return os;
  5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  61:	c9                   	leave  
  62:	c3                   	ret    

00000063 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  63:	55                   	push   %ebp
  64:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  66:	eb 06                	jmp    6e <strcmp+0xb>
    p++, q++;
  68:	ff 45 08             	incl   0x8(%ebp)
  6b:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  6e:	8b 45 08             	mov    0x8(%ebp),%eax
  71:	8a 00                	mov    (%eax),%al
  73:	84 c0                	test   %al,%al
  75:	74 0e                	je     85 <strcmp+0x22>
  77:	8b 45 08             	mov    0x8(%ebp),%eax
  7a:	8a 10                	mov    (%eax),%dl
  7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  7f:	8a 00                	mov    (%eax),%al
  81:	38 c2                	cmp    %al,%dl
  83:	74 e3                	je     68 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	8a 00                	mov    (%eax),%al
  8a:	0f b6 d0             	movzbl %al,%edx
  8d:	8b 45 0c             	mov    0xc(%ebp),%eax
  90:	8a 00                	mov    (%eax),%al
  92:	0f b6 c0             	movzbl %al,%eax
  95:	29 c2                	sub    %eax,%edx
  97:	89 d0                	mov    %edx,%eax
}
  99:	5d                   	pop    %ebp
  9a:	c3                   	ret    

0000009b <strlen>:

uint
strlen(char *s)
{
  9b:	55                   	push   %ebp
  9c:	89 e5                	mov    %esp,%ebp
  9e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  a8:	eb 03                	jmp    ad <strlen+0x12>
  aa:	ff 45 fc             	incl   -0x4(%ebp)
  ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
  b0:	8b 45 08             	mov    0x8(%ebp),%eax
  b3:	01 d0                	add    %edx,%eax
  b5:	8a 00                	mov    (%eax),%al
  b7:	84 c0                	test   %al,%al
  b9:	75 ef                	jne    aa <strlen+0xf>
    ;
  return n;
  bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  be:	c9                   	leave  
  bf:	c3                   	ret    

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  c6:	8b 45 10             	mov    0x10(%ebp),%eax
  c9:	89 44 24 08          	mov    %eax,0x8(%esp)
  cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	89 04 24             	mov    %eax,(%esp)
  da:	e8 31 ff ff ff       	call   10 <stosb>
  return dst;
  df:	8b 45 08             	mov    0x8(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strchr>:

char*
strchr(const char *s, char c)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	83 ec 04             	sub    $0x4,%esp
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  f0:	eb 12                	jmp    104 <strchr+0x20>
    if(*s == c)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	8a 00                	mov    (%eax),%al
  f7:	3a 45 fc             	cmp    -0x4(%ebp),%al
  fa:	75 05                	jne    101 <strchr+0x1d>
      return (char*)s;
  fc:	8b 45 08             	mov    0x8(%ebp),%eax
  ff:	eb 11                	jmp    112 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 101:	ff 45 08             	incl   0x8(%ebp)
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8a 00                	mov    (%eax),%al
 109:	84 c0                	test   %al,%al
 10b:	75 e5                	jne    f2 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 10d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 112:	c9                   	leave  
 113:	c3                   	ret    

00000114 <gets>:

char*
gets(char *buf, int max)
{
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 121:	eb 49                	jmp    16c <gets+0x58>
    cc = read(0, &c, 1);
 123:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 12a:	00 
 12b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 12e:	89 44 24 04          	mov    %eax,0x4(%esp)
 132:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 139:	e8 3e 01 00 00       	call   27c <read>
 13e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 141:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 145:	7f 02                	jg     149 <gets+0x35>
      break;
 147:	eb 2c                	jmp    175 <gets+0x61>
    buf[i++] = c;
 149:	8b 45 f4             	mov    -0xc(%ebp),%eax
 14c:	8d 50 01             	lea    0x1(%eax),%edx
 14f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 152:	89 c2                	mov    %eax,%edx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	01 c2                	add    %eax,%edx
 159:	8a 45 ef             	mov    -0x11(%ebp),%al
 15c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 15e:	8a 45 ef             	mov    -0x11(%ebp),%al
 161:	3c 0a                	cmp    $0xa,%al
 163:	74 10                	je     175 <gets+0x61>
 165:	8a 45 ef             	mov    -0x11(%ebp),%al
 168:	3c 0d                	cmp    $0xd,%al
 16a:	74 09                	je     175 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 16c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16f:	40                   	inc    %eax
 170:	3b 45 0c             	cmp    0xc(%ebp),%eax
 173:	7c ae                	jl     123 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 175:	8b 55 f4             	mov    -0xc(%ebp),%edx
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 180:	8b 45 08             	mov    0x8(%ebp),%eax
}
 183:	c9                   	leave  
 184:	c3                   	ret    

00000185 <stat>:

int
stat(char *n, struct stat *st)
{
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 18b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 192:	00 
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	89 04 24             	mov    %eax,(%esp)
 199:	e8 06 01 00 00       	call   2a4 <open>
 19e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1a5:	79 07                	jns    1ae <stat+0x29>
    return -1;
 1a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ac:	eb 23                	jmp    1d1 <stat+0x4c>
  r = fstat(fd, st);
 1ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b8:	89 04 24             	mov    %eax,(%esp)
 1bb:	e8 fc 00 00 00       	call   2bc <fstat>
 1c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c6:	89 04 24             	mov    %eax,(%esp)
 1c9:	e8 be 00 00 00       	call   28c <close>
  return r;
 1ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1d1:	c9                   	leave  
 1d2:	c3                   	ret    

000001d3 <atoi>:

int
atoi(const char *s)
{
 1d3:	55                   	push   %ebp
 1d4:	89 e5                	mov    %esp,%ebp
 1d6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1e0:	eb 24                	jmp    206 <atoi+0x33>
    n = n*10 + *s++ - '0';
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	89 d0                	mov    %edx,%eax
 1e7:	c1 e0 02             	shl    $0x2,%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	01 c0                	add    %eax,%eax
 1ee:	89 c1                	mov    %eax,%ecx
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 08             	mov    %edx,0x8(%ebp)
 1f9:	8a 00                	mov    (%eax),%al
 1fb:	0f be c0             	movsbl %al,%eax
 1fe:	01 c8                	add    %ecx,%eax
 200:	83 e8 30             	sub    $0x30,%eax
 203:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	8a 00                	mov    (%eax),%al
 20b:	3c 2f                	cmp    $0x2f,%al
 20d:	7e 09                	jle    218 <atoi+0x45>
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	8a 00                	mov    (%eax),%al
 214:	3c 39                	cmp    $0x39,%al
 216:	7e ca                	jle    1e2 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 218:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 229:	8b 45 0c             	mov    0xc(%ebp),%eax
 22c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 22f:	eb 16                	jmp    247 <memmove+0x2a>
    *dst++ = *src++;
 231:	8b 45 fc             	mov    -0x4(%ebp),%eax
 234:	8d 50 01             	lea    0x1(%eax),%edx
 237:	89 55 fc             	mov    %edx,-0x4(%ebp)
 23a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 23d:	8d 4a 01             	lea    0x1(%edx),%ecx
 240:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 243:	8a 12                	mov    (%edx),%dl
 245:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 247:	8b 45 10             	mov    0x10(%ebp),%eax
 24a:	8d 50 ff             	lea    -0x1(%eax),%edx
 24d:	89 55 10             	mov    %edx,0x10(%ebp)
 250:	85 c0                	test   %eax,%eax
 252:	7f dd                	jg     231 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 254:	8b 45 08             	mov    0x8(%ebp),%eax
}
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop

0000025c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 25c:	b8 01 00 00 00       	mov    $0x1,%eax
 261:	cd 40                	int    $0x40
 263:	c3                   	ret    

00000264 <exit>:
SYSCALL(exit)
 264:	b8 02 00 00 00       	mov    $0x2,%eax
 269:	cd 40                	int    $0x40
 26b:	c3                   	ret    

0000026c <wait>:
SYSCALL(wait)
 26c:	b8 03 00 00 00       	mov    $0x3,%eax
 271:	cd 40                	int    $0x40
 273:	c3                   	ret    

00000274 <pipe>:
SYSCALL(pipe)
 274:	b8 04 00 00 00       	mov    $0x4,%eax
 279:	cd 40                	int    $0x40
 27b:	c3                   	ret    

0000027c <read>:
SYSCALL(read)
 27c:	b8 05 00 00 00       	mov    $0x5,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret    

00000284 <write>:
SYSCALL(write)
 284:	b8 10 00 00 00       	mov    $0x10,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <close>:
SYSCALL(close)
 28c:	b8 15 00 00 00       	mov    $0x15,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <kill>:
SYSCALL(kill)
 294:	b8 06 00 00 00       	mov    $0x6,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <exec>:
SYSCALL(exec)
 29c:	b8 07 00 00 00       	mov    $0x7,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <open>:
SYSCALL(open)
 2a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <mknod>:
SYSCALL(mknod)
 2ac:	b8 11 00 00 00       	mov    $0x11,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <unlink>:
SYSCALL(unlink)
 2b4:	b8 12 00 00 00       	mov    $0x12,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <fstat>:
SYSCALL(fstat)
 2bc:	b8 08 00 00 00       	mov    $0x8,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <link>:
SYSCALL(link)
 2c4:	b8 13 00 00 00       	mov    $0x13,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <mkdir>:
SYSCALL(mkdir)
 2cc:	b8 14 00 00 00       	mov    $0x14,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <chdir>:
SYSCALL(chdir)
 2d4:	b8 09 00 00 00       	mov    $0x9,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <dup>:
SYSCALL(dup)
 2dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <getpid>:
SYSCALL(getpid)
 2e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <sbrk>:
SYSCALL(sbrk)
 2ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <sleep>:
SYSCALL(sleep)
 2f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <uptime>:
SYSCALL(uptime)
 2fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <getticks>:
SYSCALL(getticks)
 304:	b8 16 00 00 00       	mov    $0x16,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <get_name>:
SYSCALL(get_name)
 30c:	b8 17 00 00 00       	mov    $0x17,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <get_max_proc>:
SYSCALL(get_max_proc)
 314:	b8 18 00 00 00       	mov    $0x18,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <get_max_mem>:
SYSCALL(get_max_mem)
 31c:	b8 19 00 00 00       	mov    $0x19,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <get_max_disk>:
SYSCALL(get_max_disk)
 324:	b8 1a 00 00 00       	mov    $0x1a,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <get_curr_proc>:
SYSCALL(get_curr_proc)
 32c:	b8 1b 00 00 00       	mov    $0x1b,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <get_curr_mem>:
SYSCALL(get_curr_mem)
 334:	b8 1c 00 00 00       	mov    $0x1c,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <get_curr_disk>:
SYSCALL(get_curr_disk)
 33c:	b8 1d 00 00 00       	mov    $0x1d,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <set_name>:
SYSCALL(set_name)
 344:	b8 1e 00 00 00       	mov    $0x1e,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <set_max_mem>:
SYSCALL(set_max_mem)
 34c:	b8 1f 00 00 00       	mov    $0x1f,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <set_max_disk>:
SYSCALL(set_max_disk)
 354:	b8 20 00 00 00       	mov    $0x20,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <set_max_proc>:
SYSCALL(set_max_proc)
 35c:	b8 21 00 00 00       	mov    $0x21,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <set_curr_mem>:
SYSCALL(set_curr_mem)
 364:	b8 22 00 00 00       	mov    $0x22,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <set_curr_disk>:
SYSCALL(set_curr_disk)
 36c:	b8 23 00 00 00       	mov    $0x23,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <set_curr_proc>:
SYSCALL(set_curr_proc)
 374:	b8 24 00 00 00       	mov    $0x24,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <find>:
SYSCALL(find)
 37c:	b8 25 00 00 00       	mov    $0x25,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <is_full>:
SYSCALL(is_full)
 384:	b8 26 00 00 00       	mov    $0x26,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <container_init>:
SYSCALL(container_init)
 38c:	b8 27 00 00 00       	mov    $0x27,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <cont_proc_set>:
SYSCALL(cont_proc_set)
 394:	b8 28 00 00 00       	mov    $0x28,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <ps>:
SYSCALL(ps)
 39c:	b8 29 00 00 00       	mov    $0x29,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <reduce_curr_mem>:
SYSCALL(reduce_curr_mem)
 3a4:	b8 2a 00 00 00       	mov    $0x2a,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <set_root_inode>:
SYSCALL(set_root_inode)
 3ac:	b8 2b 00 00 00       	mov    $0x2b,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <cstop>:
SYSCALL(cstop)
 3b4:	b8 2c 00 00 00       	mov    $0x2c,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <df>:
SYSCALL(df)
 3bc:	b8 2d 00 00 00       	mov    $0x2d,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	83 ec 18             	sub    $0x18,%esp
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3d7:	00 
 3d8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3db:	89 44 24 04          	mov    %eax,0x4(%esp)
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	89 04 24             	mov    %eax,(%esp)
 3e5:	e8 9a fe ff ff       	call   284 <write>
}
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    

000003ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	56                   	push   %esi
 3f0:	53                   	push   %ebx
 3f1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3fb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ff:	74 17                	je     418 <printint+0x2c>
 401:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 405:	79 11                	jns    418 <printint+0x2c>
    neg = 1;
 407:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	f7 d8                	neg    %eax
 413:	89 45 ec             	mov    %eax,-0x14(%ebp)
 416:	eb 06                	jmp    41e <printint+0x32>
  } else {
    x = xx;
 418:	8b 45 0c             	mov    0xc(%ebp),%eax
 41b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 41e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 425:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 428:	8d 41 01             	lea    0x1(%ecx),%eax
 42b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 42e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 431:	8b 45 ec             	mov    -0x14(%ebp),%eax
 434:	ba 00 00 00 00       	mov    $0x0,%edx
 439:	f7 f3                	div    %ebx
 43b:	89 d0                	mov    %edx,%eax
 43d:	8a 80 b4 0a 00 00    	mov    0xab4(%eax),%al
 443:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 447:	8b 75 10             	mov    0x10(%ebp),%esi
 44a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 44d:	ba 00 00 00 00       	mov    $0x0,%edx
 452:	f7 f6                	div    %esi
 454:	89 45 ec             	mov    %eax,-0x14(%ebp)
 457:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45b:	75 c8                	jne    425 <printint+0x39>
  if(neg)
 45d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 461:	74 10                	je     473 <printint+0x87>
    buf[i++] = '-';
 463:	8b 45 f4             	mov    -0xc(%ebp),%eax
 466:	8d 50 01             	lea    0x1(%eax),%edx
 469:	89 55 f4             	mov    %edx,-0xc(%ebp)
 46c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 471:	eb 1e                	jmp    491 <printint+0xa5>
 473:	eb 1c                	jmp    491 <printint+0xa5>
    putc(fd, buf[i]);
 475:	8d 55 dc             	lea    -0x24(%ebp),%edx
 478:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47b:	01 d0                	add    %edx,%eax
 47d:	8a 00                	mov    (%eax),%al
 47f:	0f be c0             	movsbl %al,%eax
 482:	89 44 24 04          	mov    %eax,0x4(%esp)
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	89 04 24             	mov    %eax,(%esp)
 48c:	e8 33 ff ff ff       	call   3c4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 491:	ff 4d f4             	decl   -0xc(%ebp)
 494:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 498:	79 db                	jns    475 <printint+0x89>
    putc(fd, buf[i]);
}
 49a:	83 c4 30             	add    $0x30,%esp
 49d:	5b                   	pop    %ebx
 49e:	5e                   	pop    %esi
 49f:	5d                   	pop    %ebp
 4a0:	c3                   	ret    

000004a1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4a1:	55                   	push   %ebp
 4a2:	89 e5                	mov    %esp,%ebp
 4a4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4ae:	8d 45 0c             	lea    0xc(%ebp),%eax
 4b1:	83 c0 04             	add    $0x4,%eax
 4b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4b7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4be:	e9 77 01 00 00       	jmp    63a <printf+0x199>
    c = fmt[i] & 0xff;
 4c3:	8b 55 0c             	mov    0xc(%ebp),%edx
 4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c9:	01 d0                	add    %edx,%eax
 4cb:	8a 00                	mov    (%eax),%al
 4cd:	0f be c0             	movsbl %al,%eax
 4d0:	25 ff 00 00 00       	and    $0xff,%eax
 4d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4dc:	75 2c                	jne    50a <printf+0x69>
      if(c == '%'){
 4de:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4e2:	75 0c                	jne    4f0 <printf+0x4f>
        state = '%';
 4e4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4eb:	e9 47 01 00 00       	jmp    637 <printf+0x196>
      } else {
        putc(fd, c);
 4f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4f3:	0f be c0             	movsbl %al,%eax
 4f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	89 04 24             	mov    %eax,(%esp)
 500:	e8 bf fe ff ff       	call   3c4 <putc>
 505:	e9 2d 01 00 00       	jmp    637 <printf+0x196>
      }
    } else if(state == '%'){
 50a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 50e:	0f 85 23 01 00 00    	jne    637 <printf+0x196>
      if(c == 'd'){
 514:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 518:	75 2d                	jne    547 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 51a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51d:	8b 00                	mov    (%eax),%eax
 51f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 526:	00 
 527:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 52e:	00 
 52f:	89 44 24 04          	mov    %eax,0x4(%esp)
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	89 04 24             	mov    %eax,(%esp)
 539:	e8 ae fe ff ff       	call   3ec <printint>
        ap++;
 53e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 542:	e9 e9 00 00 00       	jmp    630 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 547:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 54b:	74 06                	je     553 <printf+0xb2>
 54d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 551:	75 2d                	jne    580 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 553:	8b 45 e8             	mov    -0x18(%ebp),%eax
 556:	8b 00                	mov    (%eax),%eax
 558:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 55f:	00 
 560:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 567:	00 
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 75 fe ff ff       	call   3ec <printint>
        ap++;
 577:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57b:	e9 b0 00 00 00       	jmp    630 <printf+0x18f>
      } else if(c == 's'){
 580:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 584:	75 42                	jne    5c8 <printf+0x127>
        s = (char*)*ap;
 586:	8b 45 e8             	mov    -0x18(%ebp),%eax
 589:	8b 00                	mov    (%eax),%eax
 58b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 58e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 592:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 596:	75 09                	jne    5a1 <printf+0x100>
          s = "(null)";
 598:	c7 45 f4 67 08 00 00 	movl   $0x867,-0xc(%ebp)
        while(*s != 0){
 59f:	eb 1c                	jmp    5bd <printf+0x11c>
 5a1:	eb 1a                	jmp    5bd <printf+0x11c>
          putc(fd, *s);
 5a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a6:	8a 00                	mov    (%eax),%al
 5a8:	0f be c0             	movsbl %al,%eax
 5ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	89 04 24             	mov    %eax,(%esp)
 5b5:	e8 0a fe ff ff       	call   3c4 <putc>
          s++;
 5ba:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c0:	8a 00                	mov    (%eax),%al
 5c2:	84 c0                	test   %al,%al
 5c4:	75 dd                	jne    5a3 <printf+0x102>
 5c6:	eb 68                	jmp    630 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5cc:	75 1d                	jne    5eb <printf+0x14a>
        putc(fd, *ap);
 5ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d1:	8b 00                	mov    (%eax),%eax
 5d3:	0f be c0             	movsbl %al,%eax
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 df fd ff ff       	call   3c4 <putc>
        ap++;
 5e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e9:	eb 45                	jmp    630 <printf+0x18f>
      } else if(c == '%'){
 5eb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ef:	75 17                	jne    608 <printf+0x167>
        putc(fd, c);
 5f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f4:	0f be c0             	movsbl %al,%eax
 5f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fb:	8b 45 08             	mov    0x8(%ebp),%eax
 5fe:	89 04 24             	mov    %eax,(%esp)
 601:	e8 be fd ff ff       	call   3c4 <putc>
 606:	eb 28                	jmp    630 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 608:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 60f:	00 
 610:	8b 45 08             	mov    0x8(%ebp),%eax
 613:	89 04 24             	mov    %eax,(%esp)
 616:	e8 a9 fd ff ff       	call   3c4 <putc>
        putc(fd, c);
 61b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61e:	0f be c0             	movsbl %al,%eax
 621:	89 44 24 04          	mov    %eax,0x4(%esp)
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	89 04 24             	mov    %eax,(%esp)
 62b:	e8 94 fd ff ff       	call   3c4 <putc>
      }
      state = 0;
 630:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 637:	ff 45 f0             	incl   -0x10(%ebp)
 63a:	8b 55 0c             	mov    0xc(%ebp),%edx
 63d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 640:	01 d0                	add    %edx,%eax
 642:	8a 00                	mov    (%eax),%al
 644:	84 c0                	test   %al,%al
 646:	0f 85 77 fe ff ff    	jne    4c3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 64c:	c9                   	leave  
 64d:	c3                   	ret    
 64e:	90                   	nop
 64f:	90                   	nop

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	83 e8 08             	sub    $0x8,%eax
 65c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65f:	a1 d0 0a 00 00       	mov    0xad0,%eax
 664:	89 45 fc             	mov    %eax,-0x4(%ebp)
 667:	eb 24                	jmp    68d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	8b 00                	mov    (%eax),%eax
 66e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 671:	77 12                	ja     685 <free+0x35>
 673:	8b 45 f8             	mov    -0x8(%ebp),%eax
 676:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 679:	77 24                	ja     69f <free+0x4f>
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	8b 00                	mov    (%eax),%eax
 680:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 683:	77 1a                	ja     69f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 690:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 693:	76 d4                	jbe    669 <free+0x19>
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	8b 00                	mov    (%eax),%eax
 69a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 69d:	76 ca                	jbe    669 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 69f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a2:	8b 40 04             	mov    0x4(%eax),%eax
 6a5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6af:	01 c2                	add    %eax,%edx
 6b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b4:	8b 00                	mov    (%eax),%eax
 6b6:	39 c2                	cmp    %eax,%edx
 6b8:	75 24                	jne    6de <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bd:	8b 50 04             	mov    0x4(%eax),%edx
 6c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c3:	8b 00                	mov    (%eax),%eax
 6c5:	8b 40 04             	mov    0x4(%eax),%eax
 6c8:	01 c2                	add    %eax,%edx
 6ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d3:	8b 00                	mov    (%eax),%eax
 6d5:	8b 10                	mov    (%eax),%edx
 6d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6da:	89 10                	mov    %edx,(%eax)
 6dc:	eb 0a                	jmp    6e8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	8b 10                	mov    (%eax),%edx
 6e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	8b 40 04             	mov    0x4(%eax),%eax
 6ee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	01 d0                	add    %edx,%eax
 6fa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fd:	75 20                	jne    71f <free+0xcf>
    p->s.size += bp->s.size;
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	8b 50 04             	mov    0x4(%eax),%edx
 705:	8b 45 f8             	mov    -0x8(%ebp),%eax
 708:	8b 40 04             	mov    0x4(%eax),%eax
 70b:	01 c2                	add    %eax,%edx
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	89 10                	mov    %edx,(%eax)
 71d:	eb 08                	jmp    727 <free+0xd7>
  } else
    p->s.ptr = bp;
 71f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 722:	8b 55 f8             	mov    -0x8(%ebp),%edx
 725:	89 10                	mov    %edx,(%eax)
  freep = p;
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	a3 d0 0a 00 00       	mov    %eax,0xad0
}
 72f:	c9                   	leave  
 730:	c3                   	ret    

00000731 <morecore>:

static Header*
morecore(uint nu)
{
 731:	55                   	push   %ebp
 732:	89 e5                	mov    %esp,%ebp
 734:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 737:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 73e:	77 07                	ja     747 <morecore+0x16>
    nu = 4096;
 740:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	c1 e0 03             	shl    $0x3,%eax
 74d:	89 04 24             	mov    %eax,(%esp)
 750:	e8 97 fb ff ff       	call   2ec <sbrk>
 755:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 758:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 75c:	75 07                	jne    765 <morecore+0x34>
    return 0;
 75e:	b8 00 00 00 00       	mov    $0x0,%eax
 763:	eb 22                	jmp    787 <morecore+0x56>
  hp = (Header*)p;
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 76b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76e:	8b 55 08             	mov    0x8(%ebp),%edx
 771:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 774:	8b 45 f0             	mov    -0x10(%ebp),%eax
 777:	83 c0 08             	add    $0x8,%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 ce fe ff ff       	call   650 <free>
  return freep;
 782:	a1 d0 0a 00 00       	mov    0xad0,%eax
}
 787:	c9                   	leave  
 788:	c3                   	ret    

00000789 <malloc>:

void*
malloc(uint nbytes)
{
 789:	55                   	push   %ebp
 78a:	89 e5                	mov    %esp,%ebp
 78c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	83 c0 07             	add    $0x7,%eax
 795:	c1 e8 03             	shr    $0x3,%eax
 798:	40                   	inc    %eax
 799:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 79c:	a1 d0 0a 00 00       	mov    0xad0,%eax
 7a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7a8:	75 23                	jne    7cd <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 7aa:	c7 45 f0 c8 0a 00 00 	movl   $0xac8,-0x10(%ebp)
 7b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b4:	a3 d0 0a 00 00       	mov    %eax,0xad0
 7b9:	a1 d0 0a 00 00       	mov    0xad0,%eax
 7be:	a3 c8 0a 00 00       	mov    %eax,0xac8
    base.s.size = 0;
 7c3:	c7 05 cc 0a 00 00 00 	movl   $0x0,0xacc
 7ca:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d0:	8b 00                	mov    (%eax),%eax
 7d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	8b 40 04             	mov    0x4(%eax),%eax
 7db:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7de:	72 4d                	jb     82d <malloc+0xa4>
      if(p->s.size == nunits)
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e9:	75 0c                	jne    7f7 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	8b 10                	mov    (%eax),%edx
 7f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f3:	89 10                	mov    %edx,(%eax)
 7f5:	eb 26                	jmp    81d <malloc+0x94>
      else {
        p->s.size -= nunits;
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	8b 40 04             	mov    0x4(%eax),%eax
 7fd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 800:	89 c2                	mov    %eax,%edx
 802:	8b 45 f4             	mov    -0xc(%ebp),%eax
 805:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 808:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80b:	8b 40 04             	mov    0x4(%eax),%eax
 80e:	c1 e0 03             	shl    $0x3,%eax
 811:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 814:	8b 45 f4             	mov    -0xc(%ebp),%eax
 817:	8b 55 ec             	mov    -0x14(%ebp),%edx
 81a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 81d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 820:	a3 d0 0a 00 00       	mov    %eax,0xad0
      return (void*)(p + 1);
 825:	8b 45 f4             	mov    -0xc(%ebp),%eax
 828:	83 c0 08             	add    $0x8,%eax
 82b:	eb 38                	jmp    865 <malloc+0xdc>
    }
    if(p == freep)
 82d:	a1 d0 0a 00 00       	mov    0xad0,%eax
 832:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 835:	75 1b                	jne    852 <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 837:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83a:	89 04 24             	mov    %eax,(%esp)
 83d:	e8 ef fe ff ff       	call   731 <morecore>
 842:	89 45 f4             	mov    %eax,-0xc(%ebp)
 845:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 849:	75 07                	jne    852 <malloc+0xc9>
        return 0;
 84b:	b8 00 00 00 00       	mov    $0x0,%eax
 850:	eb 13                	jmp    865 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 852:	8b 45 f4             	mov    -0xc(%ebp),%eax
 855:	89 45 f0             	mov    %eax,-0x10(%ebp)
 858:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85b:	8b 00                	mov    (%eax),%eax
 85d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 860:	e9 70 ff ff ff       	jmp    7d5 <malloc+0x4c>
}
 865:	c9                   	leave  
 866:	c3                   	ret    
