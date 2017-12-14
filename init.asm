
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <strcat>:
#include "fs.h"

char *argv[] = { "sh", 0 };

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

00000046 <add_file_size_disk>:

int
add_file_size_disk(char *path, char *c_name)
{
      46:	55                   	push   %ebp
      47:	89 e5                	mov    %esp,%ebp
      49:	81 ec 58 02 00 00    	sub    $0x258,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  //int z;
  int holder = 0;
      4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

  if((fd = open(path, 0)) < 0){
      56:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      5d:	00 
      5e:	8b 45 08             	mov    0x8(%ebp),%eax
      61:	89 04 24             	mov    %eax,(%esp)
      64:	e8 ab 09 00 00       	call   a14 <open>
      69:	89 45 f0             	mov    %eax,-0x10(%ebp)
      6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      70:	79 25                	jns    97 <add_file_size_disk+0x51>
    printf(2, "df: cannot open %s\n", path);
      72:	8b 45 08             	mov    0x8(%ebp),%eax
      75:	89 44 24 08          	mov    %eax,0x8(%esp)
      79:	c7 44 24 04 3a 10 00 	movl   $0x103a,0x4(%esp)
      80:	00 
      81:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      88:	e8 e4 0b 00 00       	call   c71 <printf>
    return 0;
      8d:	b8 00 00 00 00       	mov    $0x0,%eax
      92:	e9 fd 01 00 00       	jmp    294 <add_file_size_disk+0x24e>
  }

  if(fstat(fd, &st) < 0){
      97:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
      9d:	89 44 24 04          	mov    %eax,0x4(%esp)
      a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 80 09 00 00       	call   a2c <fstat>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 30                	jns    e0 <add_file_size_disk+0x9a>
    printf(2, "df: cannot stat %s\n", path);
      b0:	8b 45 08             	mov    0x8(%ebp),%eax
      b3:	89 44 24 08          	mov    %eax,0x8(%esp)
      b7:	c7 44 24 04 4e 10 00 	movl   $0x104e,0x4(%esp)
      be:	00 
      bf:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c6:	e8 a6 0b 00 00       	call   c71 <printf>
    close(fd);
      cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
      ce:	89 04 24             	mov    %eax,(%esp)
      d1:	e8 26 09 00 00       	call   9fc <close>
    return 0;
      d6:	b8 00 00 00 00       	mov    $0x0,%eax
      db:	e9 b4 01 00 00       	jmp    294 <add_file_size_disk+0x24e>
  }

  switch(st.type){
      e0:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
      e6:	98                   	cwtl   
      e7:	83 f8 01             	cmp    $0x1,%eax
      ea:	74 1c                	je     108 <add_file_size_disk+0xc2>
      ec:	83 f8 02             	cmp    $0x2,%eax
      ef:	0f 85 91 01 00 00    	jne    286 <add_file_size_disk+0x240>
  case T_FILE:
    holder += st.size;
      f5:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
      fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
      fe:	01 d0                	add    %edx,%eax
     100:	89 45 f4             	mov    %eax,-0xc(%ebp)
    break;
     103:	e9 7e 01 00 00       	jmp    286 <add_file_size_disk+0x240>
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     108:	8b 45 08             	mov    0x8(%ebp),%eax
     10b:	89 04 24             	mov    %eax,(%esp)
     10e:	e8 14 06 00 00       	call   727 <strlen>
     113:	83 c0 10             	add    $0x10,%eax
     116:	3d 00 02 00 00       	cmp    $0x200,%eax
     11b:	76 05                	jbe    122 <add_file_size_disk+0xdc>
      break;
     11d:	e9 64 01 00 00       	jmp    286 <add_file_size_disk+0x240>
    }
    strcpy(buf, path);
     122:	8b 45 08             	mov    0x8(%ebp),%eax
     125:	89 44 24 04          	mov    %eax,0x4(%esp)
     129:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     12f:	89 04 24             	mov    %eax,(%esp)
     132:	e8 8a 05 00 00       	call   6c1 <strcpy>
    p = buf+strlen(buf);
     137:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     13d:	89 04 24             	mov    %eax,(%esp)
     140:	e8 e2 05 00 00       	call   727 <strlen>
     145:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
     14b:	01 d0                	add    %edx,%eax
     14d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    *p++ = '/';
     150:	8b 45 ec             	mov    -0x14(%ebp),%eax
     153:	8d 50 01             	lea    0x1(%eax),%edx
     156:	89 55 ec             	mov    %edx,-0x14(%ebp)
     159:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     15c:	e9 fe 00 00 00       	jmp    25f <add_file_size_disk+0x219>
      if(de.inum == 0)
     161:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
     167:	66 85 c0             	test   %ax,%ax
     16a:	75 05                	jne    171 <add_file_size_disk+0x12b>
        continue;
     16c:	e9 ee 00 00 00       	jmp    25f <add_file_size_disk+0x219>
      memmove(p, de.name, DIRSIZ);
     171:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     178:	00 
     179:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     17f:	83 c0 02             	add    $0x2,%eax
     182:	89 44 24 04          	mov    %eax,0x4(%esp)
     186:	8b 45 ec             	mov    -0x14(%ebp),%eax
     189:	89 04 24             	mov    %eax,(%esp)
     18c:	e8 18 07 00 00       	call   8a9 <memmove>
      p[DIRSIZ] = 0;
     191:	8b 45 ec             	mov    -0x14(%ebp),%eax
     194:	83 c0 0e             	add    $0xe,%eax
     197:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
     19a:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
     1a0:	89 44 24 04          	mov    %eax,0x4(%esp)
     1a4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     1aa:	89 04 24             	mov    %eax,(%esp)
     1ad:	e8 5f 06 00 00       	call   811 <stat>
     1b2:	85 c0                	test   %eax,%eax
     1b4:	79 23                	jns    1d9 <add_file_size_disk+0x193>
        printf(1, "df: cannot stat %s\n", buf);
     1b6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     1bc:	89 44 24 08          	mov    %eax,0x8(%esp)
     1c0:	c7 44 24 04 4e 10 00 	movl   $0x104e,0x4(%esp)
     1c7:	00 
     1c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1cf:	e8 9d 0a 00 00       	call   c71 <printf>
        continue;
     1d4:	e9 86 00 00 00       	jmp    25f <add_file_size_disk+0x219>
      }
      if(st.type == 1){
     1d9:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
     1df:	66 83 f8 01          	cmp    $0x1,%ax
     1e3:	75 6c                	jne    251 <add_file_size_disk+0x20b>
        if(strcmp(de.name, "..") != 0 && strcmp(de.name, ".") != 0){
     1e5:	c7 44 24 04 62 10 00 	movl   $0x1062,0x4(%esp)
     1ec:	00 
     1ed:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     1f3:	83 c0 02             	add    $0x2,%eax
     1f6:	89 04 24             	mov    %eax,(%esp)
     1f9:	e8 f1 04 00 00       	call   6ef <strcmp>
     1fe:	85 c0                	test   %eax,%eax
     200:	74 4f                	je     251 <add_file_size_disk+0x20b>
     202:	c7 44 24 04 65 10 00 	movl   $0x1065,0x4(%esp)
     209:	00 
     20a:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     210:	83 c0 02             	add    $0x2,%eax
     213:	89 04 24             	mov    %eax,(%esp)
     216:	e8 d4 04 00 00       	call   6ef <strcmp>
     21b:	85 c0                	test   %eax,%eax
     21d:	74 32                	je     251 <add_file_size_disk+0x20b>
          char *dir_name = strcat(de.name, "/");
     21f:	c7 44 24 04 67 10 00 	movl   $0x1067,0x4(%esp)
     226:	00 
     227:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     22d:	83 c0 02             	add    $0x2,%eax
     230:	89 04 24             	mov    %eax,(%esp)
     233:	e8 c8 fd ff ff       	call   0 <strcat>
     238:	89 45 e8             	mov    %eax,-0x18(%ebp)
          holder += add_file_size_disk(dir_name, "");
     23b:	c7 44 24 04 69 10 00 	movl   $0x1069,0x4(%esp)
     242:	00 
     243:	8b 45 e8             	mov    -0x18(%ebp),%eax
     246:	89 04 24             	mov    %eax,(%esp)
     249:	e8 f8 fd ff ff       	call   46 <add_file_size_disk>
     24e:	01 45 f4             	add    %eax,-0xc(%ebp)
        }
      }
    holder += st.size;
     251:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
     257:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25a:	01 d0                	add    %edx,%eax
     25c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     25f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     266:	00 
     267:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     26d:	89 44 24 04          	mov    %eax,0x4(%esp)
     271:	8b 45 f0             	mov    -0x10(%ebp),%eax
     274:	89 04 24             	mov    %eax,(%esp)
     277:	e8 70 07 00 00       	call   9ec <read>
     27c:	83 f8 10             	cmp    $0x10,%eax
     27f:	0f 84 dc fe ff ff    	je     161 <add_file_size_disk+0x11b>
          holder += add_file_size_disk(dir_name, "");
        }
      }
    holder += st.size;
    }
    break;
     285:	90                   	nop
  }
  close(fd);
     286:	8b 45 f0             	mov    -0x10(%ebp),%eax
     289:	89 04 24             	mov    %eax,(%esp)
     28c:	e8 6b 07 00 00       	call   9fc <close>
  return holder;
     291:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     294:	c9                   	leave  
     295:	c3                   	ret    

