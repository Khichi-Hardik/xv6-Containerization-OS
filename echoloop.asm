
_echoloop:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;
  int ticks;

  if (argc < 3) {
   9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
  	printf(1, "usage: echoloop ticks arg1 [arg2 ...]\n");
   f:	c7 44 24 04 34 0a 00 	movl   $0xa34,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 4a 06 00 00       	call   66d <printf>
  	exit();
  23:	e8 b8 03 00 00       	call   3e0 <exit>
  }

  ticks = atoi(argv[1]);
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 04             	add    $0x4,%eax
  2e:	8b 00                	mov    (%eax),%eax
  30:	89 04 24             	mov    %eax,(%esp)
  33:	e8 33 02 00 00       	call   26b <atoi>
  38:	89 44 24 18          	mov    %eax,0x18(%esp)

  while(1){
	  for(i = 2; i < argc; i++)
  3c:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
  43:	00 
  44:	eb 48                	jmp    8e <main+0x8e>
    	printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  46:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4a:	40                   	inc    %eax
  4b:	3b 45 08             	cmp    0x8(%ebp),%eax
  4e:	7d 07                	jge    57 <main+0x57>
  50:	b8 5b 0a 00 00       	mov    $0xa5b,%eax
  55:	eb 05                	jmp    5c <main+0x5c>
  57:	b8 5d 0a 00 00       	mov    $0xa5d,%eax
  5c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  60:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  6a:	01 ca                	add    %ecx,%edx
  6c:	8b 12                	mov    (%edx),%edx
  6e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  72:	89 54 24 08          	mov    %edx,0x8(%esp)
  76:	c7 44 24 04 5f 0a 00 	movl   $0xa5f,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 e3 05 00 00       	call   66d <printf>
  }

  ticks = atoi(argv[1]);

  while(1){
	  for(i = 2; i < argc; i++)
  8a:	ff 44 24 1c          	incl   0x1c(%esp)
  8e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  92:	3b 45 08             	cmp    0x8(%ebp),%eax
  95:	7c af                	jl     46 <main+0x46>
    	printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    sleep(ticks);
  97:	8b 44 24 18          	mov    0x18(%esp),%eax
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 cd 03 00 00       	call   470 <sleep>
  }
  a3:	eb 97                	jmp    3c <main+0x3c>
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop

000000a8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	57                   	push   %edi
  ac:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b0:	8b 55 10             	mov    0x10(%ebp),%edx
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	89 cb                	mov    %ecx,%ebx
  b8:	89 df                	mov    %ebx,%edi
  ba:	89 d1                	mov    %edx,%ecx
  bc:	fc                   	cld    
  bd:	f3 aa                	rep stos %al,%es:(%edi)
  bf:	89 ca                	mov    %ecx,%edx
  c1:	89 fb                	mov    %edi,%ebx
  c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  c6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  c9:	5b                   	pop    %ebx
  ca:	5f                   	pop    %edi
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    

000000cd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  cd:	55                   	push   %ebp
  ce:	89 e5                	mov    %esp,%ebp
  d0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  d9:	90                   	nop
  da:	8b 45 08             	mov    0x8(%ebp),%eax
  dd:	8d 50 01             	lea    0x1(%eax),%edx
  e0:	89 55 08             	mov    %edx,0x8(%ebp)
  e3:	8b 55 0c             	mov    0xc(%ebp),%edx
  e6:	8d 4a 01             	lea    0x1(%edx),%ecx
  e9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ec:	8a 12                	mov    (%edx),%dl
  ee:	88 10                	mov    %dl,(%eax)
  f0:	8a 00                	mov    (%eax),%al
  f2:	84 c0                	test   %al,%al
  f4:	75 e4                	jne    da <strcpy+0xd>
    ;
  return os;
  f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f9:	c9                   	leave  
  fa:	c3                   	ret    

000000fb <strcmp>:

