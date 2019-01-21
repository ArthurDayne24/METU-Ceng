
farm.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <start_farm>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	b8 01 00 00 00       	mov    $0x1,%eax
   9:	5d                   	pop    %rbp
   a:	c3                   	retq   

000000000000000b <addval_355>:
   b:	55                   	push   %rbp
   c:	48 89 e5             	mov    %rsp,%rbp
   f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  15:	2d b8 76 31 3c       	sub    $0x3c3176b8,%eax
  1a:	5d                   	pop    %rbp
  1b:	c3                   	retq   

000000000000001c <getval_334>:
  1c:	55                   	push   %rbp
  1d:	48 89 e5             	mov    %rsp,%rbp
  20:	b8 48 89 df 91       	mov    $0x91df8948,%eax
  25:	5d                   	pop    %rbp
  26:	c3                   	retq   

0000000000000027 <getval_102>:
  27:	55                   	push   %rbp
  28:	48 89 e5             	mov    %rsp,%rbp
  2b:	b8 46 48 89 df       	mov    $0xdf894846,%eax
  30:	5d                   	pop    %rbp
  31:	c3                   	retq   

0000000000000032 <addval_488>:
  32:	55                   	push   %rbp
  33:	48 89 e5             	mov    %rsp,%rbp
  36:	89 7d fc             	mov    %edi,-0x4(%rbp)
  39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  3c:	2d 97 2d a4 38       	sub    $0x38a42d97,%eax
  41:	5d                   	pop    %rbp
  42:	c3                   	retq   

0000000000000043 <getval_410>:
  43:	55                   	push   %rbp
  44:	48 89 e5             	mov    %rsp,%rbp
  47:	b8 5b 90 90 90       	mov    $0x9090905b,%eax
  4c:	5d                   	pop    %rbp
  4d:	c3                   	retq   

000000000000004e <addval_164>:
  4e:	55                   	push   %rbp
  4f:	48 89 e5             	mov    %rsp,%rbp
  52:	89 7d fc             	mov    %edi,-0x4(%rbp)
  55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  58:	2d a6 6f 6f 3c       	sub    $0x3c6f6fa6,%eax
  5d:	5d                   	pop    %rbp
  5e:	c3                   	retq   

000000000000005f <setval_400>:
  5f:	55                   	push   %rbp
  60:	48 89 e5             	mov    %rsp,%rbp
  63:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  6b:	c7 00 48 09 d1 c3    	movl   $0xc3d10948,(%rax)
  71:	90                   	nop
  72:	5d                   	pop    %rbp
  73:	c3                   	retq   

0000000000000074 <setval_219>:
  74:	55                   	push   %rbp
  75:	48 89 e5             	mov    %rsp,%rbp
  78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  7c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80:	c7 00 80 40 89 ce    	movl   $0xce894080,(%rax)
  86:	90                   	nop
  87:	5d                   	pop    %rbp
  88:	c3                   	retq   

0000000000000089 <getval_262>:
  89:	55                   	push   %rbp
  8a:	48 89 e5             	mov    %rsp,%rbp
  8d:	b8 48 89 d1 c7       	mov    $0xc7d18948,%eax
  92:	5d                   	pop    %rbp
  93:	c3                   	retq   

0000000000000094 <setval_304>:
  94:	55                   	push   %rbp
  95:	48 89 e5             	mov    %rsp,%rbp
  98:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  a0:	c7 00 48 89 df c3    	movl   $0xc3df8948,(%rax)
  a6:	90                   	nop
  a7:	5d                   	pop    %rbp
  a8:	c3                   	retq   

00000000000000a9 <getval_498>:
  a9:	55                   	push   %rbp
  aa:	48 89 e5             	mov    %rsp,%rbp
  ad:	b8 48 89 df 91       	mov    $0x91df8948,%eax
  b2:	5d                   	pop    %rbp
  b3:	c3                   	retq   

00000000000000b4 <addval_194>:
  b4:	55                   	push   %rbp
  b5:	48 89 e5             	mov    %rsp,%rbp
  b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  be:	2d b8 76 31 6e       	sub    $0x6e3176b8,%eax
  c3:	5d                   	pop    %rbp
  c4:	c3                   	retq   

00000000000000c5 <setval_167>:
  c5:	55                   	push   %rbp
  c6:	48 89 e5             	mov    %rsp,%rbp
  c9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  d1:	c7 00 48 01 da c7    	movl   $0xc7da0148,(%rax)
  d7:	90                   	nop
  d8:	5d                   	pop    %rbp
  d9:	c3                   	retq   