00000296 <add_file_size>:

void
add_file_size(char *path, char *c_name)
{
     296:	55                   	push   %ebp
     297:	89 e5                	mov    %esp,%ebp
     299:	81 ec 58 02 00 00    	sub    $0x258,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  //int z;
  int holder = 0;
     29f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

  if((fd = open(path, 0)) < 0){
     2a6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2ad:	00 
     2ae:	8b 45 08             	mov    0x8(%ebp),%eax
     2b1:	89 04 24             	mov    %eax,(%esp)
     2b4:	e8 5b 07 00 00       	call   a14 <open>
     2b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
     2bc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     2c0:	79 20                	jns    2e2 <add_file_size+0x4c>
    printf(2, "df: cannot open %s\n", path);
     2c2:	8b 45 08             	mov    0x8(%ebp),%eax
     2c5:	89 44 24 08          	mov    %eax,0x8(%esp)
     2c9:	c7 44 24 04 3a 10 00 	movl   $0x103a,0x4(%esp)
     2d0:	00 
     2d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2d8:	e8 94 09 00 00       	call   c71 <printf>
    return;
     2dd:	e9 17 02 00 00       	jmp    4f9 <add_file_size+0x263>
  }

  if(fstat(fd, &st) < 0){
     2e2:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
     2e8:	89 44 24 04          	mov    %eax,0x4(%esp)
     2ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
     2ef:	89 04 24             	mov    %eax,(%esp)
     2f2:	e8 35 07 00 00       	call   a2c <fstat>
     2f7:	85 c0                	test   %eax,%eax
     2f9:	79 2b                	jns    326 <add_file_size+0x90>
    printf(2, "df: cannot stat %s\n", path);
     2fb:	8b 45 08             	mov    0x8(%ebp),%eax
     2fe:	89 44 24 08          	mov    %eax,0x8(%esp)
     302:	c7 44 24 04 4e 10 00 	movl   $0x104e,0x4(%esp)
     309:	00 
     30a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     311:	e8 5b 09 00 00       	call   c71 <printf>
    close(fd);
     316:	8b 45 f0             	mov    -0x10(%ebp),%eax
     319:	89 04 24             	mov    %eax,(%esp)
     31c:	e8 db 06 00 00       	call   9fc <close>
    return;
     321:	e9 d3 01 00 00       	jmp    4f9 <add_file_size+0x263>
  }

  switch(st.type){
     326:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
     32c:	98                   	cwtl   
     32d:	83 f8 01             	cmp    $0x1,%eax
     330:	74 1c                	je     34e <add_file_size+0xb8>
     332:	83 f8 02             	cmp    $0x2,%eax
     335:	0f 85 91 01 00 00    	jne    4cc <add_file_size+0x236>
  case T_FILE:
    holder += st.size;
     33b:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
     341:	8b 45 f4             	mov    -0xc(%ebp),%eax
     344:	01 d0                	add    %edx,%eax
     346:	89 45 f4             	mov    %eax,-0xc(%ebp)
    break;
     349:	e9 7e 01 00 00       	jmp    4cc <add_file_size+0x236>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     34e:	8b 45 08             	mov    0x8(%ebp),%eax
     351:	89 04 24             	mov    %eax,(%esp)
     354:	e8 ce 03 00 00       	call   727 <strlen>
     359:	83 c0 10             	add    $0x10,%eax
     35c:	3d 00 02 00 00       	cmp    $0x200,%eax
     361:	76 05                	jbe    368 <add_file_size+0xd2>
      break;
     363:	e9 64 01 00 00       	jmp    4cc <add_file_size+0x236>
    }
    strcpy(buf, path);
     368:	8b 45 08             	mov    0x8(%ebp),%eax
     36b:	89 44 24 04          	mov    %eax,0x4(%esp)
     36f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     375:	89 04 24             	mov    %eax,(%esp)
     378:	e8 44 03 00 00       	call   6c1 <strcpy>
    p = buf+strlen(buf);
     37d:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     383:	89 04 24             	mov    %eax,(%esp)
     386:	e8 9c 03 00 00       	call   727 <strlen>
     38b:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
     391:	01 d0                	add    %edx,%eax
     393:	89 45 ec             	mov    %eax,-0x14(%ebp)
    *p++ = '/';
     396:	8b 45 ec             	mov    -0x14(%ebp),%eax
     399:	8d 50 01             	lea    0x1(%eax),%edx
     39c:	89 55 ec             	mov    %edx,-0x14(%ebp)
     39f:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     3a2:	e9 fe 00 00 00       	jmp    4a5 <add_file_size+0x20f>
      if(de.inum == 0)
     3a7:	8b 85 d8 fd ff ff    	mov    -0x228(%ebp),%eax
     3ad:	66 85 c0             	test   %ax,%ax
     3b0:	75 05                	jne    3b7 <add_file_size+0x121>
        continue;
     3b2:	e9 ee 00 00 00       	jmp    4a5 <add_file_size+0x20f>
      //printf(1, "DE name: %s\n DE type %d\n",de.type, de.tpye);
      memmove(p, de.name, DIRSIZ);
     3b7:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     3be:	00 
     3bf:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     3c5:	83 c0 02             	add    $0x2,%eax
     3c8:	89 44 24 04          	mov    %eax,0x4(%esp)
     3cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3cf:	89 04 24             	mov    %eax,(%esp)
     3d2:	e8 d2 04 00 00       	call   8a9 <memmove>
      p[DIRSIZ] = 0;
     3d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3da:	83 c0 0e             	add    $0xe,%eax
     3dd:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
     3e0:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
     3e6:	89 44 24 04          	mov    %eax,0x4(%esp)
     3ea:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     3f0:	89 04 24             	mov    %eax,(%esp)
     3f3:	e8 19 04 00 00       	call   811 <stat>
     3f8:	85 c0                	test   %eax,%eax
     3fa:	79 23                	jns    41f <add_file_size+0x189>
        printf(1, "df: cannot stat %s\n", buf);
     3fc:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     402:	89 44 24 08          	mov    %eax,0x8(%esp)
     406:	c7 44 24 04 4e 10 00 	movl   $0x104e,0x4(%esp)
     40d:	00 
     40e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     415:	e8 57 08 00 00       	call   c71 <printf>
        continue;
     41a:	e9 86 00 00 00       	jmp    4a5 <add_file_size+0x20f>
      }
      if(st.type == 1){
     41f:	8b 85 c4 fd ff ff    	mov    -0x23c(%ebp),%eax
     425:	66 83 f8 01          	cmp    $0x1,%ax
     429:	75 6c                	jne    497 <add_file_size+0x201>
        if(strcmp(de.name, "..") != 0 && strcmp(de.name, ".") != 0){
     42b:	c7 44 24 04 62 10 00 	movl   $0x1062,0x4(%esp)
     432:	00 
     433:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     439:	83 c0 02             	add    $0x2,%eax
     43c:	89 04 24             	mov    %eax,(%esp)
     43f:	e8 ab 02 00 00       	call   6ef <strcmp>
     444:	85 c0                	test   %eax,%eax
     446:	74 4f                	je     497 <add_file_size+0x201>
     448:	c7 44 24 04 65 10 00 	movl   $0x1065,0x4(%esp)
     44f:	00 
     450:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     456:	83 c0 02             	add    $0x2,%eax
     459:	89 04 24             	mov    %eax,(%esp)
     45c:	e8 8e 02 00 00       	call   6ef <strcmp>
     461:	85 c0                	test   %eax,%eax
     463:	74 32                	je     497 <add_file_size+0x201>
          char *dir_name = strcat(de.name, "/");
     465:	c7 44 24 04 67 10 00 	movl   $0x1067,0x4(%esp)
     46c:	00 
     46d:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     473:	83 c0 02             	add    $0x2,%eax
     476:	89 04 24             	mov    %eax,(%esp)
     479:	e8 82 fb ff ff       	call   0 <strcat>
     47e:	89 45 e8             	mov    %eax,-0x18(%ebp)
          holder += add_file_size_disk(dir_name, "");
     481:	c7 44 24 04 69 10 00 	movl   $0x1069,0x4(%esp)
     488:	00 
     489:	8b 45 e8             	mov    -0x18(%ebp),%eax
     48c:	89 04 24             	mov    %eax,(%esp)
     48f:	e8 b2 fb ff ff       	call   46 <add_file_size_disk>
     494:	01 45 f4             	add    %eax,-0xc(%ebp)
        }
      }
    holder += st.size;
     497:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
     49d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4a0:	01 d0                	add    %edx,%eax
     4a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     4a5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     4ac:	00 
     4ad:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
     4b3:	89 44 24 04          	mov    %eax,0x4(%esp)
     4b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4ba:	89 04 24             	mov    %eax,(%esp)
     4bd:	e8 2a 05 00 00       	call   9ec <read>
     4c2:	83 f8 10             	cmp    $0x10,%eax
     4c5:	0f 84 dc fe ff ff    	je     3a7 <add_file_size+0x111>
          holder += add_file_size_disk(dir_name, "");
        }
      }
    holder += st.size;
    }
    break;
     4cb:	90                   	nop
  }
  if(strcmp(c_name, "") == 0){
     4cc:	c7 44 24 04 69 10 00 	movl   $0x1069,0x4(%esp)
     4d3:	00 
     4d4:	8b 45 0c             	mov    0xc(%ebp),%eax
     4d7:	89 04 24             	mov    %eax,(%esp)
     4da:	e8 10 02 00 00       	call   6ef <strcmp>
     4df:	85 c0                	test   %eax,%eax
     4e1:	75 0b                	jne    4ee <add_file_size+0x258>
    set_os(holder);
     4e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e6:	89 04 24             	mov    %eax,(%esp)
     4e9:	e8 8e 06 00 00       	call   b7c <set_os>
  }
  close(fd);
     4ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4f1:	89 04 24             	mov    %eax,(%esp)
     4f4:	e8 03 05 00 00       	call   9fc <close>
}
     4f9:	c9                   	leave  
     4fa:	c3                   	ret    

