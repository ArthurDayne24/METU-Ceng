
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400d68 <_init>:
  400d68:	48 83 ec 08          	sub    $0x8,%rsp
  400d6c:	48 8b 05 85 42 20 00 	mov    0x204285(%rip),%rax        # 604ff8 <_DYNAMIC+0x1d0>
  400d73:	48 85 c0             	test   %rax,%rax
  400d76:	74 05                	je     400d7d <_init+0x15>
  400d78:	e8 83 02 00 00       	callq  401000 <socket@plt+0x10>
  400d7d:	48 83 c4 08          	add    $0x8,%rsp
  400d81:	c3                   	retq   

Disassembly of section .plt:

0000000000400d90 <putchar@plt-0x10>:
  400d90:	ff 35 72 42 20 00    	pushq  0x204272(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400d96:	ff 25 74 42 20 00    	jmpq   *0x204274(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400d9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400da0 <putchar@plt>:
  400da0:	ff 25 72 42 20 00    	jmpq   *0x204272(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400da6:	68 00 00 00 00       	pushq  $0x0
  400dab:	e9 e0 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400db0 <strcasecmp@plt>:
  400db0:	ff 25 6a 42 20 00    	jmpq   *0x20426a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400db6:	68 01 00 00 00       	pushq  $0x1
  400dbb:	e9 d0 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400dc0 <__errno_location@plt>:
  400dc0:	ff 25 62 42 20 00    	jmpq   *0x204262(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400dc6:	68 02 00 00 00       	pushq  $0x2
  400dcb:	e9 c0 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400dd0 <srandom@plt>:
  400dd0:	ff 25 5a 42 20 00    	jmpq   *0x20425a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400dd6:	68 03 00 00 00       	pushq  $0x3
  400ddb:	e9 b0 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400de0 <strncmp@plt>:
  400de0:	ff 25 52 42 20 00    	jmpq   *0x204252(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400de6:	68 04 00 00 00       	pushq  $0x4
  400deb:	e9 a0 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400df0 <strcpy@plt>:
  400df0:	ff 25 4a 42 20 00    	jmpq   *0x20424a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400df6:	68 05 00 00 00       	pushq  $0x5
  400dfb:	e9 90 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e00 <puts@plt>:
  400e00:	ff 25 42 42 20 00    	jmpq   *0x204242(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400e06:	68 06 00 00 00       	pushq  $0x6
  400e0b:	e9 80 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e10 <write@plt>:
  400e10:	ff 25 3a 42 20 00    	jmpq   *0x20423a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400e16:	68 07 00 00 00       	pushq  $0x7
  400e1b:	e9 70 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e20 <__stack_chk_fail@plt>:
  400e20:	ff 25 32 42 20 00    	jmpq   *0x204232(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400e26:	68 08 00 00 00       	pushq  $0x8
  400e2b:	e9 60 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e30 <mmap@plt>:
  400e30:	ff 25 2a 42 20 00    	jmpq   *0x20422a(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400e36:	68 09 00 00 00       	pushq  $0x9
  400e3b:	e9 50 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e40 <memset@plt>:
  400e40:	ff 25 22 42 20 00    	jmpq   *0x204222(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400e46:	68 0a 00 00 00       	pushq  $0xa
  400e4b:	e9 40 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e50 <alarm@plt>:
  400e50:	ff 25 1a 42 20 00    	jmpq   *0x20421a(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400e56:	68 0b 00 00 00       	pushq  $0xb
  400e5b:	e9 30 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e60 <close@plt>:
  400e60:	ff 25 12 42 20 00    	jmpq   *0x204212(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400e66:	68 0c 00 00 00       	pushq  $0xc
  400e6b:	e9 20 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e70 <read@plt>:
  400e70:	ff 25 0a 42 20 00    	jmpq   *0x20420a(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400e76:	68 0d 00 00 00       	pushq  $0xd
  400e7b:	e9 10 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e80 <__libc_start_main@plt>:
  400e80:	ff 25 02 42 20 00    	jmpq   *0x204202(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400e86:	68 0e 00 00 00       	pushq  $0xe
  400e8b:	e9 00 ff ff ff       	jmpq   400d90 <_init+0x28>

0000000000400e90 <srand@plt>:
  400e90:	ff 25 fa 41 20 00    	jmpq   *0x2041fa(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400e96:	68 0f 00 00 00       	pushq  $0xf
  400e9b:	e9 f0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ea0 <signal@plt>:
  400ea0:	ff 25 f2 41 20 00    	jmpq   *0x2041f2(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400ea6:	68 10 00 00 00       	pushq  $0x10
  400eab:	e9 e0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400eb0 <gethostbyname@plt>:
  400eb0:	ff 25 ea 41 20 00    	jmpq   *0x2041ea(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400eb6:	68 11 00 00 00       	pushq  $0x11
  400ebb:	e9 d0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ec0 <__memmove_chk@plt>:
  400ec0:	ff 25 e2 41 20 00    	jmpq   *0x2041e2(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400ec6:	68 12 00 00 00       	pushq  $0x12
  400ecb:	e9 c0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ed0 <strtol@plt>:
  400ed0:	ff 25 da 41 20 00    	jmpq   *0x2041da(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400ed6:	68 13 00 00 00       	pushq  $0x13
  400edb:	e9 b0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ee0 <memcpy@plt>:
  400ee0:	ff 25 d2 41 20 00    	jmpq   *0x2041d2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400ee6:	68 14 00 00 00       	pushq  $0x14
  400eeb:	e9 a0 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ef0 <time@plt>:
  400ef0:	ff 25 ca 41 20 00    	jmpq   *0x2041ca(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ef6:	68 15 00 00 00       	pushq  $0x15
  400efb:	e9 90 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f00 <random@plt>:
  400f00:	ff 25 c2 41 20 00    	jmpq   *0x2041c2(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400f06:	68 16 00 00 00       	pushq  $0x16
  400f0b:	e9 80 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f10 <fflush@plt>:
  400f10:	ff 25 ba 41 20 00    	jmpq   *0x2041ba(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400f16:	68 17 00 00 00       	pushq  $0x17
  400f1b:	e9 70 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f20 <_IO_getc@plt>:
  400f20:	ff 25 b2 41 20 00    	jmpq   *0x2041b2(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400f26:	68 18 00 00 00       	pushq  $0x18
  400f2b:	e9 60 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f30 <__isoc99_sscanf@plt>:
  400f30:	ff 25 aa 41 20 00    	jmpq   *0x2041aa(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400f36:	68 19 00 00 00       	pushq  $0x19
  400f3b:	e9 50 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f40 <munmap@plt>:
  400f40:	ff 25 a2 41 20 00    	jmpq   *0x2041a2(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400f46:	68 1a 00 00 00       	pushq  $0x1a
  400f4b:	e9 40 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f50 <__printf_chk@plt>:
  400f50:	ff 25 9a 41 20 00    	jmpq   *0x20419a(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400f56:	68 1b 00 00 00       	pushq  $0x1b
  400f5b:	e9 30 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f60 <fopen@plt>:
  400f60:	ff 25 92 41 20 00    	jmpq   *0x204192(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400f66:	68 1c 00 00 00       	pushq  $0x1c
  400f6b:	e9 20 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f70 <getopt@plt>:
  400f70:	ff 25 8a 41 20 00    	jmpq   *0x20418a(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400f76:	68 1d 00 00 00       	pushq  $0x1d
  400f7b:	e9 10 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f80 <strtoul@plt>:
  400f80:	ff 25 82 41 20 00    	jmpq   *0x204182(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400f86:	68 1e 00 00 00       	pushq  $0x1e
  400f8b:	e9 00 fe ff ff       	jmpq   400d90 <_init+0x28>

0000000000400f90 <gethostname@plt>:
  400f90:	ff 25 7a 41 20 00    	jmpq   *0x20417a(%rip)        # 605110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400f96:	68 1f 00 00 00       	pushq  $0x1f
  400f9b:	e9 f0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400fa0 <exit@plt>:
  400fa0:	ff 25 72 41 20 00    	jmpq   *0x204172(%rip)        # 605118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400fa6:	68 20 00 00 00       	pushq  $0x20
  400fab:	e9 e0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400fb0 <connect@plt>:
  400fb0:	ff 25 6a 41 20 00    	jmpq   *0x20416a(%rip)        # 605120 <_GLOBAL_OFFSET_TABLE_+0x120>
  400fb6:	68 21 00 00 00       	pushq  $0x21
  400fbb:	e9 d0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400fc0 <__fprintf_chk@plt>:
  400fc0:	ff 25 62 41 20 00    	jmpq   *0x204162(%rip)        # 605128 <_GLOBAL_OFFSET_TABLE_+0x128>
  400fc6:	68 22 00 00 00       	pushq  $0x22
  400fcb:	e9 c0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400fd0 <rand@plt>:
  400fd0:	ff 25 5a 41 20 00    	jmpq   *0x20415a(%rip)        # 605130 <_GLOBAL_OFFSET_TABLE_+0x130>
  400fd6:	68 23 00 00 00       	pushq  $0x23
  400fdb:	e9 b0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400fe0 <__sprintf_chk@plt>:
  400fe0:	ff 25 52 41 20 00    	jmpq   *0x204152(%rip)        # 605138 <_GLOBAL_OFFSET_TABLE_+0x138>
  400fe6:	68 24 00 00 00       	pushq  $0x24
  400feb:	e9 a0 fd ff ff       	jmpq   400d90 <_init+0x28>

0000000000400ff0 <socket@plt>:
  400ff0:	ff 25 4a 41 20 00    	jmpq   *0x20414a(%rip)        # 605140 <_GLOBAL_OFFSET_TABLE_+0x140>
  400ff6:	68 25 00 00 00       	pushq  $0x25
  400ffb:	e9 90 fd ff ff       	jmpq   400d90 <_init+0x28>

Disassembly of section .plt.got:

0000000000401000 <.plt.got>:
  401000:	ff 25 f2 3f 20 00    	jmpq   *0x203ff2(%rip)        # 604ff8 <_DYNAMIC+0x1d0>
  401006:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000401010 <_start>:
  401010:	31 ed                	xor    %ebp,%ebp
  401012:	49 89 d1             	mov    %rdx,%r9
  401015:	5e                   	pop    %rsi
  401016:	48 89 e2             	mov    %rsp,%rdx
  401019:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40101d:	50                   	push   %rax
  40101e:	54                   	push   %rsp
  40101f:	49 c7 c0 50 31 40 00 	mov    $0x403150,%r8
  401026:	48 c7 c1 e0 30 40 00 	mov    $0x4030e0,%rcx
  40102d:	48 c7 c7 15 13 40 00 	mov    $0x401315,%rdi
  401034:	e8 47 fe ff ff       	callq  400e80 <__libc_start_main@plt>
  401039:	f4                   	hlt    
  40103a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401040 <deregister_tm_clones>:
  401040:	b8 d7 54 60 00       	mov    $0x6054d7,%eax
  401045:	55                   	push   %rbp
  401046:	48 2d d0 54 60 00    	sub    $0x6054d0,%rax
  40104c:	48 83 f8 0e          	cmp    $0xe,%rax
  401050:	48 89 e5             	mov    %rsp,%rbp
  401053:	76 1b                	jbe    401070 <deregister_tm_clones+0x30>
  401055:	b8 00 00 00 00       	mov    $0x0,%eax
  40105a:	48 85 c0             	test   %rax,%rax
  40105d:	74 11                	je     401070 <deregister_tm_clones+0x30>
  40105f:	5d                   	pop    %rbp
  401060:	bf d0 54 60 00       	mov    $0x6054d0,%edi
  401065:	ff e0                	jmpq   *%rax
  401067:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40106e:	00 00 
  401070:	5d                   	pop    %rbp
  401071:	c3                   	retq   
  401072:	0f 1f 40 00          	nopl   0x0(%rax)
  401076:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40107d:	00 00 00 

0000000000401080 <register_tm_clones>:
  401080:	be d0 54 60 00       	mov    $0x6054d0,%esi
  401085:	55                   	push   %rbp
  401086:	48 81 ee d0 54 60 00 	sub    $0x6054d0,%rsi
  40108d:	48 c1 fe 03          	sar    $0x3,%rsi
  401091:	48 89 e5             	mov    %rsp,%rbp
  401094:	48 89 f0             	mov    %rsi,%rax
  401097:	48 c1 e8 3f          	shr    $0x3f,%rax
  40109b:	48 01 c6             	add    %rax,%rsi
  40109e:	48 d1 fe             	sar    %rsi
  4010a1:	74 15                	je     4010b8 <register_tm_clones+0x38>
  4010a3:	b8 00 00 00 00       	mov    $0x0,%eax
  4010a8:	48 85 c0             	test   %rax,%rax
  4010ab:	74 0b                	je     4010b8 <register_tm_clones+0x38>
  4010ad:	5d                   	pop    %rbp
  4010ae:	bf d0 54 60 00       	mov    $0x6054d0,%edi
  4010b3:	ff e0                	jmpq   *%rax
  4010b5:	0f 1f 00             	nopl   (%rax)
  4010b8:	5d                   	pop    %rbp
  4010b9:	c3                   	retq   
  4010ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004010c0 <__do_global_dtors_aux>:
  4010c0:	80 3d 41 44 20 00 00 	cmpb   $0x0,0x204441(%rip)        # 605508 <completed.7585>
  4010c7:	75 11                	jne    4010da <__do_global_dtors_aux+0x1a>
  4010c9:	55                   	push   %rbp
  4010ca:	48 89 e5             	mov    %rsp,%rbp
  4010cd:	e8 6e ff ff ff       	callq  401040 <deregister_tm_clones>
  4010d2:	5d                   	pop    %rbp
  4010d3:	c6 05 2e 44 20 00 01 	movb   $0x1,0x20442e(%rip)        # 605508 <completed.7585>
  4010da:	f3 c3                	repz retq 
  4010dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004010e0 <frame_dummy>:
  4010e0:	bf 20 4e 60 00       	mov    $0x604e20,%edi
  4010e5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4010e9:	75 05                	jne    4010f0 <frame_dummy+0x10>
  4010eb:	eb 93                	jmp    401080 <register_tm_clones>
  4010ed:	0f 1f 00             	nopl   (%rax)
  4010f0:	b8 00 00 00 00       	mov    $0x0,%eax
  4010f5:	48 85 c0             	test   %rax,%rax
  4010f8:	74 f1                	je     4010eb <frame_dummy+0xb>
  4010fa:	55                   	push   %rbp
  4010fb:	48 89 e5             	mov    %rsp,%rbp
  4010fe:	ff d0                	callq  *%rax
  401100:	5d                   	pop    %rbp
  401101:	e9 7a ff ff ff       	jmpq   401080 <register_tm_clones>

0000000000401106 <usage>:
  401106:	48 83 ec 08          	sub    $0x8,%rsp
  40110a:	48 89 fa             	mov    %rdi,%rdx
  40110d:	83 3d 34 44 20 00 00 	cmpl   $0x0,0x204434(%rip)        # 605548 <is_checker>
  401114:	74 3e                	je     401154 <usage+0x4e>
  401116:	be 68 31 40 00       	mov    $0x403168,%esi
  40111b:	bf 01 00 00 00       	mov    $0x1,%edi
  401120:	b8 00 00 00 00       	mov    $0x0,%eax
  401125:	e8 26 fe ff ff       	callq  400f50 <__printf_chk@plt>
  40112a:	bf a0 31 40 00       	mov    $0x4031a0,%edi
  40112f:	e8 cc fc ff ff       	callq  400e00 <puts@plt>
  401134:	bf 18 33 40 00       	mov    $0x403318,%edi
  401139:	e8 c2 fc ff ff       	callq  400e00 <puts@plt>
  40113e:	bf c8 31 40 00       	mov    $0x4031c8,%edi
  401143:	e8 b8 fc ff ff       	callq  400e00 <puts@plt>
  401148:	bf 32 33 40 00       	mov    $0x403332,%edi
  40114d:	e8 ae fc ff ff       	callq  400e00 <puts@plt>
  401152:	eb 32                	jmp    401186 <usage+0x80>
  401154:	be 4e 33 40 00       	mov    $0x40334e,%esi
  401159:	bf 01 00 00 00       	mov    $0x1,%edi
  40115e:	b8 00 00 00 00       	mov    $0x0,%eax
  401163:	e8 e8 fd ff ff       	callq  400f50 <__printf_chk@plt>
  401168:	bf f0 31 40 00       	mov    $0x4031f0,%edi
  40116d:	e8 8e fc ff ff       	callq  400e00 <puts@plt>
  401172:	bf 18 32 40 00       	mov    $0x403218,%edi
  401177:	e8 84 fc ff ff       	callq  400e00 <puts@plt>
  40117c:	bf 6c 33 40 00       	mov    $0x40336c,%edi
  401181:	e8 7a fc ff ff       	callq  400e00 <puts@plt>
  401186:	bf 00 00 00 00       	mov    $0x0,%edi
  40118b:	e8 10 fe ff ff       	callq  400fa0 <exit@plt>

0000000000401190 <initialize_target>:
  401190:	55                   	push   %rbp
  401191:	53                   	push   %rbx
  401192:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401199:	89 f5                	mov    %esi,%ebp
  40119b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011a2:	00 00 
  4011a4:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  4011ab:	00 
  4011ac:	31 c0                	xor    %eax,%eax
  4011ae:	89 3d 84 43 20 00    	mov    %edi,0x204384(%rip)        # 605538 <check_level>
  4011b4:	8b 3d ce 3f 20 00    	mov    0x203fce(%rip),%edi        # 605188 <target_id>
  4011ba:	e8 00 1f 00 00       	callq  4030bf <gencookie>
  4011bf:	89 05 7f 43 20 00    	mov    %eax,0x20437f(%rip)        # 605544 <cookie>
  4011c5:	89 c7                	mov    %eax,%edi
  4011c7:	e8 f3 1e 00 00       	callq  4030bf <gencookie>
  4011cc:	89 05 6e 43 20 00    	mov    %eax,0x20436e(%rip)        # 605540 <authkey>
  4011d2:	8b 05 b0 3f 20 00    	mov    0x203fb0(%rip),%eax        # 605188 <target_id>
  4011d8:	8d 78 01             	lea    0x1(%rax),%edi
  4011db:	e8 f0 fb ff ff       	callq  400dd0 <srandom@plt>
  4011e0:	e8 1b fd ff ff       	callq  400f00 <random@plt>
  4011e5:	89 c7                	mov    %eax,%edi
  4011e7:	e8 03 03 00 00       	callq  4014ef <scramble>
  4011ec:	89 c3                	mov    %eax,%ebx
  4011ee:	85 ed                	test   %ebp,%ebp
  4011f0:	74 18                	je     40120a <initialize_target+0x7a>
  4011f2:	bf 00 00 00 00       	mov    $0x0,%edi
  4011f7:	e8 f4 fc ff ff       	callq  400ef0 <time@plt>
  4011fc:	89 c7                	mov    %eax,%edi
  4011fe:	e8 cd fb ff ff       	callq  400dd0 <srandom@plt>
  401203:	e8 f8 fc ff ff       	callq  400f00 <random@plt>
  401208:	eb 05                	jmp    40120f <initialize_target+0x7f>
  40120a:	b8 00 00 00 00       	mov    $0x0,%eax
  40120f:	01 c3                	add    %eax,%ebx
  401211:	0f b7 db             	movzwl %bx,%ebx
  401214:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  40121b:	89 c0                	mov    %eax,%eax
  40121d:	48 89 05 9c 42 20 00 	mov    %rax,0x20429c(%rip)        # 6054c0 <buf_offset>
  401224:	c6 05 3d 4f 20 00 72 	movb   $0x72,0x204f3d(%rip)        # 606168 <target_prefix>
  40122b:	83 3d 96 42 20 00 00 	cmpl   $0x0,0x204296(%rip)        # 6054c8 <notify>
  401232:	0f 84 bb 00 00 00    	je     4012f3 <initialize_target+0x163>
  401238:	83 3d 09 43 20 00 00 	cmpl   $0x0,0x204309(%rip)        # 605548 <is_checker>
  40123f:	0f 85 ae 00 00 00    	jne    4012f3 <initialize_target+0x163>
  401245:	be 00 01 00 00       	mov    $0x100,%esi
  40124a:	48 89 e7             	mov    %rsp,%rdi
  40124d:	e8 3e fd ff ff       	callq  400f90 <gethostname@plt>
  401252:	85 c0                	test   %eax,%eax
  401254:	74 25                	je     40127b <initialize_target+0xeb>
  401256:	bf 48 32 40 00       	mov    $0x403248,%edi
  40125b:	e8 a0 fb ff ff       	callq  400e00 <puts@plt>
  401260:	bf 08 00 00 00       	mov    $0x8,%edi
  401265:	e8 36 fd ff ff       	callq  400fa0 <exit@plt>
  40126a:	48 89 e6             	mov    %rsp,%rsi
  40126d:	e8 3e fb ff ff       	callq  400db0 <strcasecmp@plt>
  401272:	85 c0                	test   %eax,%eax
  401274:	74 21                	je     401297 <initialize_target+0x107>
  401276:	83 c3 01             	add    $0x1,%ebx
  401279:	eb 05                	jmp    401280 <initialize_target+0xf0>
  40127b:	bb 00 00 00 00       	mov    $0x0,%ebx
  401280:	48 63 c3             	movslq %ebx,%rax
  401283:	48 8b 3c c5 a0 51 60 	mov    0x6051a0(,%rax,8),%rdi
  40128a:	00 
  40128b:	48 85 ff             	test   %rdi,%rdi
  40128e:	75 da                	jne    40126a <initialize_target+0xda>
  401290:	b8 00 00 00 00       	mov    $0x0,%eax
  401295:	eb 05                	jmp    40129c <initialize_target+0x10c>
  401297:	b8 01 00 00 00       	mov    $0x1,%eax
  40129c:	85 c0                	test   %eax,%eax
  40129e:	75 1c                	jne    4012bc <initialize_target+0x12c>
  4012a0:	48 89 e2             	mov    %rsp,%rdx
  4012a3:	be 80 32 40 00       	mov    $0x403280,%esi
  4012a8:	bf 01 00 00 00       	mov    $0x1,%edi
  4012ad:	e8 9e fc ff ff       	callq  400f50 <__printf_chk@plt>
  4012b2:	bf 08 00 00 00       	mov    $0x8,%edi
  4012b7:	e8 e4 fc ff ff       	callq  400fa0 <exit@plt>
  4012bc:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4012c3:	00 
  4012c4:	e8 60 1b 00 00       	callq  402e29 <init_driver>
  4012c9:	85 c0                	test   %eax,%eax
  4012cb:	79 26                	jns    4012f3 <initialize_target+0x163>
  4012cd:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  4012d4:	00 
  4012d5:	be c0 32 40 00       	mov    $0x4032c0,%esi
  4012da:	bf 01 00 00 00       	mov    $0x1,%edi
  4012df:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e4:	e8 67 fc ff ff       	callq  400f50 <__printf_chk@plt>
  4012e9:	bf 08 00 00 00       	mov    $0x8,%edi
  4012ee:	e8 ad fc ff ff       	callq  400fa0 <exit@plt>
  4012f3:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  4012fa:	00 
  4012fb:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401302:	00 00 
  401304:	74 05                	je     40130b <initialize_target+0x17b>
  401306:	e8 15 fb ff ff       	callq  400e20 <__stack_chk_fail@plt>
  40130b:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  401312:	5b                   	pop    %rbx
  401313:	5d                   	pop    %rbp
  401314:	c3                   	retq   

0000000000401315 <main>:
  401315:	41 56                	push   %r14
  401317:	41 55                	push   %r13
  401319:	41 54                	push   %r12
  40131b:	55                   	push   %rbp
  40131c:	53                   	push   %rbx
  40131d:	41 89 fc             	mov    %edi,%r12d
  401320:	48 89 f3             	mov    %rsi,%rbx
  401323:	be 64 21 40 00       	mov    $0x402164,%esi
  401328:	bf 0b 00 00 00       	mov    $0xb,%edi
  40132d:	e8 6e fb ff ff       	callq  400ea0 <signal@plt>
  401332:	be 16 21 40 00       	mov    $0x402116,%esi
  401337:	bf 07 00 00 00       	mov    $0x7,%edi
  40133c:	e8 5f fb ff ff       	callq  400ea0 <signal@plt>
  401341:	be b2 21 40 00       	mov    $0x4021b2,%esi
  401346:	bf 04 00 00 00       	mov    $0x4,%edi
  40134b:	e8 50 fb ff ff       	callq  400ea0 <signal@plt>
  401350:	83 3d f1 41 20 00 00 	cmpl   $0x0,0x2041f1(%rip)        # 605548 <is_checker>
  401357:	74 20                	je     401379 <main+0x64>
  401359:	be 00 22 40 00       	mov    $0x402200,%esi
  40135e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401363:	e8 38 fb ff ff       	callq  400ea0 <signal@plt>
  401368:	bf 05 00 00 00       	mov    $0x5,%edi
  40136d:	e8 de fa ff ff       	callq  400e50 <alarm@plt>
  401372:	bd 8a 33 40 00       	mov    $0x40338a,%ebp
  401377:	eb 05                	jmp    40137e <main+0x69>
  401379:	bd 85 33 40 00       	mov    $0x403385,%ebp
  40137e:	48 8b 05 6b 41 20 00 	mov    0x20416b(%rip),%rax        # 6054f0 <stdin@@GLIBC_2.2.5>
  401385:	48 89 05 a4 41 20 00 	mov    %rax,0x2041a4(%rip)        # 605530 <infile>
  40138c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401392:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401398:	e9 c6 00 00 00       	jmpq   401463 <main+0x14e>
  40139d:	83 e8 61             	sub    $0x61,%eax
  4013a0:	3c 10                	cmp    $0x10,%al
  4013a2:	0f 87 9c 00 00 00    	ja     401444 <main+0x12f>
  4013a8:	0f b6 c0             	movzbl %al,%eax
  4013ab:	ff 24 c5 d0 33 40 00 	jmpq   *0x4033d0(,%rax,8)
  4013b2:	48 8b 3b             	mov    (%rbx),%rdi
  4013b5:	e8 4c fd ff ff       	callq  401106 <usage>
  4013ba:	be dd 39 40 00       	mov    $0x4039dd,%esi
  4013bf:	48 8b 3d 32 41 20 00 	mov    0x204132(%rip),%rdi        # 6054f8 <optarg@@GLIBC_2.2.5>
  4013c6:	e8 95 fb ff ff       	callq  400f60 <fopen@plt>
  4013cb:	48 89 05 5e 41 20 00 	mov    %rax,0x20415e(%rip)        # 605530 <infile>
  4013d2:	48 85 c0             	test   %rax,%rax
  4013d5:	0f 85 88 00 00 00    	jne    401463 <main+0x14e>
  4013db:	48 8b 0d 16 41 20 00 	mov    0x204116(%rip),%rcx        # 6054f8 <optarg@@GLIBC_2.2.5>
  4013e2:	ba 92 33 40 00       	mov    $0x403392,%edx
  4013e7:	be 01 00 00 00       	mov    $0x1,%esi
  4013ec:	48 8b 3d 0d 41 20 00 	mov    0x20410d(%rip),%rdi        # 605500 <stderr@@GLIBC_2.2.5>
  4013f3:	e8 c8 fb ff ff       	callq  400fc0 <__fprintf_chk@plt>
  4013f8:	b8 01 00 00 00       	mov    $0x1,%eax
  4013fd:	e9 e4 00 00 00       	jmpq   4014e6 <main+0x1d1>
  401402:	ba 10 00 00 00       	mov    $0x10,%edx
  401407:	be 00 00 00 00       	mov    $0x0,%esi
  40140c:	48 8b 3d e5 40 20 00 	mov    0x2040e5(%rip),%rdi        # 6054f8 <optarg@@GLIBC_2.2.5>
  401413:	e8 68 fb ff ff       	callq  400f80 <strtoul@plt>
  401418:	41 89 c6             	mov    %eax,%r14d
  40141b:	eb 46                	jmp    401463 <main+0x14e>
  40141d:	ba 0a 00 00 00       	mov    $0xa,%edx
  401422:	be 00 00 00 00       	mov    $0x0,%esi
  401427:	48 8b 3d ca 40 20 00 	mov    0x2040ca(%rip),%rdi        # 6054f8 <optarg@@GLIBC_2.2.5>
  40142e:	e8 9d fa ff ff       	callq  400ed0 <strtol@plt>
  401433:	41 89 c5             	mov    %eax,%r13d
  401436:	eb 2b                	jmp    401463 <main+0x14e>
  401438:	c7 05 86 40 20 00 00 	movl   $0x0,0x204086(%rip)        # 6054c8 <notify>
  40143f:	00 00 00 
  401442:	eb 1f                	jmp    401463 <main+0x14e>
  401444:	0f be d2             	movsbl %dl,%edx
  401447:	be af 33 40 00       	mov    $0x4033af,%esi
  40144c:	bf 01 00 00 00       	mov    $0x1,%edi
  401451:	b8 00 00 00 00       	mov    $0x0,%eax
  401456:	e8 f5 fa ff ff       	callq  400f50 <__printf_chk@plt>
  40145b:	48 8b 3b             	mov    (%rbx),%rdi
  40145e:	e8 a3 fc ff ff       	callq  401106 <usage>
  401463:	48 89 ea             	mov    %rbp,%rdx
  401466:	48 89 de             	mov    %rbx,%rsi
  401469:	44 89 e7             	mov    %r12d,%edi
  40146c:	e8 ff fa ff ff       	callq  400f70 <getopt@plt>
  401471:	89 c2                	mov    %eax,%edx
  401473:	3c ff                	cmp    $0xff,%al
  401475:	0f 85 22 ff ff ff    	jne    40139d <main+0x88>
  40147b:	be 01 00 00 00       	mov    $0x1,%esi
  401480:	44 89 ef             	mov    %r13d,%edi
  401483:	e8 08 fd ff ff       	callq  401190 <initialize_target>
  401488:	83 3d b9 40 20 00 00 	cmpl   $0x0,0x2040b9(%rip)        # 605548 <is_checker>
  40148f:	74 2a                	je     4014bb <main+0x1a6>
  401491:	44 3b 35 a8 40 20 00 	cmp    0x2040a8(%rip),%r14d        # 605540 <authkey>
  401498:	74 21                	je     4014bb <main+0x1a6>
  40149a:	44 89 f2             	mov    %r14d,%edx
  40149d:	be e8 32 40 00       	mov    $0x4032e8,%esi
  4014a2:	bf 01 00 00 00       	mov    $0x1,%edi
  4014a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ac:	e8 9f fa ff ff       	callq  400f50 <__printf_chk@plt>
  4014b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4014b6:	e8 fc 08 00 00       	callq  401db7 <check_fail>
  4014bb:	8b 15 83 40 20 00    	mov    0x204083(%rip),%edx        # 605544 <cookie>
  4014c1:	be c2 33 40 00       	mov    $0x4033c2,%esi
  4014c6:	bf 01 00 00 00       	mov    $0x1,%edi
  4014cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4014d0:	e8 7b fa ff ff       	callq  400f50 <__printf_chk@plt>
  4014d5:	48 8b 3d e4 3f 20 00 	mov    0x203fe4(%rip),%rdi        # 6054c0 <buf_offset>
  4014dc:	e8 72 0d 00 00       	callq  402253 <launch>
  4014e1:	b8 00 00 00 00       	mov    $0x0,%eax
  4014e6:	5b                   	pop    %rbx
  4014e7:	5d                   	pop    %rbp
  4014e8:	41 5c                	pop    %r12
  4014ea:	41 5d                	pop    %r13
  4014ec:	41 5e                	pop    %r14
  4014ee:	c3                   	retq   

00000000004014ef <scramble>:
  4014ef:	48 83 ec 38          	sub    $0x38,%rsp
  4014f3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4014fa:	00 00 
  4014fc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  401501:	31 c0                	xor    %eax,%eax
  401503:	eb 10                	jmp    401515 <scramble+0x26>
  401505:	69 d0 cd cf 00 00    	imul   $0xcfcd,%eax,%edx
  40150b:	01 fa                	add    %edi,%edx
  40150d:	89 c1                	mov    %eax,%ecx
  40150f:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  401512:	83 c0 01             	add    $0x1,%eax
  401515:	83 f8 09             	cmp    $0x9,%eax
  401518:	76 eb                	jbe    401505 <scramble+0x16>
  40151a:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40151e:	69 c0 1b 16 00 00    	imul   $0x161b,%eax,%eax
  401524:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401528:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40152c:	69 c0 21 c9 00 00    	imul   $0xc921,%eax,%eax
  401532:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401536:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40153a:	69 c0 91 d4 00 00    	imul   $0xd491,%eax,%eax
  401540:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401544:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401548:	69 c0 e3 23 00 00    	imul   $0x23e3,%eax,%eax
  40154e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401552:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401556:	69 c0 85 ae 00 00    	imul   $0xae85,%eax,%eax
  40155c:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401560:	8b 04 24             	mov    (%rsp),%eax
  401563:	69 c0 f2 f6 00 00    	imul   $0xf6f2,%eax,%eax
  401569:	89 04 24             	mov    %eax,(%rsp)
  40156c:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401570:	69 c0 23 4d 00 00    	imul   $0x4d23,%eax,%eax
  401576:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40157a:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40157e:	69 c0 41 f0 00 00    	imul   $0xf041,%eax,%eax
  401584:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401588:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40158c:	69 c0 22 b8 00 00    	imul   $0xb822,%eax,%eax
  401592:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401596:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40159a:	69 c0 6c 51 00 00    	imul   $0x516c,%eax,%eax
  4015a0:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015a4:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4015a8:	69 c0 e5 a2 00 00    	imul   $0xa2e5,%eax,%eax
  4015ae:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4015b2:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015b6:	69 c0 d8 73 00 00    	imul   $0x73d8,%eax,%eax
  4015bc:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015c0:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015c4:	8d 14 80             	lea    (%rax,%rax,4),%edx
  4015c7:	89 d0                	mov    %edx,%eax
  4015c9:	c1 e0 0b             	shl    $0xb,%eax
  4015cc:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015d0:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4015d4:	69 c0 e8 fe 00 00    	imul   $0xfee8,%eax,%eax
  4015da:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4015de:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4015e2:	69 c0 b7 b3 00 00    	imul   $0xb3b7,%eax,%eax
  4015e8:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4015ec:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015f0:	69 c0 68 31 00 00    	imul   $0x3168,%eax,%eax
  4015f6:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015fa:	8b 04 24             	mov    (%rsp),%eax
  4015fd:	69 c0 d4 e4 00 00    	imul   $0xe4d4,%eax,%eax
  401603:	89 04 24             	mov    %eax,(%rsp)
  401606:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40160a:	69 c0 98 0d 00 00    	imul   $0xd98,%eax,%eax
  401610:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401614:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401618:	69 c0 6f 8a 00 00    	imul   $0x8a6f,%eax,%eax
  40161e:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401622:	8b 04 24             	mov    (%rsp),%eax
  401625:	69 c0 c3 57 00 00    	imul   $0x57c3,%eax,%eax
  40162b:	89 04 24             	mov    %eax,(%rsp)
  40162e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401632:	69 c0 62 69 00 00    	imul   $0x6962,%eax,%eax
  401638:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40163c:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401640:	69 c0 18 c8 00 00    	imul   $0xc818,%eax,%eax
  401646:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40164a:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40164e:	69 c0 0d dc 00 00    	imul   $0xdc0d,%eax,%eax
  401654:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401658:	8b 04 24             	mov    (%rsp),%eax
  40165b:	69 c0 5d aa 00 00    	imul   $0xaa5d,%eax,%eax
  401661:	89 04 24             	mov    %eax,(%rsp)
  401664:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401668:	69 c0 65 3b 00 00    	imul   $0x3b65,%eax,%eax
  40166e:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401672:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401676:	69 c0 ec 96 00 00    	imul   $0x96ec,%eax,%eax
  40167c:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401680:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401684:	69 c0 f1 2b 00 00    	imul   $0x2bf1,%eax,%eax
  40168a:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40168e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401692:	69 c0 ef 09 00 00    	imul   $0x9ef,%eax,%eax
  401698:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40169c:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4016a0:	69 c0 06 8f 00 00    	imul   $0x8f06,%eax,%eax
  4016a6:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4016aa:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4016ae:	69 c0 8c b5 00 00    	imul   $0xb58c,%eax,%eax
  4016b4:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4016b8:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4016bc:	69 c0 e1 3e 00 00    	imul   $0x3ee1,%eax,%eax
  4016c2:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4016c6:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016ca:	69 c0 8f 0c 00 00    	imul   $0xc8f,%eax,%eax
  4016d0:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016d4:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4016d8:	69 c0 7f e1 00 00    	imul   $0xe17f,%eax,%eax
  4016de:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4016e2:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4016e6:	69 c0 1a dd 00 00    	imul   $0xdd1a,%eax,%eax
  4016ec:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4016f0:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4016f4:	69 c0 a2 4b 00 00    	imul   $0x4ba2,%eax,%eax
  4016fa:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4016fe:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401702:	69 c0 e2 a4 00 00    	imul   $0xa4e2,%eax,%eax
  401708:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40170c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401710:	69 c0 93 83 00 00    	imul   $0x8393,%eax,%eax
  401716:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40171a:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40171e:	69 c0 8b 6b 00 00    	imul   $0x6b8b,%eax,%eax
  401724:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401728:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40172c:	69 c0 55 25 00 00    	imul   $0x2555,%eax,%eax
  401732:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401736:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40173a:	69 c0 d1 f3 00 00    	imul   $0xf3d1,%eax,%eax
  401740:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401744:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401748:	69 c0 b2 11 00 00    	imul   $0x11b2,%eax,%eax
  40174e:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401752:	8b 04 24             	mov    (%rsp),%eax
  401755:	69 c0 05 3f 00 00    	imul   $0x3f05,%eax,%eax
  40175b:	89 04 24             	mov    %eax,(%rsp)
  40175e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401762:	69 c0 81 95 00 00    	imul   $0x9581,%eax,%eax
  401768:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40176c:	8b 04 24             	mov    (%rsp),%eax
  40176f:	69 c0 95 91 00 00    	imul   $0x9195,%eax,%eax
  401775:	89 04 24             	mov    %eax,(%rsp)
  401778:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40177c:	69 c0 cd 51 00 00    	imul   $0x51cd,%eax,%eax
  401782:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401786:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40178a:	69 c0 45 67 00 00    	imul   $0x6745,%eax,%eax
  401790:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401794:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401798:	69 c0 17 2e 00 00    	imul   $0x2e17,%eax,%eax
  40179e:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4017a2:	8b 04 24             	mov    (%rsp),%eax
  4017a5:	69 c0 63 b4 00 00    	imul   $0xb463,%eax,%eax
  4017ab:	89 04 24             	mov    %eax,(%rsp)
  4017ae:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4017b2:	69 c0 fc 8d 00 00    	imul   $0x8dfc,%eax,%eax
  4017b8:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4017bc:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4017c0:	69 c0 84 7b 00 00    	imul   $0x7b84,%eax,%eax
  4017c6:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4017ca:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4017ce:	69 c0 5b c6 00 00    	imul   $0xc65b,%eax,%eax
  4017d4:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4017d8:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4017dc:	69 c0 a4 8e 00 00    	imul   $0x8ea4,%eax,%eax
  4017e2:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4017e6:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4017ea:	69 c0 61 8d 00 00    	imul   $0x8d61,%eax,%eax
  4017f0:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4017f4:	8b 04 24             	mov    (%rsp),%eax
  4017f7:	69 c0 90 a9 00 00    	imul   $0xa990,%eax,%eax
  4017fd:	89 04 24             	mov    %eax,(%rsp)
  401800:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401804:	69 c0 17 10 00 00    	imul   $0x1017,%eax,%eax
  40180a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40180e:	8b 04 24             	mov    (%rsp),%eax
  401811:	69 c0 71 13 00 00    	imul   $0x1371,%eax,%eax
  401817:	89 04 24             	mov    %eax,(%rsp)
  40181a:	8b 04 24             	mov    (%rsp),%eax
  40181d:	69 c0 1e 28 00 00    	imul   $0x281e,%eax,%eax
  401823:	89 04 24             	mov    %eax,(%rsp)
  401826:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40182a:	69 c0 6e 5f 00 00    	imul   $0x5f6e,%eax,%eax
  401830:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401834:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401838:	69 c0 6b 9b 00 00    	imul   $0x9b6b,%eax,%eax
  40183e:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401842:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401846:	69 c0 27 e2 00 00    	imul   $0xe227,%eax,%eax
  40184c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401850:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401854:	69 c0 25 38 00 00    	imul   $0x3825,%eax,%eax
  40185a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40185e:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401862:	69 c0 e6 7d 00 00    	imul   $0x7de6,%eax,%eax
  401868:	89 44 24 20          	mov    %eax,0x20(%rsp)
  40186c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401870:	69 c0 42 bd 00 00    	imul   $0xbd42,%eax,%eax
  401876:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40187a:	8b 04 24             	mov    (%rsp),%eax
  40187d:	69 c0 d2 75 00 00    	imul   $0x75d2,%eax,%eax
  401883:	89 04 24             	mov    %eax,(%rsp)
  401886:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40188a:	69 c0 c7 c3 00 00    	imul   $0xc3c7,%eax,%eax
  401890:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401894:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401898:	69 c0 dd 24 00 00    	imul   $0x24dd,%eax,%eax
  40189e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4018a2:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4018a6:	69 c0 bd 11 00 00    	imul   $0x11bd,%eax,%eax
  4018ac:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4018b0:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4018b4:	69 c0 11 d4 00 00    	imul   $0xd411,%eax,%eax
  4018ba:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4018be:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4018c2:	69 c0 b0 ad 00 00    	imul   $0xadb0,%eax,%eax
  4018c8:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4018cc:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4018d0:	69 c0 d5 51 00 00    	imul   $0x51d5,%eax,%eax
  4018d6:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4018da:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4018de:	69 c0 02 1b 00 00    	imul   $0x1b02,%eax,%eax
  4018e4:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4018e8:	ba 00 00 00 00       	mov    $0x0,%edx
  4018ed:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f2:	eb 0a                	jmp    4018fe <scramble+0x40f>
  4018f4:	89 d1                	mov    %edx,%ecx
  4018f6:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  4018f9:	01 c8                	add    %ecx,%eax
  4018fb:	83 c2 01             	add    $0x1,%edx
  4018fe:	83 fa 09             	cmp    $0x9,%edx
  401901:	76 f1                	jbe    4018f4 <scramble+0x405>
  401903:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  401908:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  40190f:	00 00 
  401911:	74 05                	je     401918 <scramble+0x429>
  401913:	e8 08 f5 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  401918:	48 83 c4 38          	add    $0x38,%rsp
  40191c:	c3                   	retq   

000000000040191d <getbuf>:
  40191d:	48 83 ec 78          	sub    $0x78,%rsp
  401921:	48 89 e7             	mov    %rsp,%rdi
  401924:	e8 c3 04 00 00       	callq  401dec <Gets>
  401929:	b8 01 00 00 00       	mov    $0x1,%eax
  40192e:	48 83 c4 78          	add    $0x78,%rsp
  401932:	c3                   	retq   

0000000000401933 <touch1>:
  401933:	48 83 ec 08          	sub    $0x8,%rsp
  401937:	bf 04 00 00 00       	mov    $0x4,%edi
  40193c:	e8 4f f5 ff ff       	callq  400e90 <srand@plt>
  401941:	e8 8a f6 ff ff       	callq  400fd0 <rand@plt>
  401946:	89 c1                	mov    %eax,%ecx
  401948:	ba e9 a2 8b 2e       	mov    $0x2e8ba2e9,%edx
  40194d:	f7 ea                	imul   %edx
  40194f:	d1 fa                	sar    %edx
  401951:	89 c8                	mov    %ecx,%eax
  401953:	c1 f8 1f             	sar    $0x1f,%eax
  401956:	29 c2                	sub    %eax,%edx
  401958:	8d 04 92             	lea    (%rdx,%rdx,4),%eax
  40195b:	8d 04 42             	lea    (%rdx,%rax,2),%eax
  40195e:	29 c1                	sub    %eax,%ecx
  401960:	83 f9 02             	cmp    $0x2,%ecx
  401963:	74 20                	je     401985 <touch1+0x52>
  401965:	c7 05 cd 3b 20 00 01 	movl   $0x1,0x203bcd(%rip)        # 60553c <vlevel>
  40196c:	00 00 00 
  40196f:	bf 5b 37 40 00       	mov    $0x40375b,%edi
  401974:	e8 87 f4 ff ff       	callq  400e00 <puts@plt>
  401979:	bf 01 00 00 00       	mov    $0x1,%edi
  40197e:	e8 a9 06 00 00       	callq  40202c <validate>
  401983:	eb 14                	jmp    401999 <touch1+0x66>
  401985:	bf 88 37 40 00       	mov    $0x403788,%edi
  40198a:	e8 71 f4 ff ff       	callq  400e00 <puts@plt>
  40198f:	bf 01 00 00 00       	mov    $0x1,%edi
  401994:	e8 55 07 00 00       	callq  4020ee <fail>
  401999:	bf 00 00 00 00       	mov    $0x0,%edi
  40199e:	e8 fd f5 ff ff       	callq  400fa0 <exit@plt>

00000000004019a3 <touch2>:
  4019a3:	48 83 ec 08          	sub    $0x8,%rsp
  4019a7:	c7 05 8b 3b 20 00 02 	movl   $0x2,0x203b8b(%rip)        # 60553c <vlevel>
  4019ae:	00 00 00 
  4019b1:	8b 05 8d 3b 20 00    	mov    0x203b8d(%rip),%eax        # 605544 <cookie>
  4019b7:	39 f8                	cmp    %edi,%eax
  4019b9:	75 2b                	jne    4019e6 <touch2+0x43>
  4019bb:	6b c0 03             	imul   $0x3,%eax,%eax
  4019be:	39 f0                	cmp    %esi,%eax
  4019c0:	75 24                	jne    4019e6 <touch2+0x43>
  4019c2:	89 f1                	mov    %esi,%ecx
  4019c4:	89 fa                	mov    %edi,%edx
  4019c6:	be d0 37 40 00       	mov    $0x4037d0,%esi
  4019cb:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4019d5:	e8 76 f5 ff ff       	callq  400f50 <__printf_chk@plt>
  4019da:	bf 02 00 00 00       	mov    $0x2,%edi
  4019df:	e8 48 06 00 00       	callq  40202c <validate>
  4019e4:	eb 22                	jmp    401a08 <touch2+0x65>
  4019e6:	89 f1                	mov    %esi,%ecx
  4019e8:	89 fa                	mov    %edi,%edx
  4019ea:	be 00 38 40 00       	mov    $0x403800,%esi
  4019ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4019f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4019f9:	e8 52 f5 ff ff       	callq  400f50 <__printf_chk@plt>
  4019fe:	bf 02 00 00 00       	mov    $0x2,%edi
  401a03:	e8 e6 06 00 00       	callq  4020ee <fail>
  401a08:	bf 00 00 00 00       	mov    $0x0,%edi
  401a0d:	e8 8e f5 ff ff       	callq  400fa0 <exit@plt>

0000000000401a12 <hexmatch>:
  401a12:	41 54                	push   %r12
  401a14:	55                   	push   %rbp
  401a15:	53                   	push   %rbx
  401a16:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  401a1a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a21:	00 00 
  401a23:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401a28:	31 c0                	xor    %eax,%eax
  401a2a:	48 85 f6             	test   %rsi,%rsi
  401a2d:	74 6e                	je     401a9d <hexmatch+0x8b>
  401a2f:	89 fd                	mov    %edi,%ebp
  401a31:	48 89 f3             	mov    %rsi,%rbx
  401a34:	e8 c7 f4 ff ff       	callq  400f00 <random@plt>
  401a39:	48 89 c1             	mov    %rax,%rcx
  401a3c:	48 ba 05 79 4a 90 a7 	movabs $0x4a7904a7904a7905,%rdx
  401a43:	04 79 4a 
  401a46:	48 f7 ea             	imul   %rdx
  401a49:	48 c1 fa 05          	sar    $0x5,%rdx
  401a4d:	48 89 c8             	mov    %rcx,%rax
  401a50:	48 c1 f8 3f          	sar    $0x3f,%rax
  401a54:	48 29 c2             	sub    %rax,%rdx
  401a57:	48 6b d2 6e          	imul   $0x6e,%rdx,%rdx
  401a5b:	48 29 d1             	sub    %rdx,%rcx
  401a5e:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401a62:	41 89 e8             	mov    %ebp,%r8d
  401a65:	b9 78 37 40 00       	mov    $0x403778,%ecx
  401a6a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401a71:	be 01 00 00 00       	mov    $0x1,%esi
  401a76:	4c 89 e7             	mov    %r12,%rdi
  401a79:	b8 00 00 00 00       	mov    $0x0,%eax
  401a7e:	e8 5d f5 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  401a83:	ba 09 00 00 00       	mov    $0x9,%edx
  401a88:	4c 89 e6             	mov    %r12,%rsi
  401a8b:	48 89 df             	mov    %rbx,%rdi
  401a8e:	e8 4d f3 ff ff       	callq  400de0 <strncmp@plt>
  401a93:	85 c0                	test   %eax,%eax
  401a95:	0f 94 c0             	sete   %al
  401a98:	0f b6 c0             	movzbl %al,%eax
  401a9b:	eb 05                	jmp    401aa2 <hexmatch+0x90>
  401a9d:	b8 00 00 00 00       	mov    $0x0,%eax
  401aa2:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  401aa7:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401aae:	00 00 
  401ab0:	74 05                	je     401ab7 <hexmatch+0xa5>
  401ab2:	e8 69 f3 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  401ab7:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  401abb:	5b                   	pop    %rbx
  401abc:	5d                   	pop    %rbp
  401abd:	41 5c                	pop    %r12
  401abf:	c3                   	retq   

0000000000401ac0 <checkmult>:
  401ac0:	41 54                	push   %r12
  401ac2:	55                   	push   %rbp
  401ac3:	53                   	push   %rbx
  401ac4:	48 83 ec 50          	sub    $0x50,%rsp
  401ac8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401acf:	00 00 
  401ad1:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  401ad6:	31 c0                	xor    %eax,%eax
  401ad8:	48 85 f6             	test   %rsi,%rsi
  401adb:	0f 84 96 00 00 00    	je     401b77 <checkmult+0xb7>
  401ae1:	41 89 fc             	mov    %edi,%r12d
  401ae4:	48 89 f5             	mov    %rsi,%rbp
  401ae7:	e8 14 f4 ff ff       	callq  400f00 <random@plt>
  401aec:	48 89 c1             	mov    %rax,%rcx
  401aef:	48 ba 89 88 88 88 88 	movabs $0x8888888888888889,%rdx
  401af6:	88 88 88 
  401af9:	48 f7 ea             	imul   %rdx
  401afc:	48 01 ca             	add    %rcx,%rdx
  401aff:	48 c1 fa 05          	sar    $0x5,%rdx
  401b03:	48 89 c8             	mov    %rcx,%rax
  401b06:	48 c1 f8 3f          	sar    $0x3f,%rax
  401b0a:	48 29 c2             	sub    %rax,%rdx
  401b0d:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  401b14:	00 
  401b15:	48 c1 e2 06          	shl    $0x6,%rdx
  401b19:	48 29 c2             	sub    %rax,%rdx
  401b1c:	48 29 d1             	sub    %rdx,%rcx
  401b1f:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  401b23:	45 89 e0             	mov    %r12d,%r8d
  401b26:	b9 78 37 40 00       	mov    $0x403778,%ecx
  401b2b:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401b32:	be 01 00 00 00       	mov    $0x1,%esi
  401b37:	48 89 df             	mov    %rbx,%rdi
  401b3a:	b8 00 00 00 00       	mov    $0x0,%eax
  401b3f:	e8 9c f4 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  401b44:	ba 00 00 00 00       	mov    $0x0,%edx
  401b49:	eb 20                	jmp    401b6b <checkmult+0xab>
  401b4b:	48 63 ca             	movslq %edx,%rcx
  401b4e:	b8 07 00 00 00       	mov    $0x7,%eax
  401b53:	29 d0                	sub    %edx,%eax
  401b55:	48 98                	cltq   
  401b57:	0f be 34 0b          	movsbl (%rbx,%rcx,1),%esi
  401b5b:	0f be 04 03          	movsbl (%rbx,%rax,1),%eax
  401b5f:	0f af c6             	imul   %esi,%eax
  401b62:	39 44 8d 00          	cmp    %eax,0x0(%rbp,%rcx,4)
  401b66:	75 16                	jne    401b7e <checkmult+0xbe>
  401b68:	83 c2 01             	add    $0x1,%edx
  401b6b:	83 fa 07             	cmp    $0x7,%edx
  401b6e:	7e db                	jle    401b4b <checkmult+0x8b>
  401b70:	b8 01 00 00 00       	mov    $0x1,%eax
  401b75:	eb 0c                	jmp    401b83 <checkmult+0xc3>
  401b77:	b8 00 00 00 00       	mov    $0x0,%eax
  401b7c:	eb 05                	jmp    401b83 <checkmult+0xc3>
  401b7e:	b8 00 00 00 00       	mov    $0x0,%eax
  401b83:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  401b88:	64 48 33 3c 25 28 00 	xor    %fs:0x28,%rdi
  401b8f:	00 00 
  401b91:	74 05                	je     401b98 <checkmult+0xd8>
  401b93:	e8 88 f2 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  401b98:	48 83 c4 50          	add    $0x50,%rsp
  401b9c:	5b                   	pop    %rbx
  401b9d:	5d                   	pop    %rbp
  401b9e:	41 5c                	pop    %r12
  401ba0:	c3                   	retq   

0000000000401ba1 <touch3>:
  401ba1:	55                   	push   %rbp
  401ba2:	53                   	push   %rbx
  401ba3:	48 83 ec 08          	sub    $0x8,%rsp
  401ba7:	48 89 fb             	mov    %rdi,%rbx
  401baa:	48 89 f5             	mov    %rsi,%rbp
  401bad:	c7 05 85 39 20 00 03 	movl   $0x3,0x203985(%rip)        # 60553c <vlevel>
  401bb4:	00 00 00 
  401bb7:	48 89 fe             	mov    %rdi,%rsi
  401bba:	8b 3d 84 39 20 00    	mov    0x203984(%rip),%edi        # 605544 <cookie>
  401bc0:	e8 4d fe ff ff       	callq  401a12 <hexmatch>
  401bc5:	85 c0                	test   %eax,%eax
  401bc7:	74 28                	je     401bf1 <touch3+0x50>
  401bc9:	48 89 ee             	mov    %rbp,%rsi
  401bcc:	8b 3d 72 39 20 00    	mov    0x203972(%rip),%edi        # 605544 <cookie>
  401bd2:	e8 e9 fe ff ff       	callq  401ac0 <checkmult>
  401bd7:	85 c0                	test   %eax,%eax
  401bd9:	74 16                	je     401bf1 <touch3+0x50>
  401bdb:	bf 30 38 40 00       	mov    $0x403830,%edi
  401be0:	e8 1b f2 ff ff       	callq  400e00 <puts@plt>
  401be5:	bf 03 00 00 00       	mov    $0x3,%edi
  401bea:	e8 3d 04 00 00       	callq  40202c <validate>
  401bef:	eb 7a                	jmp    401c6b <touch3+0xca>
  401bf1:	48 89 e9             	mov    %rbp,%rcx
  401bf4:	48 89 da             	mov    %rbx,%rdx
  401bf7:	be 68 38 40 00       	mov    $0x403868,%esi
  401bfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401c01:	b8 00 00 00 00       	mov    $0x0,%eax
  401c06:	e8 45 f3 ff ff       	callq  400f50 <__printf_chk@plt>
  401c0b:	bf c8 38 40 00       	mov    $0x4038c8,%edi
  401c10:	e8 eb f1 ff ff       	callq  400e00 <puts@plt>
  401c15:	48 8b 3d c4 38 20 00 	mov    0x2038c4(%rip),%rdi        # 6054e0 <stdout@@GLIBC_2.2.5>
  401c1c:	e8 ef f2 ff ff       	callq  400f10 <fflush@plt>
  401c21:	bb 00 00 00 00       	mov    $0x0,%ebx
  401c26:	eb 2a                	jmp    401c52 <touch3+0xb1>
  401c28:	48 63 c3             	movslq %ebx,%rax
  401c2b:	8b 54 85 00          	mov    0x0(%rbp,%rax,4),%edx
  401c2f:	be 7d 37 40 00       	mov    $0x40377d,%esi
  401c34:	bf 01 00 00 00       	mov    $0x1,%edi
  401c39:	b8 00 00 00 00       	mov    $0x0,%eax
  401c3e:	e8 0d f3 ff ff       	callq  400f50 <__printf_chk@plt>
  401c43:	48 8b 3d 96 38 20 00 	mov    0x203896(%rip),%rdi        # 6054e0 <stdout@@GLIBC_2.2.5>
  401c4a:	e8 c1 f2 ff ff       	callq  400f10 <fflush@plt>
  401c4f:	83 c3 01             	add    $0x1,%ebx
  401c52:	83 fb 07             	cmp    $0x7,%ebx
  401c55:	7e d1                	jle    401c28 <touch3+0x87>
  401c57:	bf 0a 00 00 00       	mov    $0xa,%edi
  401c5c:	e8 3f f1 ff ff       	callq  400da0 <putchar@plt>
  401c61:	bf 03 00 00 00       	mov    $0x3,%edi
  401c66:	e8 83 04 00 00       	callq  4020ee <fail>
  401c6b:	bf 00 00 00 00       	mov    $0x0,%edi
  401c70:	e8 2b f3 ff ff       	callq  400fa0 <exit@plt>

0000000000401c75 <test>:
  401c75:	48 83 ec 08          	sub    $0x8,%rsp
  401c79:	b8 00 00 00 00       	mov    $0x0,%eax
  401c7e:	e8 9a fc ff ff       	callq  40191d <getbuf>
  401c83:	89 c2                	mov    %eax,%edx
  401c85:	be f8 38 40 00       	mov    $0x4038f8,%esi
  401c8a:	bf 01 00 00 00       	mov    $0x1,%edi
  401c8f:	b8 00 00 00 00       	mov    $0x0,%eax
  401c94:	e8 b7 f2 ff ff       	callq  400f50 <__printf_chk@plt>
  401c99:	48 83 c4 08          	add    $0x8,%rsp
  401c9d:	c3                   	retq   

0000000000401c9e <start_farm>:
  401c9e:	b8 01 00 00 00       	mov    $0x1,%eax
  401ca3:	c3                   	retq   

0000000000401ca4 <addval_355>:
  401ca4:	8d 87 48 89 ce c3    	lea    -0x3c3176b8(%rdi),%eax / "RCX -> RSI"
  401caa:	c3                   	retq   

0000000000401cab <getval_334>:
  401cab:	b8 48 89 df 91       	mov    $0x91df8948,%eax
  401cb0:	c3                   	retq   

0000000000401cb1 <getval_102>:
  401cb1:	b8 46 48 89 df       	mov    $0xdf894846,%eax / "RBX -> RDI"
  401cb6:	c3                   	retq   

0000000000401cb7 <addval_488>:
  401cb7:	8d 87 69 d2 5b c7    	lea    -0x38a42d97(%rdi),%eax
  401cbd:	c3                   	retq   

0000000000401cbe <getval_410>:
  401cbe:	b8 5b 90 90 90       	mov    $0x9090905b,%eax
  401cc3:	c3                   	retq   

0000000000401cc4 <addval_164>:
  401cc4:	8d 87 5a 90 90 c3    	lea    -0x3c6f6fa6(%rdi),%eax
  401cca:	c3                   	retq   

0000000000401ccb <setval_400>:
  401ccb:	c7 07 48 09 d1 c3    	movl   $0xc3d10948,(%rdi)
  401cd1:	c3                   	retq   

0000000000401cd2 <setval_219>:
  401cd2:	c7 07 80 40 89 ce    	movl   $0xce894080,(%rdi)
  401cd8:	c3                   	retq   

0000000000401cd9 <getval_262>:
  401cd9:	b8 48 89 d1 c7       	mov    $0xc7d18948,%eax
  401cde:	c3                   	retq   

0000000000401cdf <setval_304>:
  401cdf:	c7 07 48 89 df c3    	movl   $0xc3df8948,(%rdi)
  401ce5:	c3                   	retq   

0000000000401ce6 <getval_498>:
  401ce6:	b8 48 89 df 91       	mov    $0x91df8948,%eax
  401ceb:	c3                   	retq   

0000000000401cec <addval_194>:
  401cec:	8d 87 48 89 ce 91    	lea    -0x6e3176b8(%rdi),%eax
  401cf2:	c3                   	retq   

0000000000401cf3 <setval_167>:
  401cf3:	c7 07 48 01 da c7    	movl   $0xc7da0148,(%rdi)
  401cf9:	c3                   	retq   

0000000000401cfa <getval_283>:
  401cfa:	b8 48 89 d1 90       	mov    $0x90d18948,%eax
  401cff:	c3                   	retq   

0000000000401d00 <setval_118>:
  401d00:	c7 07 03 48 01 da    	movl   $0xda014803,(%rdi)
  401d06:	c3                   	retq   

0000000000401d07 <setval_111>:
  401d07:	c7 07 0e 5a 90 90    	movl   $0x90905a0e,(%rdi)
  401d0d:	c3                   	retq   

0000000000401d0e <addval_343>:
  401d0e:	8d 87 da 90 90 90    	lea    -0x6f6f6f26(%rdi),%eax
  401d14:	c3                   	retq   

0000000000401d15 <addval_134>:
  401d15:	8d 87 5b 94 90 90    	lea    -0x6f6f6ba5(%rdi),%eax
  401d1b:	c3                   	retq   

0000000000401d1c <setval_338>:
  401d1c:	c7 07 48 89 ce 90    	movl   $0x90ce8948,(%rdi)
  401d22:	c3                   	retq   

0000000000401d23 <addval_424>:
  401d23:	8d 87 83 48 01 da    	lea    -0x25feb77d(%rdi),%eax
  401d29:	c3                   	retq   

0000000000401d2a <addval_198>:
  401d2a:	8d 87 48 01 da 94    	lea    -0x6b25feb8(%rdi),%eax
  401d30:	c3                   	retq   

0000000000401d31 <setval_391>:
  401d31:	c7 07 48 89 d1 c3    	movl   $0xc3d18948,(%rdi)
  401d37:	c3                   	retq   

0000000000401d38 <addval_114>:
  401d38:	8d 87 a2 15 5a 92    	lea    -0x6da5ea5e(%rdi),%eax
  401d3e:	c3                   	retq   

0000000000401d3f <addval_347>:
  401d3f:	8d 87 5b 90 90 c3    	lea    -0x3c6f6fa5(%rdi),%eax
  401d45:	c3                   	retq   

0000000000401d46 <end_farm>:
  401d46:	b8 01 00 00 00       	mov    $0x1,%eax
  401d4b:	c3                   	retq   

0000000000401d4c <save_char>:
  401d4c:	8b 05 12 44 20 00    	mov    0x204412(%rip),%eax        # 606164 <gets_cnt>
  401d52:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401d57:	7f 49                	jg     401da2 <save_char+0x56>
  401d59:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401d5c:	89 f9                	mov    %edi,%ecx
  401d5e:	c0 e9 04             	shr    $0x4,%cl
  401d61:	83 e1 0f             	and    $0xf,%ecx
  401d64:	0f b6 b1 20 3c 40 00 	movzbl 0x403c20(%rcx),%esi
  401d6b:	48 63 ca             	movslq %edx,%rcx
  401d6e:	40 88 b1 60 55 60 00 	mov    %sil,0x605560(%rcx)
  401d75:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401d78:	83 e7 0f             	and    $0xf,%edi
  401d7b:	0f b6 b7 20 3c 40 00 	movzbl 0x403c20(%rdi),%esi
  401d82:	48 63 c9             	movslq %ecx,%rcx
  401d85:	40 88 b1 60 55 60 00 	mov    %sil,0x605560(%rcx)
  401d8c:	83 c2 02             	add    $0x2,%edx
  401d8f:	48 63 d2             	movslq %edx,%rdx
  401d92:	c6 82 60 55 60 00 20 	movb   $0x20,0x605560(%rdx)
  401d99:	83 c0 01             	add    $0x1,%eax
  401d9c:	89 05 c2 43 20 00    	mov    %eax,0x2043c2(%rip)        # 606164 <gets_cnt>
  401da2:	f3 c3                	repz retq 

0000000000401da4 <save_term>:
  401da4:	8b 05 ba 43 20 00    	mov    0x2043ba(%rip),%eax        # 606164 <gets_cnt>
  401daa:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401dad:	48 98                	cltq   
  401daf:	c6 80 60 55 60 00 00 	movb   $0x0,0x605560(%rax)
  401db6:	c3                   	retq   

0000000000401db7 <check_fail>:
  401db7:	48 83 ec 08          	sub    $0x8,%rsp
  401dbb:	0f be 15 a6 43 20 00 	movsbl 0x2043a6(%rip),%edx        # 606168 <target_prefix>
  401dc2:	41 b8 60 55 60 00    	mov    $0x605560,%r8d
  401dc8:	8b 0d 6a 37 20 00    	mov    0x20376a(%rip),%ecx        # 605538 <check_level>
  401dce:	be 1b 39 40 00       	mov    $0x40391b,%esi
  401dd3:	bf 01 00 00 00       	mov    $0x1,%edi
  401dd8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ddd:	e8 6e f1 ff ff       	callq  400f50 <__printf_chk@plt>
  401de2:	bf 01 00 00 00       	mov    $0x1,%edi
  401de7:	e8 b4 f1 ff ff       	callq  400fa0 <exit@plt>

0000000000401dec <Gets>:
  401dec:	41 54                	push   %r12
  401dee:	55                   	push   %rbp
  401def:	53                   	push   %rbx
  401df0:	49 89 fc             	mov    %rdi,%r12
  401df3:	c7 05 67 43 20 00 00 	movl   $0x0,0x204367(%rip)        # 606164 <gets_cnt>
  401dfa:	00 00 00 
  401dfd:	48 89 fb             	mov    %rdi,%rbx
  401e00:	eb 11                	jmp    401e13 <Gets+0x27>
  401e02:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401e06:	88 03                	mov    %al,(%rbx)
  401e08:	0f b6 f8             	movzbl %al,%edi
  401e0b:	e8 3c ff ff ff       	callq  401d4c <save_char>
  401e10:	48 89 eb             	mov    %rbp,%rbx
  401e13:	48 8b 3d 16 37 20 00 	mov    0x203716(%rip),%rdi        # 605530 <infile>
  401e1a:	e8 01 f1 ff ff       	callq  400f20 <_IO_getc@plt>
  401e1f:	83 f8 ff             	cmp    $0xffffffff,%eax
  401e22:	75 de                	jne    401e02 <Gets+0x16>
  401e24:	c6 03 00             	movb   $0x0,(%rbx)
  401e27:	b8 00 00 00 00       	mov    $0x0,%eax
  401e2c:	e8 73 ff ff ff       	callq  401da4 <save_term>
  401e31:	4c 89 e0             	mov    %r12,%rax
  401e34:	5b                   	pop    %rbx
  401e35:	5d                   	pop    %rbp
  401e36:	41 5c                	pop    %r12
  401e38:	c3                   	retq   

0000000000401e39 <notify_server>:
  401e39:	53                   	push   %rbx
  401e3a:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401e41:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e48:	00 00 
  401e4a:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401e51:	00 
  401e52:	31 c0                	xor    %eax,%eax
  401e54:	83 3d ed 36 20 00 00 	cmpl   $0x0,0x2036ed(%rip)        # 605548 <is_checker>
  401e5b:	0f 85 aa 01 00 00    	jne    40200b <notify_server+0x1d2>
  401e61:	89 fb                	mov    %edi,%ebx
  401e63:	8b 05 fb 42 20 00    	mov    0x2042fb(%rip),%eax        # 606164 <gets_cnt>
  401e69:	83 c0 64             	add    $0x64,%eax
  401e6c:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401e71:	7e 1e                	jle    401e91 <notify_server+0x58>
  401e73:	be 50 3a 40 00       	mov    $0x403a50,%esi
  401e78:	bf 01 00 00 00       	mov    $0x1,%edi
  401e7d:	b8 00 00 00 00       	mov    $0x0,%eax
  401e82:	e8 c9 f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401e87:	bf 01 00 00 00       	mov    $0x1,%edi
  401e8c:	e8 0f f1 ff ff       	callq  400fa0 <exit@plt>
  401e91:	0f be 05 d0 42 20 00 	movsbl 0x2042d0(%rip),%eax        # 606168 <target_prefix>
  401e98:	83 3d 29 36 20 00 00 	cmpl   $0x0,0x203629(%rip)        # 6054c8 <notify>
  401e9f:	74 08                	je     401ea9 <notify_server+0x70>
  401ea1:	8b 15 99 36 20 00    	mov    0x203699(%rip),%edx        # 605540 <authkey>
  401ea7:	eb 05                	jmp    401eae <notify_server+0x75>
  401ea9:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401eae:	85 db                	test   %ebx,%ebx
  401eb0:	74 08                	je     401eba <notify_server+0x81>
  401eb2:	41 b9 31 39 40 00    	mov    $0x403931,%r9d
  401eb8:	eb 06                	jmp    401ec0 <notify_server+0x87>
  401eba:	41 b9 36 39 40 00    	mov    $0x403936,%r9d
  401ec0:	68 60 55 60 00       	pushq  $0x605560
  401ec5:	56                   	push   %rsi
  401ec6:	50                   	push   %rax
  401ec7:	52                   	push   %rdx
  401ec8:	44 8b 05 b9 32 20 00 	mov    0x2032b9(%rip),%r8d        # 605188 <target_id>
  401ecf:	b9 3b 39 40 00       	mov    $0x40393b,%ecx
  401ed4:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ed9:	be 01 00 00 00       	mov    $0x1,%esi
  401ede:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401ee3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ee8:	e8 f3 f0 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  401eed:	48 83 c4 20          	add    $0x20,%rsp
  401ef1:	83 3d d0 35 20 00 00 	cmpl   $0x0,0x2035d0(%rip)        # 6054c8 <notify>
  401ef8:	0f 84 81 00 00 00    	je     401f7f <notify_server+0x146>
  401efe:	85 db                	test   %ebx,%ebx
  401f00:	74 6e                	je     401f70 <notify_server+0x137>
  401f02:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401f09:	00 
  401f0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f10:	48 89 e1             	mov    %rsp,%rcx
  401f13:	48 8b 15 76 32 20 00 	mov    0x203276(%rip),%rdx        # 605190 <lab>
  401f1a:	48 8b 35 77 32 20 00 	mov    0x203277(%rip),%rsi        # 605198 <course>
  401f21:	48 8b 3d 58 32 20 00 	mov    0x203258(%rip),%rdi        # 605180 <user_id>
  401f28:	e8 ef 10 00 00       	callq  40301c <driver_post>
  401f2d:	85 c0                	test   %eax,%eax
  401f2f:	79 26                	jns    401f57 <notify_server+0x11e>
  401f31:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401f38:	00 
  401f39:	be 57 39 40 00       	mov    $0x403957,%esi
  401f3e:	bf 01 00 00 00       	mov    $0x1,%edi
  401f43:	b8 00 00 00 00       	mov    $0x0,%eax
  401f48:	e8 03 f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401f4d:	bf 01 00 00 00       	mov    $0x1,%edi
  401f52:	e8 49 f0 ff ff       	callq  400fa0 <exit@plt>
  401f57:	bf 80 3a 40 00       	mov    $0x403a80,%edi
  401f5c:	e8 9f ee ff ff       	callq  400e00 <puts@plt>
  401f61:	bf 63 39 40 00       	mov    $0x403963,%edi
  401f66:	e8 95 ee ff ff       	callq  400e00 <puts@plt>
  401f6b:	e9 9b 00 00 00       	jmpq   40200b <notify_server+0x1d2>
  401f70:	bf 6d 39 40 00       	mov    $0x40396d,%edi
  401f75:	e8 86 ee ff ff       	callq  400e00 <puts@plt>
  401f7a:	e9 8c 00 00 00       	jmpq   40200b <notify_server+0x1d2>
  401f7f:	85 db                	test   %ebx,%ebx
  401f81:	74 07                	je     401f8a <notify_server+0x151>
  401f83:	ba 31 39 40 00       	mov    $0x403931,%edx
  401f88:	eb 05                	jmp    401f8f <notify_server+0x156>
  401f8a:	ba 36 39 40 00       	mov    $0x403936,%edx
  401f8f:	be b8 3a 40 00       	mov    $0x403ab8,%esi
  401f94:	bf 01 00 00 00       	mov    $0x1,%edi
  401f99:	b8 00 00 00 00       	mov    $0x0,%eax
  401f9e:	e8 ad ef ff ff       	callq  400f50 <__printf_chk@plt>
  401fa3:	48 8b 15 d6 31 20 00 	mov    0x2031d6(%rip),%rdx        # 605180 <user_id>
  401faa:	be 74 39 40 00       	mov    $0x403974,%esi
  401faf:	bf 01 00 00 00       	mov    $0x1,%edi
  401fb4:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb9:	e8 92 ef ff ff       	callq  400f50 <__printf_chk@plt>
  401fbe:	48 8b 15 d3 31 20 00 	mov    0x2031d3(%rip),%rdx        # 605198 <course>
  401fc5:	be 81 39 40 00       	mov    $0x403981,%esi
  401fca:	bf 01 00 00 00       	mov    $0x1,%edi
  401fcf:	b8 00 00 00 00       	mov    $0x0,%eax
  401fd4:	e8 77 ef ff ff       	callq  400f50 <__printf_chk@plt>
  401fd9:	48 8b 15 b0 31 20 00 	mov    0x2031b0(%rip),%rdx        # 605190 <lab>
  401fe0:	be 8d 39 40 00       	mov    $0x40398d,%esi
  401fe5:	bf 01 00 00 00       	mov    $0x1,%edi
  401fea:	b8 00 00 00 00       	mov    $0x0,%eax
  401fef:	e8 5c ef ff ff       	callq  400f50 <__printf_chk@plt>
  401ff4:	48 89 e2             	mov    %rsp,%rdx
  401ff7:	be 96 39 40 00       	mov    $0x403996,%esi
  401ffc:	bf 01 00 00 00       	mov    $0x1,%edi
  402001:	b8 00 00 00 00       	mov    $0x0,%eax
  402006:	e8 45 ef ff ff       	callq  400f50 <__printf_chk@plt>
  40200b:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  402012:	00 
  402013:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40201a:	00 00 
  40201c:	74 05                	je     402023 <notify_server+0x1ea>
  40201e:	e8 fd ed ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402023:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  40202a:	5b                   	pop    %rbx
  40202b:	c3                   	retq   

000000000040202c <validate>:
  40202c:	53                   	push   %rbx
  40202d:	89 fb                	mov    %edi,%ebx
  40202f:	83 3d 12 35 20 00 00 	cmpl   $0x0,0x203512(%rip)        # 605548 <is_checker>
  402036:	74 6b                	je     4020a3 <validate+0x77>
  402038:	39 3d fe 34 20 00    	cmp    %edi,0x2034fe(%rip)        # 60553c <vlevel>
  40203e:	74 14                	je     402054 <validate+0x28>
  402040:	bf a2 39 40 00       	mov    $0x4039a2,%edi
  402045:	e8 b6 ed ff ff       	callq  400e00 <puts@plt>
  40204a:	b8 00 00 00 00       	mov    $0x0,%eax
  40204f:	e8 63 fd ff ff       	callq  401db7 <check_fail>
  402054:	8b 15 de 34 20 00    	mov    0x2034de(%rip),%edx        # 605538 <check_level>
  40205a:	39 d7                	cmp    %edx,%edi
  40205c:	74 20                	je     40207e <validate+0x52>
  40205e:	89 f9                	mov    %edi,%ecx
  402060:	be e0 3a 40 00       	mov    $0x403ae0,%esi
  402065:	bf 01 00 00 00       	mov    $0x1,%edi
  40206a:	b8 00 00 00 00       	mov    $0x0,%eax
  40206f:	e8 dc ee ff ff       	callq  400f50 <__printf_chk@plt>
  402074:	b8 00 00 00 00       	mov    $0x0,%eax
  402079:	e8 39 fd ff ff       	callq  401db7 <check_fail>
  40207e:	0f be 15 e3 40 20 00 	movsbl 0x2040e3(%rip),%edx        # 606168 <target_prefix>
  402085:	41 b8 60 55 60 00    	mov    $0x605560,%r8d
  40208b:	89 f9                	mov    %edi,%ecx
  40208d:	be c0 39 40 00       	mov    $0x4039c0,%esi
  402092:	bf 01 00 00 00       	mov    $0x1,%edi
  402097:	b8 00 00 00 00       	mov    $0x0,%eax
  40209c:	e8 af ee ff ff       	callq  400f50 <__printf_chk@plt>
  4020a1:	eb 49                	jmp    4020ec <validate+0xc0>
  4020a3:	3b 3d 93 34 20 00    	cmp    0x203493(%rip),%edi        # 60553c <vlevel>
  4020a9:	74 18                	je     4020c3 <validate+0x97>
  4020ab:	bf a2 39 40 00       	mov    $0x4039a2,%edi
  4020b0:	e8 4b ed ff ff       	callq  400e00 <puts@plt>
  4020b5:	89 de                	mov    %ebx,%esi
  4020b7:	bf 00 00 00 00       	mov    $0x0,%edi
  4020bc:	e8 78 fd ff ff       	callq  401e39 <notify_server>
  4020c1:	eb 29                	jmp    4020ec <validate+0xc0>
  4020c3:	0f be 0d 9e 40 20 00 	movsbl 0x20409e(%rip),%ecx        # 606168 <target_prefix>
  4020ca:	89 fa                	mov    %edi,%edx
  4020cc:	be 08 3b 40 00       	mov    $0x403b08,%esi
  4020d1:	bf 01 00 00 00       	mov    $0x1,%edi
  4020d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4020db:	e8 70 ee ff ff       	callq  400f50 <__printf_chk@plt>
  4020e0:	89 de                	mov    %ebx,%esi
  4020e2:	bf 01 00 00 00       	mov    $0x1,%edi
  4020e7:	e8 4d fd ff ff       	callq  401e39 <notify_server>
  4020ec:	5b                   	pop    %rbx
  4020ed:	c3                   	retq   

00000000004020ee <fail>:
  4020ee:	48 83 ec 08          	sub    $0x8,%rsp
  4020f2:	83 3d 4f 34 20 00 00 	cmpl   $0x0,0x20344f(%rip)        # 605548 <is_checker>
  4020f9:	74 0a                	je     402105 <fail+0x17>
  4020fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402100:	e8 b2 fc ff ff       	callq  401db7 <check_fail>
  402105:	89 fe                	mov    %edi,%esi
  402107:	bf 00 00 00 00       	mov    $0x0,%edi
  40210c:	e8 28 fd ff ff       	callq  401e39 <notify_server>
  402111:	48 83 c4 08          	add    $0x8,%rsp
  402115:	c3                   	retq   

0000000000402116 <bushandler>:
  402116:	48 83 ec 08          	sub    $0x8,%rsp
  40211a:	83 3d 27 34 20 00 00 	cmpl   $0x0,0x203427(%rip)        # 605548 <is_checker>
  402121:	74 14                	je     402137 <bushandler+0x21>
  402123:	bf d5 39 40 00       	mov    $0x4039d5,%edi
  402128:	e8 d3 ec ff ff       	callq  400e00 <puts@plt>
  40212d:	b8 00 00 00 00       	mov    $0x0,%eax
  402132:	e8 80 fc ff ff       	callq  401db7 <check_fail>
  402137:	bf 40 3b 40 00       	mov    $0x403b40,%edi
  40213c:	e8 bf ec ff ff       	callq  400e00 <puts@plt>
  402141:	bf df 39 40 00       	mov    $0x4039df,%edi
  402146:	e8 b5 ec ff ff       	callq  400e00 <puts@plt>
  40214b:	be 00 00 00 00       	mov    $0x0,%esi
  402150:	bf 00 00 00 00       	mov    $0x0,%edi
  402155:	e8 df fc ff ff       	callq  401e39 <notify_server>
  40215a:	bf 01 00 00 00       	mov    $0x1,%edi
  40215f:	e8 3c ee ff ff       	callq  400fa0 <exit@plt>

0000000000402164 <seghandler>:
  402164:	48 83 ec 08          	sub    $0x8,%rsp
  402168:	83 3d d9 33 20 00 00 	cmpl   $0x0,0x2033d9(%rip)        # 605548 <is_checker>
  40216f:	74 14                	je     402185 <seghandler+0x21>
  402171:	bf f5 39 40 00       	mov    $0x4039f5,%edi
  402176:	e8 85 ec ff ff       	callq  400e00 <puts@plt>
  40217b:	b8 00 00 00 00       	mov    $0x0,%eax
  402180:	e8 32 fc ff ff       	callq  401db7 <check_fail>
  402185:	bf 60 3b 40 00       	mov    $0x403b60,%edi
  40218a:	e8 71 ec ff ff       	callq  400e00 <puts@plt>
  40218f:	bf df 39 40 00       	mov    $0x4039df,%edi
  402194:	e8 67 ec ff ff       	callq  400e00 <puts@plt>
  402199:	be 00 00 00 00       	mov    $0x0,%esi
  40219e:	bf 00 00 00 00       	mov    $0x0,%edi
  4021a3:	e8 91 fc ff ff       	callq  401e39 <notify_server>
  4021a8:	bf 01 00 00 00       	mov    $0x1,%edi
  4021ad:	e8 ee ed ff ff       	callq  400fa0 <exit@plt>

00000000004021b2 <illegalhandler>:
  4021b2:	48 83 ec 08          	sub    $0x8,%rsp
  4021b6:	83 3d 8b 33 20 00 00 	cmpl   $0x0,0x20338b(%rip)        # 605548 <is_checker>
  4021bd:	74 14                	je     4021d3 <illegalhandler+0x21>
  4021bf:	bf 08 3a 40 00       	mov    $0x403a08,%edi
  4021c4:	e8 37 ec ff ff       	callq  400e00 <puts@plt>
  4021c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ce:	e8 e4 fb ff ff       	callq  401db7 <check_fail>
  4021d3:	bf 88 3b 40 00       	mov    $0x403b88,%edi
  4021d8:	e8 23 ec ff ff       	callq  400e00 <puts@plt>
  4021dd:	bf df 39 40 00       	mov    $0x4039df,%edi
  4021e2:	e8 19 ec ff ff       	callq  400e00 <puts@plt>
  4021e7:	be 00 00 00 00       	mov    $0x0,%esi
  4021ec:	bf 00 00 00 00       	mov    $0x0,%edi
  4021f1:	e8 43 fc ff ff       	callq  401e39 <notify_server>
  4021f6:	bf 01 00 00 00       	mov    $0x1,%edi
  4021fb:	e8 a0 ed ff ff       	callq  400fa0 <exit@plt>

0000000000402200 <sigalrmhandler>:
  402200:	48 83 ec 08          	sub    $0x8,%rsp
  402204:	83 3d 3d 33 20 00 00 	cmpl   $0x0,0x20333d(%rip)        # 605548 <is_checker>
  40220b:	74 14                	je     402221 <sigalrmhandler+0x21>
  40220d:	bf 1c 3a 40 00       	mov    $0x403a1c,%edi
  402212:	e8 e9 eb ff ff       	callq  400e00 <puts@plt>
  402217:	b8 00 00 00 00       	mov    $0x0,%eax
  40221c:	e8 96 fb ff ff       	callq  401db7 <check_fail>
  402221:	ba 05 00 00 00       	mov    $0x5,%edx
  402226:	be b8 3b 40 00       	mov    $0x403bb8,%esi
  40222b:	bf 01 00 00 00       	mov    $0x1,%edi
  402230:	b8 00 00 00 00       	mov    $0x0,%eax
  402235:	e8 16 ed ff ff       	callq  400f50 <__printf_chk@plt>
  40223a:	be 00 00 00 00       	mov    $0x0,%esi
  40223f:	bf 00 00 00 00       	mov    $0x0,%edi
  402244:	e8 f0 fb ff ff       	callq  401e39 <notify_server>
  402249:	bf 01 00 00 00       	mov    $0x1,%edi
  40224e:	e8 4d ed ff ff       	callq  400fa0 <exit@plt>

0000000000402253 <launch>:
  402253:	55                   	push   %rbp
  402254:	48 89 e5             	mov    %rsp,%rbp
  402257:	48 83 ec 10          	sub    $0x10,%rsp
  40225b:	48 89 fa             	mov    %rdi,%rdx
  40225e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402265:	00 00 
  402267:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40226b:	31 c0                	xor    %eax,%eax
  40226d:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  402271:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  402275:	48 29 c4             	sub    %rax,%rsp
  402278:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  40227d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  402281:	be f4 00 00 00       	mov    $0xf4,%esi
  402286:	e8 b5 eb ff ff       	callq  400e40 <memset@plt>
  40228b:	48 8b 05 5e 32 20 00 	mov    0x20325e(%rip),%rax        # 6054f0 <stdin@@GLIBC_2.2.5>
  402292:	48 39 05 97 32 20 00 	cmp    %rax,0x203297(%rip)        # 605530 <infile>
  402299:	75 14                	jne    4022af <launch+0x5c>
  40229b:	be 24 3a 40 00       	mov    $0x403a24,%esi
  4022a0:	bf 01 00 00 00       	mov    $0x1,%edi
  4022a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4022aa:	e8 a1 ec ff ff       	callq  400f50 <__printf_chk@plt>
  4022af:	c7 05 83 32 20 00 00 	movl   $0x0,0x203283(%rip)        # 60553c <vlevel>
  4022b6:	00 00 00 
  4022b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4022be:	e8 b2 f9 ff ff       	callq  401c75 <test>
  4022c3:	83 3d 7e 32 20 00 00 	cmpl   $0x0,0x20327e(%rip)        # 605548 <is_checker>
  4022ca:	74 14                	je     4022e0 <launch+0x8d>
  4022cc:	bf 31 3a 40 00       	mov    $0x403a31,%edi
  4022d1:	e8 2a eb ff ff       	callq  400e00 <puts@plt>
  4022d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4022db:	e8 d7 fa ff ff       	callq  401db7 <check_fail>
  4022e0:	bf 3c 3a 40 00       	mov    $0x403a3c,%edi
  4022e5:	e8 16 eb ff ff       	callq  400e00 <puts@plt>
  4022ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4022ee:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4022f5:	00 00 
  4022f7:	74 05                	je     4022fe <launch+0xab>
  4022f9:	e8 22 eb ff ff       	callq  400e20 <__stack_chk_fail@plt>
  4022fe:	c9                   	leaveq 
  4022ff:	c3                   	retq   

0000000000402300 <stable_launch>:
  402300:	53                   	push   %rbx
  402301:	48 89 3d 20 32 20 00 	mov    %rdi,0x203220(%rip)        # 605528 <global_offset>
  402308:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  40230e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402314:	b9 32 01 00 00       	mov    $0x132,%ecx
  402319:	ba 07 00 00 00       	mov    $0x7,%edx
  40231e:	be 00 00 10 00       	mov    $0x100000,%esi
  402323:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402328:	e8 03 eb ff ff       	callq  400e30 <mmap@plt>
  40232d:	48 89 c3             	mov    %rax,%rbx
  402330:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  402336:	74 37                	je     40236f <stable_launch+0x6f>
  402338:	be 00 00 10 00       	mov    $0x100000,%esi
  40233d:	48 89 c7             	mov    %rax,%rdi
  402340:	e8 fb eb ff ff       	callq  400f40 <munmap@plt>
  402345:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40234a:	ba f0 3b 40 00       	mov    $0x403bf0,%edx
  40234f:	be 01 00 00 00       	mov    $0x1,%esi
  402354:	48 8b 3d a5 31 20 00 	mov    0x2031a5(%rip),%rdi        # 605500 <stderr@@GLIBC_2.2.5>
  40235b:	b8 00 00 00 00       	mov    $0x0,%eax
  402360:	e8 5b ec ff ff       	callq  400fc0 <__fprintf_chk@plt>
  402365:	bf 01 00 00 00       	mov    $0x1,%edi
  40236a:	e8 31 ec ff ff       	callq  400fa0 <exit@plt>
  40236f:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  402376:	48 89 15 f3 3d 20 00 	mov    %rdx,0x203df3(%rip)        # 606170 <stack_top>
  40237d:	48 89 e0             	mov    %rsp,%rax
  402380:	48 89 d4             	mov    %rdx,%rsp
  402383:	48 89 c2             	mov    %rax,%rdx
  402386:	48 89 15 93 31 20 00 	mov    %rdx,0x203193(%rip)        # 605520 <global_save_stack>
  40238d:	48 8b 3d 94 31 20 00 	mov    0x203194(%rip),%rdi        # 605528 <global_offset>
  402394:	e8 ba fe ff ff       	callq  402253 <launch>
  402399:	48 8b 05 80 31 20 00 	mov    0x203180(%rip),%rax        # 605520 <global_save_stack>
  4023a0:	48 89 c4             	mov    %rax,%rsp
  4023a3:	be 00 00 10 00       	mov    $0x100000,%esi
  4023a8:	48 89 df             	mov    %rbx,%rdi
  4023ab:	e8 90 eb ff ff       	callq  400f40 <munmap@plt>
  4023b0:	5b                   	pop    %rbx
  4023b1:	c3                   	retq   

00000000004023b2 <rio_readinitb>:
  4023b2:	89 37                	mov    %esi,(%rdi)
  4023b4:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4023bb:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4023bf:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4023c3:	c3                   	retq   

00000000004023c4 <sigalrm_handler>:
  4023c4:	48 83 ec 08          	sub    $0x8,%rsp
  4023c8:	b9 00 00 00 00       	mov    $0x0,%ecx
  4023cd:	ba 30 3c 40 00       	mov    $0x403c30,%edx
  4023d2:	be 01 00 00 00       	mov    $0x1,%esi
  4023d7:	48 8b 3d 22 31 20 00 	mov    0x203122(%rip),%rdi        # 605500 <stderr@@GLIBC_2.2.5>
  4023de:	b8 00 00 00 00       	mov    $0x0,%eax
  4023e3:	e8 d8 eb ff ff       	callq  400fc0 <__fprintf_chk@plt>
  4023e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4023ed:	e8 ae eb ff ff       	callq  400fa0 <exit@plt>

00000000004023f2 <rio_writen>:
  4023f2:	41 55                	push   %r13
  4023f4:	41 54                	push   %r12
  4023f6:	55                   	push   %rbp
  4023f7:	53                   	push   %rbx
  4023f8:	48 83 ec 08          	sub    $0x8,%rsp
  4023fc:	41 89 fc             	mov    %edi,%r12d
  4023ff:	48 89 f5             	mov    %rsi,%rbp
  402402:	49 89 d5             	mov    %rdx,%r13
  402405:	48 89 d3             	mov    %rdx,%rbx
  402408:	eb 28                	jmp    402432 <rio_writen+0x40>
  40240a:	48 89 da             	mov    %rbx,%rdx
  40240d:	48 89 ee             	mov    %rbp,%rsi
  402410:	44 89 e7             	mov    %r12d,%edi
  402413:	e8 f8 e9 ff ff       	callq  400e10 <write@plt>
  402418:	48 85 c0             	test   %rax,%rax
  40241b:	7f 0f                	jg     40242c <rio_writen+0x3a>
  40241d:	e8 9e e9 ff ff       	callq  400dc0 <__errno_location@plt>
  402422:	83 38 04             	cmpl   $0x4,(%rax)
  402425:	75 15                	jne    40243c <rio_writen+0x4a>
  402427:	b8 00 00 00 00       	mov    $0x0,%eax
  40242c:	48 29 c3             	sub    %rax,%rbx
  40242f:	48 01 c5             	add    %rax,%rbp
  402432:	48 85 db             	test   %rbx,%rbx
  402435:	75 d3                	jne    40240a <rio_writen+0x18>
  402437:	4c 89 e8             	mov    %r13,%rax
  40243a:	eb 07                	jmp    402443 <rio_writen+0x51>
  40243c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402443:	48 83 c4 08          	add    $0x8,%rsp
  402447:	5b                   	pop    %rbx
  402448:	5d                   	pop    %rbp
  402449:	41 5c                	pop    %r12
  40244b:	41 5d                	pop    %r13
  40244d:	c3                   	retq   

000000000040244e <rio_read>:
  40244e:	41 55                	push   %r13
  402450:	41 54                	push   %r12
  402452:	55                   	push   %rbp
  402453:	53                   	push   %rbx
  402454:	48 83 ec 08          	sub    $0x8,%rsp
  402458:	48 89 fb             	mov    %rdi,%rbx
  40245b:	49 89 f5             	mov    %rsi,%r13
  40245e:	49 89 d4             	mov    %rdx,%r12
  402461:	eb 2e                	jmp    402491 <rio_read+0x43>
  402463:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  402467:	8b 3b                	mov    (%rbx),%edi
  402469:	ba 00 20 00 00       	mov    $0x2000,%edx
  40246e:	48 89 ee             	mov    %rbp,%rsi
  402471:	e8 fa e9 ff ff       	callq  400e70 <read@plt>
  402476:	89 43 04             	mov    %eax,0x4(%rbx)
  402479:	85 c0                	test   %eax,%eax
  40247b:	79 0c                	jns    402489 <rio_read+0x3b>
  40247d:	e8 3e e9 ff ff       	callq  400dc0 <__errno_location@plt>
  402482:	83 38 04             	cmpl   $0x4,(%rax)
  402485:	74 0a                	je     402491 <rio_read+0x43>
  402487:	eb 37                	jmp    4024c0 <rio_read+0x72>
  402489:	85 c0                	test   %eax,%eax
  40248b:	74 3c                	je     4024c9 <rio_read+0x7b>
  40248d:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402491:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402494:	85 ed                	test   %ebp,%ebp
  402496:	7e cb                	jle    402463 <rio_read+0x15>
  402498:	89 e8                	mov    %ebp,%eax
  40249a:	49 39 c4             	cmp    %rax,%r12
  40249d:	77 03                	ja     4024a2 <rio_read+0x54>
  40249f:	44 89 e5             	mov    %r12d,%ebp
  4024a2:	4c 63 e5             	movslq %ebp,%r12
  4024a5:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4024a9:	4c 89 e2             	mov    %r12,%rdx
  4024ac:	4c 89 ef             	mov    %r13,%rdi
  4024af:	e8 2c ea ff ff       	callq  400ee0 <memcpy@plt>
  4024b4:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4024b8:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4024bb:	4c 89 e0             	mov    %r12,%rax
  4024be:	eb 0e                	jmp    4024ce <rio_read+0x80>
  4024c0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4024c7:	eb 05                	jmp    4024ce <rio_read+0x80>
  4024c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4024ce:	48 83 c4 08          	add    $0x8,%rsp
  4024d2:	5b                   	pop    %rbx
  4024d3:	5d                   	pop    %rbp
  4024d4:	41 5c                	pop    %r12
  4024d6:	41 5d                	pop    %r13
  4024d8:	c3                   	retq   

00000000004024d9 <rio_readlineb>:
  4024d9:	41 55                	push   %r13
  4024db:	41 54                	push   %r12
  4024dd:	55                   	push   %rbp
  4024de:	53                   	push   %rbx
  4024df:	48 83 ec 18          	sub    $0x18,%rsp
  4024e3:	49 89 fd             	mov    %rdi,%r13
  4024e6:	48 89 f5             	mov    %rsi,%rbp
  4024e9:	49 89 d4             	mov    %rdx,%r12
  4024ec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4024f3:	00 00 
  4024f5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4024fa:	31 c0                	xor    %eax,%eax
  4024fc:	bb 01 00 00 00       	mov    $0x1,%ebx
  402501:	eb 3f                	jmp    402542 <rio_readlineb+0x69>
  402503:	ba 01 00 00 00       	mov    $0x1,%edx
  402508:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  40250d:	4c 89 ef             	mov    %r13,%rdi
  402510:	e8 39 ff ff ff       	callq  40244e <rio_read>
  402515:	83 f8 01             	cmp    $0x1,%eax
  402518:	75 15                	jne    40252f <rio_readlineb+0x56>
  40251a:	48 8d 45 01          	lea    0x1(%rbp),%rax
  40251e:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  402523:	88 55 00             	mov    %dl,0x0(%rbp)
  402526:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  40252b:	75 0e                	jne    40253b <rio_readlineb+0x62>
  40252d:	eb 1a                	jmp    402549 <rio_readlineb+0x70>
  40252f:	85 c0                	test   %eax,%eax
  402531:	75 22                	jne    402555 <rio_readlineb+0x7c>
  402533:	48 83 fb 01          	cmp    $0x1,%rbx
  402537:	75 13                	jne    40254c <rio_readlineb+0x73>
  402539:	eb 23                	jmp    40255e <rio_readlineb+0x85>
  40253b:	48 83 c3 01          	add    $0x1,%rbx
  40253f:	48 89 c5             	mov    %rax,%rbp
  402542:	4c 39 e3             	cmp    %r12,%rbx
  402545:	72 bc                	jb     402503 <rio_readlineb+0x2a>
  402547:	eb 03                	jmp    40254c <rio_readlineb+0x73>
  402549:	48 89 c5             	mov    %rax,%rbp
  40254c:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402550:	48 89 d8             	mov    %rbx,%rax
  402553:	eb 0e                	jmp    402563 <rio_readlineb+0x8a>
  402555:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40255c:	eb 05                	jmp    402563 <rio_readlineb+0x8a>
  40255e:	b8 00 00 00 00       	mov    $0x0,%eax
  402563:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  402568:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40256f:	00 00 
  402571:	74 05                	je     402578 <rio_readlineb+0x9f>
  402573:	e8 a8 e8 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402578:	48 83 c4 18          	add    $0x18,%rsp
  40257c:	5b                   	pop    %rbx
  40257d:	5d                   	pop    %rbp
  40257e:	41 5c                	pop    %r12
  402580:	41 5d                	pop    %r13
  402582:	c3                   	retq   

0000000000402583 <urlencode>:
  402583:	41 54                	push   %r12
  402585:	55                   	push   %rbp
  402586:	53                   	push   %rbx
  402587:	48 83 ec 10          	sub    $0x10,%rsp
  40258b:	48 89 fb             	mov    %rdi,%rbx
  40258e:	48 89 f5             	mov    %rsi,%rbp
  402591:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402598:	00 00 
  40259a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40259f:	31 c0                	xor    %eax,%eax
  4025a1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4025a8:	f2 ae                	repnz scas %es:(%rdi),%al
  4025aa:	48 f7 d1             	not    %rcx
  4025ad:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4025b0:	e9 aa 00 00 00       	jmpq   40265f <urlencode+0xdc>
  4025b5:	44 0f b6 03          	movzbl (%rbx),%r8d
  4025b9:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4025bd:	0f 94 c2             	sete   %dl
  4025c0:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4025c4:	0f 94 c0             	sete   %al
  4025c7:	08 c2                	or     %al,%dl
  4025c9:	75 24                	jne    4025ef <urlencode+0x6c>
  4025cb:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4025cf:	74 1e                	je     4025ef <urlencode+0x6c>
  4025d1:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4025d5:	74 18                	je     4025ef <urlencode+0x6c>
  4025d7:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4025db:	3c 09                	cmp    $0x9,%al
  4025dd:	76 10                	jbe    4025ef <urlencode+0x6c>
  4025df:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4025e3:	3c 19                	cmp    $0x19,%al
  4025e5:	76 08                	jbe    4025ef <urlencode+0x6c>
  4025e7:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4025eb:	3c 19                	cmp    $0x19,%al
  4025ed:	77 0a                	ja     4025f9 <urlencode+0x76>
  4025ef:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4025f3:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4025f7:	eb 5f                	jmp    402658 <urlencode+0xd5>
  4025f9:	41 80 f8 20          	cmp    $0x20,%r8b
  4025fd:	75 0a                	jne    402609 <urlencode+0x86>
  4025ff:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402603:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402607:	eb 4f                	jmp    402658 <urlencode+0xd5>
  402609:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  40260d:	3c 5f                	cmp    $0x5f,%al
  40260f:	0f 96 c2             	setbe  %dl
  402612:	41 80 f8 09          	cmp    $0x9,%r8b
  402616:	0f 94 c0             	sete   %al
  402619:	08 c2                	or     %al,%dl
  40261b:	74 50                	je     40266d <urlencode+0xea>
  40261d:	45 0f b6 c0          	movzbl %r8b,%r8d
  402621:	b9 c8 3c 40 00       	mov    $0x403cc8,%ecx
  402626:	ba 08 00 00 00       	mov    $0x8,%edx
  40262b:	be 01 00 00 00       	mov    $0x1,%esi
  402630:	48 89 e7             	mov    %rsp,%rdi
  402633:	b8 00 00 00 00       	mov    $0x0,%eax
  402638:	e8 a3 e9 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  40263d:	0f b6 04 24          	movzbl (%rsp),%eax
  402641:	88 45 00             	mov    %al,0x0(%rbp)
  402644:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  402649:	88 45 01             	mov    %al,0x1(%rbp)
  40264c:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402651:	88 45 02             	mov    %al,0x2(%rbp)
  402654:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402658:	48 83 c3 01          	add    $0x1,%rbx
  40265c:	44 89 e0             	mov    %r12d,%eax
  40265f:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402663:	85 c0                	test   %eax,%eax
  402665:	0f 85 4a ff ff ff    	jne    4025b5 <urlencode+0x32>
  40266b:	eb 05                	jmp    402672 <urlencode+0xef>
  40266d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402672:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  402677:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  40267e:	00 00 
  402680:	74 05                	je     402687 <urlencode+0x104>
  402682:	e8 99 e7 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402687:	48 83 c4 10          	add    $0x10,%rsp
  40268b:	5b                   	pop    %rbx
  40268c:	5d                   	pop    %rbp
  40268d:	41 5c                	pop    %r12
  40268f:	c3                   	retq   

0000000000402690 <submitr>:
  402690:	41 57                	push   %r15
  402692:	41 56                	push   %r14
  402694:	41 55                	push   %r13
  402696:	41 54                	push   %r12
  402698:	55                   	push   %rbp
  402699:	53                   	push   %rbx
  40269a:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4026a1:	49 89 fc             	mov    %rdi,%r12
  4026a4:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4026a8:	49 89 d7             	mov    %rdx,%r15
  4026ab:	49 89 ce             	mov    %rcx,%r14
  4026ae:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4026b3:	4d 89 cd             	mov    %r9,%r13
  4026b6:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4026bd:	00 
  4026be:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4026c5:	00 00 
  4026c7:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4026ce:	00 
  4026cf:	31 c0                	xor    %eax,%eax
  4026d1:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4026d8:	00 
  4026d9:	ba 00 00 00 00       	mov    $0x0,%edx
  4026de:	be 01 00 00 00       	mov    $0x1,%esi
  4026e3:	bf 02 00 00 00       	mov    $0x2,%edi
  4026e8:	e8 03 e9 ff ff       	callq  400ff0 <socket@plt>
  4026ed:	85 c0                	test   %eax,%eax
  4026ef:	79 4e                	jns    40273f <submitr+0xaf>
  4026f1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026f8:	3a 20 43 
  4026fb:	48 89 03             	mov    %rax,(%rbx)
  4026fe:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402705:	20 75 6e 
  402708:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40270c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402713:	74 6f 20 
  402716:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40271a:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402721:	65 20 73 
  402724:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402728:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  40272f:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402735:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40273a:	e9 97 06 00 00       	jmpq   402dd6 <submitr+0x746>
  40273f:	89 c5                	mov    %eax,%ebp
  402741:	4c 89 e7             	mov    %r12,%rdi
  402744:	e8 67 e7 ff ff       	callq  400eb0 <gethostbyname@plt>
  402749:	48 85 c0             	test   %rax,%rax
  40274c:	75 67                	jne    4027b5 <submitr+0x125>
  40274e:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402755:	3a 20 44 
  402758:	48 89 03             	mov    %rax,(%rbx)
  40275b:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402762:	20 75 6e 
  402765:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402769:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402770:	74 6f 20 
  402773:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402777:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40277e:	76 65 20 
  402781:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402785:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  40278c:	72 20 61 
  40278f:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402793:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  40279a:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4027a0:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4027a4:	89 ef                	mov    %ebp,%edi
  4027a6:	e8 b5 e6 ff ff       	callq  400e60 <close@plt>
  4027ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027b0:	e9 21 06 00 00       	jmpq   402dd6 <submitr+0x746>
  4027b5:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  4027bc:	00 00 
  4027be:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  4027c5:	00 00 
  4027c7:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4027ce:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4027d2:	48 8b 40 18          	mov    0x18(%rax),%rax
  4027d6:	48 8b 30             	mov    (%rax),%rsi
  4027d9:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4027de:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4027e3:	e8 d8 e6 ff ff       	callq  400ec0 <__memmove_chk@plt>
  4027e8:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  4027ed:	66 c1 c8 08          	ror    $0x8,%ax
  4027f1:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  4027f6:	ba 10 00 00 00       	mov    $0x10,%edx
  4027fb:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  402800:	89 ef                	mov    %ebp,%edi
  402802:	e8 a9 e7 ff ff       	callq  400fb0 <connect@plt>
  402807:	85 c0                	test   %eax,%eax
  402809:	79 59                	jns    402864 <submitr+0x1d4>
  40280b:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402812:	3a 20 55 
  402815:	48 89 03             	mov    %rax,(%rbx)
  402818:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  40281f:	20 74 6f 
  402822:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402826:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40282d:	65 63 74 
  402830:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402834:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40283b:	68 65 20 
  40283e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402842:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  402849:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  40284f:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402853:	89 ef                	mov    %ebp,%edi
  402855:	e8 06 e6 ff ff       	callq  400e60 <close@plt>
  40285a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40285f:	e9 72 05 00 00       	jmpq   402dd6 <submitr+0x746>
  402864:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  40286b:	b8 00 00 00 00       	mov    $0x0,%eax
  402870:	48 89 f1             	mov    %rsi,%rcx
  402873:	4c 89 ef             	mov    %r13,%rdi
  402876:	f2 ae                	repnz scas %es:(%rdi),%al
  402878:	48 f7 d1             	not    %rcx
  40287b:	48 89 ca             	mov    %rcx,%rdx
  40287e:	48 89 f1             	mov    %rsi,%rcx
  402881:	4c 89 ff             	mov    %r15,%rdi
  402884:	f2 ae                	repnz scas %es:(%rdi),%al
  402886:	48 f7 d1             	not    %rcx
  402889:	49 89 c8             	mov    %rcx,%r8
  40288c:	48 89 f1             	mov    %rsi,%rcx
  40288f:	4c 89 f7             	mov    %r14,%rdi
  402892:	f2 ae                	repnz scas %es:(%rdi),%al
  402894:	48 f7 d1             	not    %rcx
  402897:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  40289c:	48 89 f1             	mov    %rsi,%rcx
  40289f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4028a4:	f2 ae                	repnz scas %es:(%rdi),%al
  4028a6:	48 89 c8             	mov    %rcx,%rax
  4028a9:	48 f7 d0             	not    %rax
  4028ac:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4028b1:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4028b6:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4028bd:	00 
  4028be:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4028c4:	76 72                	jbe    402938 <submitr+0x2a8>
  4028c6:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4028cd:	3a 20 52 
  4028d0:	48 89 03             	mov    %rax,(%rbx)
  4028d3:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4028da:	20 73 74 
  4028dd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028e1:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4028e8:	74 6f 6f 
  4028eb:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028ef:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4028f6:	65 2e 20 
  4028f9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028fd:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402904:	61 73 65 
  402907:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40290b:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402912:	49 54 52 
  402915:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402919:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402920:	55 46 00 
  402923:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402927:	89 ef                	mov    %ebp,%edi
  402929:	e8 32 e5 ff ff       	callq  400e60 <close@plt>
  40292e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402933:	e9 9e 04 00 00       	jmpq   402dd6 <submitr+0x746>
  402938:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  40293f:	00 
  402940:	b9 00 04 00 00       	mov    $0x400,%ecx
  402945:	b8 00 00 00 00       	mov    $0x0,%eax
  40294a:	48 89 f7             	mov    %rsi,%rdi
  40294d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402950:	4c 89 ef             	mov    %r13,%rdi
  402953:	e8 2b fc ff ff       	callq  402583 <urlencode>
  402958:	85 c0                	test   %eax,%eax
  40295a:	0f 89 8a 00 00 00    	jns    4029ea <submitr+0x35a>
  402960:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402967:	3a 20 52 
  40296a:	48 89 03             	mov    %rax,(%rbx)
  40296d:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402974:	20 73 74 
  402977:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40297b:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402982:	63 6f 6e 
  402985:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402989:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402990:	20 61 6e 
  402993:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402997:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40299e:	67 61 6c 
  4029a1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029a5:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4029ac:	6e 70 72 
  4029af:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4029b3:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4029ba:	6c 65 20 
  4029bd:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4029c1:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4029c8:	63 74 65 
  4029cb:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4029cf:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4029d5:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4029d9:	89 ef                	mov    %ebp,%edi
  4029db:	e8 80 e4 ff ff       	callq  400e60 <close@plt>
  4029e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029e5:	e9 ec 03 00 00       	jmpq   402dd6 <submitr+0x746>
  4029ea:	4c 8d ac 24 40 20 00 	lea    0x2040(%rsp),%r13
  4029f1:	00 
  4029f2:	41 54                	push   %r12
  4029f4:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  4029fb:	00 
  4029fc:	50                   	push   %rax
  4029fd:	4d 89 f9             	mov    %r15,%r9
  402a00:	4d 89 f0             	mov    %r14,%r8
  402a03:	b9 58 3c 40 00       	mov    $0x403c58,%ecx
  402a08:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a0d:	be 01 00 00 00       	mov    $0x1,%esi
  402a12:	4c 89 ef             	mov    %r13,%rdi
  402a15:	b8 00 00 00 00       	mov    $0x0,%eax
  402a1a:	e8 c1 e5 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  402a1f:	b8 00 00 00 00       	mov    $0x0,%eax
  402a24:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402a2b:	4c 89 ef             	mov    %r13,%rdi
  402a2e:	f2 ae                	repnz scas %es:(%rdi),%al
  402a30:	48 f7 d1             	not    %rcx
  402a33:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402a37:	4c 89 ee             	mov    %r13,%rsi
  402a3a:	89 ef                	mov    %ebp,%edi
  402a3c:	e8 b1 f9 ff ff       	callq  4023f2 <rio_writen>
  402a41:	48 83 c4 10          	add    $0x10,%rsp
  402a45:	48 85 c0             	test   %rax,%rax
  402a48:	79 6e                	jns    402ab8 <submitr+0x428>
  402a4a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a51:	3a 20 43 
  402a54:	48 89 03             	mov    %rax,(%rbx)
  402a57:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a5e:	20 75 6e 
  402a61:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402a65:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a6c:	74 6f 20 
  402a6f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402a73:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402a7a:	20 74 6f 
  402a7d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a81:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402a88:	72 65 73 
  402a8b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a8f:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  402a96:	65 72 76 
  402a99:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a9d:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402aa3:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  402aa7:	89 ef                	mov    %ebp,%edi
  402aa9:	e8 b2 e3 ff ff       	callq  400e60 <close@plt>
  402aae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ab3:	e9 1e 03 00 00       	jmpq   402dd6 <submitr+0x746>
  402ab8:	89 ee                	mov    %ebp,%esi
  402aba:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402abf:	e8 ee f8 ff ff       	callq  4023b2 <rio_readinitb>
  402ac4:	ba 00 20 00 00       	mov    $0x2000,%edx
  402ac9:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402ad0:	00 
  402ad1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402ad6:	e8 fe f9 ff ff       	callq  4024d9 <rio_readlineb>
  402adb:	48 85 c0             	test   %rax,%rax
  402ade:	7f 7d                	jg     402b5d <submitr+0x4cd>
  402ae0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ae7:	3a 20 43 
  402aea:	48 89 03             	mov    %rax,(%rbx)
  402aed:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402af4:	20 75 6e 
  402af7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402afb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b02:	74 6f 20 
  402b05:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402b09:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402b10:	66 69 72 
  402b13:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402b17:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402b1e:	61 64 65 
  402b21:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402b25:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402b2c:	6d 20 72 
  402b2f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402b33:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402b3a:	20 73 65 
  402b3d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402b41:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  402b48:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402b4c:	89 ef                	mov    %ebp,%edi
  402b4e:	e8 0d e3 ff ff       	callq  400e60 <close@plt>
  402b53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b58:	e9 79 02 00 00       	jmpq   402dd6 <submitr+0x746>
  402b5d:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402b64:	00 
  402b65:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  402b6a:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402b71:	00 
  402b72:	be cf 3c 40 00       	mov    $0x403ccf,%esi
  402b77:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402b7e:	00 
  402b7f:	b8 00 00 00 00       	mov    $0x0,%eax
  402b84:	e8 a7 e3 ff ff       	callq  400f30 <__isoc99_sscanf@plt>
  402b89:	e9 95 00 00 00       	jmpq   402c23 <submitr+0x593>
  402b8e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402b93:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402b9a:	00 
  402b9b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402ba0:	e8 34 f9 ff ff       	callq  4024d9 <rio_readlineb>
  402ba5:	48 85 c0             	test   %rax,%rax
  402ba8:	7f 79                	jg     402c23 <submitr+0x593>
  402baa:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402bb1:	3a 20 43 
  402bb4:	48 89 03             	mov    %rax,(%rbx)
  402bb7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402bbe:	20 75 6e 
  402bc1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402bc5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bcc:	74 6f 20 
  402bcf:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402bd3:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402bda:	68 65 61 
  402bdd:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402be1:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402be8:	66 72 6f 
  402beb:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402bef:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402bf6:	20 72 65 
  402bf9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402bfd:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402c04:	73 65 72 
  402c07:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402c0b:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402c12:	89 ef                	mov    %ebp,%edi
  402c14:	e8 47 e2 ff ff       	callq  400e60 <close@plt>
  402c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c1e:	e9 b3 01 00 00       	jmpq   402dd6 <submitr+0x746>
  402c23:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402c2a:	00 
  402c2b:	b8 0d 00 00 00       	mov    $0xd,%eax
  402c30:	29 d0                	sub    %edx,%eax
  402c32:	75 1b                	jne    402c4f <submitr+0x5bf>
  402c34:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402c3b:	00 
  402c3c:	b8 0a 00 00 00       	mov    $0xa,%eax
  402c41:	29 d0                	sub    %edx,%eax
  402c43:	75 0a                	jne    402c4f <submitr+0x5bf>
  402c45:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402c4c:	00 
  402c4d:	f7 d8                	neg    %eax
  402c4f:	85 c0                	test   %eax,%eax
  402c51:	0f 85 37 ff ff ff    	jne    402b8e <submitr+0x4fe>
  402c57:	ba 00 20 00 00       	mov    $0x2000,%edx
  402c5c:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402c63:	00 
  402c64:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402c69:	e8 6b f8 ff ff       	callq  4024d9 <rio_readlineb>
  402c6e:	48 85 c0             	test   %rax,%rax
  402c71:	0f 8f 83 00 00 00    	jg     402cfa <submitr+0x66a>
  402c77:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402c7e:	3a 20 43 
  402c81:	48 89 03             	mov    %rax,(%rbx)
  402c84:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402c8b:	20 75 6e 
  402c8e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402c92:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c99:	74 6f 20 
  402c9c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402ca0:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402ca7:	73 74 61 
  402caa:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402cae:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402cb5:	65 73 73 
  402cb8:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402cbc:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402cc3:	72 6f 6d 
  402cc6:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402cca:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402cd1:	6c 74 20 
  402cd4:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402cd8:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402cdf:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402ce5:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402ce9:	89 ef                	mov    %ebp,%edi
  402ceb:	e8 70 e1 ff ff       	callq  400e60 <close@plt>
  402cf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cf5:	e9 dc 00 00 00       	jmpq   402dd6 <submitr+0x746>
  402cfa:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402cff:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402d06:	74 37                	je     402d3f <submitr+0x6af>
  402d08:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402d0f:	00 
  402d10:	b9 98 3c 40 00       	mov    $0x403c98,%ecx
  402d15:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402d1c:	be 01 00 00 00       	mov    $0x1,%esi
  402d21:	48 89 df             	mov    %rbx,%rdi
  402d24:	b8 00 00 00 00       	mov    $0x0,%eax
  402d29:	e8 b2 e2 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  402d2e:	89 ef                	mov    %ebp,%edi
  402d30:	e8 2b e1 ff ff       	callq  400e60 <close@plt>
  402d35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d3a:	e9 97 00 00 00       	jmpq   402dd6 <submitr+0x746>
  402d3f:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402d46:	00 
  402d47:	48 89 df             	mov    %rbx,%rdi
  402d4a:	e8 a1 e0 ff ff       	callq  400df0 <strcpy@plt>
  402d4f:	89 ef                	mov    %ebp,%edi
  402d51:	e8 0a e1 ff ff       	callq  400e60 <close@plt>
  402d56:	0f b6 03             	movzbl (%rbx),%eax
  402d59:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402d5e:	29 c2                	sub    %eax,%edx
  402d60:	75 22                	jne    402d84 <submitr+0x6f4>
  402d62:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402d66:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402d6b:	29 c8                	sub    %ecx,%eax
  402d6d:	75 17                	jne    402d86 <submitr+0x6f6>
  402d6f:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402d73:	b8 0a 00 00 00       	mov    $0xa,%eax
  402d78:	29 c8                	sub    %ecx,%eax
  402d7a:	75 0a                	jne    402d86 <submitr+0x6f6>
  402d7c:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402d80:	f7 d8                	neg    %eax
  402d82:	eb 02                	jmp    402d86 <submitr+0x6f6>
  402d84:	89 d0                	mov    %edx,%eax
  402d86:	85 c0                	test   %eax,%eax
  402d88:	74 40                	je     402dca <submitr+0x73a>
  402d8a:	bf e0 3c 40 00       	mov    $0x403ce0,%edi
  402d8f:	b9 05 00 00 00       	mov    $0x5,%ecx
  402d94:	48 89 de             	mov    %rbx,%rsi
  402d97:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402d99:	0f 97 c0             	seta   %al
  402d9c:	0f 92 c1             	setb   %cl
  402d9f:	29 c8                	sub    %ecx,%eax
  402da1:	0f be c0             	movsbl %al,%eax
  402da4:	85 c0                	test   %eax,%eax
  402da6:	74 2e                	je     402dd6 <submitr+0x746>
  402da8:	85 d2                	test   %edx,%edx
  402daa:	75 13                	jne    402dbf <submitr+0x72f>
  402dac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402db0:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402db5:	29 c2                	sub    %eax,%edx
  402db7:	75 06                	jne    402dbf <submitr+0x72f>
  402db9:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402dbd:	f7 da                	neg    %edx
  402dbf:	85 d2                	test   %edx,%edx
  402dc1:	75 0e                	jne    402dd1 <submitr+0x741>
  402dc3:	b8 00 00 00 00       	mov    $0x0,%eax
  402dc8:	eb 0c                	jmp    402dd6 <submitr+0x746>
  402dca:	b8 00 00 00 00       	mov    $0x0,%eax
  402dcf:	eb 05                	jmp    402dd6 <submitr+0x746>
  402dd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402dd6:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402ddd:	00 
  402dde:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402de5:	00 00 
  402de7:	74 05                	je     402dee <submitr+0x75e>
  402de9:	e8 32 e0 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402dee:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402df5:	5b                   	pop    %rbx
  402df6:	5d                   	pop    %rbp
  402df7:	41 5c                	pop    %r12
  402df9:	41 5d                	pop    %r13
  402dfb:	41 5e                	pop    %r14
  402dfd:	41 5f                	pop    %r15
  402dff:	c3                   	retq   

0000000000402e00 <init_timeout>:
  402e00:	85 ff                	test   %edi,%edi
  402e02:	74 23                	je     402e27 <init_timeout+0x27>
  402e04:	53                   	push   %rbx
  402e05:	89 fb                	mov    %edi,%ebx
  402e07:	85 ff                	test   %edi,%edi
  402e09:	79 05                	jns    402e10 <init_timeout+0x10>
  402e0b:	bb 00 00 00 00       	mov    $0x0,%ebx
  402e10:	be c4 23 40 00       	mov    $0x4023c4,%esi
  402e15:	bf 0e 00 00 00       	mov    $0xe,%edi
  402e1a:	e8 81 e0 ff ff       	callq  400ea0 <signal@plt>
  402e1f:	89 df                	mov    %ebx,%edi
  402e21:	e8 2a e0 ff ff       	callq  400e50 <alarm@plt>
  402e26:	5b                   	pop    %rbx
  402e27:	f3 c3                	repz retq 

0000000000402e29 <init_driver>:
  402e29:	55                   	push   %rbp
  402e2a:	53                   	push   %rbx
  402e2b:	48 83 ec 28          	sub    $0x28,%rsp
  402e2f:	48 89 fd             	mov    %rdi,%rbp
  402e32:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402e39:	00 00 
  402e3b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402e40:	31 c0                	xor    %eax,%eax
  402e42:	be 01 00 00 00       	mov    $0x1,%esi
  402e47:	bf 0d 00 00 00       	mov    $0xd,%edi
  402e4c:	e8 4f e0 ff ff       	callq  400ea0 <signal@plt>
  402e51:	be 01 00 00 00       	mov    $0x1,%esi
  402e56:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402e5b:	e8 40 e0 ff ff       	callq  400ea0 <signal@plt>
  402e60:	be 01 00 00 00       	mov    $0x1,%esi
  402e65:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402e6a:	e8 31 e0 ff ff       	callq  400ea0 <signal@plt>
  402e6f:	ba 00 00 00 00       	mov    $0x0,%edx
  402e74:	be 01 00 00 00       	mov    $0x1,%esi
  402e79:	bf 02 00 00 00       	mov    $0x2,%edi
  402e7e:	e8 6d e1 ff ff       	callq  400ff0 <socket@plt>
  402e83:	85 c0                	test   %eax,%eax
  402e85:	79 4f                	jns    402ed6 <init_driver+0xad>
  402e87:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402e8e:	3a 20 43 
  402e91:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e95:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402e9c:	20 75 6e 
  402e9f:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ea3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402eaa:	74 6f 20 
  402ead:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402eb1:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402eb8:	65 20 73 
  402ebb:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ebf:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ec6:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ecc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ed1:	e9 2a 01 00 00       	jmpq   403000 <init_driver+0x1d7>
  402ed6:	89 c3                	mov    %eax,%ebx
  402ed8:	bf e5 3c 40 00       	mov    $0x403ce5,%edi
  402edd:	e8 ce df ff ff       	callq  400eb0 <gethostbyname@plt>
  402ee2:	48 85 c0             	test   %rax,%rax
  402ee5:	75 68                	jne    402f4f <init_driver+0x126>
  402ee7:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402eee:	3a 20 44 
  402ef1:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402ef5:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402efc:	20 75 6e 
  402eff:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402f03:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402f0a:	74 6f 20 
  402f0d:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402f11:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402f18:	76 65 20 
  402f1b:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402f1f:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402f26:	72 20 61 
  402f29:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402f2d:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402f34:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402f3a:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402f3e:	89 df                	mov    %ebx,%edi
  402f40:	e8 1b df ff ff       	callq  400e60 <close@plt>
  402f45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402f4a:	e9 b1 00 00 00       	jmpq   403000 <init_driver+0x1d7>
  402f4f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402f56:	00 
  402f57:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402f5e:	00 00 
  402f60:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402f66:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402f6a:	48 8b 40 18          	mov    0x18(%rax),%rax
  402f6e:	48 8b 30             	mov    (%rax),%rsi
  402f71:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402f76:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402f7b:	e8 40 df ff ff       	callq  400ec0 <__memmove_chk@plt>
  402f80:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  402f87:	ba 10 00 00 00       	mov    $0x10,%edx
  402f8c:	48 89 e6             	mov    %rsp,%rsi
  402f8f:	89 df                	mov    %ebx,%edi
  402f91:	e8 1a e0 ff ff       	callq  400fb0 <connect@plt>
  402f96:	85 c0                	test   %eax,%eax
  402f98:	79 50                	jns    402fea <init_driver+0x1c1>
  402f9a:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402fa1:	3a 20 55 
  402fa4:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402fa8:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402faf:	20 74 6f 
  402fb2:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402fb6:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402fbd:	65 63 74 
  402fc0:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402fc4:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402fcb:	65 72 76 
  402fce:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402fd2:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402fd8:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402fdc:	89 df                	mov    %ebx,%edi
  402fde:	e8 7d de ff ff       	callq  400e60 <close@plt>
  402fe3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402fe8:	eb 16                	jmp    403000 <init_driver+0x1d7>
  402fea:	89 df                	mov    %ebx,%edi
  402fec:	e8 6f de ff ff       	callq  400e60 <close@plt>
  402ff1:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402ff7:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402ffb:	b8 00 00 00 00       	mov    $0x0,%eax
  403000:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  403005:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40300c:	00 00 
  40300e:	74 05                	je     403015 <init_driver+0x1ec>
  403010:	e8 0b de ff ff       	callq  400e20 <__stack_chk_fail@plt>
  403015:	48 83 c4 28          	add    $0x28,%rsp
  403019:	5b                   	pop    %rbx
  40301a:	5d                   	pop    %rbp
  40301b:	c3                   	retq   

000000000040301c <driver_post>:
  40301c:	53                   	push   %rbx
  40301d:	4c 89 cb             	mov    %r9,%rbx
  403020:	45 85 c0             	test   %r8d,%r8d
  403023:	74 27                	je     40304c <driver_post+0x30>
  403025:	48 89 ca             	mov    %rcx,%rdx
  403028:	be f4 3c 40 00       	mov    $0x403cf4,%esi
  40302d:	bf 01 00 00 00       	mov    $0x1,%edi
  403032:	b8 00 00 00 00       	mov    $0x0,%eax
  403037:	e8 14 df ff ff       	callq  400f50 <__printf_chk@plt>
  40303c:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  403041:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  403045:	b8 00 00 00 00       	mov    $0x0,%eax
  40304a:	eb 3f                	jmp    40308b <driver_post+0x6f>
  40304c:	48 85 ff             	test   %rdi,%rdi
  40304f:	74 2c                	je     40307d <driver_post+0x61>
  403051:	80 3f 00             	cmpb   $0x0,(%rdi)
  403054:	74 27                	je     40307d <driver_post+0x61>
  403056:	48 83 ec 08          	sub    $0x8,%rsp
  40305a:	41 51                	push   %r9
  40305c:	49 89 c9             	mov    %rcx,%r9
  40305f:	49 89 d0             	mov    %rdx,%r8
  403062:	48 89 f9             	mov    %rdi,%rcx
  403065:	48 89 f2             	mov    %rsi,%rdx
  403068:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  40306d:	bf e5 3c 40 00       	mov    $0x403ce5,%edi
  403072:	e8 19 f6 ff ff       	callq  402690 <submitr>
  403077:	48 83 c4 10          	add    $0x10,%rsp
  40307b:	eb 0e                	jmp    40308b <driver_post+0x6f>
  40307d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  403082:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  403086:	b8 00 00 00 00       	mov    $0x0,%eax
  40308b:	5b                   	pop    %rbx
  40308c:	c3                   	retq   

000000000040308d <check>:
  40308d:	89 f8                	mov    %edi,%eax
  40308f:	c1 e8 1c             	shr    $0x1c,%eax
  403092:	85 c0                	test   %eax,%eax
  403094:	74 1d                	je     4030b3 <check+0x26>
  403096:	b9 00 00 00 00       	mov    $0x0,%ecx
  40309b:	eb 0b                	jmp    4030a8 <check+0x1b>
  40309d:	89 f8                	mov    %edi,%eax
  40309f:	d3 e8                	shr    %cl,%eax
  4030a1:	3c 0a                	cmp    $0xa,%al
  4030a3:	74 14                	je     4030b9 <check+0x2c>
  4030a5:	83 c1 08             	add    $0x8,%ecx
  4030a8:	83 f9 1f             	cmp    $0x1f,%ecx
  4030ab:	7e f0                	jle    40309d <check+0x10>
  4030ad:	b8 01 00 00 00       	mov    $0x1,%eax
  4030b2:	c3                   	retq   
  4030b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4030b8:	c3                   	retq   
  4030b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4030be:	c3                   	retq   

00000000004030bf <gencookie>:
  4030bf:	53                   	push   %rbx
  4030c0:	83 c7 01             	add    $0x1,%edi
  4030c3:	e8 08 dd ff ff       	callq  400dd0 <srandom@plt>
  4030c8:	e8 33 de ff ff       	callq  400f00 <random@plt>
  4030cd:	89 c3                	mov    %eax,%ebx
  4030cf:	89 c7                	mov    %eax,%edi
  4030d1:	e8 b7 ff ff ff       	callq  40308d <check>
  4030d6:	85 c0                	test   %eax,%eax
  4030d8:	74 ee                	je     4030c8 <gencookie+0x9>
  4030da:	89 d8                	mov    %ebx,%eax
  4030dc:	5b                   	pop    %rbx
  4030dd:	c3                   	retq   
  4030de:	66 90                	xchg   %ax,%ax

00000000004030e0 <__libc_csu_init>:
  4030e0:	41 57                	push   %r15
  4030e2:	41 56                	push   %r14
  4030e4:	41 89 ff             	mov    %edi,%r15d
  4030e7:	41 55                	push   %r13
  4030e9:	41 54                	push   %r12
  4030eb:	4c 8d 25 1e 1d 20 00 	lea    0x201d1e(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  4030f2:	55                   	push   %rbp
  4030f3:	48 8d 2d 1e 1d 20 00 	lea    0x201d1e(%rip),%rbp        # 604e18 <__init_array_end>
  4030fa:	53                   	push   %rbx
  4030fb:	49 89 f6             	mov    %rsi,%r14
  4030fe:	49 89 d5             	mov    %rdx,%r13
  403101:	4c 29 e5             	sub    %r12,%rbp
  403104:	48 83 ec 08          	sub    $0x8,%rsp
  403108:	48 c1 fd 03          	sar    $0x3,%rbp
  40310c:	e8 57 dc ff ff       	callq  400d68 <_init>
  403111:	48 85 ed             	test   %rbp,%rbp
  403114:	74 20                	je     403136 <__libc_csu_init+0x56>
  403116:	31 db                	xor    %ebx,%ebx
  403118:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40311f:	00 
  403120:	4c 89 ea             	mov    %r13,%rdx
  403123:	4c 89 f6             	mov    %r14,%rsi
  403126:	44 89 ff             	mov    %r15d,%edi
  403129:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40312d:	48 83 c3 01          	add    $0x1,%rbx
  403131:	48 39 eb             	cmp    %rbp,%rbx
  403134:	75 ea                	jne    403120 <__libc_csu_init+0x40>
  403136:	48 83 c4 08          	add    $0x8,%rsp
  40313a:	5b                   	pop    %rbx
  40313b:	5d                   	pop    %rbp
  40313c:	41 5c                	pop    %r12
  40313e:	41 5d                	pop    %r13
  403140:	41 5e                	pop    %r14
  403142:	41 5f                	pop    %r15
  403144:	c3                   	retq   
  403145:	90                   	nop
  403146:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40314d:	00 00 00 

0000000000403150 <__libc_csu_fini>:
  403150:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000403154 <_fini>:
  403154:	48 83 ec 08          	sub    $0x8,%rsp
  403158:	48 83 c4 08          	add    $0x8,%rsp
  40315c:	c3                   	retq   
