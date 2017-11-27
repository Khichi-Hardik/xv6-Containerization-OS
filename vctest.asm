
_vctest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int fd, id;

  if (argc < 3) {
   9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(1, "usage: vctest <vc> <cmd> [<arg> ...]\n");
   f:	c7 44 24 04 24 09 00 	movl   $0x924,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 3a 05 00 00       	call   55d <printf>
    exit();
  23:	e8 28 03 00 00       	call   350 <exit>
  }

  fd = open(argv[1], O_RDWR);
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 04             	add    $0x4,%eax
  2e:	8b 00                	mov    (%eax),%eax
  30:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  37:	00 
  38:	89 04 24             	mov    %eax,(%esp)
  3b:	e8 50 03 00 00       	call   390 <open>
  40:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  printf(1, "fd = %d\n", fd);
  44:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  48:	89 44 24 08          	mov    %eax,0x8(%esp)
  4c:	c7 44 24 04 4a 09 00 	movl   $0x94a,0x4(%esp)
  53:	00 
  54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5b:	e8 fd 04 00 00       	call   55d <printf>

  /* fork a child and exec argv[1] */
  id = fork();
  60:	e8 e3 02 00 00       	call   348 <fork>
  65:	89 44 24 18          	mov    %eax,0x18(%esp)

  if (id == 0){
  69:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  6e:	75 67                	jne    d7 <main+0xd7>
    close(0);
  70:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  77:	e8 fc 02 00 00       	call   378 <close>
    close(1);
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	e8 f0 02 00 00       	call   378 <close>
    close(2);
  88:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  8f:	e8 e4 02 00 00       	call   378 <close>
    dup(fd);
  94:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  98:	89 04 24             	mov    %eax,(%esp)
  9b:	e8 28 03 00 00       	call   3c8 <dup>
    dup(fd);
  a0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  a4:	89 04 24             	mov    %eax,(%esp)
  a7:	e8 1c 03 00 00       	call   3c8 <dup>
    dup(fd);
  ac:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b0:	89 04 24             	mov    %eax,(%esp)
  b3:	e8 10 03 00 00       	call   3c8 <dup>
    exec(argv[2], &argv[2]);
  b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  bb:	8d 50 08             	lea    0x8(%eax),%edx
  be:	8b 45 0c             	mov    0xc(%ebp),%eax
  c1:	83 c0 08             	add    $0x8,%eax
  c4:	8b 00                	mov    (%eax),%eax
  c6:	89 54 24 04          	mov    %edx,0x4(%esp)
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 b6 02 00 00       	call   388 <exec>
    exit();
  d2:	e8 79 02 00 00       	call   350 <exit>
  }

  printf(1, "%s started on vc0\n", argv[1]);
  d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  da:	83 c0 04             	add    $0x4,%eax
  dd:	8b 00                	mov    (%eax),%eax
  df:	89 44 24 08          	mov    %eax,0x8(%esp)
  e3:	c7 44 24 04 53 09 00 	movl   $0x953,0x4(%esp)
  ea:	00 
  eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f2:	e8 66 04 00 00       	call   55d <printf>

  exit();
  f7:	e8 54 02 00 00       	call   350 <exit>

000000fc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	57                   	push   %edi
 100:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 101:	8b 4d 08             	mov    0x8(%ebp),%ecx
 104:	8b 55 10             	mov    0x10(%ebp),%edx
 107:	8b 45 0c             	mov    0xc(%ebp),%eax
 10a:	89 cb                	mov    %ecx,%ebx
 10c:	89 df                	mov    %ebx,%edi
 10e:	89 d1                	mov    %edx,%ecx
 110:	fc                   	cld    
 111:	f3 aa                	rep stos %al,%es:(%edi)
 113:	89 ca                	mov    %ecx,%edx
 115:	89 fb                	mov    %edi,%ebx
 117:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 11d:	5b                   	pop    %ebx
 11e:	5f                   	pop    %edi
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    

