
_ctool:     file format elf32-i386


Disassembly of section .text:

00000000 <strcat>:
#include "fcntl.h"
#include "container.h"
#include "fs.h"

char* strcat(char* s1, const char* s2)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
  char* b = s1;
       6:	8b 45 08             	mov    0x8(%ebp),%eax
       9:	89 45 fc             	mov    %eax,-0x4(%ebp)

  while (*s1) ++s1;
       c:	eb 03                	jmp    11 <strcat+0x11>
       e:	ff 45 08             	incl   0x8(%ebp)
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8a 00                	mov    (%eax),%al
      16:	84 c0                	test   %al,%al
      18:	75 f4                	jne    e <strcat+0xe>
  while (*s2) *s1++ = *s2++;
      1a:	eb 16                	jmp    32 <strcat+0x32>
      1c:	8b 45 08             	mov    0x8(%ebp),%eax
      1f:	8d 50 01             	lea    0x1(%eax),%edx
      22:	89 55 08             	mov    %edx,0x8(%ebp)
      25:	8b 55 0c             	mov    0xc(%ebp),%edx
      28:	8d 4a 01             	lea    0x1(%edx),%ecx
      2b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
      2e:	8a 12                	mov    (%edx),%dl
      30:	88 10                	mov    %dl,(%eax)
      32:	8b 45 0c             	mov    0xc(%ebp),%eax
      35:	8a 00                	mov    (%eax),%al
      37:	84 c0                	test   %al,%al
      39:	75 e1                	jne    1c <strcat+0x1c>
  *s1 = 0;
      3b:	8b 45 08             	mov    0x8(%ebp),%eax
      3e:	c6 00 00             	movb   $0x0,(%eax)

  return b;
      41:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
      44:	c9                   	leave  
      45:	c3                   	ret    

00000046 <copy_files>:

void copy_files(char* loc, char* src){
      46:	55                   	push   %ebp
      47:	89 e5                	mov    %esp,%ebp
      49:	81 ec 28 02 00 00    	sub    $0x228,%esp
	int fd_write = open(loc, O_CREATE | O_RDWR);
      4f:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
      56:	00 
      57:	8b 45 08             	mov    0x8(%ebp),%eax
      5a:	89 04 24             	mov    %eax,(%esp)
      5d:	e8 42 0c 00 00       	call   ca4 <open>
      62:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(fd_write < 0){
      65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      69:	79 19                	jns    84 <copy_files+0x3e>
		printf(1, "Invalid file location.\n");
      6b:	c7 44 24 04 78 12 00 	movl   $0x1278,0x4(%esp)
      72:	00 
      73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      7a:	e8 32 0e 00 00       	call   eb1 <printf>
		return;
      7f:	e9 8c 00 00 00       	jmp    110 <copy_files+0xca>
	}

	int fd_read = open(src, O_RDONLY);
      84:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      8b:	00 
      8c:	8b 45 0c             	mov    0xc(%ebp),%eax
      8f:	89 04 24             	mov    %eax,(%esp)
      92:	e8 0d 0c 00 00       	call   ca4 <open>
      97:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if(fd_read < 0){
      9a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      9e:	79 16                	jns    b6 <copy_files+0x70>
		printf(1, "Invalid file location.\n");
      a0:	c7 44 24 04 78 12 00 	movl   $0x1278,0x4(%esp)
      a7:	00 
      a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      af:	e8 fd 0d 00 00       	call   eb1 <printf>
		return;
      b4:	eb 5a                	jmp    110 <copy_files+0xca>
	}

	int bytes_read;
	char buf[512];

	while((bytes_read = read(fd_read, buf, sizeof(buf))) > 0){
      b6:	eb 1c                	jmp    d4 <copy_files+0x8e>
		write(fd_write, buf, bytes_read);
      b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
      bb:	89 44 24 08          	mov    %eax,0x8(%esp)
      bf:	8d 85 ec fd ff ff    	lea    -0x214(%ebp),%eax
      c5:	89 44 24 04          	mov    %eax,0x4(%esp)
      c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
      cc:	89 04 24             	mov    %eax,(%esp)
      cf:	e8 b0 0b 00 00       	call   c84 <write>
	}

	int bytes_read;
	char buf[512];

	while((bytes_read = read(fd_read, buf, sizeof(buf))) > 0){
      d4:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
      db:	00 
      dc:	8d 85 ec fd ff ff    	lea    -0x214(%ebp),%eax
      e2:	89 44 24 04          	mov    %eax,0x4(%esp)
      e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
      e9:	89 04 24             	mov    %eax,(%esp)
      ec:	e8 8b 0b 00 00       	call   c7c <read>
      f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
      f8:	7f be                	jg     b8 <copy_files+0x72>
		write(fd_write, buf, bytes_read);
	}
	close(fd_write);
      fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
      fd:	89 04 24             	mov    %eax,(%esp)
     100:	e8 87 0b 00 00       	call   c8c <close>
	close(fd_read);
     105:	8b 45 f0             	mov    -0x10(%ebp),%eax
     108:	89 04 24             	mov    %eax,(%esp)
     10b:	e8 7c 0b 00 00       	call   c8c <close>
}
     110:	c9                   	leave  
     111:	c3                   	ret    

00000112 <init>:

void init(){
     112:	55                   	push   %ebp
     113:	89 e5                	mov    %esp,%ebp
     115:	83 ec 08             	sub    $0x8,%esp
	container_init();
     118:	e8 6f 0c 00 00       	call   d8c <container_init>
}
     11d:	c9                   	leave  
     11e:	c3                   	ret    

0000011f <name>:

void name(){
     11f:	55                   	push   %ebp
     120:	89 e5                	mov    %esp,%ebp
     122:	81 ec 98 00 00 00    	sub    $0x98,%esp
	char x[16], y[16], z[16], a[16];
	get_name(0, x);
     128:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     12b:	89 44 24 04          	mov    %eax,0x4(%esp)
     12f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     136:	e8 d1 0b 00 00       	call   d0c <get_name>
	get_name(1, y);
     13b:	8d 45 c4             	lea    -0x3c(%ebp),%eax
     13e:	89 44 24 04          	mov    %eax,0x4(%esp)
     142:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     149:	e8 be 0b 00 00       	call   d0c <get_name>
	get_name(2, z);
     14e:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     151:	89 44 24 04          	mov    %eax,0x4(%esp)
     155:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     15c:	e8 ab 0b 00 00       	call   d0c <get_name>
	get_name(3, a);
     161:	8d 45 a4             	lea    -0x5c(%ebp),%eax
     164:	89 44 24 04          	mov    %eax,0x4(%esp)
     168:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
     16f:	e8 98 0b 00 00       	call   d0c <get_name>
	int b = get_curr_mem(0);
     174:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     17b:	e8 b4 0b 00 00       	call   d34 <get_curr_mem>
     180:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int c = get_curr_mem(1);
     183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     18a:	e8 a5 0b 00 00       	call   d34 <get_curr_mem>
     18f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int d = get_curr_mem(2);
     192:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     199:	e8 96 0b 00 00       	call   d34 <get_curr_mem>
     19e:	89 45 ec             	mov    %eax,-0x14(%ebp)
	int e = get_curr_mem(3);
     1a1:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
     1a8:	e8 87 0b 00 00       	call   d34 <get_curr_mem>
     1ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int s = get_curr_disk(0);
     1b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1b7:	e8 80 0b 00 00       	call   d3c <get_curr_disk>
     1bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	printf(1, "0: %s - %d SIZE: %d, 1: %s - %d, 2: %s - %d, 3: %s - %d\n", x, b, s, y, c, z, d, a, e);
     1bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1c2:	89 44 24 28          	mov    %eax,0x28(%esp)
     1c6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
     1c9:	89 44 24 24          	mov    %eax,0x24(%esp)
     1cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1d0:	89 44 24 20          	mov    %eax,0x20(%esp)
     1d4:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     1d7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     1db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1de:	89 44 24 18          	mov    %eax,0x18(%esp)
     1e2:	8d 45 c4             	lea    -0x3c(%ebp),%eax
     1e5:	89 44 24 14          	mov    %eax,0x14(%esp)
     1e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1ec:	89 44 24 10          	mov    %eax,0x10(%esp)
     1f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     1f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
     1f7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     1fa:	89 44 24 08          	mov    %eax,0x8(%esp)
     1fe:	c7 44 24 04 90 12 00 	movl   $0x1290,0x4(%esp)
     205:	00 
     206:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     20d:	e8 9f 0c 00 00       	call   eb1 <printf>
}
     212:	c9                   	leave  
     213:	c3                   	ret    

00000214 <fmtname>:

char*
fmtname(char *path)
{
     214:	55                   	push   %ebp
     215:	89 e5                	mov    %esp,%ebp
     217:	53                   	push   %ebx
     218:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
     21b:	8b 45 08             	mov    0x8(%ebp),%eax
     21e:	89 04 24             	mov    %eax,(%esp)
     221:	e8 75 08 00 00       	call   a9b <strlen>
     226:	8b 55 08             	mov    0x8(%ebp),%edx
     229:	01 d0                	add    %edx,%eax
     22b:	89 45 f4             	mov    %eax,-0xc(%ebp)
     22e:	eb 03                	jmp    233 <fmtname+0x1f>
     230:	ff 4d f4             	decl   -0xc(%ebp)
     233:	8b 45 f4             	mov    -0xc(%ebp),%eax
     236:	3b 45 08             	cmp    0x8(%ebp),%eax
     239:	72 09                	jb     244 <fmtname+0x30>
     23b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     23e:	8a 00                	mov    (%eax),%al
     240:	3c 2f                	cmp    $0x2f,%al
     242:	75 ec                	jne    230 <fmtname+0x1c>
    ;
  p++;
     244:	ff 45 f4             	incl   -0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
     247:	8b 45 f4             	mov    -0xc(%ebp),%eax
     24a:	89 04 24             	mov    %eax,(%esp)
     24d:	e8 49 08 00 00       	call   a9b <strlen>
     252:	83 f8 0d             	cmp    $0xd,%eax
     255:	76 05                	jbe    25c <fmtname+0x48>
    return p;
     257:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25a:	eb 5f                	jmp    2bb <fmtname+0xa7>
  memmove(buf, p, strlen(p));
     25c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25f:	89 04 24             	mov    %eax,(%esp)
     262:	e8 34 08 00 00       	call   a9b <strlen>
     267:	89 44 24 08          	mov    %eax,0x8(%esp)
     26b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     26e:	89 44 24 04          	mov    %eax,0x4(%esp)
     272:	c7 04 24 4c 18 00 00 	movl   $0x184c,(%esp)
     279:	e8 9f 09 00 00       	call   c1d <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
     27e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     281:	89 04 24             	mov    %eax,(%esp)
     284:	e8 12 08 00 00       	call   a9b <strlen>
     289:	ba 0e 00 00 00       	mov    $0xe,%edx
     28e:	89 d3                	mov    %edx,%ebx
     290:	29 c3                	sub    %eax,%ebx
     292:	8b 45 f4             	mov    -0xc(%ebp),%eax
     295:	89 04 24             	mov    %eax,(%esp)
     298:	e8 fe 07 00 00       	call   a9b <strlen>
     29d:	05 4c 18 00 00       	add    $0x184c,%eax
     2a2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     2a6:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
     2ad:	00 
     2ae:	89 04 24             	mov    %eax,(%esp)
     2b1:	e8 0a 08 00 00       	call   ac0 <memset>
  return buf;
     2b6:	b8 4c 18 00 00       	mov    $0x184c,%eax
}
     2bb:	83 c4 24             	add    $0x24,%esp
     2be:	5b                   	pop    %ebx
     2bf:	5d                   	pop    %ebp
     2c0:	c3                   	ret    

