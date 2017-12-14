
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 17 0a 00 	movl   $0xa17,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 2e 06 00 00       	call   651 <printf>
    exit();
  23:	e8 8c 03 00 00       	call   3b4 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 d0 03 00 00       	call   414 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 2a 0a 00 	movl   $0xa2a,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 dd 05 00 00       	call   651 <printf>
  exit();
  74:	e8 3b 03 00 00       	call   3b4 <exit>
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop

0000007c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	57                   	push   %edi
  80:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  81:	8b 4d 08             	mov    0x8(%ebp),%ecx
  84:	8b 55 10             	mov    0x10(%ebp),%edx
  87:	8b 45 0c             	mov    0xc(%ebp),%eax
  8a:	89 cb                	mov    %ecx,%ebx
  8c:	89 df                	mov    %ebx,%edi
  8e:	89 d1                	mov    %edx,%ecx
  90:	fc                   	cld    
  91:	f3 aa                	rep stos %al,%es:(%edi)
  93:	89 ca                	mov    %ecx,%edx
  95:	89 fb                	mov    %edi,%ebx
  97:	89 5d 08             	mov    %ebx,0x8(%ebp)
  9a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9d:	5b                   	pop    %ebx
  9e:	5f                   	pop    %edi
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    

000000a1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a1:	55                   	push   %ebp
  a2:	89 e5                	mov    %esp,%ebp
  a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  ad:	90                   	nop
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	8d 50 01             	lea    0x1(%eax),%edx
  b4:	89 55 08             	mov    %edx,0x8(%ebp)
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  ba:	8d 4a 01             	lea    0x1(%edx),%ecx
  bd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  c0:	8a 12                	mov    (%edx),%dl
  c2:	88 10                	mov    %dl,(%eax)
  c4:	8a 00                	mov    (%eax),%al
  c6:	84 c0                	test   %al,%al
  c8:	75 e4                	jne    ae <strcpy+0xd>
    ;
  return os;
  ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cd:	c9                   	leave  
  ce:	c3                   	ret    

000000cf <strcmp>:

int
strcmp(const char *p, const char *q)
{
  cf:	55                   	push   %ebp
  d0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d2:	eb 06                	jmp    da <strcmp+0xb>
    p++, q++;
  d4:	ff 45 08             	incl   0x8(%ebp)
  d7:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  da:	8b 45 08             	mov    0x8(%ebp),%eax
  dd:	8a 00                	mov    (%eax),%al
  df:	84 c0                	test   %al,%al
  e1:	74 0e                	je     f1 <strcmp+0x22>
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	8a 10                	mov    (%eax),%dl
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	8a 00                	mov    (%eax),%al
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 e3                	je     d4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	8a 00                	mov    (%eax),%al
  f6:	0f b6 d0             	movzbl %al,%edx
  f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  fc:	8a 00                	mov    (%eax),%al
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	29 c2                	sub    %eax,%edx
 103:	89 d0                	mov    %edx,%eax
}
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 03                	jmp    119 <strlen+0x12>
 116:	ff 45 fc             	incl   -0x4(%ebp)
 119:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	01 d0                	add    %edx,%eax
 121:	8a 00                	mov    (%eax),%al
 123:	84 c0                	test   %al,%al
 125:	75 ef                	jne    116 <strlen+0xf>
    ;
  return n;
 127:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12a:	c9                   	leave  
 12b:	c3                   	ret    

0000012c <memset>:

void*
memset(void *dst, int c, uint n)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 132:	8b 45 10             	mov    0x10(%ebp),%eax
 135:	89 44 24 08          	mov    %eax,0x8(%esp)
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	89 04 24             	mov    %eax,(%esp)
 146:	e8 31 ff ff ff       	call   7c <stosb>
  return dst;
 14b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 14e:	c9                   	leave  
 14f:	c3                   	ret    

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	83 ec 04             	sub    $0x4,%esp
 156:	8b 45 0c             	mov    0xc(%ebp),%eax
 159:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 15c:	eb 12                	jmp    170 <strchr+0x20>
    if(*s == c)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	8a 00                	mov    (%eax),%al
 163:	3a 45 fc             	cmp    -0x4(%ebp),%al
 166:	75 05                	jne    16d <strchr+0x1d>
      return (char*)s;
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	eb 11                	jmp    17e <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 16d:	ff 45 08             	incl   0x8(%ebp)
 170:	8b 45 08             	mov    0x8(%ebp),%eax
 173:	8a 00                	mov    (%eax),%al
 175:	84 c0                	test   %al,%al
 177:	75 e5                	jne    15e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 179:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17e:	c9                   	leave  
 17f:	c3                   	ret    

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18d:	eb 49                	jmp    1d8 <gets+0x58>
    cc = read(0, &c, 1);
 18f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 196:	00 
 197:	8d 45 ef             	lea    -0x11(%ebp),%eax
 19a:	89 44 24 04          	mov    %eax,0x4(%esp)
 19e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a5:	e8 22 02 00 00       	call   3cc <read>
 1aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b1:	7f 02                	jg     1b5 <gets+0x35>
      break;
 1b3:	eb 2c                	jmp    1e1 <gets+0x61>
    buf[i++] = c;
 1b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b8:	8d 50 01             	lea    0x1(%eax),%edx
 1bb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1be:	89 c2                	mov    %eax,%edx
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	01 c2                	add    %eax,%edx
 1c5:	8a 45 ef             	mov    -0x11(%ebp),%al
 1c8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ca:	8a 45 ef             	mov    -0x11(%ebp),%al
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 10                	je     1e1 <gets+0x61>
 1d1:	8a 45 ef             	mov    -0x11(%ebp),%al
 1d4:	3c 0d                	cmp    $0xd,%al
 1d6:	74 09                	je     1e1 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1db:	40                   	inc    %eax
 1dc:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1df:	7c ae                	jl     18f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	01 d0                	add    %edx,%eax
 1e9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <stat>:

int
stat(char *n, struct stat *st)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fe:	00 
 1ff:	8b 45 08             	mov    0x8(%ebp),%eax
 202:	89 04 24             	mov    %eax,(%esp)
 205:	e8 ea 01 00 00       	call   3f4 <open>
 20a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 211:	79 07                	jns    21a <stat+0x29>
    return -1;
 213:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 218:	eb 23                	jmp    23d <stat+0x4c>
  r = fstat(fd, st);
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 44 24 04          	mov    %eax,0x4(%esp)
 221:	8b 45 f4             	mov    -0xc(%ebp),%eax
 224:	89 04 24             	mov    %eax,(%esp)
 227:	e8 e0 01 00 00       	call   40c <fstat>
 22c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 a2 01 00 00       	call   3dc <close>
  return r;
 23a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23d:	c9                   	leave  
 23e:	c3                   	ret    

0000023f <atoi>:

int
atoi(const char *s)
{
 23f:	55                   	push   %ebp
 240:	89 e5                	mov    %esp,%ebp
 242:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 245:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24c:	eb 24                	jmp    272 <atoi+0x33>
    n = n*10 + *s++ - '0';
 24e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 251:	89 d0                	mov    %edx,%eax
 253:	c1 e0 02             	shl    $0x2,%eax
 256:	01 d0                	add    %edx,%eax
 258:	01 c0                	add    %eax,%eax
 25a:	89 c1                	mov    %eax,%ecx
 25c:	8b 45 08             	mov    0x8(%ebp),%eax
 25f:	8d 50 01             	lea    0x1(%eax),%edx
 262:	89 55 08             	mov    %edx,0x8(%ebp)
 265:	8a 00                	mov    (%eax),%al
 267:	0f be c0             	movsbl %al,%eax
 26a:	01 c8                	add    %ecx,%eax
 26c:	83 e8 30             	sub    $0x30,%eax
 26f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	8a 00                	mov    (%eax),%al
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 09                	jle    284 <atoi+0x45>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	8a 00                	mov    (%eax),%al
 280:	3c 39                	cmp    $0x39,%al
 282:	7e ca                	jle    24e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 284:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 287:	c9                   	leave  
 288:	c3                   	ret    

00000289 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
 292:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 295:	8b 45 0c             	mov    0xc(%ebp),%eax
 298:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29b:	eb 16                	jmp    2b3 <memmove+0x2a>
    *dst++ = *src++;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a0:	8d 50 01             	lea    0x1(%eax),%edx
 2a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a9:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ac:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2af:	8a 12                	mov    (%edx),%dl
 2b1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b3:	8b 45 10             	mov    0x10(%ebp),%eax
 2b6:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b9:	89 55 10             	mov    %edx,0x10(%ebp)
 2bc:	85 c0                	test   %eax,%eax
 2be:	7f dd                	jg     29d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <itoa>:

int itoa(int value, char *sp, int radix)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	53                   	push   %ebx
 2c9:	83 ec 30             	sub    $0x30,%esp
  char tmp[16];
  char *tp = tmp;
 2cc:	8d 45 d8             	lea    -0x28(%ebp),%eax
 2cf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int i;
  unsigned v;

  int sign = (radix == 10 && value < 0);    
 2d2:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
 2d6:	75 0d                	jne    2e5 <itoa+0x20>
 2d8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2dc:	79 07                	jns    2e5 <itoa+0x20>
 2de:	b8 01 00 00 00       	mov    $0x1,%eax
 2e3:	eb 05                	jmp    2ea <itoa+0x25>
 2e5:	b8 00 00 00 00       	mov    $0x0,%eax
 2ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if (sign)
 2ed:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 2f1:	74 0a                	je     2fd <itoa+0x38>
      v = -value;
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	f7 d8                	neg    %eax
 2f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  else
      v = (unsigned)value;

  while (v || tp == tmp)
 2fb:	eb 54                	jmp    351 <itoa+0x8c>

  int sign = (radix == 10 && value < 0);    
  if (sign)
      v = -value;
  else
      v = (unsigned)value;
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
 300:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while (v || tp == tmp)
 303:	eb 4c                	jmp    351 <itoa+0x8c>
  {
    i = v % radix;
 305:	8b 4d 10             	mov    0x10(%ebp),%ecx
 308:	8b 45 f4             	mov    -0xc(%ebp),%eax
 30b:	ba 00 00 00 00       	mov    $0x0,%edx
 310:	f7 f1                	div    %ecx
 312:	89 d0                	mov    %edx,%eax
 314:	89 45 e8             	mov    %eax,-0x18(%ebp)
    v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
 317:	8b 5d 10             	mov    0x10(%ebp),%ebx
 31a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31d:	ba 00 00 00 00       	mov    $0x0,%edx
 322:	f7 f3                	div    %ebx
 324:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (i < 10)
 327:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
 32b:	7f 13                	jg     340 <itoa+0x7b>
      *tp++ = i+'0';
 32d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 330:	8d 50 01             	lea    0x1(%eax),%edx
 333:	89 55 f8             	mov    %edx,-0x8(%ebp)
 336:	8b 55 e8             	mov    -0x18(%ebp),%edx
 339:	83 c2 30             	add    $0x30,%edx
 33c:	88 10                	mov    %dl,(%eax)
 33e:	eb 11                	jmp    351 <itoa+0x8c>
    else
      *tp++ = i + 'a' - 10;
 340:	8b 45 f8             	mov    -0x8(%ebp),%eax
 343:	8d 50 01             	lea    0x1(%eax),%edx
 346:	89 55 f8             	mov    %edx,-0x8(%ebp)
 349:	8b 55 e8             	mov    -0x18(%ebp),%edx
 34c:	83 c2 57             	add    $0x57,%edx
 34f:	88 10                	mov    %dl,(%eax)
  if (sign)
      v = -value;
  else
      v = (unsigned)value;

  while (v || tp == tmp)
 351:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 355:	75 ae                	jne    305 <itoa+0x40>
 357:	8d 45 d8             	lea    -0x28(%ebp),%eax
 35a:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 35d:	74 a6                	je     305 <itoa+0x40>
      *tp++ = i+'0';
    else
      *tp++ = i + 'a' - 10;
  }

  int len = tp - tmp;
 35f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 362:	8d 45 d8             	lea    -0x28(%ebp),%eax
 365:	29 c2                	sub    %eax,%edx
 367:	89 d0                	mov    %edx,%eax
 369:	89 45 f0             	mov    %eax,-0x10(%ebp)

  if (sign) 
 36c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 370:	74 11                	je     383 <itoa+0xbe>
  {
    *sp++ = '-';
 372:	8b 45 0c             	mov    0xc(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 0c             	mov    %edx,0xc(%ebp)
 37b:	c6 00 2d             	movb   $0x2d,(%eax)
    len++;
 37e:	ff 45 f0             	incl   -0x10(%ebp)
  }

  while (tp > tmp)
 381:	eb 15                	jmp    398 <itoa+0xd3>
 383:	eb 13                	jmp    398 <itoa+0xd3>
    *sp++ = *--tp;
 385:	8b 45 0c             	mov    0xc(%ebp),%eax
 388:	8d 50 01             	lea    0x1(%eax),%edx
 38b:	89 55 0c             	mov    %edx,0xc(%ebp)
 38e:	ff 4d f8             	decl   -0x8(%ebp)
 391:	8b 55 f8             	mov    -0x8(%ebp),%edx
 394:	8a 12                	mov    (%edx),%dl
 396:	88 10                	mov    %dl,(%eax)
  {
    *sp++ = '-';
    len++;
  }

  while (tp > tmp)
 398:	8d 45 d8             	lea    -0x28(%ebp),%eax
 39b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 39e:	77 e5                	ja     385 <itoa+0xc0>
    *sp++ = *--tp;

  return len;
 3a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3a3:	83 c4 30             	add    $0x30,%esp
 3a6:	5b                   	pop    %ebx
 3a7:	5d                   	pop    %ebp
 3a8:	c3                   	ret    
 3a9:	90                   	nop
 3aa:	90                   	nop
 3ab:	90                   	nop

000003ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ac:	b8 01 00 00 00       	mov    $0x1,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exit>:
SYSCALL(exit)
 3b4:	b8 02 00 00 00       	mov    $0x2,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <wait>:
SYSCALL(wait)
 3bc:	b8 03 00 00 00       	mov    $0x3,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <pipe>:
SYSCALL(pipe)
 3c4:	b8 04 00 00 00       	mov    $0x4,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <read>:
SYSCALL(read)
 3cc:	b8 05 00 00 00       	mov    $0x5,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <write>:
SYSCALL(write)
 3d4:	b8 10 00 00 00       	mov    $0x10,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <close>:
SYSCALL(close)
 3dc:	b8 15 00 00 00       	mov    $0x15,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <kill>:
SYSCALL(kill)
 3e4:	b8 06 00 00 00       	mov    $0x6,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <exec>:
SYSCALL(exec)
 3ec:	b8 07 00 00 00       	mov    $0x7,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <open>:
SYSCALL(open)
 3f4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <mknod>:
SYSCALL(mknod)
 3fc:	b8 11 00 00 00       	mov    $0x11,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <unlink>:
SYSCALL(unlink)
 404:	b8 12 00 00 00       	mov    $0x12,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <fstat>:
SYSCALL(fstat)
 40c:	b8 08 00 00 00       	mov    $0x8,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <link>:
SYSCALL(link)
 414:	b8 13 00 00 00       	mov    $0x13,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <mkdir>:
SYSCALL(mkdir)
 41c:	b8 14 00 00 00       	mov    $0x14,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <chdir>:
SYSCALL(chdir)
 424:	b8 09 00 00 00       	mov    $0x9,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <dup>:
SYSCALL(dup)
 42c:	b8 0a 00 00 00       	mov    $0xa,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <getpid>:
SYSCALL(getpid)
 434:	b8 0b 00 00 00       	mov    $0xb,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <sbrk>:
SYSCALL(sbrk)
 43c:	b8 0c 00 00 00       	mov    $0xc,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <sleep>:
SYSCALL(sleep)
 444:	b8 0d 00 00 00       	mov    $0xd,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <uptime>:
SYSCALL(uptime)
 44c:	b8 0e 00 00 00       	mov    $0xe,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <getticks>:
SYSCALL(getticks)
 454:	b8 16 00 00 00       	mov    $0x16,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <get_name>:
SYSCALL(get_name)
 45c:	b8 17 00 00 00       	mov    $0x17,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <get_max_proc>:
SYSCALL(get_max_proc)
 464:	b8 18 00 00 00       	mov    $0x18,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <get_max_mem>:
SYSCALL(get_max_mem)
 46c:	b8 19 00 00 00       	mov    $0x19,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <get_max_disk>:
SYSCALL(get_max_disk)
 474:	b8 1a 00 00 00       	mov    $0x1a,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <get_curr_proc>:
SYSCALL(get_curr_proc)
 47c:	b8 1b 00 00 00       	mov    $0x1b,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <get_curr_mem>:
SYSCALL(get_curr_mem)
 484:	b8 1c 00 00 00       	mov    $0x1c,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <get_curr_disk>:
SYSCALL(get_curr_disk)
 48c:	b8 1d 00 00 00       	mov    $0x1d,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <set_name>:
SYSCALL(set_name)
 494:	b8 1e 00 00 00       	mov    $0x1e,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <set_max_mem>:
SYSCALL(set_max_mem)
 49c:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <set_max_disk>:
SYSCALL(set_max_disk)
 4a4:	b8 20 00 00 00       	mov    $0x20,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <set_max_proc>:
SYSCALL(set_max_proc)
 4ac:	b8 21 00 00 00       	mov    $0x21,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <set_curr_mem>:
SYSCALL(set_curr_mem)
 4b4:	b8 22 00 00 00       	mov    $0x22,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <set_curr_disk>:
SYSCALL(set_curr_disk)
 4bc:	b8 23 00 00 00       	mov    $0x23,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <set_curr_proc>:
SYSCALL(set_curr_proc)
 4c4:	b8 24 00 00 00       	mov    $0x24,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <find>:
SYSCALL(find)
 4cc:	b8 25 00 00 00       	mov    $0x25,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <is_full>:
SYSCALL(is_full)
 4d4:	b8 26 00 00 00       	mov    $0x26,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <container_init>:
SYSCALL(container_init)
 4dc:	b8 27 00 00 00       	mov    $0x27,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <cont_proc_set>:
SYSCALL(cont_proc_set)
 4e4:	b8 28 00 00 00       	mov    $0x28,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <ps>:
SYSCALL(ps)
 4ec:	b8 29 00 00 00       	mov    $0x29,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <reduce_curr_mem>:
SYSCALL(reduce_curr_mem)
 4f4:	b8 2a 00 00 00       	mov    $0x2a,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <set_root_inode>:
SYSCALL(set_root_inode)
 4fc:	b8 2b 00 00 00       	mov    $0x2b,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <cstop>:
SYSCALL(cstop)
 504:	b8 2c 00 00 00       	mov    $0x2c,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <df>:
SYSCALL(df)
 50c:	b8 2d 00 00 00       	mov    $0x2d,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <max_containers>:
SYSCALL(max_containers)
 514:	b8 2e 00 00 00       	mov    $0x2e,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <container_reset>:
SYSCALL(container_reset)
 51c:	b8 2f 00 00 00       	mov    $0x2f,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <pause>:
SYSCALL(pause)
 524:	b8 30 00 00 00       	mov    $0x30,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <resume>:
SYSCALL(resume)
 52c:	b8 31 00 00 00       	mov    $0x31,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <tmem>:
SYSCALL(tmem)
 534:	b8 32 00 00 00       	mov    $0x32,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <amem>:
SYSCALL(amem)
 53c:	b8 33 00 00 00       	mov    $0x33,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <c_ps>:
SYSCALL(c_ps)
 544:	b8 34 00 00 00       	mov    $0x34,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <get_used>:
SYSCALL(get_used)
 54c:	b8 35 00 00 00       	mov    $0x35,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <get_os>:
SYSCALL(get_os)
 554:	b8 36 00 00 00       	mov    $0x36,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <set_os>:
SYSCALL(set_os)
 55c:	b8 37 00 00 00       	mov    $0x37,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <get_cticks>:
SYSCALL(get_cticks)
 564:	b8 38 00 00 00       	mov    $0x38,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <tick_reset2>:
SYSCALL(tick_reset2)
 56c:	b8 39 00 00 00       	mov    $0x39,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	83 ec 18             	sub    $0x18,%esp
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 580:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 587:	00 
 588:	8d 45 f4             	lea    -0xc(%ebp),%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 3a fe ff ff       	call   3d4 <write>
}
 59a:	c9                   	leave  
 59b:	c3                   	ret    

0000059c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	56                   	push   %esi
 5a0:	53                   	push   %ebx
 5a1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5ab:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5af:	74 17                	je     5c8 <printint+0x2c>
 5b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5b5:	79 11                	jns    5c8 <printint+0x2c>
    neg = 1;
 5b7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5be:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c1:	f7 d8                	neg    %eax
 5c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c6:	eb 06                	jmp    5ce <printint+0x32>
  } else {
    x = xx;
 5c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5d5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5d8:	8d 41 01             	lea    0x1(%ecx),%eax
 5db:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5de:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e4:	ba 00 00 00 00       	mov    $0x0,%edx
 5e9:	f7 f3                	div    %ebx
 5eb:	89 d0                	mov    %edx,%eax
 5ed:	8a 80 b0 0c 00 00    	mov    0xcb0(%eax),%al
 5f3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5f7:	8b 75 10             	mov    0x10(%ebp),%esi
 5fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5fd:	ba 00 00 00 00       	mov    $0x0,%edx
 602:	f7 f6                	div    %esi
 604:	89 45 ec             	mov    %eax,-0x14(%ebp)
 607:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60b:	75 c8                	jne    5d5 <printint+0x39>
  if(neg)
 60d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 611:	74 10                	je     623 <printint+0x87>
    buf[i++] = '-';
 613:	8b 45 f4             	mov    -0xc(%ebp),%eax
 616:	8d 50 01             	lea    0x1(%eax),%edx
 619:	89 55 f4             	mov    %edx,-0xc(%ebp)
 61c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 621:	eb 1e                	jmp    641 <printint+0xa5>
 623:	eb 1c                	jmp    641 <printint+0xa5>
    putc(fd, buf[i]);
 625:	8d 55 dc             	lea    -0x24(%ebp),%edx
 628:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62b:	01 d0                	add    %edx,%eax
 62d:	8a 00                	mov    (%eax),%al
 62f:	0f be c0             	movsbl %al,%eax
 632:	89 44 24 04          	mov    %eax,0x4(%esp)
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	89 04 24             	mov    %eax,(%esp)
 63c:	e8 33 ff ff ff       	call   574 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 641:	ff 4d f4             	decl   -0xc(%ebp)
 644:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 648:	79 db                	jns    625 <printint+0x89>
    putc(fd, buf[i]);
}
 64a:	83 c4 30             	add    $0x30,%esp
 64d:	5b                   	pop    %ebx
 64e:	5e                   	pop    %esi
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret    