00000121 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 127:	8b 45 08             	mov    0x8(%ebp),%eax
 12a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 12d:	90                   	nop
 12e:	8b 45 08             	mov    0x8(%ebp),%eax
 131:	8d 50 01             	lea    0x1(%eax),%edx
 134:	89 55 08             	mov    %edx,0x8(%ebp)
 137:	8b 55 0c             	mov    0xc(%ebp),%edx
 13a:	8d 4a 01             	lea    0x1(%edx),%ecx
 13d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 140:	8a 12                	mov    (%edx),%dl
 142:	88 10                	mov    %dl,(%eax)
 144:	8a 00                	mov    (%eax),%al
 146:	84 c0                	test   %al,%al
 148:	75 e4                	jne    12e <strcpy+0xd>
    ;
  return os;
 14a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    

0000014f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 152:	eb 06                	jmp    15a <strcmp+0xb>
    p++, q++;
 154:	ff 45 08             	incl   0x8(%ebp)
 157:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	8a 00                	mov    (%eax),%al
 15f:	84 c0                	test   %al,%al
 161:	74 0e                	je     171 <strcmp+0x22>
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	8a 10                	mov    (%eax),%dl
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	8a 00                	mov    (%eax),%al
 16d:	38 c2                	cmp    %al,%dl
 16f:	74 e3                	je     154 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	8a 00                	mov    (%eax),%al
 176:	0f b6 d0             	movzbl %al,%edx
 179:	8b 45 0c             	mov    0xc(%ebp),%eax
 17c:	8a 00                	mov    (%eax),%al
 17e:	0f b6 c0             	movzbl %al,%eax
 181:	29 c2                	sub    %eax,%edx
 183:	89 d0                	mov    %edx,%eax
}
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    

00000187 <strlen>:

uint
strlen(char *s)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 18d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 194:	eb 03                	jmp    199 <strlen+0x12>
 196:	ff 45 fc             	incl   -0x4(%ebp)
 199:	8b 55 fc             	mov    -0x4(%ebp),%edx
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	01 d0                	add    %edx,%eax
 1a1:	8a 00                	mov    (%eax),%al
 1a3:	84 c0                	test   %al,%al
 1a5:	75 ef                	jne    196 <strlen+0xf>
    ;
  return n;
 1a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1b2:	8b 45 10             	mov    0x10(%ebp),%eax
 1b5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 31 ff ff ff       	call   fc <stosb>
  return dst;
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ce:	c9                   	leave  
 1cf:	c3                   	ret    

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 04             	sub    $0x4,%esp
 1d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d9:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1dc:	eb 12                	jmp    1f0 <strchr+0x20>
    if(*s == c)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	8a 00                	mov    (%eax),%al
 1e3:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1e6:	75 05                	jne    1ed <strchr+0x1d>
      return (char*)s;
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	eb 11                	jmp    1fe <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1ed:	ff 45 08             	incl   0x8(%ebp)
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8a 00                	mov    (%eax),%al
 1f5:	84 c0                	test   %al,%al
 1f7:	75 e5                	jne    1de <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1f9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 206:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20d:	eb 49                	jmp    258 <gets+0x58>
    cc = read(0, &c, 1);
 20f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 216:	00 
 217:	8d 45 ef             	lea    -0x11(%ebp),%eax
 21a:	89 44 24 04          	mov    %eax,0x4(%esp)
 21e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 225:	e8 3e 01 00 00       	call   368 <read>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 22d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 231:	7f 02                	jg     235 <gets+0x35>
      break;
 233:	eb 2c                	jmp    261 <gets+0x61>
    buf[i++] = c;
 235:	8b 45 f4             	mov    -0xc(%ebp),%eax
 238:	8d 50 01             	lea    0x1(%eax),%edx
 23b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 23e:	89 c2                	mov    %eax,%edx
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	01 c2                	add    %eax,%edx
 245:	8a 45 ef             	mov    -0x11(%ebp),%al
 248:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 24a:	8a 45 ef             	mov    -0x11(%ebp),%al
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 10                	je     261 <gets+0x61>
 251:	8a 45 ef             	mov    -0x11(%ebp),%al
 254:	3c 0d                	cmp    $0xd,%al
 256:	74 09                	je     261 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 258:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25b:	40                   	inc    %eax
 25c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 25f:	7c ae                	jl     20f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 261:	8b 55 f4             	mov    -0xc(%ebp),%edx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	01 d0                	add    %edx,%eax
 269:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26f:	c9                   	leave  
 270:	c3                   	ret    