000004fb <create_vcs>:



void
create_vcs(void)
{
     4fb:	55                   	push   %ebp
     4fc:	89 e5                	mov    %esp,%ebp
     4fe:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char *dname = "vc0";
     501:	c7 45 f0 6a 10 00 00 	movl   $0x106a,-0x10(%ebp)

  for (i = 0; i < 4; i++) {
     508:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     50f:	eb 58                	jmp    569 <create_vcs+0x6e>
    dname[2] = '0' + i;
     511:	8b 45 f0             	mov    -0x10(%ebp),%eax
     514:	8d 50 02             	lea    0x2(%eax),%edx
     517:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51a:	83 c0 30             	add    $0x30,%eax
     51d:	88 02                	mov    %al,(%edx)
    if ((fd = open(dname, O_RDWR)) < 0){
     51f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     526:	00 
     527:	8b 45 f0             	mov    -0x10(%ebp),%eax
     52a:	89 04 24             	mov    %eax,(%esp)
     52d:	e8 e2 04 00 00       	call   a14 <open>
     532:	89 45 ec             	mov    %eax,-0x14(%ebp)
     535:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     539:	79 20                	jns    55b <create_vcs+0x60>
      mknod(dname, 1, i + 2);
     53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     53e:	83 c0 02             	add    $0x2,%eax
     541:	98                   	cwtl   
     542:	89 44 24 08          	mov    %eax,0x8(%esp)
     546:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     54d:	00 
     54e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     551:	89 04 24             	mov    %eax,(%esp)
     554:	e8 c3 04 00 00       	call   a1c <mknod>
     559:	eb 0b                	jmp    566 <create_vcs+0x6b>
    } else {
      close(fd);
     55b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     55e:	89 04 24             	mov    %eax,(%esp)
     561:	e8 96 04 00 00       	call   9fc <close>
create_vcs(void)
{
  int i, fd;
  char *dname = "vc0";

  for (i = 0; i < 4; i++) {
     566:	ff 45 f4             	incl   -0xc(%ebp)
     569:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
     56d:	7e a2                	jle    511 <create_vcs+0x16>
      mknod(dname, 1, i + 2);
    } else {
      close(fd);
    }
  }
}
     56f:	c9                   	leave  
     570:	c3                   	ret    

00000571 <main>:

int
main(void)
{
     571:	55                   	push   %ebp
     572:	89 e5                	mov    %esp,%ebp
     574:	83 e4 f0             	and    $0xfffffff0,%esp
     577:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
     57a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     581:	00 
     582:	c7 04 24 6e 10 00 00 	movl   $0x106e,(%esp)
     589:	e8 86 04 00 00       	call   a14 <open>
     58e:	85 c0                	test   %eax,%eax
     590:	79 30                	jns    5c2 <main+0x51>
    mknod("console", 1, 1);
     592:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     599:	00 
     59a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     5a1:	00 
     5a2:	c7 04 24 6e 10 00 00 	movl   $0x106e,(%esp)
     5a9:	e8 6e 04 00 00       	call   a1c <mknod>
    open("console", O_RDWR);
     5ae:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     5b5:	00 
     5b6:	c7 04 24 6e 10 00 00 	movl   $0x106e,(%esp)
     5bd:	e8 52 04 00 00       	call   a14 <open>
  }
  dup(0);  // stdout
     5c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     5c9:	e8 7e 04 00 00       	call   a4c <dup>
  dup(0);  // stderr
     5ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     5d5:	e8 72 04 00 00       	call   a4c <dup>

  create_vcs();
     5da:	e8 1c ff ff ff       	call   4fb <create_vcs>

  add_file_size("", "");
     5df:	c7 44 24 04 69 10 00 	movl   $0x1069,0x4(%esp)
     5e6:	00 
     5e7:	c7 04 24 69 10 00 00 	movl   $0x1069,(%esp)
     5ee:	e8 a3 fc ff ff       	call   296 <add_file_size>
  for(;;){
    printf(1, "init: starting sh\n");
     5f3:	c7 44 24 04 76 10 00 	movl   $0x1076,0x4(%esp)
     5fa:	00 
     5fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     602:	e8 6a 06 00 00       	call   c71 <printf>
    pid = fork();
     607:	e8 c0 03 00 00       	call   9cc <fork>
     60c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
     610:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     615:	79 19                	jns    630 <main+0xbf>
      printf(1, "init: fork failed\n");
     617:	c7 44 24 04 89 10 00 	movl   $0x1089,0x4(%esp)
     61e:	00 
     61f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     626:	e8 46 06 00 00       	call   c71 <printf>
      exit();
     62b:	e8 a4 03 00 00       	call   9d4 <exit>
    }
    if(pid == 0){
     630:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     635:	75 2d                	jne    664 <main+0xf3>
      exec("sh", argv);
     637:	c7 44 24 04 ac 13 00 	movl   $0x13ac,0x4(%esp)
     63e:	00 
     63f:	c7 04 24 37 10 00 00 	movl   $0x1037,(%esp)
     646:	e8 c1 03 00 00       	call   a0c <exec>
      printf(1, "init: exec sh failed\n");
     64b:	c7 44 24 04 9c 10 00 	movl   $0x109c,0x4(%esp)
     652:	00 
     653:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     65a:	e8 12 06 00 00       	call   c71 <printf>
      exit();
     65f:	e8 70 03 00 00       	call   9d4 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
     664:	eb 14                	jmp    67a <main+0x109>
      printf(1, "zombie!\n");
     666:	c7 44 24 04 b2 10 00 	movl   $0x10b2,0x4(%esp)
     66d:	00 
     66e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     675:	e8 f7 05 00 00       	call   c71 <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
     67a:	e8 5d 03 00 00       	call   9dc <wait>
     67f:	89 44 24 18          	mov    %eax,0x18(%esp)
     683:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
     688:	78 0a                	js     694 <main+0x123>
     68a:	8b 44 24 18          	mov    0x18(%esp),%eax
     68e:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
     692:	75 d2                	jne    666 <main+0xf5>
      printf(1, "zombie!\n");
  }
     694:	e9 5a ff ff ff       	jmp    5f3 <main+0x82>
     699:	90                   	nop
     69a:	90                   	nop
     69b:	90                   	nop

0000069c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     69c:	55                   	push   %ebp
     69d:	89 e5                	mov    %esp,%ebp
     69f:	57                   	push   %edi
     6a0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     6a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
     6a4:	8b 55 10             	mov    0x10(%ebp),%edx
     6a7:	8b 45 0c             	mov    0xc(%ebp),%eax
     6aa:	89 cb                	mov    %ecx,%ebx
     6ac:	89 df                	mov    %ebx,%edi
     6ae:	89 d1                	mov    %edx,%ecx
     6b0:	fc                   	cld    
     6b1:	f3 aa                	rep stos %al,%es:(%edi)
     6b3:	89 ca                	mov    %ecx,%edx
     6b5:	89 fb                	mov    %edi,%ebx
     6b7:	89 5d 08             	mov    %ebx,0x8(%ebp)
     6ba:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     6bd:	5b                   	pop    %ebx
     6be:	5f                   	pop    %edi
     6bf:	5d                   	pop    %ebp
     6c0:	c3                   	ret    

000006c1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     6c1:	55                   	push   %ebp
     6c2:	89 e5                	mov    %esp,%ebp
     6c4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     6c7:	8b 45 08             	mov    0x8(%ebp),%eax
     6ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     6cd:	90                   	nop
     6ce:	8b 45 08             	mov    0x8(%ebp),%eax
     6d1:	8d 50 01             	lea    0x1(%eax),%edx
     6d4:	89 55 08             	mov    %edx,0x8(%ebp)
     6d7:	8b 55 0c             	mov    0xc(%ebp),%edx
     6da:	8d 4a 01             	lea    0x1(%edx),%ecx
     6dd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     6e0:	8a 12                	mov    (%edx),%dl
     6e2:	88 10                	mov    %dl,(%eax)
     6e4:	8a 00                	mov    (%eax),%al
     6e6:	84 c0                	test   %al,%al
     6e8:	75 e4                	jne    6ce <strcpy+0xd>
    ;
  return os;
     6ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     6ed:	c9                   	leave  
     6ee:	c3                   	ret    

000006ef <strcmp>:

int
strcmp(const char *p, const char *q)
{
     6ef:	55                   	push   %ebp
     6f0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     6f2:	eb 06                	jmp    6fa <strcmp+0xb>
    p++, q++;
     6f4:	ff 45 08             	incl   0x8(%ebp)
     6f7:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     6fa:	8b 45 08             	mov    0x8(%ebp),%eax
     6fd:	8a 00                	mov    (%eax),%al
     6ff:	84 c0                	test   %al,%al
     701:	74 0e                	je     711 <strcmp+0x22>
     703:	8b 45 08             	mov    0x8(%ebp),%eax
     706:	8a 10                	mov    (%eax),%dl
     708:	8b 45 0c             	mov    0xc(%ebp),%eax
     70b:	8a 00                	mov    (%eax),%al
     70d:	38 c2                	cmp    %al,%dl
     70f:	74 e3                	je     6f4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     711:	8b 45 08             	mov    0x8(%ebp),%eax
     714:	8a 00                	mov    (%eax),%al
     716:	0f b6 d0             	movzbl %al,%edx
     719:	8b 45 0c             	mov    0xc(%ebp),%eax
     71c:	8a 00                	mov    (%eax),%al
     71e:	0f b6 c0             	movzbl %al,%eax
     721:	29 c2                	sub    %eax,%edx
     723:	89 d0                	mov    %edx,%eax
}
     725:	5d                   	pop    %ebp
     726:	c3                   	ret    

00000727 <strlen>:

uint
strlen(char *s)
{
     727:	55                   	push   %ebp
     728:	89 e5                	mov    %esp,%ebp
     72a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     72d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     734:	eb 03                	jmp    739 <strlen+0x12>
     736:	ff 45 fc             	incl   -0x4(%ebp)
     739:	8b 55 fc             	mov    -0x4(%ebp),%edx
     73c:	8b 45 08             	mov    0x8(%ebp),%eax
     73f:	01 d0                	add    %edx,%eax
     741:	8a 00                	mov    (%eax),%al
     743:	84 c0                	test   %al,%al
     745:	75 ef                	jne    736 <strlen+0xf>
    ;
  return n;
     747:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     74a:	c9                   	leave  
     74b:	c3                   	ret    

0000074c <memset>:

void*
memset(void *dst, int c, uint n)
{
     74c:	55                   	push   %ebp
     74d:	89 e5                	mov    %esp,%ebp
     74f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     752:	8b 45 10             	mov    0x10(%ebp),%eax
     755:	89 44 24 08          	mov    %eax,0x8(%esp)
     759:	8b 45 0c             	mov    0xc(%ebp),%eax
     75c:	89 44 24 04          	mov    %eax,0x4(%esp)
     760:	8b 45 08             	mov    0x8(%ebp),%eax
     763:	89 04 24             	mov    %eax,(%esp)
     766:	e8 31 ff ff ff       	call   69c <stosb>
  return dst;
     76b:	8b 45 08             	mov    0x8(%ebp),%eax
}
     76e:	c9                   	leave  
     76f:	c3                   	ret    

00000770 <strchr>:

char*
strchr(const char *s, char c)
{
     770:	55                   	push   %ebp
     771:	89 e5                	mov    %esp,%ebp
     773:	83 ec 04             	sub    $0x4,%esp
     776:	8b 45 0c             	mov    0xc(%ebp),%eax
     779:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     77c:	eb 12                	jmp    790 <strchr+0x20>
    if(*s == c)
     77e:	8b 45 08             	mov    0x8(%ebp),%eax
     781:	8a 00                	mov    (%eax),%al
     783:	3a 45 fc             	cmp    -0x4(%ebp),%al
     786:	75 05                	jne    78d <strchr+0x1d>
      return (char*)s;
     788:	8b 45 08             	mov    0x8(%ebp),%eax
     78b:	eb 11                	jmp    79e <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     78d:	ff 45 08             	incl   0x8(%ebp)
     790:	8b 45 08             	mov    0x8(%ebp),%eax
     793:	8a 00                	mov    (%eax),%al
     795:	84 c0                	test   %al,%al
     797:	75 e5                	jne    77e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     799:	b8 00 00 00 00       	mov    $0x0,%eax
}
     79e:	c9                   	leave  
     79f:	c3                   	ret    

000007a0 <gets>:

char*
gets(char *buf, int max)
{
     7a0:	55                   	push   %ebp
     7a1:	89 e5                	mov    %esp,%ebp
     7a3:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     7a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7ad:	eb 49                	jmp    7f8 <gets+0x58>
    cc = read(0, &c, 1);
     7af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     7b6:	00 
     7b7:	8d 45 ef             	lea    -0x11(%ebp),%eax
     7ba:	89 44 24 04          	mov    %eax,0x4(%esp)
     7be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     7c5:	e8 22 02 00 00       	call   9ec <read>
     7ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     7cd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     7d1:	7f 02                	jg     7d5 <gets+0x35>
      break;
     7d3:	eb 2c                	jmp    801 <gets+0x61>
    buf[i++] = c;
     7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7d8:	8d 50 01             	lea    0x1(%eax),%edx
     7db:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7de:	89 c2                	mov    %eax,%edx
     7e0:	8b 45 08             	mov    0x8(%ebp),%eax
     7e3:	01 c2                	add    %eax,%edx
     7e5:	8a 45 ef             	mov    -0x11(%ebp),%al
     7e8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     7ea:	8a 45 ef             	mov    -0x11(%ebp),%al
     7ed:	3c 0a                	cmp    $0xa,%al
     7ef:	74 10                	je     801 <gets+0x61>
     7f1:	8a 45 ef             	mov    -0x11(%ebp),%al
     7f4:	3c 0d                	cmp    $0xd,%al
     7f6:	74 09                	je     801 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7fb:	40                   	inc    %eax
     7fc:	3b 45 0c             	cmp    0xc(%ebp),%eax
     7ff:	7c ae                	jl     7af <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     801:	8b 55 f4             	mov    -0xc(%ebp),%edx
     804:	8b 45 08             	mov    0x8(%ebp),%eax
     807:	01 d0                	add    %edx,%eax
     809:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     80c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     80f:	c9                   	leave  
     810:	c3                   	ret    

00000811 <stat>:

int
stat(char *n, struct stat *st)
{
     811:	55                   	push   %ebp
     812:	89 e5                	mov    %esp,%ebp
     814:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     817:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     81e:	00 
     81f:	8b 45 08             	mov    0x8(%ebp),%eax
     822:	89 04 24             	mov    %eax,(%esp)
     825:	e8 ea 01 00 00       	call   a14 <open>
     82a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     82d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     831:	79 07                	jns    83a <stat+0x29>
    return -1;
     833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     838:	eb 23                	jmp    85d <stat+0x4c>
  r = fstat(fd, st);
     83a:	8b 45 0c             	mov    0xc(%ebp),%eax
     83d:	89 44 24 04          	mov    %eax,0x4(%esp)
     841:	8b 45 f4             	mov    -0xc(%ebp),%eax
     844:	89 04 24             	mov    %eax,(%esp)
     847:	e8 e0 01 00 00       	call   a2c <fstat>
     84c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     852:	89 04 24             	mov    %eax,(%esp)
     855:	e8 a2 01 00 00       	call   9fc <close>
  return r;
     85a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     85d:	c9                   	leave  
     85e:	c3                   	ret    

0000085f <atoi>:

int
atoi(const char *s)
{
     85f:	55                   	push   %ebp
     860:	89 e5                	mov    %esp,%ebp
     862:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     865:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     86c:	eb 24                	jmp    892 <atoi+0x33>
    n = n*10 + *s++ - '0';
     86e:	8b 55 fc             	mov    -0x4(%ebp),%edx
     871:	89 d0                	mov    %edx,%eax
     873:	c1 e0 02             	shl    $0x2,%eax
     876:	01 d0                	add    %edx,%eax
     878:	01 c0                	add    %eax,%eax
     87a:	89 c1                	mov    %eax,%ecx
     87c:	8b 45 08             	mov    0x8(%ebp),%eax
     87f:	8d 50 01             	lea    0x1(%eax),%edx
     882:	89 55 08             	mov    %edx,0x8(%ebp)
     885:	8a 00                	mov    (%eax),%al
     887:	0f be c0             	movsbl %al,%eax
     88a:	01 c8                	add    %ecx,%eax
     88c:	83 e8 30             	sub    $0x30,%eax
     88f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     892:	8b 45 08             	mov    0x8(%ebp),%eax
     895:	8a 00                	mov    (%eax),%al
     897:	3c 2f                	cmp    $0x2f,%al
     899:	7e 09                	jle    8a4 <atoi+0x45>
     89b:	8b 45 08             	mov    0x8(%ebp),%eax
     89e:	8a 00                	mov    (%eax),%al
     8a0:	3c 39                	cmp    $0x39,%al
     8a2:	7e ca                	jle    86e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     8a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     8a7:	c9                   	leave  
     8a8:	c3                   	ret    

000008a9 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     8a9:	55                   	push   %ebp
     8aa:	89 e5                	mov    %esp,%ebp
     8ac:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
     8af:	8b 45 08             	mov    0x8(%ebp),%eax
     8b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     8b5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     8bb:	eb 16                	jmp    8d3 <memmove+0x2a>
    *dst++ = *src++;
     8bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8c0:	8d 50 01             	lea    0x1(%eax),%edx
     8c3:	89 55 fc             	mov    %edx,-0x4(%ebp)
     8c6:	8b 55 f8             	mov    -0x8(%ebp),%edx
     8c9:	8d 4a 01             	lea    0x1(%edx),%ecx
     8cc:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     8cf:	8a 12                	mov    (%edx),%dl
     8d1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     8d3:	8b 45 10             	mov    0x10(%ebp),%eax
     8d6:	8d 50 ff             	lea    -0x1(%eax),%edx
     8d9:	89 55 10             	mov    %edx,0x10(%ebp)
     8dc:	85 c0                	test   %eax,%eax
     8de:	7f dd                	jg     8bd <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     8e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
     8e3:	c9                   	leave  
     8e4:	c3                   	ret    

000008e5 <itoa>:

int itoa(int value, char *sp, int radix)
{
     8e5:	55                   	push   %ebp
     8e6:	89 e5                	mov    %esp,%ebp
     8e8:	53                   	push   %ebx
     8e9:	83 ec 30             	sub    $0x30,%esp
  char tmp[16];
  char *tp = tmp;
     8ec:	8d 45 d8             	lea    -0x28(%ebp),%eax
     8ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  int i;
  unsigned v;

  int sign = (radix == 10 && value < 0);    
     8f2:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
     8f6:	75 0d                	jne    905 <itoa+0x20>
     8f8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     8fc:	79 07                	jns    905 <itoa+0x20>
     8fe:	b8 01 00 00 00       	mov    $0x1,%eax
     903:	eb 05                	jmp    90a <itoa+0x25>
     905:	b8 00 00 00 00       	mov    $0x0,%eax
     90a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if (sign)
     90d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     911:	74 0a                	je     91d <itoa+0x38>
      v = -value;
     913:	8b 45 08             	mov    0x8(%ebp),%eax
     916:	f7 d8                	neg    %eax
     918:	89 45 f4             	mov    %eax,-0xc(%ebp)
  else
      v = (unsigned)value;

  while (v || tp == tmp)
     91b:	eb 54                	jmp    971 <itoa+0x8c>

  int sign = (radix == 10 && value < 0);    
  if (sign)
      v = -value;
  else
      v = (unsigned)value;
     91d:	8b 45 08             	mov    0x8(%ebp),%eax
     920:	89 45 f4             	mov    %eax,-0xc(%ebp)

  while (v || tp == tmp)
     923:	eb 4c                	jmp    971 <itoa+0x8c>
  {
    i = v % radix;
     925:	8b 4d 10             	mov    0x10(%ebp),%ecx
     928:	8b 45 f4             	mov    -0xc(%ebp),%eax
     92b:	ba 00 00 00 00       	mov    $0x0,%edx
     930:	f7 f1                	div    %ecx
     932:	89 d0                	mov    %edx,%eax
     934:	89 45 e8             	mov    %eax,-0x18(%ebp)
    v /= radix; // v/=radix uses less CPU clocks than v=v/radix does
     937:	8b 5d 10             	mov    0x10(%ebp),%ebx
     93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     93d:	ba 00 00 00 00       	mov    $0x0,%edx
     942:	f7 f3                	div    %ebx
     944:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (i < 10)
     947:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
     94b:	7f 13                	jg     960 <itoa+0x7b>
      *tp++ = i+'0';
     94d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     950:	8d 50 01             	lea    0x1(%eax),%edx
     953:	89 55 f8             	mov    %edx,-0x8(%ebp)
     956:	8b 55 e8             	mov    -0x18(%ebp),%edx
     959:	83 c2 30             	add    $0x30,%edx
     95c:	88 10                	mov    %dl,(%eax)
     95e:	eb 11                	jmp    971 <itoa+0x8c>
    else
      *tp++ = i + 'a' - 10;
     960:	8b 45 f8             	mov    -0x8(%ebp),%eax
     963:	8d 50 01             	lea    0x1(%eax),%edx
     966:	89 55 f8             	mov    %edx,-0x8(%ebp)
     969:	8b 55 e8             	mov    -0x18(%ebp),%edx
     96c:	83 c2 57             	add    $0x57,%edx
     96f:	88 10                	mov    %dl,(%eax)
  if (sign)
      v = -value;
  else
      v = (unsigned)value;

  while (v || tp == tmp)
     971:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     975:	75 ae                	jne    925 <itoa+0x40>
     977:	8d 45 d8             	lea    -0x28(%ebp),%eax
     97a:	39 45 f8             	cmp    %eax,-0x8(%ebp)
     97d:	74 a6                	je     925 <itoa+0x40>
      *tp++ = i+'0';
    else
      *tp++ = i + 'a' - 10;
  }

  int len = tp - tmp;
     97f:	8b 55 f8             	mov    -0x8(%ebp),%edx
     982:	8d 45 d8             	lea    -0x28(%ebp),%eax
     985:	29 c2                	sub    %eax,%edx
     987:	89 d0                	mov    %edx,%eax
     989:	89 45 f0             	mov    %eax,-0x10(%ebp)

  if (sign) 
     98c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     990:	74 11                	je     9a3 <itoa+0xbe>
  {
    *sp++ = '-';
     992:	8b 45 0c             	mov    0xc(%ebp),%eax
     995:	8d 50 01             	lea    0x1(%eax),%edx
     998:	89 55 0c             	mov    %edx,0xc(%ebp)
     99b:	c6 00 2d             	movb   $0x2d,(%eax)
    len++;
     99e:	ff 45 f0             	incl   -0x10(%ebp)
  }

  while (tp > tmp)
     9a1:	eb 15                	jmp    9b8 <itoa+0xd3>
     9a3:	eb 13                	jmp    9b8 <itoa+0xd3>
    *sp++ = *--tp;
     9a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     9a8:	8d 50 01             	lea    0x1(%eax),%edx
     9ab:	89 55 0c             	mov    %edx,0xc(%ebp)
     9ae:	ff 4d f8             	decl   -0x8(%ebp)
     9b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
     9b4:	8a 12                	mov    (%edx),%dl
     9b6:	88 10                	mov    %dl,(%eax)
  {
    *sp++ = '-';
    len++;
  }

  while (tp > tmp)
     9b8:	8d 45 d8             	lea    -0x28(%ebp),%eax
     9bb:	39 45 f8             	cmp    %eax,-0x8(%ebp)
     9be:	77 e5                	ja     9a5 <itoa+0xc0>
    *sp++ = *--tp;

  return len;
     9c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     9c3:	83 c4 30             	add    $0x30,%esp
     9c6:	5b                   	pop    %ebx
     9c7:	5d                   	pop    %ebp
     9c8:	c3                   	ret    
     9c9:	90                   	nop
     9ca:	90                   	nop
     9cb:	90                   	nop

000009cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     9cc:	b8 01 00 00 00       	mov    $0x1,%eax
     9d1:	cd 40                	int    $0x40
     9d3:	c3                   	ret    

000009d4 <exit>:
SYSCALL(exit)
     9d4:	b8 02 00 00 00       	mov    $0x2,%eax
     9d9:	cd 40                	int    $0x40
     9db:	c3                   	ret    

000009dc <wait>:
SYSCALL(wait)
     9dc:	b8 03 00 00 00       	mov    $0x3,%eax
     9e1:	cd 40                	int    $0x40
     9e3:	c3                   	ret    

000009e4 <pipe>:
SYSCALL(pipe)
     9e4:	b8 04 00 00 00       	mov    $0x4,%eax
     9e9:	cd 40                	int    $0x40
     9eb:	c3                   	ret    

000009ec <read>:
SYSCALL(read)
     9ec:	b8 05 00 00 00       	mov    $0x5,%eax
     9f1:	cd 40                	int    $0x40
     9f3:	c3                   	ret    

000009f4 <write>:
SYSCALL(write)
     9f4:	b8 10 00 00 00       	mov    $0x10,%eax
     9f9:	cd 40                	int    $0x40
     9fb:	c3                   	ret    

000009fc <close>:
SYSCALL(close)
     9fc:	b8 15 00 00 00       	mov    $0x15,%eax
     a01:	cd 40                	int    $0x40
     a03:	c3                   	ret    

00000a04 <kill>:
SYSCALL(kill)
     a04:	b8 06 00 00 00       	mov    $0x6,%eax
     a09:	cd 40                	int    $0x40
     a0b:	c3                   	ret    

00000a0c <exec>:
SYSCALL(exec)
     a0c:	b8 07 00 00 00       	mov    $0x7,%eax
     a11:	cd 40                	int    $0x40
     a13:	c3                   	ret    

00000a14 <open>:
SYSCALL(open)
     a14:	b8 0f 00 00 00       	mov    $0xf,%eax
     a19:	cd 40                	int    $0x40
     a1b:	c3                   	ret    

00000a1c <mknod>:
SYSCALL(mknod)
     a1c:	b8 11 00 00 00       	mov    $0x11,%eax
     a21:	cd 40                	int    $0x40
     a23:	c3                   	ret    

00000a24 <unlink>:
SYSCALL(unlink)
     a24:	b8 12 00 00 00       	mov    $0x12,%eax
     a29:	cd 40                	int    $0x40
     a2b:	c3                   	ret    

00000a2c <fstat>:
SYSCALL(fstat)
     a2c:	b8 08 00 00 00       	mov    $0x8,%eax
     a31:	cd 40                	int    $0x40
     a33:	c3                   	ret    

00000a34 <link>:
SYSCALL(link)
     a34:	b8 13 00 00 00       	mov    $0x13,%eax
     a39:	cd 40                	int    $0x40
     a3b:	c3                   	ret    

00000a3c <mkdir>:
SYSCALL(mkdir)
     a3c:	b8 14 00 00 00       	mov    $0x14,%eax
     a41:	cd 40                	int    $0x40
     a43:	c3                   	ret    

00000a44 <chdir>:
SYSCALL(chdir)
     a44:	b8 09 00 00 00       	mov    $0x9,%eax
     a49:	cd 40                	int    $0x40
     a4b:	c3                   	ret    

00000a4c <dup>:
SYSCALL(dup)
     a4c:	b8 0a 00 00 00       	mov    $0xa,%eax
     a51:	cd 40                	int    $0x40
     a53:	c3                   	ret    

00000a54 <getpid>:
SYSCALL(getpid)
     a54:	b8 0b 00 00 00       	mov    $0xb,%eax
     a59:	cd 40                	int    $0x40
     a5b:	c3                   	ret    

00000a5c <sbrk>:
SYSCALL(sbrk)
     a5c:	b8 0c 00 00 00       	mov    $0xc,%eax
     a61:	cd 40                	int    $0x40
     a63:	c3                   	ret    

00000a64 <sleep>:
SYSCALL(sleep)
     a64:	b8 0d 00 00 00       	mov    $0xd,%eax
     a69:	cd 40                	int    $0x40
     a6b:	c3                   	ret    

00000a6c <uptime>:
SYSCALL(uptime)
     a6c:	b8 0e 00 00 00       	mov    $0xe,%eax
     a71:	cd 40                	int    $0x40
     a73:	c3                   	ret    

00000a74 <getticks>:
SYSCALL(getticks)
     a74:	b8 16 00 00 00       	mov    $0x16,%eax
     a79:	cd 40                	int    $0x40
     a7b:	c3                   	ret    

00000a7c <get_name>:
SYSCALL(get_name)
     a7c:	b8 17 00 00 00       	mov    $0x17,%eax
     a81:	cd 40                	int    $0x40
     a83:	c3                   	ret    

00000a84 <get_max_proc>:
SYSCALL(get_max_proc)
     a84:	b8 18 00 00 00       	mov    $0x18,%eax
     a89:	cd 40                	int    $0x40
     a8b:	c3                   	ret    

00000a8c <get_max_mem>:
SYSCALL(get_max_mem)
     a8c:	b8 19 00 00 00       	mov    $0x19,%eax
     a91:	cd 40                	int    $0x40
     a93:	c3                   	ret    

00000a94 <get_max_disk>:
SYSCALL(get_max_disk)
     a94:	b8 1a 00 00 00       	mov    $0x1a,%eax
     a99:	cd 40                	int    $0x40
     a9b:	c3                   	ret    

00000a9c <get_curr_proc>:
SYSCALL(get_curr_proc)
     a9c:	b8 1b 00 00 00       	mov    $0x1b,%eax
     aa1:	cd 40                	int    $0x40
     aa3:	c3                   	ret    

00000aa4 <get_curr_mem>:
SYSCALL(get_curr_mem)
     aa4:	b8 1c 00 00 00       	mov    $0x1c,%eax
     aa9:	cd 40                	int    $0x40
     aab:	c3                   	ret    

00000aac <get_curr_disk>:
SYSCALL(get_curr_disk)
     aac:	b8 1d 00 00 00       	mov    $0x1d,%eax
     ab1:	cd 40                	int    $0x40
     ab3:	c3                   	ret    

00000ab4 <set_name>:
SYSCALL(set_name)
     ab4:	b8 1e 00 00 00       	mov    $0x1e,%eax
     ab9:	cd 40                	int    $0x40
     abb:	c3                   	ret    

00000abc <set_max_mem>:
SYSCALL(set_max_mem)
     abc:	b8 1f 00 00 00       	mov    $0x1f,%eax
     ac1:	cd 40                	int    $0x40
     ac3:	c3                   	ret    

00000ac4 <set_max_disk>:
SYSCALL(set_max_disk)
     ac4:	b8 20 00 00 00       	mov    $0x20,%eax
     ac9:	cd 40                	int    $0x40
     acb:	c3                   	ret    

00000acc <set_max_proc>:
SYSCALL(set_max_proc)
     acc:	b8 21 00 00 00       	mov    $0x21,%eax
     ad1:	cd 40                	int    $0x40
     ad3:	c3                   	ret    

00000ad4 <set_curr_mem>:
SYSCALL(set_curr_mem)
     ad4:	b8 22 00 00 00       	mov    $0x22,%eax
     ad9:	cd 40                	int    $0x40
     adb:	c3                   	ret    

00000adc <set_curr_disk>:
SYSCALL(set_curr_disk)
     adc:	b8 23 00 00 00       	mov    $0x23,%eax
     ae1:	cd 40                	int    $0x40
     ae3:	c3                   	ret    

00000ae4 <set_curr_proc>:
SYSCALL(set_curr_proc)
     ae4:	b8 24 00 00 00       	mov    $0x24,%eax
     ae9:	cd 40                	int    $0x40
     aeb:	c3                   	ret    

00000aec <find>:
SYSCALL(find)
     aec:	b8 25 00 00 00       	mov    $0x25,%eax
     af1:	cd 40                	int    $0x40
     af3:	c3                   	ret    

00000af4 <is_full>:
SYSCALL(is_full)
     af4:	b8 26 00 00 00       	mov    $0x26,%eax
     af9:	cd 40                	int    $0x40
     afb:	c3                   	ret    

00000afc <container_init>:
SYSCALL(container_init)
     afc:	b8 27 00 00 00       	mov    $0x27,%eax
     b01:	cd 40                	int    $0x40
     b03:	c3                   	ret    

00000b04 <cont_proc_set>:
SYSCALL(cont_proc_set)
     b04:	b8 28 00 00 00       	mov    $0x28,%eax
     b09:	cd 40                	int    $0x40
     b0b:	c3                   	ret    

00000b0c <ps>:
SYSCALL(ps)
     b0c:	b8 29 00 00 00       	mov    $0x29,%eax
     b11:	cd 40                	int    $0x40
     b13:	c3                   	ret    

00000b14 <reduce_curr_mem>:
SYSCALL(reduce_curr_mem)
     b14:	b8 2a 00 00 00       	mov    $0x2a,%eax
     b19:	cd 40                	int    $0x40
     b1b:	c3                   	ret    

00000b1c <set_root_inode>:
SYSCALL(set_root_inode)
     b1c:	b8 2b 00 00 00       	mov    $0x2b,%eax
     b21:	cd 40                	int    $0x40
     b23:	c3                   	ret    

00000b24 <cstop>:
SYSCALL(cstop)
     b24:	b8 2c 00 00 00       	mov    $0x2c,%eax
     b29:	cd 40                	int    $0x40
     b2b:	c3                   	ret    

00000b2c <df>:
SYSCALL(df)
     b2c:	b8 2d 00 00 00       	mov    $0x2d,%eax
     b31:	cd 40                	int    $0x40
     b33:	c3                   	ret    

00000b34 <max_containers>:
SYSCALL(max_containers)
     b34:	b8 2e 00 00 00       	mov    $0x2e,%eax
     b39:	cd 40                	int    $0x40
     b3b:	c3                   	ret    

00000b3c <container_reset>:
SYSCALL(container_reset)
     b3c:	b8 2f 00 00 00       	mov    $0x2f,%eax
     b41:	cd 40                	int    $0x40
     b43:	c3                   	ret    

00000b44 <pause>:
SYSCALL(pause)
     b44:	b8 30 00 00 00       	mov    $0x30,%eax
     b49:	cd 40                	int    $0x40
     b4b:	c3                   	ret    

00000b4c <resume>:
SYSCALL(resume)
     b4c:	b8 31 00 00 00       	mov    $0x31,%eax
     b51:	cd 40                	int    $0x40
     b53:	c3                   	ret    

00000b54 <tmem>:
SYSCALL(tmem)
     b54:	b8 32 00 00 00       	mov    $0x32,%eax
     b59:	cd 40                	int    $0x40
     b5b:	c3                   	ret    

00000b5c <amem>:
SYSCALL(amem)
     b5c:	b8 33 00 00 00       	mov    $0x33,%eax
     b61:	cd 40                	int    $0x40
     b63:	c3                   	ret    

00000b64 <c_ps>:
SYSCALL(c_ps)
     b64:	b8 34 00 00 00       	mov    $0x34,%eax
     b69:	cd 40                	int    $0x40
     b6b:	c3                   	ret    

00000b6c <get_used>:
SYSCALL(get_used)
     b6c:	b8 35 00 00 00       	mov    $0x35,%eax
     b71:	cd 40                	int    $0x40
     b73:	c3                   	ret    

00000b74 <get_os>:
SYSCALL(get_os)
     b74:	b8 36 00 00 00       	mov    $0x36,%eax
     b79:	cd 40                	int    $0x40
     b7b:	c3                   	ret    

00000b7c <set_os>:
SYSCALL(set_os)
     b7c:	b8 37 00 00 00       	mov    $0x37,%eax
     b81:	cd 40                	int    $0x40
     b83:	c3                   	ret    

00000b84 <get_cticks>:
SYSCALL(get_cticks)
     b84:	b8 38 00 00 00       	mov    $0x38,%eax
     b89:	cd 40                	int    $0x40
     b8b:	c3                   	ret    

00000b8c <tick_reset2>:
SYSCALL(tick_reset2)
     b8c:	b8 39 00 00 00       	mov    $0x39,%eax
     b91:	cd 40                	int    $0x40
     b93:	c3                   	ret    

00000b94 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     b94:	55                   	push   %ebp
     b95:	89 e5                	mov    %esp,%ebp
     b97:	83 ec 18             	sub    $0x18,%esp
     b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b9d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     ba0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ba7:	00 
     ba8:	8d 45 f4             	lea    -0xc(%ebp),%eax
     bab:	89 44 24 04          	mov    %eax,0x4(%esp)
     baf:	8b 45 08             	mov    0x8(%ebp),%eax
     bb2:	89 04 24             	mov    %eax,(%esp)
     bb5:	e8 3a fe ff ff       	call   9f4 <write>
}
     bba:	c9                   	leave  
     bbb:	c3                   	ret    

00000bbc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     bbc:	55                   	push   %ebp
     bbd:	89 e5                	mov    %esp,%ebp
     bbf:	56                   	push   %esi
     bc0:	53                   	push   %ebx
     bc1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     bc4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     bcb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     bcf:	74 17                	je     be8 <printint+0x2c>
     bd1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     bd5:	79 11                	jns    be8 <printint+0x2c>
    neg = 1;
     bd7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     bde:	8b 45 0c             	mov    0xc(%ebp),%eax
     be1:	f7 d8                	neg    %eax
     be3:	89 45 ec             	mov    %eax,-0x14(%ebp)
     be6:	eb 06                	jmp    bee <printint+0x32>
  } else {
    x = xx;
     be8:	8b 45 0c             	mov    0xc(%ebp),%eax
     beb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     bee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     bf5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     bf8:	8d 41 01             	lea    0x1(%ecx),%eax
     bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
     bfe:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c01:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c04:	ba 00 00 00 00       	mov    $0x0,%edx
     c09:	f7 f3                	div    %ebx
     c0b:	89 d0                	mov    %edx,%eax
     c0d:	8a 80 b4 13 00 00    	mov    0x13b4(%eax),%al
     c13:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     c17:	8b 75 10             	mov    0x10(%ebp),%esi
     c1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c1d:	ba 00 00 00 00       	mov    $0x0,%edx
     c22:	f7 f6                	div    %esi
     c24:	89 45 ec             	mov    %eax,-0x14(%ebp)
     c27:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     c2b:	75 c8                	jne    bf5 <printint+0x39>
  if(neg)
     c2d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     c31:	74 10                	je     c43 <printint+0x87>
    buf[i++] = '-';
     c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c36:	8d 50 01             	lea    0x1(%eax),%edx
     c39:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c3c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     c41:	eb 1e                	jmp    c61 <printint+0xa5>
     c43:	eb 1c                	jmp    c61 <printint+0xa5>
    putc(fd, buf[i]);
     c45:	8d 55 dc             	lea    -0x24(%ebp),%edx
     c48:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c4b:	01 d0                	add    %edx,%eax
     c4d:	8a 00                	mov    (%eax),%al
     c4f:	0f be c0             	movsbl %al,%eax
     c52:	89 44 24 04          	mov    %eax,0x4(%esp)
     c56:	8b 45 08             	mov    0x8(%ebp),%eax
     c59:	89 04 24             	mov    %eax,(%esp)
     c5c:	e8 33 ff ff ff       	call   b94 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     c61:	ff 4d f4             	decl   -0xc(%ebp)
     c64:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     c68:	79 db                	jns    c45 <printint+0x89>
    putc(fd, buf[i]);
}
     c6a:	83 c4 30             	add    $0x30,%esp
     c6d:	5b                   	pop    %ebx
     c6e:	5e                   	pop    %esi
     c6f:	5d                   	pop    %ebp
     c70:	c3                   	ret    

00000c71 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     c71:	55                   	push   %ebp
     c72:	89 e5                	mov    %esp,%ebp
     c74:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     c77:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     c7e:	8d 45 0c             	lea    0xc(%ebp),%eax
     c81:	83 c0 04             	add    $0x4,%eax
     c84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     c87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     c8e:	e9 77 01 00 00       	jmp    e0a <printf+0x199>
    c = fmt[i] & 0xff;
     c93:	8b 55 0c             	mov    0xc(%ebp),%edx
     c96:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c99:	01 d0                	add    %edx,%eax
     c9b:	8a 00                	mov    (%eax),%al
     c9d:	0f be c0             	movsbl %al,%eax
     ca0:	25 ff 00 00 00       	and    $0xff,%eax
     ca5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     ca8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     cac:	75 2c                	jne    cda <printf+0x69>
      if(c == '%'){
     cae:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     cb2:	75 0c                	jne    cc0 <printf+0x4f>
        state = '%';
     cb4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     cbb:	e9 47 01 00 00       	jmp    e07 <printf+0x196>
      } else {
        putc(fd, c);
     cc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cc3:	0f be c0             	movsbl %al,%eax
     cc6:	89 44 24 04          	mov    %eax,0x4(%esp)
     cca:	8b 45 08             	mov    0x8(%ebp),%eax
     ccd:	89 04 24             	mov    %eax,(%esp)
     cd0:	e8 bf fe ff ff       	call   b94 <putc>
     cd5:	e9 2d 01 00 00       	jmp    e07 <printf+0x196>
      }
    } else if(state == '%'){
     cda:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     cde:	0f 85 23 01 00 00    	jne    e07 <printf+0x196>
      if(c == 'd'){
     ce4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     ce8:	75 2d                	jne    d17 <printf+0xa6>
        printint(fd, *ap, 10, 1);
     cea:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ced:	8b 00                	mov    (%eax),%eax
     cef:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     cf6:	00 
     cf7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cfe:	00 
     cff:	89 44 24 04          	mov    %eax,0x4(%esp)
     d03:	8b 45 08             	mov    0x8(%ebp),%eax
     d06:	89 04 24             	mov    %eax,(%esp)
     d09:	e8 ae fe ff ff       	call   bbc <printint>
        ap++;
     d0e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     d12:	e9 e9 00 00 00       	jmp    e00 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
     d17:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     d1b:	74 06                	je     d23 <printf+0xb2>
     d1d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     d21:	75 2d                	jne    d50 <printf+0xdf>
        printint(fd, *ap, 16, 0);
     d23:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d26:	8b 00                	mov    (%eax),%eax
     d28:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     d2f:	00 
     d30:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     d37:	00 
     d38:	89 44 24 04          	mov    %eax,0x4(%esp)
     d3c:	8b 45 08             	mov    0x8(%ebp),%eax
     d3f:	89 04 24             	mov    %eax,(%esp)
     d42:	e8 75 fe ff ff       	call   bbc <printint>
        ap++;
     d47:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     d4b:	e9 b0 00 00 00       	jmp    e00 <printf+0x18f>
      } else if(c == 's'){
     d50:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     d54:	75 42                	jne    d98 <printf+0x127>
        s = (char*)*ap;
     d56:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d59:	8b 00                	mov    (%eax),%eax
     d5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     d5e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     d62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d66:	75 09                	jne    d71 <printf+0x100>
          s = "(null)";
     d68:	c7 45 f4 bb 10 00 00 	movl   $0x10bb,-0xc(%ebp)
        while(*s != 0){
     d6f:	eb 1c                	jmp    d8d <printf+0x11c>
     d71:	eb 1a                	jmp    d8d <printf+0x11c>
          putc(fd, *s);
     d73:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d76:	8a 00                	mov    (%eax),%al
     d78:	0f be c0             	movsbl %al,%eax
     d7b:	89 44 24 04          	mov    %eax,0x4(%esp)
     d7f:	8b 45 08             	mov    0x8(%ebp),%eax
     d82:	89 04 24             	mov    %eax,(%esp)
     d85:	e8 0a fe ff ff       	call   b94 <putc>
          s++;
     d8a:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d90:	8a 00                	mov    (%eax),%al
     d92:	84 c0                	test   %al,%al
     d94:	75 dd                	jne    d73 <printf+0x102>
     d96:	eb 68                	jmp    e00 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     d98:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     d9c:	75 1d                	jne    dbb <printf+0x14a>
        putc(fd, *ap);
     d9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     da1:	8b 00                	mov    (%eax),%eax
     da3:	0f be c0             	movsbl %al,%eax
     da6:	89 44 24 04          	mov    %eax,0x4(%esp)
     daa:	8b 45 08             	mov    0x8(%ebp),%eax
     dad:	89 04 24             	mov    %eax,(%esp)
     db0:	e8 df fd ff ff       	call   b94 <putc>
        ap++;
     db5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     db9:	eb 45                	jmp    e00 <printf+0x18f>
      } else if(c == '%'){
     dbb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     dbf:	75 17                	jne    dd8 <printf+0x167>
        putc(fd, c);
     dc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dc4:	0f be c0             	movsbl %al,%eax
     dc7:	89 44 24 04          	mov    %eax,0x4(%esp)
     dcb:	8b 45 08             	mov    0x8(%ebp),%eax
     dce:	89 04 24             	mov    %eax,(%esp)
     dd1:	e8 be fd ff ff       	call   b94 <putc>
     dd6:	eb 28                	jmp    e00 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     dd8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
     ddf:	00 
     de0:	8b 45 08             	mov    0x8(%ebp),%eax
     de3:	89 04 24             	mov    %eax,(%esp)
     de6:	e8 a9 fd ff ff       	call   b94 <putc>
        putc(fd, c);
     deb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dee:	0f be c0             	movsbl %al,%eax
     df1:	89 44 24 04          	mov    %eax,0x4(%esp)
     df5:	8b 45 08             	mov    0x8(%ebp),%eax
     df8:	89 04 24             	mov    %eax,(%esp)
     dfb:	e8 94 fd ff ff       	call   b94 <putc>
      }
      state = 0;
     e00:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e07:	ff 45 f0             	incl   -0x10(%ebp)
     e0a:	8b 55 0c             	mov    0xc(%ebp),%edx
     e0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e10:	01 d0                	add    %edx,%eax
     e12:	8a 00                	mov    (%eax),%al
     e14:	84 c0                	test   %al,%al
     e16:	0f 85 77 fe ff ff    	jne    c93 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     e1c:	c9                   	leave  
     e1d:	c3                   	ret    
     e1e:	90                   	nop
     e1f:	90                   	nop

00000e20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e26:	8b 45 08             	mov    0x8(%ebp),%eax
     e29:	83 e8 08             	sub    $0x8,%eax
     e2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e2f:	a1 d0 13 00 00       	mov    0x13d0,%eax
     e34:	89 45 fc             	mov    %eax,-0x4(%ebp)
     e37:	eb 24                	jmp    e5d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e39:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e3c:	8b 00                	mov    (%eax),%eax
     e3e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e41:	77 12                	ja     e55 <free+0x35>
     e43:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e46:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e49:	77 24                	ja     e6f <free+0x4f>
     e4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e4e:	8b 00                	mov    (%eax),%eax
     e50:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     e53:	77 1a                	ja     e6f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e55:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e58:	8b 00                	mov    (%eax),%eax
     e5a:	89 45 fc             	mov    %eax,-0x4(%ebp)
     e5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e60:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     e63:	76 d4                	jbe    e39 <free+0x19>
     e65:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e68:	8b 00                	mov    (%eax),%eax
     e6a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     e6d:	76 ca                	jbe    e39 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     e6f:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e72:	8b 40 04             	mov    0x4(%eax),%eax
     e75:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     e7c:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e7f:	01 c2                	add    %eax,%edx
     e81:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e84:	8b 00                	mov    (%eax),%eax
     e86:	39 c2                	cmp    %eax,%edx
     e88:	75 24                	jne    eae <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     e8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e8d:	8b 50 04             	mov    0x4(%eax),%edx
     e90:	8b 45 fc             	mov    -0x4(%ebp),%eax
     e93:	8b 00                	mov    (%eax),%eax
     e95:	8b 40 04             	mov    0x4(%eax),%eax
     e98:	01 c2                	add    %eax,%edx
     e9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     e9d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     ea0:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ea3:	8b 00                	mov    (%eax),%eax
     ea5:	8b 10                	mov    (%eax),%edx
     ea7:	8b 45 f8             	mov    -0x8(%ebp),%eax
     eaa:	89 10                	mov    %edx,(%eax)
     eac:	eb 0a                	jmp    eb8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     eae:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eb1:	8b 10                	mov    (%eax),%edx
     eb3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     eb6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     eb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ebb:	8b 40 04             	mov    0x4(%eax),%eax
     ebe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     ec5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ec8:	01 d0                	add    %edx,%eax
     eca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     ecd:	75 20                	jne    eef <free+0xcf>
    p->s.size += bp->s.size;
     ecf:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ed2:	8b 50 04             	mov    0x4(%eax),%edx
     ed5:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ed8:	8b 40 04             	mov    0x4(%eax),%eax
     edb:	01 c2                	add    %eax,%edx
     edd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ee0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     ee3:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ee6:	8b 10                	mov    (%eax),%edx
     ee8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     eeb:	89 10                	mov    %edx,(%eax)
     eed:	eb 08                	jmp    ef7 <free+0xd7>
  } else
    p->s.ptr = bp;
     eef:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ef2:	8b 55 f8             	mov    -0x8(%ebp),%edx
     ef5:	89 10                	mov    %edx,(%eax)
  freep = p;
     ef7:	8b 45 fc             	mov    -0x4(%ebp),%eax
     efa:	a3 d0 13 00 00       	mov    %eax,0x13d0
}
     eff:	c9                   	leave  
     f00:	c3                   	ret    

00000f01 <morecore>:

static Header*
morecore(uint nu)
{
     f01:	55                   	push   %ebp
     f02:	89 e5                	mov    %esp,%ebp
     f04:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     f07:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     f0e:	77 07                	ja     f17 <morecore+0x16>
    nu = 4096;
     f10:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     f17:	8b 45 08             	mov    0x8(%ebp),%eax
     f1a:	c1 e0 03             	shl    $0x3,%eax
     f1d:	89 04 24             	mov    %eax,(%esp)
     f20:	e8 37 fb ff ff       	call   a5c <sbrk>
     f25:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     f28:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     f2c:	75 07                	jne    f35 <morecore+0x34>
    return 0;
     f2e:	b8 00 00 00 00       	mov    $0x0,%eax
     f33:	eb 22                	jmp    f57 <morecore+0x56>
  hp = (Header*)p;
     f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f38:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     f3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f3e:	8b 55 08             	mov    0x8(%ebp),%edx
     f41:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     f44:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f47:	83 c0 08             	add    $0x8,%eax
     f4a:	89 04 24             	mov    %eax,(%esp)
     f4d:	e8 ce fe ff ff       	call   e20 <free>
  return freep;
     f52:	a1 d0 13 00 00       	mov    0x13d0,%eax
}
     f57:	c9                   	leave  
     f58:	c3                   	ret    

00000f59 <malloc>:

void*
malloc(uint nbytes)
{
     f59:	55                   	push   %ebp
     f5a:	89 e5                	mov    %esp,%ebp
     f5c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f5f:	8b 45 08             	mov    0x8(%ebp),%eax
     f62:	83 c0 07             	add    $0x7,%eax
     f65:	c1 e8 03             	shr    $0x3,%eax
     f68:	40                   	inc    %eax
     f69:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     f6c:	a1 d0 13 00 00       	mov    0x13d0,%eax
     f71:	89 45 f0             	mov    %eax,-0x10(%ebp)
     f74:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f78:	75 23                	jne    f9d <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
     f7a:	c7 45 f0 c8 13 00 00 	movl   $0x13c8,-0x10(%ebp)
     f81:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f84:	a3 d0 13 00 00       	mov    %eax,0x13d0
     f89:	a1 d0 13 00 00       	mov    0x13d0,%eax
     f8e:	a3 c8 13 00 00       	mov    %eax,0x13c8
    base.s.size = 0;
     f93:	c7 05 cc 13 00 00 00 	movl   $0x0,0x13cc
     f9a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fa0:	8b 00                	mov    (%eax),%eax
     fa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     fa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fa8:	8b 40 04             	mov    0x4(%eax),%eax
     fab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     fae:	72 4d                	jb     ffd <malloc+0xa4>
      if(p->s.size == nunits)
     fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb3:	8b 40 04             	mov    0x4(%eax),%eax
     fb6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     fb9:	75 0c                	jne    fc7 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
     fbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fbe:	8b 10                	mov    (%eax),%edx
     fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fc3:	89 10                	mov    %edx,(%eax)
     fc5:	eb 26                	jmp    fed <malloc+0x94>
      else {
        p->s.size -= nunits;
     fc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fca:	8b 40 04             	mov    0x4(%eax),%eax
     fcd:	2b 45 ec             	sub    -0x14(%ebp),%eax
     fd0:	89 c2                	mov    %eax,%edx
     fd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fdb:	8b 40 04             	mov    0x4(%eax),%eax
     fde:	c1 e0 03             	shl    $0x3,%eax
     fe1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fe7:	8b 55 ec             	mov    -0x14(%ebp),%edx
     fea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     fed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff0:	a3 d0 13 00 00       	mov    %eax,0x13d0
      return (void*)(p + 1);
     ff5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ff8:	83 c0 08             	add    $0x8,%eax
     ffb:	eb 38                	jmp    1035 <malloc+0xdc>
    }
    if(p == freep)
     ffd:	a1 d0 13 00 00       	mov    0x13d0,%eax
    1002:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    1005:	75 1b                	jne    1022 <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
    1007:	8b 45 ec             	mov    -0x14(%ebp),%eax
    100a:	89 04 24             	mov    %eax,(%esp)
    100d:	e8 ef fe ff ff       	call   f01 <morecore>
    1012:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1015:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1019:	75 07                	jne    1022 <malloc+0xc9>
        return 0;
    101b:	b8 00 00 00 00       	mov    $0x0,%eax
    1020:	eb 13                	jmp    1035 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1022:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1025:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102b:	8b 00                	mov    (%eax),%eax
    102d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1030:	e9 70 ff ff ff       	jmp    fa5 <malloc+0x4c>
}
    1035:	c9                   	leave  
    1036:	c3                   	ret    