000002c1 <add_file_size>:

void
add_file_size(char *path, char *c_name)
{
     2c1:	55                   	push   %ebp
     2c2:	89 e5                	mov    %esp,%ebp
     2c4:	81 ec 58 02 00 00    	sub    $0x258,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  int z;
  printf(1, "PATH: %s  C_NAME: %s",path, c_name);
     2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
     2cd:	89 44 24 0c          	mov    %eax,0xc(%esp)
     2d1:	8b 45 08             	mov    0x8(%ebp),%eax
     2d4:	89 44 24 08          	mov    %eax,0x8(%esp)
     2d8:	c7 44 24 04 c9 12 00 	movl   $0x12c9,0x4(%esp)
     2df:	00 
     2e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2e7:	e8 c5 0b 00 00       	call   eb1 <printf>

  if((fd = open(path, 0)) < 0){
     2ec:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2f3:	00 
     2f4:	8b 45 08             	mov    0x8(%ebp),%eax
     2f7:	89 04 24             	mov    %eax,(%esp)
     2fa:	e8 a5 09 00 00       	call   ca4 <open>
     2ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
     302:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     306:	79 20                	jns    328 <add_file_size+0x67>
    printf(2, "ls: cannot open %s\n", path);
     308:	8b 45 08             	mov    0x8(%ebp),%eax
     30b:	89 44 24 08          	mov    %eax,0x8(%esp)
     30f:	c7 44 24 04 de 12 00 	movl   $0x12de,0x4(%esp)
     316:	00 
     317:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     31e:	e8 8e 0b 00 00       	call   eb1 <printf>
    return;
     323:	e9 8f 02 00 00       	jmp    5b7 <add_file_size+0x2f6>
  }

  if(fstat(fd, &st) < 0){
     328:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
     32e:	89 44 24 04          	mov    %eax,0x4(%esp)
     332:	8b 45 f4             	mov    -0xc(%ebp),%eax
     335:	89 04 24             	mov    %eax,(%esp)
     338:	e8 7f 09 00 00       	call   cbc <fstat>
     33d:	85 c0                	test   %eax,%eax
     33f:	79 2b                	jns    36c <add_file_size+0xab>
    printf(2, "ls: cannot stat %s\n", path);
     341:	8b 45 08             	mov    0x8(%ebp),%eax
     344:	89 44 24 08          	mov    %eax,0x8(%esp)
     348:	c7 44 24 04 f2 12 00 	movl   $0x12f2,0x4(%esp)
     34f:	00 
     350:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     357:	e8 55 0b 00 00       	call   eb1 <printf>
    close(fd);
     35c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     35f:	89 04 24             	mov    %eax,(%esp)
     362:	e8 25 09 00 00       	call   c8c <close>
    return;
     367:	e9 4b 02 00 00       	jmp    5b7 <add_file_size+0x2f6>
  }

  switch(st.type){
     36c:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
     372:	98                   	cwtl   
     373:	83 f8 01             	cmp    $0x1,%eax
     376:	0f 84 89 00 00 00    	je     405 <add_file_size+0x144>
     37c:	83 f8 02             	cmp    $0x2,%eax
     37f:	0f 85 27 02 00 00    	jne    5ac <add_file_size+0x2eb>
  case T_FILE:
  	printf(1, "HERE \n");
     385:	c7 44 24 04 06 13 00 	movl   $0x1306,0x4(%esp)
     38c:	00 
     38d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     394:	e8 18 0b 00 00       	call   eb1 <printf>
  	z = find(c_name);
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 04 24             	mov    %eax,(%esp)
     39f:	e8 d8 09 00 00       	call   d7c <find>
     3a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  	printf(1, "Z = %d\n", z);
     3a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     3aa:	89 44 24 08          	mov    %eax,0x8(%esp)
     3ae:	c7 44 24 04 0d 13 00 	movl   $0x130d,0x4(%esp)
     3b5:	00 
     3b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3bd:	e8 ef 0a 00 00       	call   eb1 <printf>
  	if(z >= 0){
     3c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3c6:	78 38                	js     400 <add_file_size+0x13f>
	  	set_curr_disk(st.size, z);
     3c8:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
     3ce:	8b 55 f0             	mov    -0x10(%ebp),%edx
     3d1:	89 54 24 04          	mov    %edx,0x4(%esp)
     3d5:	89 04 24             	mov    %eax,(%esp)
     3d8:	e8 8f 09 00 00       	call   d6c <set_curr_disk>
	  	printf(1, "adding %d \n", st.size);
     3dd:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
     3e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     3e7:	c7 44 24 04 15 13 00 	movl   $0x1315,0x4(%esp)
     3ee:	00 
     3ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3f6:	e8 b6 0a 00 00       	call   eb1 <printf>
	}
    break;
     3fb:	e9 ac 01 00 00       	jmp    5ac <add_file_size+0x2eb>
     400:	e9 a7 01 00 00       	jmp    5ac <add_file_size+0x2eb>

  case T_DIR:
  	printf(1, "HERE2 \n");
     405:	c7 44 24 04 21 13 00 	movl   $0x1321,0x4(%esp)
     40c:	00 
     40d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     414:	e8 98 0a 00 00       	call   eb1 <printf>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     419:	8b 45 08             	mov    0x8(%ebp),%eax
     41c:	89 04 24             	mov    %eax,(%esp)
     41f:	e8 77 06 00 00       	call   a9b <strlen>
     424:	83 c0 10             	add    $0x10,%eax
     427:	3d 00 02 00 00       	cmp    $0x200,%eax
     42c:	76 19                	jbe    447 <add_file_size+0x186>
      printf(1, "ls: path too long\n");
     42e:	c7 44 24 04 29 13 00 	movl   $0x1329,0x4(%esp)
     435:	00 
     436:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     43d:	e8 6f 0a 00 00       	call   eb1 <printf>
      break;
     442:	e9 65 01 00 00       	jmp    5ac <add_file_size+0x2eb>
    }
    printf(1, "HERE3 \n");
     447:	c7 44 24 04 3c 13 00 	movl   $0x133c,0x4(%esp)
     44e:	00 
     44f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     456:	e8 56 0a 00 00       	call   eb1 <printf>
    strcpy(buf, path);
     45b:	8b 45 08             	mov    0x8(%ebp),%eax
     45e:	89 44 24 04          	mov    %eax,0x4(%esp)
     462:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     468:	89 04 24             	mov    %eax,(%esp)
     46b:	e8 c5 05 00 00       	call   a35 <strcpy>
    p = buf+strlen(buf);
     470:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     476:	89 04 24             	mov    %eax,(%esp)
     479:	e8 1d 06 00 00       	call   a9b <strlen>
     47e:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
     484:	01 d0                	add    %edx,%eax
     486:	89 45 ec             	mov    %eax,-0x14(%ebp)
    *p++ = '/';
     489:	8b 45 ec             	mov    -0x14(%ebp),%eax
     48c:	8d 50 01             	lea    0x1(%eax),%edx
     48f:	89 55 ec             	mov    %edx,-0x14(%ebp)
     492:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     495:	e9 eb 00 00 00       	jmp    585 <add_file_size+0x2c4>
      if(de.inum == 0)
     49a:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
     4a0:	66 85 c0             	test   %ax,%ax
     4a3:	75 05                	jne    4aa <add_file_size+0x1e9>
        continue;
     4a5:	e9 db 00 00 00       	jmp    585 <add_file_size+0x2c4>
      memmove(p, de.name, DIRSIZ);
     4aa:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     4b1:	00 
     4b2:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     4b8:	83 c0 02             	add    $0x2,%eax
     4bb:	89 44 24 04          	mov    %eax,0x4(%esp)
     4bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4c2:	89 04 24             	mov    %eax,(%esp)
     4c5:	e8 53 07 00 00       	call   c1d <memmove>
      p[DIRSIZ] = 0;
     4ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
     4cd:	83 c0 0e             	add    $0xe,%eax
     4d0:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
     4d3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
     4d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     4dd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     4e3:	89 04 24             	mov    %eax,(%esp)
     4e6:	e8 9a 06 00 00       	call   b85 <stat>
     4eb:	85 c0                	test   %eax,%eax
     4ed:	79 20                	jns    50f <add_file_size+0x24e>
        printf(1, "ls: cannot stat %s\n", buf);
     4ef:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     4f5:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f9:	c7 44 24 04 f2 12 00 	movl   $0x12f2,0x4(%esp)
     500:	00 
     501:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     508:	e8 a4 09 00 00       	call   eb1 <printf>
        continue;
     50d:	eb 76                	jmp    585 <add_file_size+0x2c4>
      }
      printf(1, "HERE4 \n");
     50f:	c7 44 24 04 44 13 00 	movl   $0x1344,0x4(%esp)
     516:	00 
     517:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     51e:	e8 8e 09 00 00       	call   eb1 <printf>
      int z = find(c_name);
     523:	8b 45 0c             	mov    0xc(%ebp),%eax
     526:	89 04 24             	mov    %eax,(%esp)
     529:	e8 4e 08 00 00       	call   d7c <find>
     52e:	89 45 e8             	mov    %eax,-0x18(%ebp)
      printf(1, "Z = %d\n", z);
     531:	8b 45 e8             	mov    -0x18(%ebp),%eax
     534:	89 44 24 08          	mov    %eax,0x8(%esp)
     538:	c7 44 24 04 0d 13 00 	movl   $0x130d,0x4(%esp)
     53f:	00 
     540:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     547:	e8 65 09 00 00       	call   eb1 <printf>
  	  if(z >= 0){
     54c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     550:	78 33                	js     585 <add_file_size+0x2c4>
	  	set_curr_disk(st.size, z);
     552:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
     558:	8b 55 e8             	mov    -0x18(%ebp),%edx
     55b:	89 54 24 04          	mov    %edx,0x4(%esp)
     55f:	89 04 24             	mov    %eax,(%esp)
     562:	e8 05 08 00 00       	call   d6c <set_curr_disk>
	  	printf(1, "adding %d \n", st.size);
     567:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
     56d:	89 44 24 08          	mov    %eax,0x8(%esp)
     571:	c7 44 24 04 15 13 00 	movl   $0x1315,0x4(%esp)
     578:	00 
     579:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     580:	e8 2c 09 00 00       	call   eb1 <printf>
    }
    printf(1, "HERE3 \n");
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     585:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     58c:	00 
     58d:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     593:	89 44 24 04          	mov    %eax,0x4(%esp)
     597:	8b 45 f4             	mov    -0xc(%ebp),%eax
     59a:	89 04 24             	mov    %eax,(%esp)
     59d:	e8 da 06 00 00       	call   c7c <read>
     5a2:	83 f8 10             	cmp    $0x10,%eax
     5a5:	0f 84 ef fe ff ff    	je     49a <add_file_size+0x1d9>
  	  if(z >= 0){
	  	set_curr_disk(st.size, z);
	  	printf(1, "adding %d \n", st.size);
	  }
    }
    break;
     5ab:	90                   	nop
  }
  close(fd);
     5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5af:	89 04 24             	mov    %eax,(%esp)
     5b2:	e8 d5 06 00 00       	call   c8c <close>
}
     5b7:	c9                   	leave  
     5b8:	c3                   	ret    