00000000000000da <getval_283>:
  da:	55                   	push   %rbp
  db:	48 89 e5             	mov    %rsp,%rbp
  de:	b8 48 89 d1 90       	mov    $0x90d18948,%eax
  e3:	5d                   	pop    %rbp
  e4:	c3                   	retq   

00000000000000e5 <setval_118>:
  e5:	55                   	push   %rbp
  e6:	48 89 e5             	mov    %rsp,%rbp
  e9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  f1:	c7 00 03 48 01 da    	movl   $0xda014803,(%rax)
  f7:	90                   	nop
  f8:	5d                   	pop    %rbp
  f9:	c3                   	retq   

00000000000000fa <setval_111>:
  fa:	55                   	push   %rbp
  fb:	48 89 e5             	mov    %rsp,%rbp
  fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 102:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 106:	c7 00 0e 5a 90 90    	movl   $0x90905a0e,(%rax)
 10c:	90                   	nop
 10d:	5d                   	pop    %rbp
 10e:	c3                   	retq   

000000000000010f <addval_343>:
 10f:	55                   	push   %rbp
 110:	48 89 e5             	mov    %rsp,%rbp
 113:	89 7d fc             	mov    %edi,-0x4(%rbp)
 116:	8b 45 fc             	mov    -0x4(%rbp),%eax
 119:	2d 26 6f 6f 6f       	sub    $0x6f6f6f26,%eax
 11e:	5d                   	pop    %rbp
 11f:	c3                   	retq   

0000000000000120 <addval_134>:
 120:	55                   	push   %rbp
 121:	48 89 e5             	mov    %rsp,%rbp
 124:	89 7d fc             	mov    %edi,-0x4(%rbp)
 127:	8b 45 fc             	mov    -0x4(%rbp),%eax
 12a:	2d a5 6b 6f 6f       	sub    $0x6f6f6ba5,%eax
 12f:	5d                   	pop    %rbp
 130:	c3                   	retq   

0000000000000131 <setval_338>:
 131:	55                   	push   %rbp
 132:	48 89 e5             	mov    %rsp,%rbp
 135:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 139:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 13d:	c7 00 48 89 ce 90    	movl   $0x90ce8948,(%rax)
 143:	90                   	nop
 144:	5d                   	pop    %rbp
 145:	c3                   	retq   

0000000000000146 <addval_424>:
 146:	55                   	push   %rbp
 147:	48 89 e5             	mov    %rsp,%rbp
 14a:	89 7d fc             	mov    %edi,-0x4(%rbp)
 14d:	8b 45 fc             	mov    -0x4(%rbp),%eax
 150:	2d 7d b7 fe 25       	sub    $0x25feb77d,%eax
 155:	5d                   	pop    %rbp
 156:	c3                   	retq   

0000000000000157 <addval_198>:
 157:	55                   	push   %rbp
 158:	48 89 e5             	mov    %rsp,%rbp
 15b:	89 7d fc             	mov    %edi,-0x4(%rbp)
 15e:	8b 45 fc             	mov    -0x4(%rbp),%eax
 161:	2d b8 fe 25 6b       	sub    $0x6b25feb8,%eax
 166:	5d                   	pop    %rbp
 167:	c3                   	retq   

0000000000000168 <setval_391>:
 168:	55                   	push   %rbp
 169:	48 89 e5             	mov    %rsp,%rbp
 16c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 170:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 174:	c7 00 48 89 d1 c3    	movl   $0xc3d18948,(%rax)
 17a:	90                   	nop
 17b:	5d                   	pop    %rbp
 17c:	c3                   	retq   

000000000000017d <addval_114>:
 17d:	55                   	push   %rbp
 17e:	48 89 e5             	mov    %rsp,%rbp
 181:	89 7d fc             	mov    %edi,-0x4(%rbp)
 184:	8b 45 fc             	mov    -0x4(%rbp),%eax
 187:	2d 5e ea a5 6d       	sub    $0x6da5ea5e,%eax
 18c:	5d                   	pop    %rbp
 18d:	c3                   	retq   

000000000000018e <addval_347>:
 18e:	55                   	push   %rbp
 18f:	48 89 e5             	mov    %rsp,%rbp
 192:	89 7d fc             	mov    %edi,-0x4(%rbp)
 195:	8b 45 fc             	mov    -0x4(%rbp),%eax
 198:	2d a5 6f 6f 3c       	sub    $0x3c6f6fa5,%eax
 19d:	5d                   	pop    %rbp
 19e:	c3                   	retq   

000000000000019f <end_farm>:
 19f:	55                   	push   %rbp
 1a0:	48 89 e5             	mov    %rsp,%rbp
 1a3:	b8 01 00 00 00       	mov    $0x1,%eax
 1a8:	5d                   	pop    %rbp
 1a9:	c3                   	retq   