00000271 <stat>:

int
stat(char *n, struct stat *st)
{
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 277:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 27e:	00 
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	89 04 24             	mov    %eax,(%esp)
 285:	e8 06 01 00 00       	call   390 <open>
 28a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 28d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 291:	79 07                	jns    29a <stat+0x29>
    return -1;
 293:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 298:	eb 23                	jmp    2bd <stat+0x4c>
  r = fstat(fd, st);
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a4:	89 04 24             	mov    %eax,(%esp)
 2a7:	e8 fc 00 00 00       	call   3a8 <fstat>
 2ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b2:	89 04 24             	mov    %eax,(%esp)
 2b5:	e8 be 00 00 00       	call   378 <close>
  return r;
 2ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2bd:	c9                   	leave  
 2be:	c3                   	ret    

000002bf <atoi>:

int
atoi(const char *s)
{
 2bf:	55                   	push   %ebp
 2c0:	89 e5                	mov    %esp,%ebp
 2c2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2cc:	eb 24                	jmp    2f2 <atoi+0x33>
    n = n*10 + *s++ - '0';
 2ce:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2d1:	89 d0                	mov    %edx,%eax
 2d3:	c1 e0 02             	shl    $0x2,%eax
 2d6:	01 d0                	add    %edx,%eax
 2d8:	01 c0                	add    %eax,%eax
 2da:	89 c1                	mov    %eax,%ecx
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	8d 50 01             	lea    0x1(%eax),%edx
 2e2:	89 55 08             	mov    %edx,0x8(%ebp)
 2e5:	8a 00                	mov    (%eax),%al
 2e7:	0f be c0             	movsbl %al,%eax
 2ea:	01 c8                	add    %ecx,%eax
 2ec:	83 e8 30             	sub    $0x30,%eax
 2ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	8a 00                	mov    (%eax),%al
 2f7:	3c 2f                	cmp    $0x2f,%al
 2f9:	7e 09                	jle    304 <atoi+0x45>
 2fb:	8b 45 08             	mov    0x8(%ebp),%eax
 2fe:	8a 00                	mov    (%eax),%al
 300:	3c 39                	cmp    $0x39,%al
 302:	7e ca                	jle    2ce <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 304:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 307:	c9                   	leave  
 308:	c3                   	ret    

00000309 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 315:	8b 45 0c             	mov    0xc(%ebp),%eax
 318:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31b:	eb 16                	jmp    333 <memmove+0x2a>
    *dst++ = *src++;
 31d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 320:	8d 50 01             	lea    0x1(%eax),%edx
 323:	89 55 fc             	mov    %edx,-0x4(%ebp)
 326:	8b 55 f8             	mov    -0x8(%ebp),%edx
 329:	8d 4a 01             	lea    0x1(%edx),%ecx
 32c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32f:	8a 12                	mov    (%edx),%dl
 331:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 333:	8b 45 10             	mov    0x10(%ebp),%eax
 336:	8d 50 ff             	lea    -0x1(%eax),%edx
 339:	89 55 10             	mov    %edx,0x10(%ebp)
 33c:	85 c0                	test   %eax,%eax
 33e:	7f dd                	jg     31d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 340:	8b 45 08             	mov    0x8(%ebp),%eax
}
 343:	c9                   	leave  
 344:	c3                   	ret    
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop

00000348 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 348:	b8 01 00 00 00       	mov    $0x1,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <exit>:
SYSCALL(exit)
 350:	b8 02 00 00 00       	mov    $0x2,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <wait>:
SYSCALL(wait)
 358:	b8 03 00 00 00       	mov    $0x3,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <pipe>:
SYSCALL(pipe)
 360:	b8 04 00 00 00       	mov    $0x4,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <read>:
SYSCALL(read)
 368:	b8 05 00 00 00       	mov    $0x5,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <write>:
SYSCALL(write)
 370:	b8 10 00 00 00       	mov    $0x10,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <close>:
SYSCALL(close)
 378:	b8 15 00 00 00       	mov    $0x15,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <kill>:
SYSCALL(kill)
 380:	b8 06 00 00 00       	mov    $0x6,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <exec>:
SYSCALL(exec)
 388:	b8 07 00 00 00       	mov    $0x7,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <open>:
SYSCALL(open)
 390:	b8 0f 00 00 00       	mov    $0xf,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <mknod>:
SYSCALL(mknod)
 398:	b8 11 00 00 00       	mov    $0x11,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <unlink>:
SYSCALL(unlink)
 3a0:	b8 12 00 00 00       	mov    $0x12,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <fstat>:
SYSCALL(fstat)
 3a8:	b8 08 00 00 00       	mov    $0x8,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <link>:
SYSCALL(link)
 3b0:	b8 13 00 00 00       	mov    $0x13,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <mkdir>:
SYSCALL(mkdir)
 3b8:	b8 14 00 00 00       	mov    $0x14,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <chdir>:
SYSCALL(chdir)
 3c0:	b8 09 00 00 00       	mov    $0x9,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <dup>:
SYSCALL(dup)
 3c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <getpid>:
SYSCALL(getpid)
 3d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <sbrk>:
SYSCALL(sbrk)
 3d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <sleep>:
SYSCALL(sleep)
 3e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <uptime>:
SYSCALL(uptime)
 3e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <getticks>:
SYSCALL(getticks)
 3f0:	b8 16 00 00 00       	mov    $0x16,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <get_name>:
SYSCALL(get_name)
 3f8:	b8 17 00 00 00       	mov    $0x17,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <get_max_proc>:
SYSCALL(get_max_proc)
 400:	b8 18 00 00 00       	mov    $0x18,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <get_max_mem>:
SYSCALL(get_max_mem)
 408:	b8 19 00 00 00       	mov    $0x19,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <get_max_disk>:
SYSCALL(get_max_disk)
 410:	b8 1a 00 00 00       	mov    $0x1a,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <get_curr_proc>:
SYSCALL(get_curr_proc)
 418:	b8 1b 00 00 00       	mov    $0x1b,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <get_curr_mem>:
SYSCALL(get_curr_mem)
 420:	b8 1c 00 00 00       	mov    $0x1c,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <get_curr_disk>:
SYSCALL(get_curr_disk)
 428:	b8 1d 00 00 00       	mov    $0x1d,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <set_name>:
SYSCALL(set_name)
 430:	b8 1e 00 00 00       	mov    $0x1e,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <set_max_mem>:
SYSCALL(set_max_mem)
 438:	b8 1f 00 00 00       	mov    $0x1f,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <set_max_disk>:
SYSCALL(set_max_disk)
 440:	b8 20 00 00 00       	mov    $0x20,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <set_max_proc>:
SYSCALL(set_max_proc)
 448:	b8 21 00 00 00       	mov    $0x21,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <set_curr_mem>:
SYSCALL(set_curr_mem)
 450:	b8 22 00 00 00       	mov    $0x22,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <set_curr_disk>:
SYSCALL(set_curr_disk)
 458:	b8 23 00 00 00       	mov    $0x23,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <set_curr_proc>:
SYSCALL(set_curr_proc)
 460:	b8 24 00 00 00       	mov    $0x24,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <find>:
SYSCALL(find)
 468:	b8 25 00 00 00       	mov    $0x25,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <is_full>:
SYSCALL(is_full)
 470:	b8 26 00 00 00       	mov    $0x26,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <container_init>:
SYSCALL(container_init)
 478:	b8 27 00 00 00       	mov    $0x27,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	83 ec 18             	sub    $0x18,%esp
 486:	8b 45 0c             	mov    0xc(%ebp),%eax
 489:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 48c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 493:	00 
 494:	8d 45 f4             	lea    -0xc(%ebp),%eax
 497:	89 44 24 04          	mov    %eax,0x4(%esp)
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	89 04 24             	mov    %eax,(%esp)
 4a1:	e8 ca fe ff ff       	call   370 <write>
}
 4a6:	c9                   	leave  
 4a7:	c3                   	ret    