int
strcmp(const char *p, const char *q)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  fe:	eb 06                	jmp    106 <strcmp+0xb>
    p++, q++;
 100:	ff 45 08             	incl   0x8(%ebp)
 103:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 106:	8b 45 08             	mov    0x8(%ebp),%eax
 109:	8a 00                	mov    (%eax),%al
 10b:	84 c0                	test   %al,%al
 10d:	74 0e                	je     11d <strcmp+0x22>
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	8a 10                	mov    (%eax),%dl
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	8a 00                	mov    (%eax),%al
 119:	38 c2                	cmp    %al,%dl
 11b:	74 e3                	je     100 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	8a 00                	mov    (%eax),%al
 122:	0f b6 d0             	movzbl %al,%edx
 125:	8b 45 0c             	mov    0xc(%ebp),%eax
 128:	8a 00                	mov    (%eax),%al
 12a:	0f b6 c0             	movzbl %al,%eax
 12d:	29 c2                	sub    %eax,%edx
 12f:	89 d0                	mov    %edx,%eax
}
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    

00000133 <strlen>:

uint
strlen(char *s)
{
 133:	55                   	push   %ebp
 134:	89 e5                	mov    %esp,%ebp
 136:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 139:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 140:	eb 03                	jmp    145 <strlen+0x12>
 142:	ff 45 fc             	incl   -0x4(%ebp)
 145:	8b 55 fc             	mov    -0x4(%ebp),%edx
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	01 d0                	add    %edx,%eax
 14d:	8a 00                	mov    (%eax),%al
 14f:	84 c0                	test   %al,%al
 151:	75 ef                	jne    142 <strlen+0xf>
    ;
  return n;
 153:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <memset>:

void*
memset(void *dst, int c, uint n)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 15e:	8b 45 10             	mov    0x10(%ebp),%eax
 161:	89 44 24 08          	mov    %eax,0x8(%esp)
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	89 44 24 04          	mov    %eax,0x4(%esp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	89 04 24             	mov    %eax,(%esp)
 172:	e8 31 ff ff ff       	call   a8 <stosb>
  return dst;
 177:	8b 45 08             	mov    0x8(%ebp),%eax
}
 17a:	c9                   	leave  
 17b:	c3                   	ret    

0000017c <strchr>:

char*
strchr(const char *s, char c)
{
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
 17f:	83 ec 04             	sub    $0x4,%esp
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 188:	eb 12                	jmp    19c <strchr+0x20>
    if(*s == c)
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	8a 00                	mov    (%eax),%al
 18f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 192:	75 05                	jne    199 <strchr+0x1d>
      return (char*)s;
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	eb 11                	jmp    1aa <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 199:	ff 45 08             	incl   0x8(%ebp)
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	8a 00                	mov    (%eax),%al
 1a1:	84 c0                	test   %al,%al
 1a3:	75 e5                	jne    18a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <gets>:

char*
gets(char *buf, int max)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1b9:	eb 49                	jmp    204 <gets+0x58>
    cc = read(0, &c, 1);
 1bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1c2:	00 
 1c3:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d1:	e8 22 02 00 00       	call   3f8 <read>
 1d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1dd:	7f 02                	jg     1e1 <gets+0x35>
      break;
 1df:	eb 2c                	jmp    20d <gets+0x61>
    buf[i++] = c;
 1e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e4:	8d 50 01             	lea    0x1(%eax),%edx
 1e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1ea:	89 c2                	mov    %eax,%edx
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	01 c2                	add    %eax,%edx
 1f1:	8a 45 ef             	mov    -0x11(%ebp),%al
 1f4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1f6:	8a 45 ef             	mov    -0x11(%ebp),%al
 1f9:	3c 0a                	cmp    $0xa,%al
 1fb:	74 10                	je     20d <gets+0x61>
 1fd:	8a 45 ef             	mov    -0x11(%ebp),%al
 200:	3c 0d                	cmp    $0xd,%al
 202:	74 09                	je     20d <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 204:	8b 45 f4             	mov    -0xc(%ebp),%eax
 207:	40                   	inc    %eax
 208:	3b 45 0c             	cmp    0xc(%ebp),%eax
 20b:	7c ae                	jl     1bb <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 20d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	01 d0                	add    %edx,%eax
 215:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 218:	8b 45 08             	mov    0x8(%ebp),%eax
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <stat>:

int
stat(char *n, struct stat *st)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 223:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 22a:	00 
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	89 04 24             	mov    %eax,(%esp)
 231:	e8 ea 01 00 00       	call   420 <open>
 236:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 239:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 23d:	79 07                	jns    246 <stat+0x29>
    return -1;
 23f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 244:	eb 23                	jmp    269 <stat+0x4c>
  r = fstat(fd, st);
 246:	8b 45 0c             	mov    0xc(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 250:	89 04 24             	mov    %eax,(%esp)
 253:	e8 e0 01 00 00       	call   438 <fstat>
 258:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25e:	89 04 24             	mov    %eax,(%esp)
 261:	e8 a2 01 00 00       	call   408 <close>
  return r;
 266:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 269:	c9                   	leave  
 26a:	c3                   	ret    

0000026b <atoi>:

int
atoi(const char *s)
{
 26b:	55                   	push   %ebp
 26c:	89 e5                	mov    %esp,%ebp
 26e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 271:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 278:	eb 24                	jmp    29e <atoi+0x33>
    n = n*10 + *s++ - '0';
 27a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27d:	89 d0                	mov    %edx,%eax
 27f:	c1 e0 02             	shl    $0x2,%eax
 282:	01 d0                	add    %edx,%eax
 284:	01 c0                	add    %eax,%eax
 286:	89 c1                	mov    %eax,%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8d 50 01             	lea    0x1(%eax),%edx
 28e:	89 55 08             	mov    %edx,0x8(%ebp)
 291:	8a 00                	mov    (%eax),%al
 293:	0f be c0             	movsbl %al,%eax
 296:	01 c8                	add    %ecx,%eax
 298:	83 e8 30             	sub    $0x30,%eax
 29b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	8a 00                	mov    (%eax),%al
 2a3:	3c 2f                	cmp    $0x2f,%al
 2a5:	7e 09                	jle    2b0 <atoi+0x45>
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	8a 00                	mov    (%eax),%al
 2ac:	3c 39                	cmp    $0x39,%al
 2ae:	7e ca                	jle    27a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c7:	eb 16                	jmp    2df <memmove+0x2a>
    *dst++ = *src++;
 2c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2cc:	8d 50 01             	lea    0x1(%eax),%edx
 2cf:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2d2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d5:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2db:	8a 12                	mov    (%edx),%dl
 2dd:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2df:	8b 45 10             	mov    0x10(%ebp),%eax
 2e2:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e5:	89 55 10             	mov    %edx,0x10(%ebp)
 2e8:	85 c0                	test   %eax,%eax
 2ea:	7f dd                	jg     2c9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ef:	c9                   	leave  
 2f0:	c3                   	ret    

000002f1 <itoa>:

int itoa(int value, char *sp, int radix)
{
 2f1:	55                   	push   %ebp
 2f2:	89 e5                	mov    %esp,%ebp
 2f4:	53                   	push   %ebx
 2f5:	83 ec 30             	sub    $0x30,%esp
  char tmp[16];
  char *tp = tmp;
 2f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
 2fb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int i;
  unsigned v;

  int sign = (radix == 10 && value < 0);    
 2fe:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
 302:	75 0d                	jne    311 <itoa+0x20>
 304:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 308:	79 07                	jns    311 <itoa+0x20>
 30a:	b8 01 00 00 00       	mov    $0x1,%eax
 30f:	eb 05                	jmp    316 <itoa+0x25>
 311:	b8 00 00 00 00       	mov    $0x0,%eax
 316:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if (sign)
 319:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 31d:	74 0a                	je     329 <itoa+0x38>
      v = -value;
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	f7 d8                	neg    %eax
 324:	89 45 f4             	mov    %eax,-0xc(%ebp)
  else
      v = (unsigned)value;

  while (v || tp == tmp)
 327:	eb 54                	jmp    37d <itoa+0x8c>

  int sign = (radix == 10 && value < 0);    
  if (sign)
      v = -value;
  else
      v = (unsigned)value;
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while (v || tp == tmp)
 32f:	eb 4c                	jmp    37d <itoa+0x8c>
  {
    i = v % radix;
 331:	8b 4d 10             	mov    0x10(%ebp),%ecx
 334:	8b 45 f4             	mov    -0xc(%ebp),%eax
 337:	ba 00 00 00 00       	mov    $0x0,%edx
 33c:	f7 f1                	div    %ecx
 33e:	89 d0                	mov    %edx,%eax
 340:	89 45 e8             	mov    %eax,-0x18(%ebp)
    v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
 343:	8b 5d 10             	mov    0x10(%ebp),%ebx
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	ba 00 00 00 00       	mov    $0x0,%edx
 34e:	f7 f3                	div    %ebx
 350:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (i < 10)
 353:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
 357:	7f 13                	jg     36c <itoa+0x7b>
      *tp++ = i+'0';
 359:	8b 45 f8             	mov    -0x8(%ebp),%eax
 35c:	8d 50 01             	lea    0x1(%eax),%edx
 35f:	89 55 f8             	mov    %edx,-0x8(%ebp)
 362:	8b 55 e8             	mov    -0x18(%ebp),%edx
 365:	83 c2 30             	add    $0x30,%edx
 368:	88 10                	mov    %dl,(%eax)
 36a:	eb 11                	jmp    37d <itoa+0x8c>
    else
      *tp++ = i + 'a' - 10;
 36c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 36f:	8d 50 01             	lea    0x1(%eax),%edx
 372:	89 55 f8             	mov    %edx,-0x8(%ebp)
 375:	8b 55 e8             	mov    -0x18(%ebp),%edx
 378:	83 c2 57             	add    $0x57,%edx
 37b:	88 10                	mov    %dl,(%eax)
  if (sign)
      v = -value;
  else
      v = (unsigned)value;

  while (v || tp == tmp)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	75 ae                	jne    331 <itoa+0x40>
 383:	8d 45 d8             	lea    -0x28(%ebp),%eax
 386:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 389:	74 a6                	je     331 <itoa+0x40>
      *tp++ = i+'0';
    else
      *tp++ = i + 'a' - 10;
  }

  int len = tp - tmp;
 38b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 38e:	8d 45 d8             	lea    -0x28(%ebp),%eax
 391:	29 c2                	sub    %eax,%edx
 393:	89 d0                	mov    %edx,%eax
 395:	89 45 f0             	mov    %eax,-0x10(%ebp)

  if (sign) 
 398:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 39c:	74 11                	je     3af <itoa+0xbe>
  {
    *sp++ = '-';
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	8d 50 01             	lea    0x1(%eax),%edx
 3a4:	89 55 0c             	mov    %edx,0xc(%ebp)
 3a7:	c6 00 2d             	movb   $0x2d,(%eax)
    len++;
 3aa:	ff 45 f0             	incl   -0x10(%ebp)
  }

  while (tp > tmp)
 3ad:	eb 15                	jmp    3c4 <itoa+0xd3>
 3af:	eb 13                	jmp    3c4 <itoa+0xd3>
    *sp++ = *--tp;
 3b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b4:	8d 50 01             	lea    0x1(%eax),%edx
 3b7:	89 55 0c             	mov    %edx,0xc(%ebp)
 3ba:	ff 4d f8             	decl   -0x8(%ebp)
 3bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3c0:	8a 12                	mov    (%edx),%dl
 3c2:	88 10                	mov    %dl,(%eax)
  {
    *sp++ = '-';
    len++;
  }

  while (tp > tmp)
 3c4:	8d 45 d8             	lea    -0x28(%ebp),%eax
 3c7:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 3ca:	77 e5                	ja     3b1 <itoa+0xc0>
    *sp++ = *--tp;

  return len;
 3cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3cf:	83 c4 30             	add    $0x30,%esp
 3d2:	5b                   	pop    %ebx
 3d3:	5d                   	pop    %ebp
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

00000550 <pause>:
SYSCALL(pause)
 550:	b8 30 00 00 00       	mov    $0x30,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <resume>:
SYSCALL(resume)
 558:	b8 31 00 00 00       	mov    $0x31,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <tmem>:
SYSCALL(tmem)
 560:	b8 32 00 00 00       	mov    $0x32,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <amem>:
SYSCALL(amem)
 568:	b8 33 00 00 00       	mov    $0x33,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <c_ps>:
SYSCALL(c_ps)
 570:	b8 34 00 00 00       	mov    $0x34,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <get_used>:
SYSCALL(get_used)
 578:	b8 35 00 00 00       	mov    $0x35,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <get_os>:
SYSCALL(get_os)
 580:	b8 36 00 00 00       	mov    $0x36,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <set_os>:
SYSCALL(set_os)
 588:	b8 37 00 00 00       	mov    $0x37,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	83 ec 18             	sub    $0x18,%esp
 596:	8b 45 0c             	mov    0xc(%ebp),%eax
 599:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 59c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a3:	00 
 5a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	89 04 24             	mov    %eax,(%esp)
 5b1:	e8 4a fe ff ff       	call   400 <write>
}
 5b6:	c9                   	leave  
 5b7:	c3                   	ret    

000005b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	56                   	push   %esi
 5bc:	53                   	push   %ebx
 5bd:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5c0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5c7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5cb:	74 17                	je     5e4 <printint+0x2c>
 5cd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5d1:	79 11                	jns    5e4 <printint+0x2c>
    neg = 1;
 5d3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5da:	8b 45 0c             	mov    0xc(%ebp),%eax
 5dd:	f7 d8                	neg    %eax
 5df:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5e2:	eb 06                	jmp    5ea <printint+0x32>
  } else {
    x = xx;
 5e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5f1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5f4:	8d 41 01             	lea    0x1(%ecx),%eax
 5f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 600:	ba 00 00 00 00       	mov    $0x0,%edx
 605:	f7 f3                	div    %ebx
 607:	89 d0                	mov    %edx,%eax
 609:	8a 80 d4 0c 00 00    	mov    0xcd4(%eax),%al
 60f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 613:	8b 75 10             	mov    0x10(%ebp),%esi
 616:	8b 45 ec             	mov    -0x14(%ebp),%eax
 619:	ba 00 00 00 00       	mov    $0x0,%edx
 61e:	f7 f6                	div    %esi
 620:	89 45 ec             	mov    %eax,-0x14(%ebp)
 623:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 627:	75 c8                	jne    5f1 <printint+0x39>
  if(neg)
 629:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 62d:	74 10                	je     63f <printint+0x87>
    buf[i++] = '-';
 62f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 632:	8d 50 01             	lea    0x1(%eax),%edx
 635:	89 55 f4             	mov    %edx,-0xc(%ebp)
 638:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 63d:	eb 1e                	jmp    65d <printint+0xa5>
 63f:	eb 1c                	jmp    65d <printint+0xa5>
    putc(fd, buf[i]);
 641:	8d 55 dc             	lea    -0x24(%ebp),%edx
 644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 647:	01 d0                	add    %edx,%eax
 649:	8a 00                	mov    (%eax),%al
 64b:	0f be c0             	movsbl %al,%eax
 64e:	89 44 24 04          	mov    %eax,0x4(%esp)
 652:	8b 45 08             	mov    0x8(%ebp),%eax
 655:	89 04 24             	mov    %eax,(%esp)
 658:	e8 33 ff ff ff       	call   590 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 65d:	ff 4d f4             	decl   -0xc(%ebp)
 660:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 664:	79 db                	jns    641 <printint+0x89>
    putc(fd, buf[i]);
}
 666:	83 c4 30             	add    $0x30,%esp
 669:	5b                   	pop    %ebx
 66a:	5e                   	pop    %esi
 66b:	5d                   	pop    %ebp
 66c:	c3                   	ret    

0000066d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 66d:	55                   	push   %ebp
 66e:	89 e5                	mov    %esp,%ebp
 670:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 673:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 67a:	8d 45 0c             	lea    0xc(%ebp),%eax
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 683:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 68a:	e9 77 01 00 00       	jmp    806 <printf+0x199>
    c = fmt[i] & 0xff;
 68f:	8b 55 0c             	mov    0xc(%ebp),%edx
 692:	8b 45 f0             	mov    -0x10(%ebp),%eax
 695:	01 d0                	add    %edx,%eax
 697:	8a 00                	mov    (%eax),%al
 699:	0f be c0             	movsbl %al,%eax
 69c:	25 ff 00 00 00       	and    $0xff,%eax
 6a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6a8:	75 2c                	jne    6d6 <printf+0x69>
      if(c == '%'){
 6aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ae:	75 0c                	jne    6bc <printf+0x4f>
        state = '%';
 6b0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6b7:	e9 47 01 00 00       	jmp    803 <printf+0x196>
      } else {
        putc(fd, c);
 6bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6bf:	0f be c0             	movsbl %al,%eax
 6c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c6:	8b 45 08             	mov    0x8(%ebp),%eax
 6c9:	89 04 24             	mov    %eax,(%esp)
 6cc:	e8 bf fe ff ff       	call   590 <putc>
 6d1:	e9 2d 01 00 00       	jmp    803 <printf+0x196>
      }
    } else if(state == '%'){
 6d6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6da:	0f 85 23 01 00 00    	jne    803 <printf+0x196>
      if(c == 'd'){
 6e0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6e4:	75 2d                	jne    713 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 6e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e9:	8b 00                	mov    (%eax),%eax
 6eb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6f2:	00 
 6f3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6fa:	00 
 6fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	89 04 24             	mov    %eax,(%esp)
 705:	e8 ae fe ff ff       	call   5b8 <printint>
        ap++;
 70a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 70e:	e9 e9 00 00 00       	jmp    7fc <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 713:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 717:	74 06                	je     71f <printf+0xb2>
 719:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 71d:	75 2d                	jne    74c <printf+0xdf>
        printint(fd, *ap, 16, 0);
 71f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 722:	8b 00                	mov    (%eax),%eax
 724:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 72b:	00 
 72c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 733:	00 
 734:	89 44 24 04          	mov    %eax,0x4(%esp)
 738:	8b 45 08             	mov    0x8(%ebp),%eax
 73b:	89 04 24             	mov    %eax,(%esp)
 73e:	e8 75 fe ff ff       	call   5b8 <printint>
        ap++;
 743:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 747:	e9 b0 00 00 00       	jmp    7fc <printf+0x18f>
      } else if(c == 's'){
 74c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 750:	75 42                	jne    794 <printf+0x127>
        s = (char*)*ap;
 752:	8b 45 e8             	mov    -0x18(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 75a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 75e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 762:	75 09                	jne    76d <printf+0x100>
          s = "(null)";
 764:	c7 45 f4 64 0a 00 00 	movl   $0xa64,-0xc(%ebp)
        while(*s != 0){
 76b:	eb 1c                	jmp    789 <printf+0x11c>
 76d:	eb 1a                	jmp    789 <printf+0x11c>
          putc(fd, *s);
 76f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 772:	8a 00                	mov    (%eax),%al
 774:	0f be c0             	movsbl %al,%eax
 777:	89 44 24 04          	mov    %eax,0x4(%esp)
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	89 04 24             	mov    %eax,(%esp)
 781:	e8 0a fe ff ff       	call   590 <putc>
          s++;
 786:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 789:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78c:	8a 00                	mov    (%eax),%al
 78e:	84 c0                	test   %al,%al
 790:	75 dd                	jne    76f <printf+0x102>
 792:	eb 68                	jmp    7fc <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 794:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 798:	75 1d                	jne    7b7 <printf+0x14a>
        putc(fd, *ap);
 79a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	0f be c0             	movsbl %al,%eax
 7a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 df fd ff ff       	call   590 <putc>
        ap++;
 7b1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b5:	eb 45                	jmp    7fc <printf+0x18f>
      } else if(c == '%'){
 7b7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7bb:	75 17                	jne    7d4 <printf+0x167>
        putc(fd, c);
 7bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c0:	0f be c0             	movsbl %al,%eax
 7c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	89 04 24             	mov    %eax,(%esp)
 7cd:	e8 be fd ff ff       	call   590 <putc>
 7d2:	eb 28                	jmp    7fc <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7d4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7db:	00 
 7dc:	8b 45 08             	mov    0x8(%ebp),%eax
 7df:	89 04 24             	mov    %eax,(%esp)
 7e2:	e8 a9 fd ff ff       	call   590 <putc>
        putc(fd, c);
 7e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ea:	0f be c0             	movsbl %al,%eax
 7ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	89 04 24             	mov    %eax,(%esp)
 7f7:	e8 94 fd ff ff       	call   590 <putc>
      }
      state = 0;
 7fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 803:	ff 45 f0             	incl   -0x10(%ebp)
 806:	8b 55 0c             	mov    0xc(%ebp),%edx
 809:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80c:	01 d0                	add    %edx,%eax
 80e:	8a 00                	mov    (%eax),%al
 810:	84 c0                	test   %al,%al
 812:	0f 85 77 fe ff ff    	jne    68f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 818:	c9                   	leave  
 819:	c3                   	ret    
 81a:	90                   	nop
 81b:	90                   	nop

0000081c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	83 e8 08             	sub    $0x8,%eax
 828:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82b:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 830:	89 45 fc             	mov    %eax,-0x4(%ebp)
 833:	eb 24                	jmp    859 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 83d:	77 12                	ja     851 <free+0x35>
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 845:	77 24                	ja     86b <free+0x4f>
 847:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84f:	77 1a                	ja     86b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	8b 00                	mov    (%eax),%eax
 856:	89 45 fc             	mov    %eax,-0x4(%ebp)
 859:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85f:	76 d4                	jbe    835 <free+0x19>
 861:	8b 45 fc             	mov    -0x4(%ebp),%eax
 864:	8b 00                	mov    (%eax),%eax
 866:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 869:	76 ca                	jbe    835 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 86b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 878:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87b:	01 c2                	add    %eax,%edx
 87d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 880:	8b 00                	mov    (%eax),%eax
 882:	39 c2                	cmp    %eax,%edx
 884:	75 24                	jne    8aa <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 886:	8b 45 f8             	mov    -0x8(%ebp),%eax
 889:	8b 50 04             	mov    0x4(%eax),%edx
 88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88f:	8b 00                	mov    (%eax),%eax
 891:	8b 40 04             	mov    0x4(%eax),%eax
 894:	01 c2                	add    %eax,%edx
 896:	8b 45 f8             	mov    -0x8(%ebp),%eax
 899:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 89c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89f:	8b 00                	mov    (%eax),%eax
 8a1:	8b 10                	mov    (%eax),%edx
 8a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a6:	89 10                	mov    %edx,(%eax)
 8a8:	eb 0a                	jmp    8b4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ad:	8b 10                	mov    (%eax),%edx
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b7:	8b 40 04             	mov    0x4(%eax),%eax
 8ba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c4:	01 d0                	add    %edx,%eax
 8c6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8c9:	75 20                	jne    8eb <free+0xcf>
    p->s.size += bp->s.size;
 8cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ce:	8b 50 04             	mov    0x4(%eax),%edx
 8d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d4:	8b 40 04             	mov    0x4(%eax),%eax
 8d7:	01 c2                	add    %eax,%edx
 8d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8dc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e2:	8b 10                	mov    (%eax),%edx
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	89 10                	mov    %edx,(%eax)
 8e9:	eb 08                	jmp    8f3 <free+0xd7>
  } else
    p->s.ptr = bp;
 8eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ee:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8f1:	89 10                	mov    %edx,(%eax)
  freep = p;
 8f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f6:	a3 f0 0c 00 00       	mov    %eax,0xcf0
}
 8fb:	c9                   	leave  
 8fc:	c3                   	ret    

000008fd <morecore>:

static Header*
morecore(uint nu)
{
 8fd:	55                   	push   %ebp
 8fe:	89 e5                	mov    %esp,%ebp
 900:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 903:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 90a:	77 07                	ja     913 <morecore+0x16>
    nu = 4096;
 90c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 913:	8b 45 08             	mov    0x8(%ebp),%eax
 916:	c1 e0 03             	shl    $0x3,%eax
 919:	89 04 24             	mov    %eax,(%esp)
 91c:	e8 47 fb ff ff       	call   468 <sbrk>
 921:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 924:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 928:	75 07                	jne    931 <morecore+0x34>
    return 0;
 92a:	b8 00 00 00 00       	mov    $0x0,%eax
 92f:	eb 22                	jmp    953 <morecore+0x56>
  hp = (Header*)p;
 931:	8b 45 f4             	mov    -0xc(%ebp),%eax
 934:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 937:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93a:	8b 55 08             	mov    0x8(%ebp),%edx
 93d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 940:	8b 45 f0             	mov    -0x10(%ebp),%eax
 943:	83 c0 08             	add    $0x8,%eax
 946:	89 04 24             	mov    %eax,(%esp)
 949:	e8 ce fe ff ff       	call   81c <free>
  return freep;
 94e:	a1 f0 0c 00 00       	mov    0xcf0,%eax
}
 953:	c9                   	leave  
 954:	c3                   	ret    

00000955 <malloc>:

void*
malloc(uint nbytes)
{
 955:	55                   	push   %ebp
 956:	89 e5                	mov    %esp,%ebp
 958:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 95b:	8b 45 08             	mov    0x8(%ebp),%eax
 95e:	83 c0 07             	add    $0x7,%eax
 961:	c1 e8 03             	shr    $0x3,%eax
 964:	40                   	inc    %eax
 965:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 968:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 96d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 970:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 974:	75 23                	jne    999 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 976:	c7 45 f0 e8 0c 00 00 	movl   $0xce8,-0x10(%ebp)
 97d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 980:	a3 f0 0c 00 00       	mov    %eax,0xcf0
 985:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 98a:	a3 e8 0c 00 00       	mov    %eax,0xce8
    base.s.size = 0;
 98f:	c7 05 ec 0c 00 00 00 	movl   $0x0,0xcec
 996:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 999:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99c:	8b 00                	mov    (%eax),%eax
 99e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a4:	8b 40 04             	mov    0x4(%eax),%eax
 9a7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9aa:	72 4d                	jb     9f9 <malloc+0xa4>
      if(p->s.size == nunits)
 9ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9af:	8b 40 04             	mov    0x4(%eax),%eax
 9b2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9b5:	75 0c                	jne    9c3 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 9b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ba:	8b 10                	mov    (%eax),%edx
 9bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bf:	89 10                	mov    %edx,(%eax)
 9c1:	eb 26                	jmp    9e9 <malloc+0x94>
      else {
        p->s.size -= nunits;
 9c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c6:	8b 40 04             	mov    0x4(%eax),%eax
 9c9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9cc:	89 c2                	mov    %eax,%edx
 9ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d7:	8b 40 04             	mov    0x4(%eax),%eax
 9da:	c1 e0 03             	shl    $0x3,%eax
 9dd:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9e6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ec:	a3 f0 0c 00 00       	mov    %eax,0xcf0
      return (void*)(p + 1);
 9f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f4:	83 c0 08             	add    $0x8,%eax
 9f7:	eb 38                	jmp    a31 <malloc+0xdc>
    }
    if(p == freep)
 9f9:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 9fe:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a01:	75 1b                	jne    a1e <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 a03:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a06:	89 04 24             	mov    %eax,(%esp)
 a09:	e8 ef fe ff ff       	call   8fd <morecore>
 a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a15:	75 07                	jne    a1e <malloc+0xc9>
        return 0;
 a17:	b8 00 00 00 00       	mov    $0x0,%eax
 a1c:	eb 13                	jmp    a31 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a21:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a27:	8b 00                	mov    (%eax),%eax
 a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a2c:	e9 70 ff ff ff       	jmp    9a1 <malloc+0x4c>
}
 a31:	c9                   	leave  
 a32:	c3                   	ret    