000005b9 <create>:

void create(char *c_args[]){
     5b9:	55                   	push   %ebp
     5ba:	89 e5                	mov    %esp,%ebp
     5bc:	53                   	push   %ebx
     5bd:	83 ec 34             	sub    $0x34,%esp
	mkdir(c_args[0]);
     5c0:	8b 45 08             	mov    0x8(%ebp),%eax
     5c3:	8b 00                	mov    (%eax),%eax
     5c5:	89 04 24             	mov    %eax,(%esp)
     5c8:	e8 ff 06 00 00       	call   ccc <mkdir>
	
	int x = 0;
     5cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	while(c_args[x] != 0){
     5d4:	eb 03                	jmp    5d9 <create+0x20>
			x++;
     5d6:	ff 45 f4             	incl   -0xc(%ebp)

void create(char *c_args[]){
	mkdir(c_args[0]);
	
	int x = 0;
	while(c_args[x] != 0){
     5d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5dc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     5e3:	8b 45 08             	mov    0x8(%ebp),%eax
     5e6:	01 d0                	add    %edx,%eax
     5e8:	8b 00                	mov    (%eax),%eax
     5ea:	85 c0                	test   %eax,%eax
     5ec:	75 e8                	jne    5d6 <create+0x1d>
	int i;
	// int vc_num = is_full();
	// set_name(c_args[0], vc_num);
	// // printf(1, "vc_num is %d.\n", vc_num);
	// cont_proc_set(vc_num);
	for(i = 1; i < x; i++){
     5ee:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
     5f5:	e9 ed 00 00 00       	jmp    6e7 <create+0x12e>
     5fa:	89 e0                	mov    %esp,%eax
     5fc:	89 c3                	mov    %eax,%ebx
		printf(1, "%s.\n", c_args[i]);
     5fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     601:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     608:	8b 45 08             	mov    0x8(%ebp),%eax
     60b:	01 d0                	add    %edx,%eax
     60d:	8b 00                	mov    (%eax),%eax
     60f:	89 44 24 08          	mov    %eax,0x8(%esp)
     613:	c7 44 24 04 4c 13 00 	movl   $0x134c,0x4(%esp)
     61a:	00 
     61b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     622:	e8 8a 08 00 00       	call   eb1 <printf>
		char dir[strlen(c_args[0])];
     627:	8b 45 08             	mov    0x8(%ebp),%eax
     62a:	8b 00                	mov    (%eax),%eax
     62c:	89 04 24             	mov    %eax,(%esp)
     62f:	e8 67 04 00 00       	call   a9b <strlen>
     634:	89 c2                	mov    %eax,%edx
     636:	4a                   	dec    %edx
     637:	89 55 ec             	mov    %edx,-0x14(%ebp)
     63a:	ba 10 00 00 00       	mov    $0x10,%edx
     63f:	4a                   	dec    %edx
     640:	01 d0                	add    %edx,%eax
     642:	b9 10 00 00 00       	mov    $0x10,%ecx
     647:	ba 00 00 00 00       	mov    $0x0,%edx
     64c:	f7 f1                	div    %ecx
     64e:	6b c0 10             	imul   $0x10,%eax,%eax
     651:	29 c4                	sub    %eax,%esp
     653:	8d 44 24 0c          	lea    0xc(%esp),%eax
     657:	83 c0 00             	add    $0x0,%eax
     65a:	89 45 e8             	mov    %eax,-0x18(%ebp)
		strcpy(dir, c_args[0]);
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
     660:	8b 10                	mov    (%eax),%edx
     662:	8b 45 e8             	mov    -0x18(%ebp),%eax
     665:	89 54 24 04          	mov    %edx,0x4(%esp)
     669:	89 04 24             	mov    %eax,(%esp)
     66c:	e8 c4 03 00 00       	call   a35 <strcpy>
		strcat(dir, "/");
     671:	8b 45 e8             	mov    -0x18(%ebp),%eax
     674:	c7 44 24 04 51 13 00 	movl   $0x1351,0x4(%esp)
     67b:	00 
     67c:	89 04 24             	mov    %eax,(%esp)
     67f:	e8 7c f9 ff ff       	call   0 <strcat>
		char* location = strcat(dir, c_args[i]);
     684:	8b 45 f0             	mov    -0x10(%ebp),%eax
     687:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     68e:	8b 45 08             	mov    0x8(%ebp),%eax
     691:	01 d0                	add    %edx,%eax
     693:	8b 10                	mov    (%eax),%edx
     695:	8b 45 e8             	mov    -0x18(%ebp),%eax
     698:	89 54 24 04          	mov    %edx,0x4(%esp)
     69c:	89 04 24             	mov    %eax,(%esp)
     69f:	e8 5c f9 ff ff       	call   0 <strcat>
     6a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		printf(1, "Location: %s.\n", location);
     6a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6aa:	89 44 24 08          	mov    %eax,0x8(%esp)
     6ae:	c7 44 24 04 53 13 00 	movl   $0x1353,0x4(%esp)
     6b5:	00 
     6b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6bd:	e8 ef 07 00 00       	call   eb1 <printf>
		copy_files(location, c_args[i]);
     6c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6c5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     6cc:	8b 45 08             	mov    0x8(%ebp),%eax
     6cf:	01 d0                	add    %edx,%eax
     6d1:	8b 00                	mov    (%eax),%eax
     6d3:	89 44 24 04          	mov    %eax,0x4(%esp)
     6d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     6da:	89 04 24             	mov    %eax,(%esp)
     6dd:	e8 64 f9 ff ff       	call   46 <copy_files>
     6e2:	89 dc                	mov    %ebx,%esp
	int i;
	// int vc_num = is_full();
	// set_name(c_args[0], vc_num);
	// // printf(1, "vc_num is %d.\n", vc_num);
	// cont_proc_set(vc_num);
	for(i = 1; i < x; i++){
     6e4:	ff 45 f0             	incl   -0x10(%ebp)
     6e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     6ea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     6ed:	0f 8c 07 ff ff ff    	jl     5fa <create+0x41>
		char* location = strcat(dir, c_args[i]);
		printf(1, "Location: %s.\n", location);
		copy_files(location, c_args[i]);
	}

}
     6f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     6f6:	c9                   	leave  
     6f7:	c3                   	ret    

000006f8 <attach_vc>:

void attach_vc(char* vc, char* dir, char* file, int vc_num){
     6f8:	55                   	push   %ebp
     6f9:	89 e5                	mov    %esp,%ebp
     6fb:	83 ec 38             	sub    $0x38,%esp
	int fd, id;

	fd = open(vc, O_RDWR);
     6fe:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     705:	00 
     706:	8b 45 08             	mov    0x8(%ebp),%eax
     709:	89 04 24             	mov    %eax,(%esp)
     70c:	e8 93 05 00 00       	call   ca4 <open>
     711:	89 45 f4             	mov    %eax,-0xc(%ebp)
	//printf(1, "fd = %d\n", fd);

	//TODO Check tosee file in file system
	char c_name[16];
	strcpy(c_name, dir);
     714:	8b 45 0c             	mov    0xc(%ebp),%eax
     717:	89 44 24 04          	mov    %eax,0x4(%esp)
     71b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     71e:	89 04 24             	mov    %eax,(%esp)
     721:	e8 0f 03 00 00       	call   a35 <strcpy>
	chdir(dir);
     726:	8b 45 0c             	mov    0xc(%ebp),%eax
     729:	89 04 24             	mov    %eax,(%esp)
     72c:	e8 a3 05 00 00       	call   cd4 <chdir>
	// chroot(dir);

	/* fork a child and exec argv[1] */
	// cont_proc_set(vc_num);
	id = fork();
     731:	e8 26 05 00 00       	call   c5c <fork>
     736:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if (id == 0){
     739:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     73d:	0f 85 a3 00 00 00    	jne    7e6 <attach_vc+0xee>
		cont_proc_set(vc_num);
     743:	8b 45 14             	mov    0x14(%ebp),%eax
     746:	89 04 24             	mov    %eax,(%esp)
     749:	e8 46 06 00 00       	call   d94 <cont_proc_set>
		dir = strcat("/" , dir);
     74e:	8b 45 0c             	mov    0xc(%ebp),%eax
     751:	89 44 24 04          	mov    %eax,0x4(%esp)
     755:	c7 04 24 51 13 00 00 	movl   $0x1351,(%esp)
     75c:	e8 9f f8 ff ff       	call   0 <strcat>
     761:	89 45 0c             	mov    %eax,0xc(%ebp)
		//dir = strcat(dir, "/");
		add_file_size(dir, c_name);
     764:	8d 45 e0             	lea    -0x20(%ebp),%eax
     767:	89 44 24 04          	mov    %eax,0x4(%esp)
     76b:	8b 45 0c             	mov    0xc(%ebp),%eax
     76e:	89 04 24             	mov    %eax,(%esp)
     771:	e8 4b fb ff ff       	call   2c1 <add_file_size>
		close(0);
     776:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     77d:	e8 0a 05 00 00       	call   c8c <close>
		close(1);
     782:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     789:	e8 fe 04 00 00       	call   c8c <close>
		close(2);
     78e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     795:	e8 f2 04 00 00       	call   c8c <close>
		dup(fd);
     79a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     79d:	89 04 24             	mov    %eax,(%esp)
     7a0:	e8 37 05 00 00       	call   cdc <dup>
		dup(fd);
     7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7a8:	89 04 24             	mov    %eax,(%esp)
     7ab:	e8 2c 05 00 00       	call   cdc <dup>
		dup(fd);
     7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7b3:	89 04 24             	mov    %eax,(%esp)
     7b6:	e8 21 05 00 00       	call   cdc <dup>
		exec(file, &file);
     7bb:	8b 45 10             	mov    0x10(%ebp),%eax
     7be:	8d 55 10             	lea    0x10(%ebp),%edx
     7c1:	89 54 24 04          	mov    %edx,0x4(%esp)
     7c5:	89 04 24             	mov    %eax,(%esp)
     7c8:	e8 cf 04 00 00       	call   c9c <exec>
		printf(1, "Failure to attach VC.");
     7cd:	c7 44 24 04 62 13 00 	movl   $0x1362,0x4(%esp)
     7d4:	00 
     7d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7dc:	e8 d0 06 00 00       	call   eb1 <printf>
		exit();
     7e1:	e8 7e 04 00 00       	call   c64 <exit>
	}
	// wait();
}
     7e6:	c9                   	leave  
     7e7:	c3                   	ret    

000007e8 <start>:

void start(char *s_args[]){
     7e8:	55                   	push   %ebp
     7e9:	89 e5                	mov    %esp,%ebp
     7eb:	83 ec 38             	sub    $0x38,%esp
	//int arg_size = (int) (sizeof(s_args)/sizeof(char*));
	//int i;
	int index = 0;
     7ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	if((index = is_full()) < 0){
     7f5:	e8 8a 05 00 00       	call   d84 <is_full>
     7fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
     7fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     801:	79 19                	jns    81c <start+0x34>
		printf(1, "No Available Containers.\n");
     803:	c7 44 24 04 78 13 00 	movl   $0x1378,0x4(%esp)
     80a:	00 
     80b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     812:	e8 9a 06 00 00       	call   eb1 <printf>
		return;
     817:	e9 9d 00 00 00       	jmp    8b9 <start+0xd1>
	}

	int x = 0;
     81c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	while(s_args[x] != 0){
     823:	eb 03                	jmp    828 <start+0x40>
			x++;
     825:	ff 45 f4             	incl   -0xc(%ebp)
		printf(1, "No Available Containers.\n");
		return;
	}

	int x = 0;
	while(s_args[x] != 0){
     828:	8b 45 f4             	mov    -0xc(%ebp),%eax
     82b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     832:	8b 45 08             	mov    0x8(%ebp),%eax
     835:	01 d0                	add    %edx,%eax
     837:	8b 00                	mov    (%eax),%eax
     839:	85 c0                	test   %eax,%eax
     83b:	75 e8                	jne    825 <start+0x3d>
	}

	// printf(1, "Open container at %d\n", index);

	//Make a VC in use function that checks if that VC is in use by a container
	char* vc = s_args[0];
     83d:	8b 45 08             	mov    0x8(%ebp),%eax
     840:	8b 00                	mov    (%eax),%eax
     842:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char* dir = s_args[1];
     845:	8b 45 08             	mov    0x8(%ebp),%eax
     848:	8b 40 04             	mov    0x4(%eax),%eax
     84b:	89 45 e8             	mov    %eax,-0x18(%ebp)
	char* file = s_args[2];
     84e:	8b 45 08             	mov    0x8(%ebp),%eax
     851:	8b 40 08             	mov    0x8(%eax),%eax
     854:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	if(find(dir) == 0){
     857:	8b 45 e8             	mov    -0x18(%ebp),%eax
     85a:	89 04 24             	mov    %eax,(%esp)
     85d:	e8 1a 05 00 00       	call   d7c <find>
     862:	85 c0                	test   %eax,%eax
     864:	75 16                	jne    87c <start+0x94>
		printf(1, "Container already in use.\n");
     866:	c7 44 24 04 92 13 00 	movl   $0x1392,0x4(%esp)
     86d:	00 
     86e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     875:	e8 37 06 00 00       	call   eb1 <printf>
		return;
     87a:	eb 3d                	jmp    8b9 <start+0xd1>
	//ASsume they give us the values for now
	// set_max_proc(atoi(s_args[3]), index);
	// set_max_mem(atoi(s_args[4]), index);
	// set_max_disk(atoi(s_args[5]), index);

	set_name(dir, index);
     87c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     87f:	89 44 24 04          	mov    %eax,0x4(%esp)
     883:	8b 45 e8             	mov    -0x18(%ebp),%eax
     886:	89 04 24             	mov    %eax,(%esp)
     889:	e8 b6 04 00 00       	call   d44 <set_name>
	set_root_inode(dir);
     88e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     891:	89 04 24             	mov    %eax,(%esp)
     894:	e8 13 05 00 00       	call   dac <set_root_inode>
	attach_vc(vc, dir, file, index);
     899:	8b 45 f0             	mov    -0x10(%ebp),%eax
     89c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8a3:	89 44 24 08          	mov    %eax,0x8(%esp)
     8a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8aa:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
     8b1:	89 04 24             	mov    %eax,(%esp)
     8b4:	e8 3f fe ff ff       	call   6f8 <attach_vc>
	// 	}
	// 	else if(s_args[i] == '-d'){

	// 	}
	// }
}
     8b9:	c9                   	leave  
     8ba:	c3                   	ret    

000008bb <pause>:

void pause(char *c_name){
     8bb:	55                   	push   %ebp
     8bc:	89 e5                	mov    %esp,%ebp

}
     8be:	5d                   	pop    %ebp
     8bf:	c3                   	ret    

000008c0 <resume>:

void resume(char *c_name){ 
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp

}
     8c3:	5d                   	pop    %ebp
     8c4:	c3                   	ret    

000008c5 <stop>:

void stop(char *c_name[]){
     8c5:	55                   	push   %ebp
     8c6:	89 e5                	mov    %esp,%ebp
     8c8:	83 ec 18             	sub    $0x18,%esp
	printf(1, "trying to stop container %s\n", c_name[0]);
     8cb:	8b 45 08             	mov    0x8(%ebp),%eax
     8ce:	8b 00                	mov    (%eax),%eax
     8d0:	89 44 24 08          	mov    %eax,0x8(%esp)
     8d4:	c7 44 24 04 ad 13 00 	movl   $0x13ad,0x4(%esp)
     8db:	00 
     8dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8e3:	e8 c9 05 00 00       	call   eb1 <printf>
	cstop(c_name[0]);
     8e8:	8b 45 08             	mov    0x8(%ebp),%eax
     8eb:	8b 00                	mov    (%eax),%eax
     8ed:	89 04 24             	mov    %eax,(%esp)
     8f0:	e8 bf 04 00 00       	call   db4 <cstop>
}
     8f5:	c9                   	leave  
     8f6:	c3                   	ret    

000008f7 <info>:

void info(char *c_name){
     8f7:	55                   	push   %ebp
     8f8:	89 e5                	mov    %esp,%ebp

}
     8fa:	5d                   	pop    %ebp
     8fb:	c3                   	ret    

000008fc <main>:

int main(int argc, char *argv[]){
     8fc:	55                   	push   %ebp
     8fd:	89 e5                	mov    %esp,%ebp
     8ff:	83 e4 f0             	and    $0xfffffff0,%esp
     902:	83 ec 10             	sub    $0x10,%esp
	if(strcmp(argv[1], "init") == 0){
     905:	8b 45 0c             	mov    0xc(%ebp),%eax
     908:	83 c0 04             	add    $0x4,%eax
     90b:	8b 00                	mov    (%eax),%eax
     90d:	c7 44 24 04 ca 13 00 	movl   $0x13ca,0x4(%esp)
     914:	00 
     915:	89 04 24             	mov    %eax,(%esp)
     918:	e8 46 01 00 00       	call   a63 <strcmp>
     91d:	85 c0                	test   %eax,%eax
     91f:	0f 84 d2 00 00 00    	je     9f7 <main+0xfb>
		// init();
	}
	else if(strcmp(argv[1], "create") == 0){
     925:	8b 45 0c             	mov    0xc(%ebp),%eax
     928:	83 c0 04             	add    $0x4,%eax
     92b:	8b 00                	mov    (%eax),%eax
     92d:	c7 44 24 04 cf 13 00 	movl   $0x13cf,0x4(%esp)
     934:	00 
     935:	89 04 24             	mov    %eax,(%esp)
     938:	e8 26 01 00 00       	call   a63 <strcmp>
     93d:	85 c0                	test   %eax,%eax
     93f:	75 27                	jne    968 <main+0x6c>
		printf(1, "Calling create\n");
     941:	c7 44 24 04 d6 13 00 	movl   $0x13d6,0x4(%esp)
     948:	00 
     949:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     950:	e8 5c 05 00 00       	call   eb1 <printf>
		create(&argv[2]);
     955:	8b 45 0c             	mov    0xc(%ebp),%eax
     958:	83 c0 08             	add    $0x8,%eax
     95b:	89 04 24             	mov    %eax,(%esp)
     95e:	e8 56 fc ff ff       	call   5b9 <create>
     963:	e9 8f 00 00 00       	jmp    9f7 <main+0xfb>
	}
	else if(strcmp(argv[1], "start") == 0){
     968:	8b 45 0c             	mov    0xc(%ebp),%eax
     96b:	83 c0 04             	add    $0x4,%eax
     96e:	8b 00                	mov    (%eax),%eax
     970:	c7 44 24 04 e6 13 00 	movl   $0x13e6,0x4(%esp)
     977:	00 
     978:	89 04 24             	mov    %eax,(%esp)
     97b:	e8 e3 00 00 00       	call   a63 <strcmp>
     980:	85 c0                	test   %eax,%eax
     982:	75 10                	jne    994 <main+0x98>
		start(&argv[2]);
     984:	8b 45 0c             	mov    0xc(%ebp),%eax
     987:	83 c0 08             	add    $0x8,%eax
     98a:	89 04 24             	mov    %eax,(%esp)
     98d:	e8 56 fe ff ff       	call   7e8 <start>
     992:	eb 63                	jmp    9f7 <main+0xfb>
	}
	else if(strcmp(argv[1], "name") == 0){
     994:	8b 45 0c             	mov    0xc(%ebp),%eax
     997:	83 c0 04             	add    $0x4,%eax
     99a:	8b 00                	mov    (%eax),%eax
     99c:	c7 44 24 04 ec 13 00 	movl   $0x13ec,0x4(%esp)
     9a3:	00 
     9a4:	89 04 24             	mov    %eax,(%esp)
     9a7:	e8 b7 00 00 00       	call   a63 <strcmp>
     9ac:	85 c0                	test   %eax,%eax
     9ae:	75 07                	jne    9b7 <main+0xbb>
		name();
     9b0:	e8 6a f7 ff ff       	call   11f <name>
     9b5:	eb 40                	jmp    9f7 <main+0xfb>
	// 	pause(&argv[2]);
	// }
	// else if(argv[1] == 'resume'){
	// 	resume(&argv[2]);
	// }
	else if(strcmp(argv[1],"stop") == 0){
     9b7:	8b 45 0c             	mov    0xc(%ebp),%eax
     9ba:	83 c0 04             	add    $0x4,%eax
     9bd:	8b 00                	mov    (%eax),%eax
     9bf:	c7 44 24 04 f1 13 00 	movl   $0x13f1,0x4(%esp)
     9c6:	00 
     9c7:	89 04 24             	mov    %eax,(%esp)
     9ca:	e8 94 00 00 00       	call   a63 <strcmp>
     9cf:	85 c0                	test   %eax,%eax
     9d1:	75 10                	jne    9e3 <main+0xe7>
		stop(&argv[2]);
     9d3:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d6:	83 c0 08             	add    $0x8,%eax
     9d9:	89 04 24             	mov    %eax,(%esp)
     9dc:	e8 e4 fe ff ff       	call   8c5 <stop>
     9e1:	eb 14                	jmp    9f7 <main+0xfb>
	}
	// else if(argv[1] == 'info'){
	// 	info(&argv[2]);
	// }
	else{
		printf(1, "Improper usage; create, start, pause, resume, stop, info.\n");
     9e3:	c7 44 24 04 f8 13 00 	movl   $0x13f8,0x4(%esp)
     9ea:	00 
     9eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9f2:	e8 ba 04 00 00       	call   eb1 <printf>
	}
	printf(1, "Done with ctool\n");
     9f7:	c7 44 24 04 33 14 00 	movl   $0x1433,0x4(%esp)
     9fe:	00 
     9ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a06:	e8 a6 04 00 00       	call   eb1 <printf>

	exit();
     a0b:	e8 54 02 00 00       	call   c64 <exit>

00000a10 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     a15:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a18:	8b 55 10             	mov    0x10(%ebp),%edx
     a1b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a1e:	89 cb                	mov    %ecx,%ebx
     a20:	89 df                	mov    %ebx,%edi
     a22:	89 d1                	mov    %edx,%ecx
     a24:	fc                   	cld    
     a25:	f3 aa                	rep stos %al,%es:(%edi)
     a27:	89 ca                	mov    %ecx,%edx
     a29:	89 fb                	mov    %edi,%ebx
     a2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
     a2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     a31:	5b                   	pop    %ebx
     a32:	5f                   	pop    %edi
     a33:	5d                   	pop    %ebp
     a34:	c3                   	ret    

00000a35 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     a35:	55                   	push   %ebp
     a36:	89 e5                	mov    %esp,%ebp
     a38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     a3b:	8b 45 08             	mov    0x8(%ebp),%eax
     a3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     a41:	90                   	nop
     a42:	8b 45 08             	mov    0x8(%ebp),%eax
     a45:	8d 50 01             	lea    0x1(%eax),%edx
     a48:	89 55 08             	mov    %edx,0x8(%ebp)
     a4b:	8b 55 0c             	mov    0xc(%ebp),%edx
     a4e:	8d 4a 01             	lea    0x1(%edx),%ecx
     a51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     a54:	8a 12                	mov    (%edx),%dl
     a56:	88 10                	mov    %dl,(%eax)
     a58:	8a 00                	mov    (%eax),%al
     a5a:	84 c0                	test   %al,%al
     a5c:	75 e4                	jne    a42 <strcpy+0xd>
    ;
  return os;
     a5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     a61:	c9                   	leave  
     a62:	c3                   	ret    

00000a63 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a63:	55                   	push   %ebp
     a64:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     a66:	eb 06                	jmp    a6e <strcmp+0xb>
    p++, q++;
     a68:	ff 45 08             	incl   0x8(%ebp)
     a6b:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a6e:	8b 45 08             	mov    0x8(%ebp),%eax
     a71:	8a 00                	mov    (%eax),%al
     a73:	84 c0                	test   %al,%al
     a75:	74 0e                	je     a85 <strcmp+0x22>
     a77:	8b 45 08             	mov    0x8(%ebp),%eax
     a7a:	8a 10                	mov    (%eax),%dl
     a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7f:	8a 00                	mov    (%eax),%al
     a81:	38 c2                	cmp    %al,%dl
     a83:	74 e3                	je     a68 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a85:	8b 45 08             	mov    0x8(%ebp),%eax
     a88:	8a 00                	mov    (%eax),%al
     a8a:	0f b6 d0             	movzbl %al,%edx
     a8d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a90:	8a 00                	mov    (%eax),%al
     a92:	0f b6 c0             	movzbl %al,%eax
     a95:	29 c2                	sub    %eax,%edx
     a97:	89 d0                	mov    %edx,%eax
}
     a99:	5d                   	pop    %ebp
     a9a:	c3                   	ret    

00000a9b <strlen>:

uint
strlen(char *s)
{
     a9b:	55                   	push   %ebp
     a9c:	89 e5                	mov    %esp,%ebp
     a9e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     aa1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     aa8:	eb 03                	jmp    aad <strlen+0x12>
     aaa:	ff 45 fc             	incl   -0x4(%ebp)
     aad:	8b 55 fc             	mov    -0x4(%ebp),%edx
     ab0:	8b 45 08             	mov    0x8(%ebp),%eax
     ab3:	01 d0                	add    %edx,%eax
     ab5:	8a 00                	mov    (%eax),%al
     ab7:	84 c0                	test   %al,%al
     ab9:	75 ef                	jne    aaa <strlen+0xf>
    ;
  return n;
     abb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     abe:	c9                   	leave  
     abf:	c3                   	ret    

00000ac0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     ac6:	8b 45 10             	mov    0x10(%ebp),%eax
     ac9:	89 44 24 08          	mov    %eax,0x8(%esp)
     acd:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad0:	89 44 24 04          	mov    %eax,0x4(%esp)
     ad4:	8b 45 08             	mov    0x8(%ebp),%eax
     ad7:	89 04 24             	mov    %eax,(%esp)
     ada:	e8 31 ff ff ff       	call   a10 <stosb>
  return dst;
     adf:	8b 45 08             	mov    0x8(%ebp),%eax
}
     ae2:	c9                   	leave  
     ae3:	c3                   	ret    

00000ae4 <strchr>:

char*
strchr(const char *s, char c)
{
     ae4:	55                   	push   %ebp
     ae5:	89 e5                	mov    %esp,%ebp
     ae7:	83 ec 04             	sub    $0x4,%esp
     aea:	8b 45 0c             	mov    0xc(%ebp),%eax
     aed:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     af0:	eb 12                	jmp    b04 <strchr+0x20>
    if(*s == c)
     af2:	8b 45 08             	mov    0x8(%ebp),%eax
     af5:	8a 00                	mov    (%eax),%al
     af7:	3a 45 fc             	cmp    -0x4(%ebp),%al
     afa:	75 05                	jne    b01 <strchr+0x1d>
      return (char*)s;
     afc:	8b 45 08             	mov    0x8(%ebp),%eax
     aff:	eb 11                	jmp    b12 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     b01:	ff 45 08             	incl   0x8(%ebp)
     b04:	8b 45 08             	mov    0x8(%ebp),%eax
     b07:	8a 00                	mov    (%eax),%al
     b09:	84 c0                	test   %al,%al
     b0b:	75 e5                	jne    af2 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     b0d:	b8 00 00 00 00       	mov    $0x0,%eax
}
     b12:	c9                   	leave  
     b13:	c3                   	ret    

00000b14 <gets>:

char*
gets(char *buf, int max)
{
     b14:	55                   	push   %ebp
     b15:	89 e5                	mov    %esp,%ebp
     b17:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     b21:	eb 49                	jmp    b6c <gets+0x58>
    cc = read(0, &c, 1);
     b23:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     b2a:	00 
     b2b:	8d 45 ef             	lea    -0x11(%ebp),%eax
     b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
     b32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b39:	e8 3e 01 00 00       	call   c7c <read>
     b3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     b41:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b45:	7f 02                	jg     b49 <gets+0x35>
      break;
     b47:	eb 2c                	jmp    b75 <gets+0x61>
    buf[i++] = c;
     b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b4c:	8d 50 01             	lea    0x1(%eax),%edx
     b4f:	89 55 f4             	mov    %edx,-0xc(%ebp)
     b52:	89 c2                	mov    %eax,%edx
     b54:	8b 45 08             	mov    0x8(%ebp),%eax
     b57:	01 c2                	add    %eax,%edx
     b59:	8a 45 ef             	mov    -0x11(%ebp),%al
     b5c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     b5e:	8a 45 ef             	mov    -0x11(%ebp),%al
     b61:	3c 0a                	cmp    $0xa,%al
     b63:	74 10                	je     b75 <gets+0x61>
     b65:	8a 45 ef             	mov    -0x11(%ebp),%al
     b68:	3c 0d                	cmp    $0xd,%al
     b6a:	74 09                	je     b75 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b6f:	40                   	inc    %eax
     b70:	3b 45 0c             	cmp    0xc(%ebp),%eax
     b73:	7c ae                	jl     b23 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     b75:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b78:	8b 45 08             	mov    0x8(%ebp),%eax
     b7b:	01 d0                	add    %edx,%eax
     b7d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     b80:	8b 45 08             	mov    0x8(%ebp),%eax
}
     b83:	c9                   	leave  
     b84:	c3                   	ret    

00000b85 <stat>:

int
stat(char *n, struct stat *st)
{
     b85:	55                   	push   %ebp
     b86:	89 e5                	mov    %esp,%ebp
     b88:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b8b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     b92:	00 
     b93:	8b 45 08             	mov    0x8(%ebp),%eax
     b96:	89 04 24             	mov    %eax,(%esp)
     b99:	e8 06 01 00 00       	call   ca4 <open>
     b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     ba1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ba5:	79 07                	jns    bae <stat+0x29>
    return -1;
     ba7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     bac:	eb 23                	jmp    bd1 <stat+0x4c>
  r = fstat(fd, st);
     bae:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb1:	89 44 24 04          	mov    %eax,0x4(%esp)
     bb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bb8:	89 04 24             	mov    %eax,(%esp)
     bbb:	e8 fc 00 00 00       	call   cbc <fstat>
     bc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bc6:	89 04 24             	mov    %eax,(%esp)
     bc9:	e8 be 00 00 00       	call   c8c <close>
  return r;
     bce:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     bd1:	c9                   	leave  
     bd2:	c3                   	ret    

00000bd3 <atoi>:

int
atoi(const char *s)
{
     bd3:	55                   	push   %ebp
     bd4:	89 e5                	mov    %esp,%ebp
     bd6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     bd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     be0:	eb 24                	jmp    c06 <atoi+0x33>
    n = n*10 + *s++ - '0';
     be2:	8b 55 fc             	mov    -0x4(%ebp),%edx
     be5:	89 d0                	mov    %edx,%eax
     be7:	c1 e0 02             	shl    $0x2,%eax
     bea:	01 d0                	add    %edx,%eax
     bec:	01 c0                	add    %eax,%eax
     bee:	89 c1                	mov    %eax,%ecx
     bf0:	8b 45 08             	mov    0x8(%ebp),%eax
     bf3:	8d 50 01             	lea    0x1(%eax),%edx
     bf6:	89 55 08             	mov    %edx,0x8(%ebp)
     bf9:	8a 00                	mov    (%eax),%al
     bfb:	0f be c0             	movsbl %al,%eax
     bfe:	01 c8                	add    %ecx,%eax
     c00:	83 e8 30             	sub    $0x30,%eax
     c03:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c06:	8b 45 08             	mov    0x8(%ebp),%eax
     c09:	8a 00                	mov    (%eax),%al
     c0b:	3c 2f                	cmp    $0x2f,%al
     c0d:	7e 09                	jle    c18 <atoi+0x45>
     c0f:	8b 45 08             	mov    0x8(%ebp),%eax
     c12:	8a 00                	mov    (%eax),%al
     c14:	3c 39                	cmp    $0x39,%al
     c16:	7e ca                	jle    be2 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     c18:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     c1b:	c9                   	leave  
     c1c:	c3                   	ret    

00000c1d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     c1d:	55                   	push   %ebp
     c1e:	89 e5                	mov    %esp,%ebp
     c20:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
     c23:	8b 45 08             	mov    0x8(%ebp),%eax
     c26:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     c29:	8b 45 0c             	mov    0xc(%ebp),%eax
     c2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     c2f:	eb 16                	jmp    c47 <memmove+0x2a>
    *dst++ = *src++;
     c31:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c34:	8d 50 01             	lea    0x1(%eax),%edx
     c37:	89 55 fc             	mov    %edx,-0x4(%ebp)
     c3a:	8b 55 f8             	mov    -0x8(%ebp),%edx
     c3d:	8d 4a 01             	lea    0x1(%edx),%ecx
     c40:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     c43:	8a 12                	mov    (%edx),%dl
     c45:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c47:	8b 45 10             	mov    0x10(%ebp),%eax
     c4a:	8d 50 ff             	lea    -0x1(%eax),%edx
     c4d:	89 55 10             	mov    %edx,0x10(%ebp)
     c50:	85 c0                	test   %eax,%eax
     c52:	7f dd                	jg     c31 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     c54:	8b 45 08             	mov    0x8(%ebp),%eax
}
     c57:	c9                   	leave  
     c58:	c3                   	ret    
     c59:	90                   	nop
     c5a:	90                   	nop
     c5b:	90                   	nop

00000c5c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c5c:	b8 01 00 00 00       	mov    $0x1,%eax
     c61:	cd 40                	int    $0x40
     c63:	c3                   	ret    

00000c64 <exit>:
SYSCALL(exit)
     c64:	b8 02 00 00 00       	mov    $0x2,%eax
     c69:	cd 40                	int    $0x40
     c6b:	c3                   	ret    

00000c6c <wait>:
SYSCALL(wait)
     c6c:	b8 03 00 00 00       	mov    $0x3,%eax
     c71:	cd 40                	int    $0x40
     c73:	c3                   	ret    

00000c74 <pipe>:
SYSCALL(pipe)
     c74:	b8 04 00 00 00       	mov    $0x4,%eax
     c79:	cd 40                	int    $0x40
     c7b:	c3                   	ret    

00000c7c <read>:
SYSCALL(read)
     c7c:	b8 05 00 00 00       	mov    $0x5,%eax
     c81:	cd 40                	int    $0x40
     c83:	c3                   	ret    

00000c84 <write>:
SYSCALL(write)
     c84:	b8 10 00 00 00       	mov    $0x10,%eax
     c89:	cd 40                	int    $0x40
     c8b:	c3                   	ret    

00000c8c <close>:
SYSCALL(close)
     c8c:	b8 15 00 00 00       	mov    $0x15,%eax
     c91:	cd 40                	int    $0x40
     c93:	c3                   	ret    

00000c94 <kill>:
SYSCALL(kill)
     c94:	b8 06 00 00 00       	mov    $0x6,%eax
     c99:	cd 40                	int    $0x40
     c9b:	c3                   	ret    

00000c9c <exec>:
SYSCALL(exec)
     c9c:	b8 07 00 00 00       	mov    $0x7,%eax
     ca1:	cd 40                	int    $0x40
     ca3:	c3                   	ret    

00000ca4 <open>:
SYSCALL(open)
     ca4:	b8 0f 00 00 00       	mov    $0xf,%eax
     ca9:	cd 40                	int    $0x40
     cab:	c3                   	ret    

00000cac <mknod>:
SYSCALL(mknod)
     cac:	b8 11 00 00 00       	mov    $0x11,%eax
     cb1:	cd 40                	int    $0x40
     cb3:	c3                   	ret    

00000cb4 <unlink>:
SYSCALL(unlink)
     cb4:	b8 12 00 00 00       	mov    $0x12,%eax
     cb9:	cd 40                	int    $0x40
     cbb:	c3                   	ret    

00000cbc <fstat>:
SYSCALL(fstat)
     cbc:	b8 08 00 00 00       	mov    $0x8,%eax
     cc1:	cd 40                	int    $0x40
     cc3:	c3                   	ret    

00000cc4 <link>:
SYSCALL(link)
     cc4:	b8 13 00 00 00       	mov    $0x13,%eax
     cc9:	cd 40                	int    $0x40
     ccb:	c3                   	ret    

00000ccc <mkdir>:
SYSCALL(mkdir)
     ccc:	b8 14 00 00 00       	mov    $0x14,%eax
     cd1:	cd 40                	int    $0x40
     cd3:	c3                   	ret    

00000cd4 <chdir>:
SYSCALL(chdir)
     cd4:	b8 09 00 00 00       	mov    $0x9,%eax
     cd9:	cd 40                	int    $0x40
     cdb:	c3                   	ret    

00000cdc <dup>:
SYSCALL(dup)
     cdc:	b8 0a 00 00 00       	mov    $0xa,%eax
     ce1:	cd 40                	int    $0x40
     ce3:	c3                   	ret    

00000ce4 <getpid>:
SYSCALL(getpid)
     ce4:	b8 0b 00 00 00       	mov    $0xb,%eax
     ce9:	cd 40                	int    $0x40
     ceb:	c3                   	ret    

00000cec <sbrk>:
SYSCALL(sbrk)
     cec:	b8 0c 00 00 00       	mov    $0xc,%eax
     cf1:	cd 40                	int    $0x40
     cf3:	c3                   	ret    

00000cf4 <sleep>:
SYSCALL(sleep)
     cf4:	b8 0d 00 00 00       	mov    $0xd,%eax
     cf9:	cd 40                	int    $0x40
     cfb:	c3                   	ret    

00000cfc <uptime>:
SYSCALL(uptime)
     cfc:	b8 0e 00 00 00       	mov    $0xe,%eax
     d01:	cd 40                	int    $0x40
     d03:	c3                   	ret    

00000d04 <getticks>:
SYSCALL(getticks)
     d04:	b8 16 00 00 00       	mov    $0x16,%eax
     d09:	cd 40                	int    $0x40
     d0b:	c3                   	ret    

00000d0c <get_name>:
SYSCALL(get_name)
     d0c:	b8 17 00 00 00       	mov    $0x17,%eax
     d11:	cd 40                	int    $0x40
     d13:	c3                   	ret    

00000d14 <get_max_proc>:
SYSCALL(get_max_proc)
     d14:	b8 18 00 00 00       	mov    $0x18,%eax
     d19:	cd 40                	int    $0x40
     d1b:	c3                   	ret    

00000d1c <get_max_mem>:
SYSCALL(get_max_mem)
     d1c:	b8 19 00 00 00       	mov    $0x19,%eax
     d21:	cd 40                	int    $0x40
     d23:	c3                   	ret    

00000d24 <get_max_disk>:
SYSCALL(get_max_disk)
     d24:	b8 1a 00 00 00       	mov    $0x1a,%eax
     d29:	cd 40                	int    $0x40
     d2b:	c3                   	ret    

00000d2c <get_curr_proc>:
SYSCALL(get_curr_proc)
     d2c:	b8 1b 00 00 00       	mov    $0x1b,%eax
     d31:	cd 40                	int    $0x40
     d33:	c3                   	ret    

00000d34 <get_curr_mem>:
SYSCALL(get_curr_mem)
     d34:	b8 1c 00 00 00       	mov    $0x1c,%eax
     d39:	cd 40                	int    $0x40
     d3b:	c3                   	ret    

00000d3c <get_curr_disk>:
SYSCALL(get_curr_disk)
     d3c:	b8 1d 00 00 00       	mov    $0x1d,%eax
     d41:	cd 40                	int    $0x40
     d43:	c3                   	ret    

00000d44 <set_name>:
SYSCALL(set_name)
     d44:	b8 1e 00 00 00       	mov    $0x1e,%eax
     d49:	cd 40                	int    $0x40
     d4b:	c3                   	ret    

00000d4c <set_max_mem>:
SYSCALL(set_max_mem)
     d4c:	b8 1f 00 00 00       	mov    $0x1f,%eax
     d51:	cd 40                	int    $0x40
     d53:	c3                   	ret    

00000d54 <set_max_disk>:
SYSCALL(set_max_disk)
     d54:	b8 20 00 00 00       	mov    $0x20,%eax
     d59:	cd 40                	int    $0x40
     d5b:	c3                   	ret    

00000d5c <set_max_proc>:
SYSCALL(set_max_proc)
     d5c:	b8 21 00 00 00       	mov    $0x21,%eax
     d61:	cd 40                	int    $0x40
     d63:	c3                   	ret    

00000d64 <set_curr_mem>:
SYSCALL(set_curr_mem)
     d64:	b8 22 00 00 00       	mov    $0x22,%eax
     d69:	cd 40                	int    $0x40
     d6b:	c3                   	ret    

00000d6c <set_curr_disk>:
SYSCALL(set_curr_disk)
     d6c:	b8 23 00 00 00       	mov    $0x23,%eax
     d71:	cd 40                	int    $0x40
     d73:	c3                   	ret    

00000d74 <set_curr_proc>:
SYSCALL(set_curr_proc)
     d74:	b8 24 00 00 00       	mov    $0x24,%eax
     d79:	cd 40                	int    $0x40
     d7b:	c3                   	ret    

00000d7c <find>:
SYSCALL(find)
     d7c:	b8 25 00 00 00       	mov    $0x25,%eax
     d81:	cd 40                	int    $0x40
     d83:	c3                   	ret    

00000d84 <is_full>:
SYSCALL(is_full)
     d84:	b8 26 00 00 00       	mov    $0x26,%eax
     d89:	cd 40                	int    $0x40
     d8b:	c3                   	ret    

00000d8c <container_init>:
SYSCALL(container_init)
     d8c:	b8 27 00 00 00       	mov    $0x27,%eax
     d91:	cd 40                	int    $0x40
     d93:	c3                   	ret    

00000d94 <cont_proc_set>:
SYSCALL(cont_proc_set)
     d94:	b8 28 00 00 00       	mov    $0x28,%eax
     d99:	cd 40                	int    $0x40
     d9b:	c3                   	ret    

00000d9c <ps>:
SYSCALL(ps)
     d9c:	b8 29 00 00 00       	mov    $0x29,%eax
     da1:	cd 40                	int    $0x40
     da3:	c3                   	ret    

00000da4 <reduce_curr_mem>:
SYSCALL(reduce_curr_mem)
     da4:	b8 2a 00 00 00       	mov    $0x2a,%eax
     da9:	cd 40                	int    $0x40
     dab:	c3                   	ret    

00000dac <set_root_inode>:
SYSCALL(set_root_inode)
     dac:	b8 2b 00 00 00       	mov    $0x2b,%eax
     db1:	cd 40                	int    $0x40
     db3:	c3                   	ret    

00000db4 <cstop>:
SYSCALL(cstop)
     db4:	b8 2c 00 00 00       	mov    $0x2c,%eax
     db9:	cd 40                	int    $0x40
     dbb:	c3                   	ret    

00000dbc <df>:
SYSCALL(df)
     dbc:	b8 2d 00 00 00       	mov    $0x2d,%eax
     dc1:	cd 40                	int    $0x40
     dc3:	c3                   	ret    

00000dc4 <max_containers>:
SYSCALL(max_containers)
     dc4:	b8 2e 00 00 00       	mov    $0x2e,%eax
     dc9:	cd 40                	int    $0x40
     dcb:	c3                   	ret    

00000dcc <container_reset>:
SYSCALL(container_reset)
     dcc:	b8 2f 00 00 00       	mov    $0x2f,%eax
     dd1:	cd 40                	int    $0x40
     dd3:	c3                   	ret    

00000dd4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     dd4:	55                   	push   %ebp
     dd5:	89 e5                	mov    %esp,%ebp
     dd7:	83 ec 18             	sub    $0x18,%esp
     dda:	8b 45 0c             	mov    0xc(%ebp),%eax
     ddd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     de0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     de7:	00 
     de8:	8d 45 f4             	lea    -0xc(%ebp),%eax
     deb:	89 44 24 04          	mov    %eax,0x4(%esp)
     def:	8b 45 08             	mov    0x8(%ebp),%eax
     df2:	89 04 24             	mov    %eax,(%esp)
     df5:	e8 8a fe ff ff       	call   c84 <write>
}
     dfa:	c9                   	leave  
     dfb:	c3                   	ret    

00000dfc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     dfc:	55                   	push   %ebp
     dfd:	89 e5                	mov    %esp,%ebp
     dff:	56                   	push   %esi
     e00:	53                   	push   %ebx
     e01:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     e04:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     e0b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     e0f:	74 17                	je     e28 <printint+0x2c>
     e11:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     e15:	79 11                	jns    e28 <printint+0x2c>
    neg = 1;
     e17:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     e1e:	8b 45 0c             	mov    0xc(%ebp),%eax
     e21:	f7 d8                	neg    %eax
     e23:	89 45 ec             	mov    %eax,-0x14(%ebp)
     e26:	eb 06                	jmp    e2e <printint+0x32>
  } else {
    x = xx;
     e28:	8b 45 0c             	mov    0xc(%ebp),%eax
     e2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     e2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     e35:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     e38:	8d 41 01             	lea    0x1(%ecx),%eax
     e3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e3e:	8b 5d 10             	mov    0x10(%ebp),%ebx
     e41:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e44:	ba 00 00 00 00       	mov    $0x0,%edx
     e49:	f7 f3                	div    %ebx
     e4b:	89 d0                	mov    %edx,%eax
     e4d:	8a 80 38 18 00 00    	mov    0x1838(%eax),%al
     e53:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     e57:	8b 75 10             	mov    0x10(%ebp),%esi
     e5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e5d:	ba 00 00 00 00       	mov    $0x0,%edx
     e62:	f7 f6                	div    %esi
     e64:	89 45 ec             	mov    %eax,-0x14(%ebp)
     e67:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     e6b:	75 c8                	jne    e35 <printint+0x39>
  if(neg)
     e6d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e71:	74 10                	je     e83 <printint+0x87>
    buf[i++] = '-';
     e73:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e76:	8d 50 01             	lea    0x1(%eax),%edx
     e79:	89 55 f4             	mov    %edx,-0xc(%ebp)
     e7c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     e81:	eb 1e                	jmp    ea1 <printint+0xa5>
     e83:	eb 1c                	jmp    ea1 <printint+0xa5>
    putc(fd, buf[i]);
     e85:	8d 55 dc             	lea    -0x24(%ebp),%edx
     e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e8b:	01 d0                	add    %edx,%eax
     e8d:	8a 00                	mov    (%eax),%al
     e8f:	0f be c0             	movsbl %al,%eax
     e92:	89 44 24 04          	mov    %eax,0x4(%esp)
     e96:	8b 45 08             	mov    0x8(%ebp),%eax
     e99:	89 04 24             	mov    %eax,(%esp)
     e9c:	e8 33 ff ff ff       	call   dd4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     ea1:	ff 4d f4             	decl   -0xc(%ebp)
     ea4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea8:	79 db                	jns    e85 <printint+0x89>
    putc(fd, buf[i]);
}
     eaa:	83 c4 30             	add    $0x30,%esp
     ead:	5b                   	pop    %ebx
     eae:	5e                   	pop    %esi
     eaf:	5d                   	pop    %ebp
     eb0:	c3                   	ret    

00000eb1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     eb1:	55                   	push   %ebp
     eb2:	89 e5                	mov    %esp,%ebp
     eb4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     eb7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     ebe:	8d 45 0c             	lea    0xc(%ebp),%eax
     ec1:	83 c0 04             	add    $0x4,%eax
     ec4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     ec7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ece:	e9 77 01 00 00       	jmp    104a <printf+0x199>
    c = fmt[i] & 0xff;
     ed3:	8b 55 0c             	mov    0xc(%ebp),%edx
     ed6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ed9:	01 d0                	add    %edx,%eax
     edb:	8a 00                	mov    (%eax),%al
     edd:	0f be c0             	movsbl %al,%eax
     ee0:	25 ff 00 00 00       	and    $0xff,%eax
     ee5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     ee8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     eec:	75 2c                	jne    f1a <printf+0x69>
      if(c == '%'){
     eee:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     ef2:	75 0c                	jne    f00 <printf+0x4f>
        state = '%';
     ef4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     efb:	e9 47 01 00 00       	jmp    1047 <printf+0x196>
      } else {
        putc(fd, c);
     f00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f03:	0f be c0             	movsbl %al,%eax
     f06:	89 44 24 04          	mov    %eax,0x4(%esp)
     f0a:	8b 45 08             	mov    0x8(%ebp),%eax
     f0d:	89 04 24             	mov    %eax,(%esp)
     f10:	e8 bf fe ff ff       	call   dd4 <putc>
     f15:	e9 2d 01 00 00       	jmp    1047 <printf+0x196>
      }
    } else if(state == '%'){
     f1a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     f1e:	0f 85 23 01 00 00    	jne    1047 <printf+0x196>
      if(c == 'd'){
     f24:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     f28:	75 2d                	jne    f57 <printf+0xa6>
        printint(fd, *ap, 10, 1);
     f2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f2d:	8b 00                	mov    (%eax),%eax
     f2f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     f36:	00 
     f37:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     f3e:	00 
     f3f:	89 44 24 04          	mov    %eax,0x4(%esp)
     f43:	8b 45 08             	mov    0x8(%ebp),%eax
     f46:	89 04 24             	mov    %eax,(%esp)
     f49:	e8 ae fe ff ff       	call   dfc <printint>
        ap++;
     f4e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     f52:	e9 e9 00 00 00       	jmp    1040 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
     f57:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     f5b:	74 06                	je     f63 <printf+0xb2>
     f5d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     f61:	75 2d                	jne    f90 <printf+0xdf>
        printint(fd, *ap, 16, 0);
     f63:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f66:	8b 00                	mov    (%eax),%eax
     f68:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     f6f:	00 
     f70:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     f77:	00 
     f78:	89 44 24 04          	mov    %eax,0x4(%esp)
     f7c:	8b 45 08             	mov    0x8(%ebp),%eax
     f7f:	89 04 24             	mov    %eax,(%esp)
     f82:	e8 75 fe ff ff       	call   dfc <printint>
        ap++;
     f87:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     f8b:	e9 b0 00 00 00       	jmp    1040 <printf+0x18f>
      } else if(c == 's'){
     f90:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     f94:	75 42                	jne    fd8 <printf+0x127>
        s = (char*)*ap;
     f96:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f99:	8b 00                	mov    (%eax),%eax
     f9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     f9e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     fa2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fa6:	75 09                	jne    fb1 <printf+0x100>
          s = "(null)";
     fa8:	c7 45 f4 44 14 00 00 	movl   $0x1444,-0xc(%ebp)
        while(*s != 0){
     faf:	eb 1c                	jmp    fcd <printf+0x11c>
     fb1:	eb 1a                	jmp    fcd <printf+0x11c>
          putc(fd, *s);
     fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb6:	8a 00                	mov    (%eax),%al
     fb8:	0f be c0             	movsbl %al,%eax
     fbb:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbf:	8b 45 08             	mov    0x8(%ebp),%eax
     fc2:	89 04 24             	mov    %eax,(%esp)
     fc5:	e8 0a fe ff ff       	call   dd4 <putc>
          s++;
     fca:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd0:	8a 00                	mov    (%eax),%al
     fd2:	84 c0                	test   %al,%al
     fd4:	75 dd                	jne    fb3 <printf+0x102>
     fd6:	eb 68                	jmp    1040 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     fd8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     fdc:	75 1d                	jne    ffb <printf+0x14a>
        putc(fd, *ap);
     fde:	8b 45 e8             	mov    -0x18(%ebp),%eax
     fe1:	8b 00                	mov    (%eax),%eax
     fe3:	0f be c0             	movsbl %al,%eax
     fe6:	89 44 24 04          	mov    %eax,0x4(%esp)
     fea:	8b 45 08             	mov    0x8(%ebp),%eax
     fed:	89 04 24             	mov    %eax,(%esp)
     ff0:	e8 df fd ff ff       	call   dd4 <putc>
        ap++;
     ff5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     ff9:	eb 45                	jmp    1040 <printf+0x18f>
      } else if(c == '%'){
     ffb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     fff:	75 17                	jne    1018 <printf+0x167>
        putc(fd, c);
    1001:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1004:	0f be c0             	movsbl %al,%eax
    1007:	89 44 24 04          	mov    %eax,0x4(%esp)
    100b:	8b 45 08             	mov    0x8(%ebp),%eax
    100e:	89 04 24             	mov    %eax,(%esp)
    1011:	e8 be fd ff ff       	call   dd4 <putc>
    1016:	eb 28                	jmp    1040 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1018:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    101f:	00 
    1020:	8b 45 08             	mov    0x8(%ebp),%eax
    1023:	89 04 24             	mov    %eax,(%esp)
    1026:	e8 a9 fd ff ff       	call   dd4 <putc>
        putc(fd, c);
    102b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    102e:	0f be c0             	movsbl %al,%eax
    1031:	89 44 24 04          	mov    %eax,0x4(%esp)
    1035:	8b 45 08             	mov    0x8(%ebp),%eax
    1038:	89 04 24             	mov    %eax,(%esp)
    103b:	e8 94 fd ff ff       	call   dd4 <putc>
      }
      state = 0;
    1040:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1047:	ff 45 f0             	incl   -0x10(%ebp)
    104a:	8b 55 0c             	mov    0xc(%ebp),%edx
    104d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1050:	01 d0                	add    %edx,%eax
    1052:	8a 00                	mov    (%eax),%al
    1054:	84 c0                	test   %al,%al
    1056:	0f 85 77 fe ff ff    	jne    ed3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    105c:	c9                   	leave  
    105d:	c3                   	ret    
    105e:	90                   	nop
    105f:	90                   	nop

00001060 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1066:	8b 45 08             	mov    0x8(%ebp),%eax
    1069:	83 e8 08             	sub    $0x8,%eax
    106c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    106f:	a1 64 18 00 00       	mov    0x1864,%eax
    1074:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1077:	eb 24                	jmp    109d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1079:	8b 45 fc             	mov    -0x4(%ebp),%eax
    107c:	8b 00                	mov    (%eax),%eax
    107e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1081:	77 12                	ja     1095 <free+0x35>
    1083:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1086:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1089:	77 24                	ja     10af <free+0x4f>
    108b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    108e:	8b 00                	mov    (%eax),%eax
    1090:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1093:	77 1a                	ja     10af <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1095:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1098:	8b 00                	mov    (%eax),%eax
    109a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    109d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10a0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    10a3:	76 d4                	jbe    1079 <free+0x19>
    10a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10a8:	8b 00                	mov    (%eax),%eax
    10aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    10ad:	76 ca                	jbe    1079 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    10af:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10b2:	8b 40 04             	mov    0x4(%eax),%eax
    10b5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    10bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10bf:	01 c2                	add    %eax,%edx
    10c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10c4:	8b 00                	mov    (%eax),%eax
    10c6:	39 c2                	cmp    %eax,%edx
    10c8:	75 24                	jne    10ee <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    10ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10cd:	8b 50 04             	mov    0x4(%eax),%edx
    10d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10d3:	8b 00                	mov    (%eax),%eax
    10d5:	8b 40 04             	mov    0x4(%eax),%eax
    10d8:	01 c2                	add    %eax,%edx
    10da:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10dd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    10e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10e3:	8b 00                	mov    (%eax),%eax
    10e5:	8b 10                	mov    (%eax),%edx
    10e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10ea:	89 10                	mov    %edx,(%eax)
    10ec:	eb 0a                	jmp    10f8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    10ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10f1:	8b 10                	mov    (%eax),%edx
    10f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10f6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    10f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10fb:	8b 40 04             	mov    0x4(%eax),%eax
    10fe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1105:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1108:	01 d0                	add    %edx,%eax
    110a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    110d:	75 20                	jne    112f <free+0xcf>
    p->s.size += bp->s.size;
    110f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1112:	8b 50 04             	mov    0x4(%eax),%edx
    1115:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1118:	8b 40 04             	mov    0x4(%eax),%eax
    111b:	01 c2                	add    %eax,%edx
    111d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1120:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1123:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1126:	8b 10                	mov    (%eax),%edx
    1128:	8b 45 fc             	mov    -0x4(%ebp),%eax
    112b:	89 10                	mov    %edx,(%eax)
    112d:	eb 08                	jmp    1137 <free+0xd7>
  } else
    p->s.ptr = bp;
    112f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1132:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1135:	89 10                	mov    %edx,(%eax)
  freep = p;
    1137:	8b 45 fc             	mov    -0x4(%ebp),%eax
    113a:	a3 64 18 00 00       	mov    %eax,0x1864
}
    113f:	c9                   	leave  
    1140:	c3                   	ret    

00001141 <morecore>:

static Header*
morecore(uint nu)
{
    1141:	55                   	push   %ebp
    1142:	89 e5                	mov    %esp,%ebp
    1144:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1147:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    114e:	77 07                	ja     1157 <morecore+0x16>
    nu = 4096;
    1150:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1157:	8b 45 08             	mov    0x8(%ebp),%eax
    115a:	c1 e0 03             	shl    $0x3,%eax
    115d:	89 04 24             	mov    %eax,(%esp)
    1160:	e8 87 fb ff ff       	call   cec <sbrk>
    1165:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1168:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    116c:	75 07                	jne    1175 <morecore+0x34>
    return 0;
    116e:	b8 00 00 00 00       	mov    $0x0,%eax
    1173:	eb 22                	jmp    1197 <morecore+0x56>
  hp = (Header*)p;
    1175:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1178:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    117b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    117e:	8b 55 08             	mov    0x8(%ebp),%edx
    1181:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1184:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1187:	83 c0 08             	add    $0x8,%eax
    118a:	89 04 24             	mov    %eax,(%esp)
    118d:	e8 ce fe ff ff       	call   1060 <free>
  return freep;
    1192:	a1 64 18 00 00       	mov    0x1864,%eax
}
    1197:	c9                   	leave  
    1198:	c3                   	ret    

00001199 <malloc>:

void*
malloc(uint nbytes)
{
    1199:	55                   	push   %ebp
    119a:	89 e5                	mov    %esp,%ebp
    119c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    119f:	8b 45 08             	mov    0x8(%ebp),%eax
    11a2:	83 c0 07             	add    $0x7,%eax
    11a5:	c1 e8 03             	shr    $0x3,%eax
    11a8:	40                   	inc    %eax
    11a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    11ac:	a1 64 18 00 00       	mov    0x1864,%eax
    11b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    11b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11b8:	75 23                	jne    11dd <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
    11ba:	c7 45 f0 5c 18 00 00 	movl   $0x185c,-0x10(%ebp)
    11c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11c4:	a3 64 18 00 00       	mov    %eax,0x1864
    11c9:	a1 64 18 00 00       	mov    0x1864,%eax
    11ce:	a3 5c 18 00 00       	mov    %eax,0x185c
    base.s.size = 0;
    11d3:	c7 05 60 18 00 00 00 	movl   $0x0,0x1860
    11da:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e0:	8b 00                	mov    (%eax),%eax
    11e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    11e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e8:	8b 40 04             	mov    0x4(%eax),%eax
    11eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    11ee:	72 4d                	jb     123d <malloc+0xa4>
      if(p->s.size == nunits)
    11f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11f3:	8b 40 04             	mov    0x4(%eax),%eax
    11f6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    11f9:	75 0c                	jne    1207 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
    11fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fe:	8b 10                	mov    (%eax),%edx
    1200:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1203:	89 10                	mov    %edx,(%eax)
    1205:	eb 26                	jmp    122d <malloc+0x94>
      else {
        p->s.size -= nunits;
    1207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    120a:	8b 40 04             	mov    0x4(%eax),%eax
    120d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1210:	89 c2                	mov    %eax,%edx
    1212:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1215:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1218:	8b 45 f4             	mov    -0xc(%ebp),%eax
    121b:	8b 40 04             	mov    0x4(%eax),%eax
    121e:	c1 e0 03             	shl    $0x3,%eax
    1221:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    1224:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1227:	8b 55 ec             	mov    -0x14(%ebp),%edx
    122a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    122d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1230:	a3 64 18 00 00       	mov    %eax,0x1864
      return (void*)(p + 1);
    1235:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1238:	83 c0 08             	add    $0x8,%eax
    123b:	eb 38                	jmp    1275 <malloc+0xdc>
    }
    if(p == freep)
    123d:	a1 64 18 00 00       	mov    0x1864,%eax
    1242:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1245:	75 1b                	jne    1262 <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
    1247:	8b 45 ec             	mov    -0x14(%ebp),%eax
    124a:	89 04 24             	mov    %eax,(%esp)
    124d:	e8 ef fe ff ff       	call   1141 <morecore>
    1252:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1255:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1259:	75 07                	jne    1262 <malloc+0xc9>
        return 0;
    125b:	b8 00 00 00 00       	mov    $0x0,%eax
    1260:	eb 13                	jmp    1275 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1262:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1265:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1268:	8b 45 f4             	mov    -0xc(%ebp),%eax
    126b:	8b 00                	mov    (%eax),%eax
    126d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1270:	e9 70 ff ff ff       	jmp    11e5 <malloc+0x4c>
}
    1275:	c9                   	leave  
    1276:	c3                   	ret    