000004a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	56                   	push   %esi
 4ac:	53                   	push   %ebx
 4ad:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4b7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4bb:	74 17                	je     4d4 <printint+0x2c>
 4bd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4c1:	79 11                	jns    4d4 <printint+0x2c>
    neg = 1;
 4c3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	f7 d8                	neg    %eax
 4cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d2:	eb 06                	jmp    4da <printint+0x32>
  } else {
    x = xx;
 4d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4e4:	8d 41 01             	lea    0x1(%ecx),%eax
 4e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ea:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f0:	ba 00 00 00 00       	mov    $0x0,%edx
 4f5:	f7 f3                	div    %ebx
 4f7:	89 d0                	mov    %edx,%eax
 4f9:	8a 80 b4 0b 00 00    	mov    0xbb4(%eax),%al
 4ff:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 503:	8b 75 10             	mov    0x10(%ebp),%esi
 506:	8b 45 ec             	mov    -0x14(%ebp),%eax
 509:	ba 00 00 00 00       	mov    $0x0,%edx
 50e:	f7 f6                	div    %esi
 510:	89 45 ec             	mov    %eax,-0x14(%ebp)
 513:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 517:	75 c8                	jne    4e1 <printint+0x39>
  if(neg)
 519:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 51d:	74 10                	je     52f <printint+0x87>
    buf[i++] = '-';
 51f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 522:	8d 50 01             	lea    0x1(%eax),%edx
 525:	89 55 f4             	mov    %edx,-0xc(%ebp)
 528:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 52d:	eb 1e                	jmp    54d <printint+0xa5>
 52f:	eb 1c                	jmp    54d <printint+0xa5>
    putc(fd, buf[i]);
 531:	8d 55 dc             	lea    -0x24(%ebp),%edx
 534:	8b 45 f4             	mov    -0xc(%ebp),%eax
 537:	01 d0                	add    %edx,%eax
 539:	8a 00                	mov    (%eax),%al
 53b:	0f be c0             	movsbl %al,%eax
 53e:	89 44 24 04          	mov    %eax,0x4(%esp)
 542:	8b 45 08             	mov    0x8(%ebp),%eax
 545:	89 04 24             	mov    %eax,(%esp)
 548:	e8 33 ff ff ff       	call   480 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 54d:	ff 4d f4             	decl   -0xc(%ebp)
 550:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 554:	79 db                	jns    531 <printint+0x89>
    putc(fd, buf[i]);
}
 556:	83 c4 30             	add    $0x30,%esp
 559:	5b                   	pop    %ebx
 55a:	5e                   	pop    %esi
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    

