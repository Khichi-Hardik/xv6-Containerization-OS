
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <create_vcs>:

char *argv[] = { "sh", 0 };

void
create_vcs(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char *dname = "vc0";
   6:	c7 45 f0 f6 09 00 00 	movl   $0x9f6,-0x10(%ebp)

  for (i = 0; i < 4; i++) {
   d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  14:	eb 58                	jmp    6e <create_vcs+0x6e>
    dname[2] = '0' + i;
  16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  19:	8d 50 02             	lea    0x2(%eax),%edx
  1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1f:	83 c0 30             	add    $0x30,%eax
  22:	88 02                	mov    %al,(%edx)
    if ((fd = open(dname, O_RDWR)) < 0){
  24:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  2b:	00 
  2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2f:	89 04 24             	mov    %eax,(%esp)
  32:	e8 e9 03 00 00       	call   420 <open>
  37:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  3e:	79 20                	jns    60 <create_vcs+0x60>
      mknod(dname, 1, i + 2);
  40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  43:	83 c0 02             	add    $0x2,%eax
  46:	98                   	cwtl   
  47:	89 44 24 08          	mov    %eax,0x8(%esp)
  4b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  52:	00 
  53:	8b 45 f0             	mov    -0x10(%ebp),%eax
  56:	89 04 24             	mov    %eax,(%esp)
  59:	e8 ca 03 00 00       	call   428 <mknod>
  5e:	eb 0b                	jmp    6b <create_vcs+0x6b>
    } else {
      close(fd);
  60:	8b 45 ec             	mov    -0x14(%ebp),%eax
  63:	89 04 24             	mov    %eax,(%esp)
  66:	e8 9d 03 00 00       	call   408 <close>
create_vcs(void)
{
  int i, fd;
  char *dname = "vc0";

  for (i = 0; i < 4; i++) {
  6b:	ff 45 f4             	incl   -0xc(%ebp)
  6e:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  72:	7e a2                	jle    16 <create_vcs+0x16>
      mknod(dname, 1, i + 2);
    } else {
      close(fd);
    }
  }
}
  74:	c9                   	leave  
  75:	c3                   	ret    

00000076 <main>:

int
main(void)
{
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	83 e4 f0             	and    $0xfffffff0,%esp
  7c:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  7f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  86:	00 
  87:	c7 04 24 fa 09 00 00 	movl   $0x9fa,(%esp)
  8e:	e8 8d 03 00 00       	call   420 <open>
  93:	85 c0                	test   %eax,%eax
  95:	79 30                	jns    c7 <main+0x51>
    mknod("console", 1, 1);
  97:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  9e:	00 
  9f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  a6:	00 
  a7:	c7 04 24 fa 09 00 00 	movl   $0x9fa,(%esp)
  ae:	e8 75 03 00 00       	call   428 <mknod>
    open("console", O_RDWR);
  b3:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 fa 09 00 00 	movl   $0x9fa,(%esp)
  c2:	e8 59 03 00 00       	call   420 <open>
  }
  dup(0);  // stdout
  c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ce:	e8 85 03 00 00       	call   458 <dup>
  dup(0);  // stderr
  d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  da:	e8 79 03 00 00       	call   458 <dup>

  create_vcs();
  df:	e8 1c ff ff ff       	call   0 <create_vcs>

  for(;;){
    printf(1, "init: starting sh\n");
  e4:	c7 44 24 04 02 0a 00 	movl   $0xa02,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	e8 35 05 00 00       	call   62d <printf>
    pid = fork();
  f8:	e8 db 02 00 00       	call   3d8 <fork>
  fd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
 101:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 106:	79 19                	jns    121 <main+0xab>
      printf(1, "init: fork failed\n");
 108:	c7 44 24 04 15 0a 00 	movl   $0xa15,0x4(%esp)
 10f:	00 
 110:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 117:	e8 11 05 00 00       	call   62d <printf>
      exit();
 11c:	e8 bf 02 00 00       	call   3e0 <exit>
    }
    if(pid == 0){
 121:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 126:	75 2d                	jne    155 <main+0xdf>
      exec("sh", argv);
 128:	c7 44 24 04 b4 0c 00 	movl   $0xcb4,0x4(%esp)
 12f:	00 
 130:	c7 04 24 f3 09 00 00 	movl   $0x9f3,(%esp)
 137:	e8 dc 02 00 00       	call   418 <exec>
      printf(1, "init: exec sh failed\n");
 13c:	c7 44 24 04 28 0a 00 	movl   $0xa28,0x4(%esp)
 143:	00 
 144:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14b:	e8 dd 04 00 00       	call   62d <printf>
      exit();
 150:	e8 8b 02 00 00       	call   3e0 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
 155:	eb 14                	jmp    16b <main+0xf5>
      printf(1, "zombie!\n");
 157:	c7 44 24 04 3e 0a 00 	movl   $0xa3e,0x4(%esp)
 15e:	00 
 15f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 166:	e8 c2 04 00 00       	call   62d <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
 16b:	e8 78 02 00 00       	call   3e8 <wait>
 170:	89 44 24 18          	mov    %eax,0x18(%esp)
 174:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 179:	78 0a                	js     185 <main+0x10f>
 17b:	8b 44 24 18          	mov    0x18(%esp),%eax
 17f:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 183:	75 d2                	jne    157 <main+0xe1>
      printf(1, "zombie!\n");
  }
 185:	e9 5a ff ff ff       	jmp    e4 <main+0x6e>
 18a:	90                   	nop
 18b:	90                   	nop

0000018c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	57                   	push   %edi
 190:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 191:	8b 4d 08             	mov    0x8(%ebp),%ecx
 194:	8b 55 10             	mov    0x10(%ebp),%edx
 197:	8b 45 0c             	mov    0xc(%ebp),%eax
 19a:	89 cb                	mov    %ecx,%ebx
 19c:	89 df                	mov    %ebx,%edi
 19e:	89 d1                	mov    %edx,%ecx
 1a0:	fc                   	cld    
 1a1:	f3 aa                	rep stos %al,%es:(%edi)
 1a3:	89 ca                	mov    %ecx,%edx
 1a5:	89 fb                	mov    %edi,%ebx
 1a7:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1aa:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1ad:	5b                   	pop    %ebx
 1ae:	5f                   	pop    %edi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    

000001b1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
 1b4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1bd:	90                   	nop
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	8d 50 01             	lea    0x1(%eax),%edx
 1c4:	89 55 08             	mov    %edx,0x8(%ebp)
 1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ca:	8d 4a 01             	lea    0x1(%edx),%ecx
 1cd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1d0:	8a 12                	mov    (%edx),%dl
 1d2:	88 10                	mov    %dl,(%eax)
 1d4:	8a 00                	mov    (%eax),%al
 1d6:	84 c0                	test   %al,%al
 1d8:	75 e4                	jne    1be <strcpy+0xd>
    ;
  return os;
 1da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1e2:	eb 06                	jmp    1ea <strcmp+0xb>
    p++, q++;
 1e4:	ff 45 08             	incl   0x8(%ebp)
 1e7:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	8a 00                	mov    (%eax),%al
 1ef:	84 c0                	test   %al,%al
 1f1:	74 0e                	je     201 <strcmp+0x22>
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	8a 10                	mov    (%eax),%dl
 1f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fb:	8a 00                	mov    (%eax),%al
 1fd:	38 c2                	cmp    %al,%dl
 1ff:	74 e3                	je     1e4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 201:	8b 45 08             	mov    0x8(%ebp),%eax
 204:	8a 00                	mov    (%eax),%al
 206:	0f b6 d0             	movzbl %al,%edx
 209:	8b 45 0c             	mov    0xc(%ebp),%eax
 20c:	8a 00                	mov    (%eax),%al
 20e:	0f b6 c0             	movzbl %al,%eax
 211:	29 c2                	sub    %eax,%edx
 213:	89 d0                	mov    %edx,%eax
}
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <strlen>:

uint
strlen(char *s)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 21d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 224:	eb 03                	jmp    229 <strlen+0x12>
 226:	ff 45 fc             	incl   -0x4(%ebp)
 229:	8b 55 fc             	mov    -0x4(%ebp),%edx
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
 22f:	01 d0                	add    %edx,%eax
 231:	8a 00                	mov    (%eax),%al
 233:	84 c0                	test   %al,%al
 235:	75 ef                	jne    226 <strlen+0xf>
    ;
  return n;
 237:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23a:	c9                   	leave  
 23b:	c3                   	ret    

0000023c <memset>:

void*
memset(void *dst, int c, uint n)
{
 23c:	55                   	push   %ebp
 23d:	89 e5                	mov    %esp,%ebp
 23f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 242:	8b 45 10             	mov    0x10(%ebp),%eax
 245:	89 44 24 08          	mov    %eax,0x8(%esp)
 249:	8b 45 0c             	mov    0xc(%ebp),%eax
 24c:	89 44 24 04          	mov    %eax,0x4(%esp)
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 31 ff ff ff       	call   18c <stosb>
  return dst;
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 25e:	c9                   	leave  
 25f:	c3                   	ret    

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 04             	sub    $0x4,%esp
 266:	8b 45 0c             	mov    0xc(%ebp),%eax
 269:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 26c:	eb 12                	jmp    280 <strchr+0x20>
    if(*s == c)
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	8a 00                	mov    (%eax),%al
 273:	3a 45 fc             	cmp    -0x4(%ebp),%al
 276:	75 05                	jne    27d <strchr+0x1d>
      return (char*)s;
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	eb 11                	jmp    28e <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 27d:	ff 45 08             	incl   0x8(%ebp)
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	8a 00                	mov    (%eax),%al
 285:	84 c0                	test   %al,%al
 287:	75 e5                	jne    26e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 289:	b8 00 00 00 00       	mov    $0x0,%eax
}
 28e:	c9                   	leave  
 28f:	c3                   	ret    

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 296:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 29d:	eb 49                	jmp    2e8 <gets+0x58>
    cc = read(0, &c, 1);
 29f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2a6:	00 
 2a7:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b5:	e8 3e 01 00 00       	call   3f8 <read>
 2ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2bd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2c1:	7f 02                	jg     2c5 <gets+0x35>
      break;
 2c3:	eb 2c                	jmp    2f1 <gets+0x61>
    buf[i++] = c;
 2c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c8:	8d 50 01             	lea    0x1(%eax),%edx
 2cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2ce:	89 c2                	mov    %eax,%edx
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	01 c2                	add    %eax,%edx
 2d5:	8a 45 ef             	mov    -0x11(%ebp),%al
 2d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2da:	8a 45 ef             	mov    -0x11(%ebp),%al
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	74 10                	je     2f1 <gets+0x61>
 2e1:	8a 45 ef             	mov    -0x11(%ebp),%al
 2e4:	3c 0d                	cmp    $0xd,%al
 2e6:	74 09                	je     2f1 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2eb:	40                   	inc    %eax
 2ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2ef:	7c ae                	jl     29f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	01 d0                	add    %edx,%eax
 2f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ff:	c9                   	leave  
 300:	c3                   	ret    

00000301 <stat>:

int
stat(char *n, struct stat *st)
{
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 307:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 30e:	00 
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	89 04 24             	mov    %eax,(%esp)
 315:	e8 06 01 00 00       	call   420 <open>
 31a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 31d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 321:	79 07                	jns    32a <stat+0x29>
    return -1;
 323:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 328:	eb 23                	jmp    34d <stat+0x4c>
  r = fstat(fd, st);
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	89 44 24 04          	mov    %eax,0x4(%esp)
 331:	8b 45 f4             	mov    -0xc(%ebp),%eax
 334:	89 04 24             	mov    %eax,(%esp)
 337:	e8 fc 00 00 00       	call   438 <fstat>
 33c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 33f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 342:	89 04 24             	mov    %eax,(%esp)
 345:	e8 be 00 00 00       	call   408 <close>
  return r;
 34a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 34d:	c9                   	leave  
 34e:	c3                   	ret    

0000034f <atoi>:

int
atoi(const char *s)
{
 34f:	55                   	push   %ebp
 350:	89 e5                	mov    %esp,%ebp
 352:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 355:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 35c:	eb 24                	jmp    382 <atoi+0x33>
    n = n*10 + *s++ - '0';
 35e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 361:	89 d0                	mov    %edx,%eax
 363:	c1 e0 02             	shl    $0x2,%eax
 366:	01 d0                	add    %edx,%eax
 368:	01 c0                	add    %eax,%eax
 36a:	89 c1                	mov    %eax,%ecx
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
 36f:	8d 50 01             	lea    0x1(%eax),%edx
 372:	89 55 08             	mov    %edx,0x8(%ebp)
 375:	8a 00                	mov    (%eax),%al
 377:	0f be c0             	movsbl %al,%eax
 37a:	01 c8                	add    %ecx,%eax
 37c:	83 e8 30             	sub    $0x30,%eax
 37f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	8a 00                	mov    (%eax),%al
 387:	3c 2f                	cmp    $0x2f,%al
 389:	7e 09                	jle    394 <atoi+0x45>
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	8a 00                	mov    (%eax),%al
 390:	3c 39                	cmp    $0x39,%al
 392:	7e ca                	jle    35e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 394:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 397:	c9                   	leave  
 398:	c3                   	ret    

00000399 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3ab:	eb 16                	jmp    3c3 <memmove+0x2a>
    *dst++ = *src++;
 3ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3b0:	8d 50 01             	lea    0x1(%eax),%edx
 3b3:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3b9:	8d 4a 01             	lea    0x1(%edx),%ecx
 3bc:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3bf:	8a 12                	mov    (%edx),%dl
 3c1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c3:	8b 45 10             	mov    0x10(%ebp),%eax
 3c6:	8d 50 ff             	lea    -0x1(%eax),%edx
 3c9:	89 55 10             	mov    %edx,0x10(%ebp)
 3cc:	85 c0                	test   %eax,%eax
 3ce:	7f dd                	jg     3ad <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    
 3d5:	90                   	nop
 3d6:	90                   	nop
 3d7:	90                   	nop

000003d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d8:	b8 01 00 00 00       	mov    $0x1,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <exit>:
SYSCALL(exit)
 3e0:	b8 02 00 00 00       	mov    $0x2,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <wait>:
SYSCALL(wait)
 3e8:	b8 03 00 00 00       	mov    $0x3,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <pipe>:
SYSCALL(pipe)
 3f0:	b8 04 00 00 00       	mov    $0x4,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <read>:
SYSCALL(read)
 3f8:	b8 05 00 00 00       	mov    $0x5,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <write>:
SYSCALL(write)
 400:	b8 10 00 00 00       	mov    $0x10,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <close>:
SYSCALL(close)
 408:	b8 15 00 00 00       	mov    $0x15,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <kill>:
SYSCALL(kill)
 410:	b8 06 00 00 00       	mov    $0x6,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <exec>:
SYSCALL(exec)
 418:	b8 07 00 00 00       	mov    $0x7,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <open>:
SYSCALL(open)
 420:	b8 0f 00 00 00       	mov    $0xf,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <mknod>:
SYSCALL(mknod)
 428:	b8 11 00 00 00       	mov    $0x11,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <unlink>:
SYSCALL(unlink)
 430:	b8 12 00 00 00       	mov    $0x12,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <fstat>:
SYSCALL(fstat)
 438:	b8 08 00 00 00       	mov    $0x8,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <link>:
SYSCALL(link)
 440:	b8 13 00 00 00       	mov    $0x13,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <mkdir>:
SYSCALL(mkdir)
 448:	b8 14 00 00 00       	mov    $0x14,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <chdir>:
SYSCALL(chdir)
 450:	b8 09 00 00 00       	mov    $0x9,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <dup>:
SYSCALL(dup)
 458:	b8 0a 00 00 00       	mov    $0xa,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <getpid>:
SYSCALL(getpid)
 460:	b8 0b 00 00 00       	mov    $0xb,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <sbrk>:
SYSCALL(sbrk)
 468:	b8 0c 00 00 00       	mov    $0xc,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <sleep>:
SYSCALL(sleep)
 470:	b8 0d 00 00 00       	mov    $0xd,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <uptime>:
SYSCALL(uptime)
 478:	b8 0e 00 00 00       	mov    $0xe,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <getticks>:
SYSCALL(getticks)
 480:	b8 16 00 00 00       	mov    $0x16,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <get_name>:
SYSCALL(get_name)
 488:	b8 17 00 00 00       	mov    $0x17,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <get_max_proc>:
SYSCALL(get_max_proc)
 490:	b8 18 00 00 00       	mov    $0x18,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <get_max_mem>:
SYSCALL(get_max_mem)
 498:	b8 19 00 00 00       	mov    $0x19,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <get_max_disk>:
SYSCALL(get_max_disk)
 4a0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <get_curr_proc>:
SYSCALL(get_curr_proc)
 4a8:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <get_curr_mem>:
SYSCALL(get_curr_mem)
 4b0:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <get_curr_disk>:
SYSCALL(get_curr_disk)
 4b8:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <set_name>:
SYSCALL(set_name)
 4c0:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <set_max_mem>:
SYSCALL(set_max_mem)
 4c8:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <set_max_disk>:
SYSCALL(set_max_disk)
 4d0:	b8 20 00 00 00       	mov    $0x20,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <set_max_proc>:
SYSCALL(set_max_proc)
 4d8:	b8 21 00 00 00       	mov    $0x21,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <set_curr_mem>:
SYSCALL(set_curr_mem)
 4e0:	b8 22 00 00 00       	mov    $0x22,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <set_curr_disk>:
SYSCALL(set_curr_disk)
 4e8:	b8 23 00 00 00       	mov    $0x23,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <set_curr_proc>:
SYSCALL(set_curr_proc)
 4f0:	b8 24 00 00 00       	mov    $0x24,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <find>:
SYSCALL(find)
 4f8:	b8 25 00 00 00       	mov    $0x25,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <is_full>:
SYSCALL(is_full)
 500:	b8 26 00 00 00       	mov    $0x26,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <container_init>:
SYSCALL(container_init)
 508:	b8 27 00 00 00       	mov    $0x27,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <cont_proc_set>:
SYSCALL(cont_proc_set)
 510:	b8 28 00 00 00       	mov    $0x28,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <ps>:
SYSCALL(ps)
 518:	b8 29 00 00 00       	mov    $0x29,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <reduce_curr_mem>:
SYSCALL(reduce_curr_mem)
 520:	b8 2a 00 00 00       	mov    $0x2a,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <set_root_inode>:
SYSCALL(set_root_inode)
 528:	b8 2b 00 00 00       	mov    $0x2b,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <cstop>:
SYSCALL(cstop)
 530:	b8 2c 00 00 00       	mov    $0x2c,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <df>:
SYSCALL(df)
 538:	b8 2d 00 00 00       	mov    $0x2d,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <max_containers>:
SYSCALL(max_containers)
 540:	b8 2e 00 00 00       	mov    $0x2e,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <container_reset>:
SYSCALL(container_reset)
 548:	b8 2f 00 00 00       	mov    $0x2f,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	83 ec 18             	sub    $0x18,%esp
 556:	8b 45 0c             	mov    0xc(%ebp),%eax
 559:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 55c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 563:	00 
 564:	8d 45 f4             	lea    -0xc(%ebp),%eax
 567:	89 44 24 04          	mov    %eax,0x4(%esp)
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
 56e:	89 04 24             	mov    %eax,(%esp)
 571:	e8 8a fe ff ff       	call   400 <write>
}
 576:	c9                   	leave  
 577:	c3                   	ret    

00000578 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 578:	55                   	push   %ebp
 579:	89 e5                	mov    %esp,%ebp
 57b:	56                   	push   %esi
 57c:	53                   	push   %ebx
 57d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 580:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 587:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 58b:	74 17                	je     5a4 <printint+0x2c>
 58d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 591:	79 11                	jns    5a4 <printint+0x2c>
    neg = 1;
 593:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 59a:	8b 45 0c             	mov    0xc(%ebp),%eax
 59d:	f7 d8                	neg    %eax
 59f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a2:	eb 06                	jmp    5aa <printint+0x32>
  } else {
    x = xx;
 5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5b4:	8d 41 01             	lea    0x1(%ecx),%eax
 5b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5ba:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c0:	ba 00 00 00 00       	mov    $0x0,%edx
 5c5:	f7 f3                	div    %ebx
 5c7:	89 d0                	mov    %edx,%eax
 5c9:	8a 80 bc 0c 00 00    	mov    0xcbc(%eax),%al
 5cf:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5d3:	8b 75 10             	mov    0x10(%ebp),%esi
 5d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d9:	ba 00 00 00 00       	mov    $0x0,%edx
 5de:	f7 f6                	div    %esi
 5e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e7:	75 c8                	jne    5b1 <printint+0x39>
  if(neg)
 5e9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ed:	74 10                	je     5ff <printint+0x87>
    buf[i++] = '-';
 5ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f2:	8d 50 01             	lea    0x1(%eax),%edx
 5f5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5f8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5fd:	eb 1e                	jmp    61d <printint+0xa5>
 5ff:	eb 1c                	jmp    61d <printint+0xa5>
    putc(fd, buf[i]);
 601:	8d 55 dc             	lea    -0x24(%ebp),%edx
 604:	8b 45 f4             	mov    -0xc(%ebp),%eax
 607:	01 d0                	add    %edx,%eax
 609:	8a 00                	mov    (%eax),%al
 60b:	0f be c0             	movsbl %al,%eax
 60e:	89 44 24 04          	mov    %eax,0x4(%esp)
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	89 04 24             	mov    %eax,(%esp)
 618:	e8 33 ff ff ff       	call   550 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 61d:	ff 4d f4             	decl   -0xc(%ebp)
 620:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 624:	79 db                	jns    601 <printint+0x89>
    putc(fd, buf[i]);
}
 626:	83 c4 30             	add    $0x30,%esp
 629:	5b                   	pop    %ebx
 62a:	5e                   	pop    %esi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    

0000062d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 62d:	55                   	push   %ebp
 62e:	89 e5                	mov    %esp,%ebp
 630:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 633:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 63a:	8d 45 0c             	lea    0xc(%ebp),%eax
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 643:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 64a:	e9 77 01 00 00       	jmp    7c6 <printf+0x199>
    c = fmt[i] & 0xff;
 64f:	8b 55 0c             	mov    0xc(%ebp),%edx
 652:	8b 45 f0             	mov    -0x10(%ebp),%eax
 655:	01 d0                	add    %edx,%eax
 657:	8a 00                	mov    (%eax),%al
 659:	0f be c0             	movsbl %al,%eax
 65c:	25 ff 00 00 00       	and    $0xff,%eax
 661:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 664:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 668:	75 2c                	jne    696 <printf+0x69>
      if(c == '%'){
 66a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66e:	75 0c                	jne    67c <printf+0x4f>
        state = '%';
 670:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 677:	e9 47 01 00 00       	jmp    7c3 <printf+0x196>
      } else {
        putc(fd, c);
 67c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67f:	0f be c0             	movsbl %al,%eax
 682:	89 44 24 04          	mov    %eax,0x4(%esp)
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	89 04 24             	mov    %eax,(%esp)
 68c:	e8 bf fe ff ff       	call   550 <putc>
 691:	e9 2d 01 00 00       	jmp    7c3 <printf+0x196>
      }
    } else if(state == '%'){
 696:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 69a:	0f 85 23 01 00 00    	jne    7c3 <printf+0x196>
      if(c == 'd'){
 6a0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6a4:	75 2d                	jne    6d3 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 6a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a9:	8b 00                	mov    (%eax),%eax
 6ab:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6b2:	00 
 6b3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6ba:	00 
 6bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	89 04 24             	mov    %eax,(%esp)
 6c5:	e8 ae fe ff ff       	call   578 <printint>
        ap++;
 6ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ce:	e9 e9 00 00 00       	jmp    7bc <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 6d3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6d7:	74 06                	je     6df <printf+0xb2>
 6d9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6dd:	75 2d                	jne    70c <printf+0xdf>
        printint(fd, *ap, 16, 0);
 6df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6eb:	00 
 6ec:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6f3:	00 
 6f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	89 04 24             	mov    %eax,(%esp)
 6fe:	e8 75 fe ff ff       	call   578 <printint>
        ap++;
 703:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 707:	e9 b0 00 00 00       	jmp    7bc <printf+0x18f>
      } else if(c == 's'){
 70c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 710:	75 42                	jne    754 <printf+0x127>
        s = (char*)*ap;
 712:	8b 45 e8             	mov    -0x18(%ebp),%eax
 715:	8b 00                	mov    (%eax),%eax
 717:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 71a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 71e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 722:	75 09                	jne    72d <printf+0x100>
          s = "(null)";
 724:	c7 45 f4 47 0a 00 00 	movl   $0xa47,-0xc(%ebp)
        while(*s != 0){
 72b:	eb 1c                	jmp    749 <printf+0x11c>
 72d:	eb 1a                	jmp    749 <printf+0x11c>
          putc(fd, *s);
 72f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 732:	8a 00                	mov    (%eax),%al
 734:	0f be c0             	movsbl %al,%eax
 737:	89 44 24 04          	mov    %eax,0x4(%esp)
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	89 04 24             	mov    %eax,(%esp)
 741:	e8 0a fe ff ff       	call   550 <putc>
          s++;
 746:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 749:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74c:	8a 00                	mov    (%eax),%al
 74e:	84 c0                	test   %al,%al
 750:	75 dd                	jne    72f <printf+0x102>
 752:	eb 68                	jmp    7bc <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 754:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 758:	75 1d                	jne    777 <printf+0x14a>
        putc(fd, *ap);
 75a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	0f be c0             	movsbl %al,%eax
 762:	89 44 24 04          	mov    %eax,0x4(%esp)
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	89 04 24             	mov    %eax,(%esp)
 76c:	e8 df fd ff ff       	call   550 <putc>
        ap++;
 771:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 775:	eb 45                	jmp    7bc <printf+0x18f>
      } else if(c == '%'){
 777:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 77b:	75 17                	jne    794 <printf+0x167>
        putc(fd, c);
 77d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 780:	0f be c0             	movsbl %al,%eax
 783:	89 44 24 04          	mov    %eax,0x4(%esp)
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	89 04 24             	mov    %eax,(%esp)
 78d:	e8 be fd ff ff       	call   550 <putc>
 792:	eb 28                	jmp    7bc <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 794:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 79b:	00 
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	89 04 24             	mov    %eax,(%esp)
 7a2:	e8 a9 fd ff ff       	call   550 <putc>
        putc(fd, c);
 7a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7aa:	0f be c0             	movsbl %al,%eax
 7ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	89 04 24             	mov    %eax,(%esp)
 7b7:	e8 94 fd ff ff       	call   550 <putc>
      }
      state = 0;
 7bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7c3:	ff 45 f0             	incl   -0x10(%ebp)
 7c6:	8b 55 0c             	mov    0xc(%ebp),%edx
 7c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cc:	01 d0                	add    %edx,%eax
 7ce:	8a 00                	mov    (%eax),%al
 7d0:	84 c0                	test   %al,%al
 7d2:	0f 85 77 fe ff ff    	jne    64f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7d8:	c9                   	leave  
 7d9:	c3                   	ret    
 7da:	90                   	nop
 7db:	90                   	nop

000007dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7dc:	55                   	push   %ebp
 7dd:	89 e5                	mov    %esp,%ebp
 7df:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e2:	8b 45 08             	mov    0x8(%ebp),%eax
 7e5:	83 e8 08             	sub    $0x8,%eax
 7e8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7eb:	a1 d8 0c 00 00       	mov    0xcd8,%eax
 7f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7f3:	eb 24                	jmp    819 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f8:	8b 00                	mov    (%eax),%eax
 7fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7fd:	77 12                	ja     811 <free+0x35>
 7ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 802:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 805:	77 24                	ja     82b <free+0x4f>
 807:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80f:	77 1a                	ja     82b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	8b 45 fc             	mov    -0x4(%ebp),%eax
 814:	8b 00                	mov    (%eax),%eax
 816:	89 45 fc             	mov    %eax,-0x4(%ebp)
 819:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 81f:	76 d4                	jbe    7f5 <free+0x19>
 821:	8b 45 fc             	mov    -0x4(%ebp),%eax
 824:	8b 00                	mov    (%eax),%eax
 826:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 829:	76 ca                	jbe    7f5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 838:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83b:	01 c2                	add    %eax,%edx
 83d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 840:	8b 00                	mov    (%eax),%eax
 842:	39 c2                	cmp    %eax,%edx
 844:	75 24                	jne    86a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 846:	8b 45 f8             	mov    -0x8(%ebp),%eax
 849:	8b 50 04             	mov    0x4(%eax),%edx
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	8b 00                	mov    (%eax),%eax
 851:	8b 40 04             	mov    0x4(%eax),%eax
 854:	01 c2                	add    %eax,%edx
 856:	8b 45 f8             	mov    -0x8(%ebp),%eax
 859:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	8b 00                	mov    (%eax),%eax
 861:	8b 10                	mov    (%eax),%edx
 863:	8b 45 f8             	mov    -0x8(%ebp),%eax
 866:	89 10                	mov    %edx,(%eax)
 868:	eb 0a                	jmp    874 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86d:	8b 10                	mov    (%eax),%edx
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	8b 40 04             	mov    0x4(%eax),%eax
 87a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 881:	8b 45 fc             	mov    -0x4(%ebp),%eax
 884:	01 d0                	add    %edx,%eax
 886:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 889:	75 20                	jne    8ab <free+0xcf>
    p->s.size += bp->s.size;
 88b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88e:	8b 50 04             	mov    0x4(%eax),%edx
 891:	8b 45 f8             	mov    -0x8(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	01 c2                	add    %eax,%edx
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 89f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a2:	8b 10                	mov    (%eax),%edx
 8a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a7:	89 10                	mov    %edx,(%eax)
 8a9:	eb 08                	jmp    8b3 <free+0xd7>
  } else
    p->s.ptr = bp;
 8ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ae:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8b1:	89 10                	mov    %edx,(%eax)
  freep = p;
 8b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b6:	a3 d8 0c 00 00       	mov    %eax,0xcd8
}
 8bb:	c9                   	leave  
 8bc:	c3                   	ret    

000008bd <morecore>:

static Header*
morecore(uint nu)
{
 8bd:	55                   	push   %ebp
 8be:	89 e5                	mov    %esp,%ebp
 8c0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8c3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8ca:	77 07                	ja     8d3 <morecore+0x16>
    nu = 4096;
 8cc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8d3:	8b 45 08             	mov    0x8(%ebp),%eax
 8d6:	c1 e0 03             	shl    $0x3,%eax
 8d9:	89 04 24             	mov    %eax,(%esp)
 8dc:	e8 87 fb ff ff       	call   468 <sbrk>
 8e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8e4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8e8:	75 07                	jne    8f1 <morecore+0x34>
    return 0;
 8ea:	b8 00 00 00 00       	mov    $0x0,%eax
 8ef:	eb 22                	jmp    913 <morecore+0x56>
  hp = (Header*)p;
 8f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fa:	8b 55 08             	mov    0x8(%ebp),%edx
 8fd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 903:	83 c0 08             	add    $0x8,%eax
 906:	89 04 24             	mov    %eax,(%esp)
 909:	e8 ce fe ff ff       	call   7dc <free>
  return freep;
 90e:	a1 d8 0c 00 00       	mov    0xcd8,%eax
}
 913:	c9                   	leave  
 914:	c3                   	ret    

00000915 <malloc>:

void*
malloc(uint nbytes)
{
 915:	55                   	push   %ebp
 916:	89 e5                	mov    %esp,%ebp
 918:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91b:	8b 45 08             	mov    0x8(%ebp),%eax
 91e:	83 c0 07             	add    $0x7,%eax
 921:	c1 e8 03             	shr    $0x3,%eax
 924:	40                   	inc    %eax
 925:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 928:	a1 d8 0c 00 00       	mov    0xcd8,%eax
 92d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 930:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 934:	75 23                	jne    959 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 936:	c7 45 f0 d0 0c 00 00 	movl   $0xcd0,-0x10(%ebp)
 93d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 940:	a3 d8 0c 00 00       	mov    %eax,0xcd8
 945:	a1 d8 0c 00 00       	mov    0xcd8,%eax
 94a:	a3 d0 0c 00 00       	mov    %eax,0xcd0
    base.s.size = 0;
 94f:	c7 05 d4 0c 00 00 00 	movl   $0x0,0xcd4
 956:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	8b 40 04             	mov    0x4(%eax),%eax
 967:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 96a:	72 4d                	jb     9b9 <malloc+0xa4>
      if(p->s.size == nunits)
 96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96f:	8b 40 04             	mov    0x4(%eax),%eax
 972:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 975:	75 0c                	jne    983 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	8b 10                	mov    (%eax),%edx
 97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97f:	89 10                	mov    %edx,(%eax)
 981:	eb 26                	jmp    9a9 <malloc+0x94>
      else {
        p->s.size -= nunits;
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	8b 40 04             	mov    0x4(%eax),%eax
 989:	2b 45 ec             	sub    -0x14(%ebp),%eax
 98c:	89 c2                	mov    %eax,%edx
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 994:	8b 45 f4             	mov    -0xc(%ebp),%eax
 997:	8b 40 04             	mov    0x4(%eax),%eax
 99a:	c1 e0 03             	shl    $0x3,%eax
 99d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9a6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ac:	a3 d8 0c 00 00       	mov    %eax,0xcd8
      return (void*)(p + 1);
 9b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b4:	83 c0 08             	add    $0x8,%eax
 9b7:	eb 38                	jmp    9f1 <malloc+0xdc>
    }
    if(p == freep)
 9b9:	a1 d8 0c 00 00       	mov    0xcd8,%eax
 9be:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9c1:	75 1b                	jne    9de <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 9c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9c6:	89 04 24             	mov    %eax,(%esp)
 9c9:	e8 ef fe ff ff       	call   8bd <morecore>
 9ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9d5:	75 07                	jne    9de <malloc+0xc9>
        return 0;
 9d7:	b8 00 00 00 00       	mov    $0x0,%eax
 9dc:	eb 13                	jmp    9f1 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e7:	8b 00                	mov    (%eax),%eax
 9e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9ec:	e9 70 ff ff ff       	jmp    961 <malloc+0x4c>
}
 9f1:	c9                   	leave  
 9f2:	c3                   	ret    