00000651 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 651:	55                   	push   %ebp
 652:	89 e5                	mov    %esp,%ebp
 654:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 657:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 65e:	8d 45 0c             	lea    0xc(%ebp),%eax
 661:	83 c0 04             	add    $0x4,%eax
 664:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 667:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 66e:	e9 77 01 00 00       	jmp    7ea <printf+0x199>
    c = fmt[i] & 0xff;
 673:	8b 55 0c             	mov    0xc(%ebp),%edx
 676:	8b 45 f0             	mov    -0x10(%ebp),%eax
 679:	01 d0                	add    %edx,%eax
 67b:	8a 00                	mov    (%eax),%al
 67d:	0f be c0             	movsbl %al,%eax
 680:	25 ff 00 00 00       	and    $0xff,%eax
 685:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 688:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 68c:	75 2c                	jne    6ba <printf+0x69>
      if(c == '%'){
 68e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 692:	75 0c                	jne    6a0 <printf+0x4f>
        state = '%';
 694:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 69b:	e9 47 01 00 00       	jmp    7e7 <printf+0x196>
      } else {
        putc(fd, c);
 6a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a3:	0f be c0             	movsbl %al,%eax
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 bf fe ff ff       	call   574 <putc>
 6b5:	e9 2d 01 00 00       	jmp    7e7 <printf+0x196>
      }
    } else if(state == '%'){
 6ba:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6be:	0f 85 23 01 00 00    	jne    7e7 <printf+0x196>
      if(c == 'd'){
 6c4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6c8:	75 2d                	jne    6f7 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 6ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6cd:	8b 00                	mov    (%eax),%eax
 6cf:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6d6:	00 
 6d7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6de:	00 
 6df:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	89 04 24             	mov    %eax,(%esp)
 6e9:	e8 ae fe ff ff       	call   59c <printint>
        ap++;
 6ee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f2:	e9 e9 00 00 00       	jmp    7e0 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 6f7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6fb:	74 06                	je     703 <printf+0xb2>
 6fd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 701:	75 2d                	jne    730 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 703:	8b 45 e8             	mov    -0x18(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 70f:	00 
 710:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 717:	00 
 718:	89 44 24 04          	mov    %eax,0x4(%esp)
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 75 fe ff ff       	call   59c <printint>
        ap++;
 727:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 72b:	e9 b0 00 00 00       	jmp    7e0 <printf+0x18f>
      } else if(c == 's'){
 730:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 734:	75 42                	jne    778 <printf+0x127>
        s = (char*)*ap;
 736:	8b 45 e8             	mov    -0x18(%ebp),%eax
 739:	8b 00                	mov    (%eax),%eax
 73b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 73e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 742:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 746:	75 09                	jne    751 <printf+0x100>
          s = "(null)";
 748:	c7 45 f4 3e 0a 00 00 	movl   $0xa3e,-0xc(%ebp)
        while(*s != 0){
 74f:	eb 1c                	jmp    76d <printf+0x11c>
 751:	eb 1a                	jmp    76d <printf+0x11c>
          putc(fd, *s);
 753:	8b 45 f4             	mov    -0xc(%ebp),%eax
 756:	8a 00                	mov    (%eax),%al
 758:	0f be c0             	movsbl %al,%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 0a fe ff ff       	call   574 <putc>
          s++;
 76a:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 76d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 770:	8a 00                	mov    (%eax),%al
 772:	84 c0                	test   %al,%al
 774:	75 dd                	jne    753 <printf+0x102>
 776:	eb 68                	jmp    7e0 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 778:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 77c:	75 1d                	jne    79b <printf+0x14a>
        putc(fd, *ap);
 77e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 781:	8b 00                	mov    (%eax),%eax
 783:	0f be c0             	movsbl %al,%eax
 786:	89 44 24 04          	mov    %eax,0x4(%esp)
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	89 04 24             	mov    %eax,(%esp)
 790:	e8 df fd ff ff       	call   574 <putc>
        ap++;
 795:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 799:	eb 45                	jmp    7e0 <printf+0x18f>
      } else if(c == '%'){
 79b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 79f:	75 17                	jne    7b8 <printf+0x167>
        putc(fd, c);
 7a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a4:	0f be c0             	movsbl %al,%eax
 7a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	89 04 24             	mov    %eax,(%esp)
 7b1:	e8 be fd ff ff       	call   574 <putc>
 7b6:	eb 28                	jmp    7e0 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7b8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7bf:	00 
 7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 7c3:	89 04 24             	mov    %eax,(%esp)
 7c6:	e8 a9 fd ff ff       	call   574 <putc>
        putc(fd, c);
 7cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ce:	0f be c0             	movsbl %al,%eax
 7d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	89 04 24             	mov    %eax,(%esp)
 7db:	e8 94 fd ff ff       	call   574 <putc>
      }
      state = 0;
 7e0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7e7:	ff 45 f0             	incl   -0x10(%ebp)
 7ea:	8b 55 0c             	mov    0xc(%ebp),%edx
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	01 d0                	add    %edx,%eax
 7f2:	8a 00                	mov    (%eax),%al
 7f4:	84 c0                	test   %al,%al
 7f6:	0f 85 77 fe ff ff    	jne    673 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7fc:	c9                   	leave  
 7fd:	c3                   	ret    
 7fe:	90                   	nop
 7ff:	90                   	nop

00000800 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	83 e8 08             	sub    $0x8,%eax
 80c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80f:	a1 cc 0c 00 00       	mov    0xccc,%eax
 814:	89 45 fc             	mov    %eax,-0x4(%ebp)
 817:	eb 24                	jmp    83d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 819:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81c:	8b 00                	mov    (%eax),%eax
 81e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 821:	77 12                	ja     835 <free+0x35>
 823:	8b 45 f8             	mov    -0x8(%ebp),%eax
 826:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 829:	77 24                	ja     84f <free+0x4f>
 82b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82e:	8b 00                	mov    (%eax),%eax
 830:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 833:	77 1a                	ja     84f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 83d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 840:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 843:	76 d4                	jbe    819 <free+0x19>
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
 848:	8b 00                	mov    (%eax),%eax
 84a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 84d:	76 ca                	jbe    819 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 84f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 852:	8b 40 04             	mov    0x4(%eax),%eax
 855:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 85c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85f:	01 c2                	add    %eax,%edx
 861:	8b 45 fc             	mov    -0x4(%ebp),%eax
 864:	8b 00                	mov    (%eax),%eax
 866:	39 c2                	cmp    %eax,%edx
 868:	75 24                	jne    88e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 86a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86d:	8b 50 04             	mov    0x4(%eax),%edx
 870:	8b 45 fc             	mov    -0x4(%ebp),%eax
 873:	8b 00                	mov    (%eax),%eax
 875:	8b 40 04             	mov    0x4(%eax),%eax
 878:	01 c2                	add    %eax,%edx
 87a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 87d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 880:	8b 45 fc             	mov    -0x4(%ebp),%eax
 883:	8b 00                	mov    (%eax),%eax
 885:	8b 10                	mov    (%eax),%edx
 887:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88a:	89 10                	mov    %edx,(%eax)
 88c:	eb 0a                	jmp    898 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 88e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 891:	8b 10                	mov    (%eax),%edx
 893:	8b 45 f8             	mov    -0x8(%ebp),%eax
 896:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 898:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89b:	8b 40 04             	mov    0x4(%eax),%eax
 89e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	01 d0                	add    %edx,%eax
 8aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ad:	75 20                	jne    8cf <free+0xcf>
    p->s.size += bp->s.size;
 8af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b2:	8b 50 04             	mov    0x4(%eax),%edx
 8b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b8:	8b 40 04             	mov    0x4(%eax),%eax
 8bb:	01 c2                	add    %eax,%edx
 8bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c6:	8b 10                	mov    (%eax),%edx
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	89 10                	mov    %edx,(%eax)
 8cd:	eb 08                	jmp    8d7 <free+0xd7>
  } else
    p->s.ptr = bp;
 8cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8d5:	89 10                	mov    %edx,(%eax)
  freep = p;
 8d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8da:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 8df:	c9                   	leave  
 8e0:	c3                   	ret    

000008e1 <morecore>:

static Header*
morecore(uint nu)
{
 8e1:	55                   	push   %ebp
 8e2:	89 e5                	mov    %esp,%ebp
 8e4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8e7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8ee:	77 07                	ja     8f7 <morecore+0x16>
    nu = 4096;
 8f0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8f7:	8b 45 08             	mov    0x8(%ebp),%eax
 8fa:	c1 e0 03             	shl    $0x3,%eax
 8fd:	89 04 24             	mov    %eax,(%esp)
 900:	e8 37 fb ff ff       	call   43c <sbrk>
 905:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 908:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 90c:	75 07                	jne    915 <morecore+0x34>
    return 0;
 90e:	b8 00 00 00 00       	mov    $0x0,%eax
 913:	eb 22                	jmp    937 <morecore+0x56>
  hp = (Header*)p;
 915:	8b 45 f4             	mov    -0xc(%ebp),%eax
 918:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 91b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91e:	8b 55 08             	mov    0x8(%ebp),%edx
 921:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 924:	8b 45 f0             	mov    -0x10(%ebp),%eax
 927:	83 c0 08             	add    $0x8,%eax
 92a:	89 04 24             	mov    %eax,(%esp)
 92d:	e8 ce fe ff ff       	call   800 <free>
  return freep;
 932:	a1 cc 0c 00 00       	mov    0xccc,%eax
}
 937:	c9                   	leave  
 938:	c3                   	ret    

00000939 <malloc>:

void*
malloc(uint nbytes)
{
 939:	55                   	push   %ebp
 93a:	89 e5                	mov    %esp,%ebp
 93c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93f:	8b 45 08             	mov    0x8(%ebp),%eax
 942:	83 c0 07             	add    $0x7,%eax
 945:	c1 e8 03             	shr    $0x3,%eax
 948:	40                   	inc    %eax
 949:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 94c:	a1 cc 0c 00 00       	mov    0xccc,%eax
 951:	89 45 f0             	mov    %eax,-0x10(%ebp)
 954:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 958:	75 23                	jne    97d <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 95a:	c7 45 f0 c4 0c 00 00 	movl   $0xcc4,-0x10(%ebp)
 961:	8b 45 f0             	mov    -0x10(%ebp),%eax
 964:	a3 cc 0c 00 00       	mov    %eax,0xccc
 969:	a1 cc 0c 00 00       	mov    0xccc,%eax
 96e:	a3 c4 0c 00 00       	mov    %eax,0xcc4
    base.s.size = 0;
 973:	c7 05 c8 0c 00 00 00 	movl   $0x0,0xcc8
 97a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 980:	8b 00                	mov    (%eax),%eax
 982:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	8b 40 04             	mov    0x4(%eax),%eax
 98b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 98e:	72 4d                	jb     9dd <malloc+0xa4>
      if(p->s.size == nunits)
 990:	8b 45 f4             	mov    -0xc(%ebp),%eax
 993:	8b 40 04             	mov    0x4(%eax),%eax
 996:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 999:	75 0c                	jne    9a7 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	8b 10                	mov    (%eax),%edx
 9a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a3:	89 10                	mov    %edx,(%eax)
 9a5:	eb 26                	jmp    9cd <malloc+0x94>
      else {
        p->s.size -= nunits;
 9a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9aa:	8b 40 04             	mov    0x4(%eax),%eax
 9ad:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9b0:	89 c2                	mov    %eax,%edx
 9b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bb:	8b 40 04             	mov    0x4(%eax),%eax
 9be:	c1 e0 03             	shl    $0x3,%eax
 9c1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9ca:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d0:	a3 cc 0c 00 00       	mov    %eax,0xccc
      return (void*)(p + 1);
 9d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d8:	83 c0 08             	add    $0x8,%eax
 9db:	eb 38                	jmp    a15 <malloc+0xdc>
    }
    if(p == freep)
 9dd:	a1 cc 0c 00 00       	mov    0xccc,%eax
 9e2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9e5:	75 1b                	jne    a02 <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 9e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ea:	89 04 24             	mov    %eax,(%esp)
 9ed:	e8 ef fe ff ff       	call   8e1 <morecore>
 9f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9f9:	75 07                	jne    a02 <malloc+0xc9>
        return 0;
 9fb:	b8 00 00 00 00       	mov    $0x0,%eax
 a00:	eb 13                	jmp    a15 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0b:	8b 00                	mov    (%eax),%eax
 a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a10:	e9 70 ff ff ff       	jmp    985 <malloc+0x4c>
}
 a15:	c9                   	leave  
 a16:	c3                   	ret    