0000055d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 55d:	55                   	push   %ebp
 55e:	89 e5                	mov    %esp,%ebp
 560:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 563:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 56a:	8d 45 0c             	lea    0xc(%ebp),%eax
 56d:	83 c0 04             	add    $0x4,%eax
 570:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 573:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 57a:	e9 77 01 00 00       	jmp    6f6 <printf+0x199>
    c = fmt[i] & 0xff;
 57f:	8b 55 0c             	mov    0xc(%ebp),%edx
 582:	8b 45 f0             	mov    -0x10(%ebp),%eax
 585:	01 d0                	add    %edx,%eax
 587:	8a 00                	mov    (%eax),%al
 589:	0f be c0             	movsbl %al,%eax
 58c:	25 ff 00 00 00       	and    $0xff,%eax
 591:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 594:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 598:	75 2c                	jne    5c6 <printf+0x69>
      if(c == '%'){
 59a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 59e:	75 0c                	jne    5ac <printf+0x4f>
        state = '%';
 5a0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5a7:	e9 47 01 00 00       	jmp    6f3 <printf+0x196>
      } else {
        putc(fd, c);
 5ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5af:	0f be c0             	movsbl %al,%eax
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	89 04 24             	mov    %eax,(%esp)
 5bc:	e8 bf fe ff ff       	call   480 <putc>
 5c1:	e9 2d 01 00 00       	jmp    6f3 <printf+0x196>
      }
    } else if(state == '%'){
 5c6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ca:	0f 85 23 01 00 00    	jne    6f3 <printf+0x196>
      if(c == 'd'){
 5d0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5d4:	75 2d                	jne    603 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 5d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d9:	8b 00                	mov    (%eax),%eax
 5db:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5e2:	00 
 5e3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ea:	00 
 5eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	89 04 24             	mov    %eax,(%esp)
 5f5:	e8 ae fe ff ff       	call   4a8 <printint>
        ap++;
 5fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fe:	e9 e9 00 00 00       	jmp    6ec <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 603:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 607:	74 06                	je     60f <printf+0xb2>
 609:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 60d:	75 2d                	jne    63c <printf+0xdf>
        printint(fd, *ap, 16, 0);
 60f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 612:	8b 00                	mov    (%eax),%eax
 614:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 61b:	00 
 61c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 623:	00 
 624:	89 44 24 04          	mov    %eax,0x4(%esp)
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	89 04 24             	mov    %eax,(%esp)
 62e:	e8 75 fe ff ff       	call   4a8 <printint>
        ap++;
 633:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 637:	e9 b0 00 00 00       	jmp    6ec <printf+0x18f>
      } else if(c == 's'){
 63c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 640:	75 42                	jne    684 <printf+0x127>
        s = (char*)*ap;
 642:	8b 45 e8             	mov    -0x18(%ebp),%eax
 645:	8b 00                	mov    (%eax),%eax
 647:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 64a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 64e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 652:	75 09                	jne    65d <printf+0x100>
          s = "(null)";
 654:	c7 45 f4 66 09 00 00 	movl   $0x966,-0xc(%ebp)
        while(*s != 0){
 65b:	eb 1c                	jmp    679 <printf+0x11c>
 65d:	eb 1a                	jmp    679 <printf+0x11c>
          putc(fd, *s);
 65f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 662:	8a 00                	mov    (%eax),%al
 664:	0f be c0             	movsbl %al,%eax
 667:	89 44 24 04          	mov    %eax,0x4(%esp)
 66b:	8b 45 08             	mov    0x8(%ebp),%eax
 66e:	89 04 24             	mov    %eax,(%esp)
 671:	e8 0a fe ff ff       	call   480 <putc>
          s++;
 676:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 679:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67c:	8a 00                	mov    (%eax),%al
 67e:	84 c0                	test   %al,%al
 680:	75 dd                	jne    65f <printf+0x102>
 682:	eb 68                	jmp    6ec <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 684:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 688:	75 1d                	jne    6a7 <printf+0x14a>
        putc(fd, *ap);
 68a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 68d:	8b 00                	mov    (%eax),%eax
 68f:	0f be c0             	movsbl %al,%eax
 692:	89 44 24 04          	mov    %eax,0x4(%esp)
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 df fd ff ff       	call   480 <putc>
        ap++;
 6a1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a5:	eb 45                	jmp    6ec <printf+0x18f>
      } else if(c == '%'){
 6a7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ab:	75 17                	jne    6c4 <printf+0x167>
        putc(fd, c);
 6ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b0:	0f be c0             	movsbl %al,%eax
 6b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	89 04 24             	mov    %eax,(%esp)
 6bd:	e8 be fd ff ff       	call   480 <putc>
 6c2:	eb 28                	jmp    6ec <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6c4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6cb:	00 
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	89 04 24             	mov    %eax,(%esp)
 6d2:	e8 a9 fd ff ff       	call   480 <putc>
        putc(fd, c);
 6d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6da:	0f be c0             	movsbl %al,%eax
 6dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	89 04 24             	mov    %eax,(%esp)
 6e7:	e8 94 fd ff ff       	call   480 <putc>
      }
      state = 0;
 6ec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f3:	ff 45 f0             	incl   -0x10(%ebp)
 6f6:	8b 55 0c             	mov    0xc(%ebp),%edx
 6f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fc:	01 d0                	add    %edx,%eax
 6fe:	8a 00                	mov    (%eax),%al
 700:	84 c0                	test   %al,%al
 702:	0f 85 77 fe ff ff    	jne    57f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 708:	c9                   	leave  
 709:	c3                   	ret    
 70a:	90                   	nop
 70b:	90                   	nop

0000070c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 70c:	55                   	push   %ebp
 70d:	89 e5                	mov    %esp,%ebp
 70f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	83 e8 08             	sub    $0x8,%eax
 718:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71b:	a1 d0 0b 00 00       	mov    0xbd0,%eax
 720:	89 45 fc             	mov    %eax,-0x4(%ebp)
 723:	eb 24                	jmp    749 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 725:	8b 45 fc             	mov    -0x4(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 72d:	77 12                	ja     741 <free+0x35>
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 735:	77 24                	ja     75b <free+0x4f>
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 73f:	77 1a                	ja     75b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	89 45 fc             	mov    %eax,-0x4(%ebp)
 749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74f:	76 d4                	jbe    725 <free+0x19>
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 00                	mov    (%eax),%eax
 756:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 759:	76 ca                	jbe    725 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	8b 40 04             	mov    0x4(%eax),%eax
 761:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	01 c2                	add    %eax,%edx
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 00                	mov    (%eax),%eax
 772:	39 c2                	cmp    %eax,%edx
 774:	75 24                	jne    79a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 776:	8b 45 f8             	mov    -0x8(%ebp),%eax
 779:	8b 50 04             	mov    0x4(%eax),%edx
 77c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77f:	8b 00                	mov    (%eax),%eax
 781:	8b 40 04             	mov    0x4(%eax),%eax
 784:	01 c2                	add    %eax,%edx
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 78c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78f:	8b 00                	mov    (%eax),%eax
 791:	8b 10                	mov    (%eax),%edx
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	89 10                	mov    %edx,(%eax)
 798:	eb 0a                	jmp    7a4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 10                	mov    (%eax),%edx
 79f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	01 d0                	add    %edx,%eax
 7b6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b9:	75 20                	jne    7db <free+0xcf>
    p->s.size += bp->s.size;
 7bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7be:	8b 50 04             	mov    0x4(%eax),%edx
 7c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c4:	8b 40 04             	mov    0x4(%eax),%eax
 7c7:	01 c2                	add    %eax,%edx
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	8b 10                	mov    (%eax),%edx
 7d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d7:	89 10                	mov    %edx,(%eax)
 7d9:	eb 08                	jmp    7e3 <free+0xd7>
  } else
    p->s.ptr = bp;
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7e1:	89 10                	mov    %edx,(%eax)
  freep = p;
 7e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e6:	a3 d0 0b 00 00       	mov    %eax,0xbd0
}
 7eb:	c9                   	leave  
 7ec:	c3                   	ret    

000007ed <morecore>:

static Header*
morecore(uint nu)
{
 7ed:	55                   	push   %ebp
 7ee:	89 e5                	mov    %esp,%ebp
 7f0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7f3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7fa:	77 07                	ja     803 <morecore+0x16>
    nu = 4096;
 7fc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 803:	8b 45 08             	mov    0x8(%ebp),%eax
 806:	c1 e0 03             	shl    $0x3,%eax
 809:	89 04 24             	mov    %eax,(%esp)
 80c:	e8 c7 fb ff ff       	call   3d8 <sbrk>
 811:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 814:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 818:	75 07                	jne    821 <morecore+0x34>
    return 0;
 81a:	b8 00 00 00 00       	mov    $0x0,%eax
 81f:	eb 22                	jmp    843 <morecore+0x56>
  hp = (Header*)p;
 821:	8b 45 f4             	mov    -0xc(%ebp),%eax
 824:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 827:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82a:	8b 55 08             	mov    0x8(%ebp),%edx
 82d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 830:	8b 45 f0             	mov    -0x10(%ebp),%eax
 833:	83 c0 08             	add    $0x8,%eax
 836:	89 04 24             	mov    %eax,(%esp)
 839:	e8 ce fe ff ff       	call   70c <free>
  return freep;
 83e:	a1 d0 0b 00 00       	mov    0xbd0,%eax
}
 843:	c9                   	leave  
 844:	c3                   	ret    

00000845 <malloc>:

void*
malloc(uint nbytes)
{
 845:	55                   	push   %ebp
 846:	89 e5                	mov    %esp,%ebp
 848:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	83 c0 07             	add    $0x7,%eax
 851:	c1 e8 03             	shr    $0x3,%eax
 854:	40                   	inc    %eax
 855:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 858:	a1 d0 0b 00 00       	mov    0xbd0,%eax
 85d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 860:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 864:	75 23                	jne    889 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 866:	c7 45 f0 c8 0b 00 00 	movl   $0xbc8,-0x10(%ebp)
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	a3 d0 0b 00 00       	mov    %eax,0xbd0
 875:	a1 d0 0b 00 00       	mov    0xbd0,%eax
 87a:	a3 c8 0b 00 00       	mov    %eax,0xbc8
    base.s.size = 0;
 87f:	c7 05 cc 0b 00 00 00 	movl   $0x0,0xbcc
 886:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 889:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88c:	8b 00                	mov    (%eax),%eax
 88e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 89a:	72 4d                	jb     8e9 <malloc+0xa4>
      if(p->s.size == nunits)
 89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89f:	8b 40 04             	mov    0x4(%eax),%eax
 8a2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8a5:	75 0c                	jne    8b3 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 8a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8aa:	8b 10                	mov    (%eax),%edx
 8ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8af:	89 10                	mov    %edx,(%eax)
 8b1:	eb 26                	jmp    8d9 <malloc+0x94>
      else {
        p->s.size -= nunits;
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	8b 40 04             	mov    0x4(%eax),%eax
 8b9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8bc:	89 c2                	mov    %eax,%edx
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c7:	8b 40 04             	mov    0x4(%eax),%eax
 8ca:	c1 e0 03             	shl    $0x3,%eax
 8cd:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8d6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	a3 d0 0b 00 00       	mov    %eax,0xbd0
      return (void*)(p + 1);
 8e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e4:	83 c0 08             	add    $0x8,%eax
 8e7:	eb 38                	jmp    921 <malloc+0xdc>
    }
    if(p == freep)
 8e9:	a1 d0 0b 00 00       	mov    0xbd0,%eax
 8ee:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8f1:	75 1b                	jne    90e <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 8f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 ef fe ff ff       	call   7ed <morecore>
 8fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 901:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 905:	75 07                	jne    90e <malloc+0xc9>
        return 0;
 907:	b8 00 00 00 00       	mov    $0x0,%eax
 90c:	eb 13                	jmp    921 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 911:	89 45 f0             	mov    %eax,-0x10(%ebp)
 914:	8b 45 f4             	mov    -0xc(%ebp),%eax
 917:	8b 00                	mov    (%eax),%eax
 919:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 91c:	e9 70 ff ff ff       	jmp    891 <malloc+0x4c>
}
 921:	c9                   	leave  
 922:	c3                   	ret    
