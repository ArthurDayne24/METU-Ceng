
ctarget:     file format elf64-x86-64


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
  40101f:	49 c7 c0 a0 30 40 00 	mov    $0x4030a0,%r8
  401026:	48 c7 c1 30 30 40 00 	mov    $0x403030,%rcx
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
  401116:	be b8 30 40 00       	mov    $0x4030b8,%esi
  40111b:	bf 01 00 00 00       	mov    $0x1,%edi
  401120:	b8 00 00 00 00       	mov    $0x0,%eax
  401125:	e8 26 fe ff ff       	callq  400f50 <__printf_chk@plt>
  40112a:	bf f0 30 40 00       	mov    $0x4030f0,%edi
  40112f:	e8 cc fc ff ff       	callq  400e00 <puts@plt>
  401134:	bf 68 32 40 00       	mov    $0x403268,%edi
  401139:	e8 c2 fc ff ff       	callq  400e00 <puts@plt>
  40113e:	bf 18 31 40 00       	mov    $0x403118,%edi
  401143:	e8 b8 fc ff ff       	callq  400e00 <puts@plt>
  401148:	bf 82 32 40 00       	mov    $0x403282,%edi
  40114d:	e8 ae fc ff ff       	callq  400e00 <puts@plt>
  401152:	eb 32                	jmp    401186 <usage+0x80>
  401154:	be 9e 32 40 00       	mov    $0x40329e,%esi
  401159:	bf 01 00 00 00       	mov    $0x1,%edi
  40115e:	b8 00 00 00 00       	mov    $0x0,%eax
  401163:	e8 e8 fd ff ff       	callq  400f50 <__printf_chk@plt>
  401168:	bf 40 31 40 00       	mov    $0x403140,%edi
  40116d:	e8 8e fc ff ff       	callq  400e00 <puts@plt>
  401172:	bf 68 31 40 00       	mov    $0x403168,%edi
  401177:	e8 84 fc ff ff       	callq  400e00 <puts@plt>
  40117c:	bf bc 32 40 00       	mov    $0x4032bc,%edi
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
  4011ba:	e8 52 1e 00 00       	callq  403011 <gencookie>
  4011bf:	89 05 7f 43 20 00    	mov    %eax,0x20437f(%rip)        # 605544 <cookie>
  4011c5:	89 c7                	mov    %eax,%edi
  4011c7:	e8 45 1e 00 00       	callq  403011 <gencookie>
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
  401224:	c6 05 3d 4f 20 00 63 	movb   $0x63,0x204f3d(%rip)        # 606168 <target_prefix>
  40122b:	83 3d 96 42 20 00 00 	cmpl   $0x0,0x204296(%rip)        # 6054c8 <notify>
  401232:	0f 84 bb 00 00 00    	je     4012f3 <initialize_target+0x163>
  401238:	83 3d 09 43 20 00 00 	cmpl   $0x0,0x204309(%rip)        # 605548 <is_checker>
  40123f:	0f 85 ae 00 00 00    	jne    4012f3 <initialize_target+0x163>
  401245:	be 00 01 00 00       	mov    $0x100,%esi
  40124a:	48 89 e7             	mov    %rsp,%rdi
  40124d:	e8 3e fd ff ff       	callq  400f90 <gethostname@plt>
  401252:	85 c0                	test   %eax,%eax
  401254:	74 25                	je     40127b <initialize_target+0xeb>
  401256:	bf 98 31 40 00       	mov    $0x403198,%edi
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
  4012a3:	be d0 31 40 00       	mov    $0x4031d0,%esi
  4012a8:	bf 01 00 00 00       	mov    $0x1,%edi
  4012ad:	e8 9e fc ff ff       	callq  400f50 <__printf_chk@plt>
  4012b2:	bf 08 00 00 00       	mov    $0x8,%edi
  4012b7:	e8 e4 fc ff ff       	callq  400fa0 <exit@plt>
  4012bc:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4012c3:	00 
  4012c4:	e8 b2 1a 00 00       	callq  402d7b <init_driver>
  4012c9:	85 c0                	test   %eax,%eax
  4012cb:	79 26                	jns    4012f3 <initialize_target+0x163>
  4012cd:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  4012d4:	00 
  4012d5:	be 10 32 40 00       	mov    $0x403210,%esi
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
  401323:	be b6 20 40 00       	mov    $0x4020b6,%esi
  401328:	bf 0b 00 00 00       	mov    $0xb,%edi
  40132d:	e8 6e fb ff ff       	callq  400ea0 <signal@plt>
  401332:	be 68 20 40 00       	mov    $0x402068,%esi
  401337:	bf 07 00 00 00       	mov    $0x7,%edi
  40133c:	e8 5f fb ff ff       	callq  400ea0 <signal@plt>
  401341:	be 04 21 40 00       	mov    $0x402104,%esi
  401346:	bf 04 00 00 00       	mov    $0x4,%edi
  40134b:	e8 50 fb ff ff       	callq  400ea0 <signal@plt>
  401350:	83 3d f1 41 20 00 00 	cmpl   $0x0,0x2041f1(%rip)        # 605548 <is_checker>
  401357:	74 20                	je     401379 <main+0x64>
  401359:	be 52 21 40 00       	mov    $0x402152,%esi
  40135e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401363:	e8 38 fb ff ff       	callq  400ea0 <signal@plt>
  401368:	bf 05 00 00 00       	mov    $0x5,%edi
  40136d:	e8 de fa ff ff       	callq  400e50 <alarm@plt>
  401372:	bd da 32 40 00       	mov    $0x4032da,%ebp
  401377:	eb 05                	jmp    40137e <main+0x69>
  401379:	bd d5 32 40 00       	mov    $0x4032d5,%ebp
  40137e:	48 8b 05 6b 41 20 00 	mov    0x20416b(%rip),%rax        # 6054f0 <stdin@@GLIBC_2.2.5>
  401385:	48 89 05 a4 41 20 00 	mov    %rax,0x2041a4(%rip)        # 605530 <infile>
  40138c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401392:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401398:	e9 c6 00 00 00       	jmpq   401463 <main+0x14e>
  40139d:	83 e8 61             	sub    $0x61,%eax
  4013a0:	3c 10                	cmp    $0x10,%al
  4013a2:	0f 87 9c 00 00 00    	ja     401444 <main+0x12f>
  4013a8:	0f b6 c0             	movzbl %al,%eax
  4013ab:	ff 24 c5 20 33 40 00 	jmpq   *0x403320(,%rax,8)
  4013b2:	48 8b 3b             	mov    (%rbx),%rdi
  4013b5:	e8 4c fd ff ff       	callq  401106 <usage>
  4013ba:	be 2d 39 40 00       	mov    $0x40392d,%esi
  4013bf:	48 8b 3d 32 41 20 00 	mov    0x204132(%rip),%rdi        # 6054f8 <optarg@@GLIBC_2.2.5>
  4013c6:	e8 95 fb ff ff       	callq  400f60 <fopen@plt>
  4013cb:	48 89 05 5e 41 20 00 	mov    %rax,0x20415e(%rip)        # 605530 <infile>
  4013d2:	48 85 c0             	test   %rax,%rax
  4013d5:	0f 85 88 00 00 00    	jne    401463 <main+0x14e>
  4013db:	48 8b 0d 16 41 20 00 	mov    0x204116(%rip),%rcx        # 6054f8 <optarg@@GLIBC_2.2.5>
  4013e2:	ba e2 32 40 00       	mov    $0x4032e2,%edx
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
  401447:	be ff 32 40 00       	mov    $0x4032ff,%esi
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
  40147b:	be 00 00 00 00       	mov    $0x0,%esi
  401480:	44 89 ef             	mov    %r13d,%edi
  401483:	e8 08 fd ff ff       	callq  401190 <initialize_target>
  401488:	83 3d b9 40 20 00 00 	cmpl   $0x0,0x2040b9(%rip)        # 605548 <is_checker>
  40148f:	74 2a                	je     4014bb <main+0x1a6>
  401491:	44 3b 35 a8 40 20 00 	cmp    0x2040a8(%rip),%r14d        # 605540 <authkey>
  401498:	74 21                	je     4014bb <main+0x1a6>
  40149a:	44 89 f2             	mov    %r14d,%edx
  40149d:	be 38 32 40 00       	mov    $0x403238,%esi
  4014a2:	bf 01 00 00 00       	mov    $0x1,%edi
  4014a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ac:	e8 9f fa ff ff       	callq  400f50 <__printf_chk@plt>
  4014b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4014b6:	e8 4e 08 00 00       	callq  401d09 <check_fail>
  4014bb:	8b 15 83 40 20 00    	mov    0x204083(%rip),%edx        # 605544 <cookie>
  4014c1:	be 12 33 40 00       	mov    $0x403312,%esi
  4014c6:	bf 01 00 00 00       	mov    $0x1,%edi
  4014cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4014d0:	e8 7b fa ff ff       	callq  400f50 <__printf_chk@plt>
  4014d5:	48 8b 3d e4 3f 20 00 	mov    0x203fe4(%rip),%rdi        # 6054c0 <buf_offset>
  4014dc:	e8 71 0d 00 00       	callq  402252 <stable_launch>
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
  401924:	e8 15 04 00 00       	callq  401d3e <Gets>
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
  40196f:	bf ab 36 40 00       	mov    $0x4036ab,%edi
  401974:	e8 87 f4 ff ff       	callq  400e00 <puts@plt>
  401979:	bf 01 00 00 00       	mov    $0x1,%edi
  40197e:	e8 fb 05 00 00       	callq  401f7e <validate>
  401983:	eb 14                	jmp    401999 <touch1+0x66>
  401985:	bf d8 36 40 00       	mov    $0x4036d8,%edi
  40198a:	e8 71 f4 ff ff       	callq  400e00 <puts@plt>
  40198f:	bf 01 00 00 00       	mov    $0x1,%edi
  401994:	e8 a7 06 00 00       	callq  402040 <fail>
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
  4019c6:	be 20 37 40 00       	mov    $0x403720,%esi
  4019cb:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d0:	b8 00 00 00 00       	mov    $0x0,%eax
  4019d5:	e8 76 f5 ff ff       	callq  400f50 <__printf_chk@plt>
  4019da:	bf 02 00 00 00       	mov    $0x2,%edi
  4019df:	e8 9a 05 00 00       	callq  401f7e <validate>
  4019e4:	eb 22                	jmp    401a08 <touch2+0x65>
  4019e6:	89 f1                	mov    %esi,%ecx
  4019e8:	89 fa                	mov    %edi,%edx
  4019ea:	be 50 37 40 00       	mov    $0x403750,%esi
  4019ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4019f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4019f9:	e8 52 f5 ff ff       	callq  400f50 <__printf_chk@plt>
  4019fe:	bf 02 00 00 00       	mov    $0x2,%edi
  401a03:	e8 38 06 00 00       	callq  402040 <fail>
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
  401a65:	b9 c8 36 40 00       	mov    $0x4036c8,%ecx
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
  401b26:	b9 c8 36 40 00       	mov    $0x4036c8,%ecx
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
  401bdb:	bf 80 37 40 00       	mov    $0x403780,%edi
  401be0:	e8 1b f2 ff ff       	callq  400e00 <puts@plt>
  401be5:	bf 03 00 00 00       	mov    $0x3,%edi
  401bea:	e8 8f 03 00 00       	callq  401f7e <validate>
  401bef:	eb 7a                	jmp    401c6b <touch3+0xca>
  401bf1:	48 89 e9             	mov    %rbp,%rcx
  401bf4:	48 89 da             	mov    %rbx,%rdx
  401bf7:	be b8 37 40 00       	mov    $0x4037b8,%esi
  401bfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401c01:	b8 00 00 00 00       	mov    $0x0,%eax
  401c06:	e8 45 f3 ff ff       	callq  400f50 <__printf_chk@plt>
  401c0b:	bf 18 38 40 00       	mov    $0x403818,%edi
  401c10:	e8 eb f1 ff ff       	callq  400e00 <puts@plt>
  401c15:	48 8b 3d c4 38 20 00 	mov    0x2038c4(%rip),%rdi        # 6054e0 <stdout@@GLIBC_2.2.5>
  401c1c:	e8 ef f2 ff ff       	callq  400f10 <fflush@plt>
  401c21:	bb 00 00 00 00       	mov    $0x0,%ebx
  401c26:	eb 2a                	jmp    401c52 <touch3+0xb1>
  401c28:	48 63 c3             	movslq %ebx,%rax
  401c2b:	8b 54 85 00          	mov    0x0(%rbp,%rax,4),%edx
  401c2f:	be cd 36 40 00       	mov    $0x4036cd,%esi
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
  401c66:	e8 d5 03 00 00       	callq  402040 <fail>
  401c6b:	bf 00 00 00 00       	mov    $0x0,%edi
  401c70:	e8 2b f3 ff ff       	callq  400fa0 <exit@plt>

0000000000401c75 <test>:
  401c75:	48 83 ec 08          	sub    $0x8,%rsp
  401c79:	b8 00 00 00 00       	mov    $0x0,%eax
  401c7e:	e8 9a fc ff ff       	callq  40191d <getbuf>
  401c83:	89 c2                	mov    %eax,%edx
  401c85:	be 48 38 40 00       	mov    $0x403848,%esi
  401c8a:	bf 01 00 00 00       	mov    $0x1,%edi
  401c8f:	b8 00 00 00 00       	mov    $0x0,%eax
  401c94:	e8 b7 f2 ff ff       	callq  400f50 <__printf_chk@plt>
  401c99:	48 83 c4 08          	add    $0x8,%rsp
  401c9d:	c3                   	retq   

0000000000401c9e <save_char>:
  401c9e:	8b 05 c0 44 20 00    	mov    0x2044c0(%rip),%eax        # 606164 <gets_cnt>
  401ca4:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401ca9:	7f 49                	jg     401cf4 <save_char+0x56>
  401cab:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401cae:	89 f9                	mov    %edi,%ecx
  401cb0:	c0 e9 04             	shr    $0x4,%cl
  401cb3:	83 e1 0f             	and    $0xf,%ecx
  401cb6:	0f b6 b1 70 3b 40 00 	movzbl 0x403b70(%rcx),%esi
  401cbd:	48 63 ca             	movslq %edx,%rcx
  401cc0:	40 88 b1 60 55 60 00 	mov    %sil,0x605560(%rcx)
  401cc7:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401cca:	83 e7 0f             	and    $0xf,%edi
  401ccd:	0f b6 b7 70 3b 40 00 	movzbl 0x403b70(%rdi),%esi
  401cd4:	48 63 c9             	movslq %ecx,%rcx
  401cd7:	40 88 b1 60 55 60 00 	mov    %sil,0x605560(%rcx)
  401cde:	83 c2 02             	add    $0x2,%edx
  401ce1:	48 63 d2             	movslq %edx,%rdx
  401ce4:	c6 82 60 55 60 00 20 	movb   $0x20,0x605560(%rdx)
  401ceb:	83 c0 01             	add    $0x1,%eax
  401cee:	89 05 70 44 20 00    	mov    %eax,0x204470(%rip)        # 606164 <gets_cnt>
  401cf4:	f3 c3                	repz retq 

0000000000401cf6 <save_term>:
  401cf6:	8b 05 68 44 20 00    	mov    0x204468(%rip),%eax        # 606164 <gets_cnt>
  401cfc:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401cff:	48 98                	cltq   
  401d01:	c6 80 60 55 60 00 00 	movb   $0x0,0x605560(%rax)
  401d08:	c3                   	retq   

0000000000401d09 <check_fail>:
  401d09:	48 83 ec 08          	sub    $0x8,%rsp
  401d0d:	0f be 15 54 44 20 00 	movsbl 0x204454(%rip),%edx        # 606168 <target_prefix>
  401d14:	41 b8 60 55 60 00    	mov    $0x605560,%r8d
  401d1a:	8b 0d 18 38 20 00    	mov    0x203818(%rip),%ecx        # 605538 <check_level>
  401d20:	be 6b 38 40 00       	mov    $0x40386b,%esi
  401d25:	bf 01 00 00 00       	mov    $0x1,%edi
  401d2a:	b8 00 00 00 00       	mov    $0x0,%eax
  401d2f:	e8 1c f2 ff ff       	callq  400f50 <__printf_chk@plt>
  401d34:	bf 01 00 00 00       	mov    $0x1,%edi
  401d39:	e8 62 f2 ff ff       	callq  400fa0 <exit@plt>

0000000000401d3e <Gets>:
  401d3e:	41 54                	push   %r12
  401d40:	55                   	push   %rbp
  401d41:	53                   	push   %rbx
  401d42:	49 89 fc             	mov    %rdi,%r12
  401d45:	c7 05 15 44 20 00 00 	movl   $0x0,0x204415(%rip)        # 606164 <gets_cnt>
  401d4c:	00 00 00 
  401d4f:	48 89 fb             	mov    %rdi,%rbx
  401d52:	eb 11                	jmp    401d65 <Gets+0x27>
  401d54:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401d58:	88 03                	mov    %al,(%rbx)
  401d5a:	0f b6 f8             	movzbl %al,%edi
  401d5d:	e8 3c ff ff ff       	callq  401c9e <save_char>
  401d62:	48 89 eb             	mov    %rbp,%rbx
  401d65:	48 8b 3d c4 37 20 00 	mov    0x2037c4(%rip),%rdi        # 605530 <infile>
  401d6c:	e8 af f1 ff ff       	callq  400f20 <_IO_getc@plt>
  401d71:	83 f8 ff             	cmp    $0xffffffff,%eax
  401d74:	75 de                	jne    401d54 <Gets+0x16>
  401d76:	c6 03 00             	movb   $0x0,(%rbx)
  401d79:	b8 00 00 00 00       	mov    $0x0,%eax
  401d7e:	e8 73 ff ff ff       	callq  401cf6 <save_term>
  401d83:	4c 89 e0             	mov    %r12,%rax
  401d86:	5b                   	pop    %rbx
  401d87:	5d                   	pop    %rbp
  401d88:	41 5c                	pop    %r12
  401d8a:	c3                   	retq   

0000000000401d8b <notify_server>:
  401d8b:	53                   	push   %rbx
  401d8c:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401d93:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401d9a:	00 00 
  401d9c:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401da3:	00 
  401da4:	31 c0                	xor    %eax,%eax
  401da6:	83 3d 9b 37 20 00 00 	cmpl   $0x0,0x20379b(%rip)        # 605548 <is_checker>
  401dad:	0f 85 aa 01 00 00    	jne    401f5d <notify_server+0x1d2>
  401db3:	89 fb                	mov    %edi,%ebx
  401db5:	8b 05 a9 43 20 00    	mov    0x2043a9(%rip),%eax        # 606164 <gets_cnt>
  401dbb:	83 c0 64             	add    $0x64,%eax
  401dbe:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401dc3:	7e 1e                	jle    401de3 <notify_server+0x58>
  401dc5:	be a0 39 40 00       	mov    $0x4039a0,%esi
  401dca:	bf 01 00 00 00       	mov    $0x1,%edi
  401dcf:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd4:	e8 77 f1 ff ff       	callq  400f50 <__printf_chk@plt>
  401dd9:	bf 01 00 00 00       	mov    $0x1,%edi
  401dde:	e8 bd f1 ff ff       	callq  400fa0 <exit@plt>
  401de3:	0f be 05 7e 43 20 00 	movsbl 0x20437e(%rip),%eax        # 606168 <target_prefix>
  401dea:	83 3d d7 36 20 00 00 	cmpl   $0x0,0x2036d7(%rip)        # 6054c8 <notify>
  401df1:	74 08                	je     401dfb <notify_server+0x70>
  401df3:	8b 15 47 37 20 00    	mov    0x203747(%rip),%edx        # 605540 <authkey>
  401df9:	eb 05                	jmp    401e00 <notify_server+0x75>
  401dfb:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401e00:	85 db                	test   %ebx,%ebx
  401e02:	74 08                	je     401e0c <notify_server+0x81>
  401e04:	41 b9 81 38 40 00    	mov    $0x403881,%r9d
  401e0a:	eb 06                	jmp    401e12 <notify_server+0x87>
  401e0c:	41 b9 86 38 40 00    	mov    $0x403886,%r9d
  401e12:	68 60 55 60 00       	pushq  $0x605560
  401e17:	56                   	push   %rsi
  401e18:	50                   	push   %rax
  401e19:	52                   	push   %rdx
  401e1a:	44 8b 05 67 33 20 00 	mov    0x203367(%rip),%r8d        # 605188 <target_id>
  401e21:	b9 8b 38 40 00       	mov    $0x40388b,%ecx
  401e26:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e2b:	be 01 00 00 00       	mov    $0x1,%esi
  401e30:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401e35:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3a:	e8 a1 f1 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  401e3f:	48 83 c4 20          	add    $0x20,%rsp
  401e43:	83 3d 7e 36 20 00 00 	cmpl   $0x0,0x20367e(%rip)        # 6054c8 <notify>
  401e4a:	0f 84 81 00 00 00    	je     401ed1 <notify_server+0x146>
  401e50:	85 db                	test   %ebx,%ebx
  401e52:	74 6e                	je     401ec2 <notify_server+0x137>
  401e54:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401e5b:	00 
  401e5c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401e62:	48 89 e1             	mov    %rsp,%rcx
  401e65:	48 8b 15 24 33 20 00 	mov    0x203324(%rip),%rdx        # 605190 <lab>
  401e6c:	48 8b 35 25 33 20 00 	mov    0x203325(%rip),%rsi        # 605198 <course>
  401e73:	48 8b 3d 06 33 20 00 	mov    0x203306(%rip),%rdi        # 605180 <user_id>
  401e7a:	e8 ef 10 00 00       	callq  402f6e <driver_post>
  401e7f:	85 c0                	test   %eax,%eax
  401e81:	79 26                	jns    401ea9 <notify_server+0x11e>
  401e83:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401e8a:	00 
  401e8b:	be a7 38 40 00       	mov    $0x4038a7,%esi
  401e90:	bf 01 00 00 00       	mov    $0x1,%edi
  401e95:	b8 00 00 00 00       	mov    $0x0,%eax
  401e9a:	e8 b1 f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401e9f:	bf 01 00 00 00       	mov    $0x1,%edi
  401ea4:	e8 f7 f0 ff ff       	callq  400fa0 <exit@plt>
  401ea9:	bf d0 39 40 00       	mov    $0x4039d0,%edi
  401eae:	e8 4d ef ff ff       	callq  400e00 <puts@plt>
  401eb3:	bf b3 38 40 00       	mov    $0x4038b3,%edi
  401eb8:	e8 43 ef ff ff       	callq  400e00 <puts@plt>
  401ebd:	e9 9b 00 00 00       	jmpq   401f5d <notify_server+0x1d2>
  401ec2:	bf bd 38 40 00       	mov    $0x4038bd,%edi
  401ec7:	e8 34 ef ff ff       	callq  400e00 <puts@plt>
  401ecc:	e9 8c 00 00 00       	jmpq   401f5d <notify_server+0x1d2>
  401ed1:	85 db                	test   %ebx,%ebx
  401ed3:	74 07                	je     401edc <notify_server+0x151>
  401ed5:	ba 81 38 40 00       	mov    $0x403881,%edx
  401eda:	eb 05                	jmp    401ee1 <notify_server+0x156>
  401edc:	ba 86 38 40 00       	mov    $0x403886,%edx
  401ee1:	be 08 3a 40 00       	mov    $0x403a08,%esi
  401ee6:	bf 01 00 00 00       	mov    $0x1,%edi
  401eeb:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef0:	e8 5b f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401ef5:	48 8b 15 84 32 20 00 	mov    0x203284(%rip),%rdx        # 605180 <user_id>
  401efc:	be c4 38 40 00       	mov    $0x4038c4,%esi
  401f01:	bf 01 00 00 00       	mov    $0x1,%edi
  401f06:	b8 00 00 00 00       	mov    $0x0,%eax
  401f0b:	e8 40 f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401f10:	48 8b 15 81 32 20 00 	mov    0x203281(%rip),%rdx        # 605198 <course>
  401f17:	be d1 38 40 00       	mov    $0x4038d1,%esi
  401f1c:	bf 01 00 00 00       	mov    $0x1,%edi
  401f21:	b8 00 00 00 00       	mov    $0x0,%eax
  401f26:	e8 25 f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401f2b:	48 8b 15 5e 32 20 00 	mov    0x20325e(%rip),%rdx        # 605190 <lab>
  401f32:	be dd 38 40 00       	mov    $0x4038dd,%esi
  401f37:	bf 01 00 00 00       	mov    $0x1,%edi
  401f3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401f41:	e8 0a f0 ff ff       	callq  400f50 <__printf_chk@plt>
  401f46:	48 89 e2             	mov    %rsp,%rdx
  401f49:	be e6 38 40 00       	mov    $0x4038e6,%esi
  401f4e:	bf 01 00 00 00       	mov    $0x1,%edi
  401f53:	b8 00 00 00 00       	mov    $0x0,%eax
  401f58:	e8 f3 ef ff ff       	callq  400f50 <__printf_chk@plt>
  401f5d:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401f64:	00 
  401f65:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401f6c:	00 00 
  401f6e:	74 05                	je     401f75 <notify_server+0x1ea>
  401f70:	e8 ab ee ff ff       	callq  400e20 <__stack_chk_fail@plt>
  401f75:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401f7c:	5b                   	pop    %rbx
  401f7d:	c3                   	retq   

0000000000401f7e <validate>:
  401f7e:	53                   	push   %rbx
  401f7f:	89 fb                	mov    %edi,%ebx
  401f81:	83 3d c0 35 20 00 00 	cmpl   $0x0,0x2035c0(%rip)        # 605548 <is_checker>
  401f88:	74 6b                	je     401ff5 <validate+0x77>
  401f8a:	39 3d ac 35 20 00    	cmp    %edi,0x2035ac(%rip)        # 60553c <vlevel>
  401f90:	74 14                	je     401fa6 <validate+0x28>
  401f92:	bf f2 38 40 00       	mov    $0x4038f2,%edi
  401f97:	e8 64 ee ff ff       	callq  400e00 <puts@plt>
  401f9c:	b8 00 00 00 00       	mov    $0x0,%eax
  401fa1:	e8 63 fd ff ff       	callq  401d09 <check_fail>
  401fa6:	8b 15 8c 35 20 00    	mov    0x20358c(%rip),%edx        # 605538 <check_level>
  401fac:	39 d7                	cmp    %edx,%edi
  401fae:	74 20                	je     401fd0 <validate+0x52>
  401fb0:	89 f9                	mov    %edi,%ecx
  401fb2:	be 30 3a 40 00       	mov    $0x403a30,%esi
  401fb7:	bf 01 00 00 00       	mov    $0x1,%edi
  401fbc:	b8 00 00 00 00       	mov    $0x0,%eax
  401fc1:	e8 8a ef ff ff       	callq  400f50 <__printf_chk@plt>
  401fc6:	b8 00 00 00 00       	mov    $0x0,%eax
  401fcb:	e8 39 fd ff ff       	callq  401d09 <check_fail>
  401fd0:	0f be 15 91 41 20 00 	movsbl 0x204191(%rip),%edx        # 606168 <target_prefix>
  401fd7:	41 b8 60 55 60 00    	mov    $0x605560,%r8d
  401fdd:	89 f9                	mov    %edi,%ecx
  401fdf:	be 10 39 40 00       	mov    $0x403910,%esi
  401fe4:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe9:	b8 00 00 00 00       	mov    $0x0,%eax
  401fee:	e8 5d ef ff ff       	callq  400f50 <__printf_chk@plt>
  401ff3:	eb 49                	jmp    40203e <validate+0xc0>
  401ff5:	3b 3d 41 35 20 00    	cmp    0x203541(%rip),%edi        # 60553c <vlevel>
  401ffb:	74 18                	je     402015 <validate+0x97>
  401ffd:	bf f2 38 40 00       	mov    $0x4038f2,%edi
  402002:	e8 f9 ed ff ff       	callq  400e00 <puts@plt>
  402007:	89 de                	mov    %ebx,%esi
  402009:	bf 00 00 00 00       	mov    $0x0,%edi
  40200e:	e8 78 fd ff ff       	callq  401d8b <notify_server>
  402013:	eb 29                	jmp    40203e <validate+0xc0>
  402015:	0f be 0d 4c 41 20 00 	movsbl 0x20414c(%rip),%ecx        # 606168 <target_prefix>
  40201c:	89 fa                	mov    %edi,%edx
  40201e:	be 58 3a 40 00       	mov    $0x403a58,%esi
  402023:	bf 01 00 00 00       	mov    $0x1,%edi
  402028:	b8 00 00 00 00       	mov    $0x0,%eax
  40202d:	e8 1e ef ff ff       	callq  400f50 <__printf_chk@plt>
  402032:	89 de                	mov    %ebx,%esi
  402034:	bf 01 00 00 00       	mov    $0x1,%edi
  402039:	e8 4d fd ff ff       	callq  401d8b <notify_server>
  40203e:	5b                   	pop    %rbx
  40203f:	c3                   	retq   

0000000000402040 <fail>:
  402040:	48 83 ec 08          	sub    $0x8,%rsp
  402044:	83 3d fd 34 20 00 00 	cmpl   $0x0,0x2034fd(%rip)        # 605548 <is_checker>
  40204b:	74 0a                	je     402057 <fail+0x17>
  40204d:	b8 00 00 00 00       	mov    $0x0,%eax
  402052:	e8 b2 fc ff ff       	callq  401d09 <check_fail>
  402057:	89 fe                	mov    %edi,%esi
  402059:	bf 00 00 00 00       	mov    $0x0,%edi
  40205e:	e8 28 fd ff ff       	callq  401d8b <notify_server>
  402063:	48 83 c4 08          	add    $0x8,%rsp
  402067:	c3                   	retq   

0000000000402068 <bushandler>:
  402068:	48 83 ec 08          	sub    $0x8,%rsp
  40206c:	83 3d d5 34 20 00 00 	cmpl   $0x0,0x2034d5(%rip)        # 605548 <is_checker>
  402073:	74 14                	je     402089 <bushandler+0x21>
  402075:	bf 25 39 40 00       	mov    $0x403925,%edi
  40207a:	e8 81 ed ff ff       	callq  400e00 <puts@plt>
  40207f:	b8 00 00 00 00       	mov    $0x0,%eax
  402084:	e8 80 fc ff ff       	callq  401d09 <check_fail>
  402089:	bf 90 3a 40 00       	mov    $0x403a90,%edi
  40208e:	e8 6d ed ff ff       	callq  400e00 <puts@plt>
  402093:	bf 2f 39 40 00       	mov    $0x40392f,%edi
  402098:	e8 63 ed ff ff       	callq  400e00 <puts@plt>
  40209d:	be 00 00 00 00       	mov    $0x0,%esi
  4020a2:	bf 00 00 00 00       	mov    $0x0,%edi
  4020a7:	e8 df fc ff ff       	callq  401d8b <notify_server>
  4020ac:	bf 01 00 00 00       	mov    $0x1,%edi
  4020b1:	e8 ea ee ff ff       	callq  400fa0 <exit@plt>

00000000004020b6 <seghandler>:
  4020b6:	48 83 ec 08          	sub    $0x8,%rsp
  4020ba:	83 3d 87 34 20 00 00 	cmpl   $0x0,0x203487(%rip)        # 605548 <is_checker>
  4020c1:	74 14                	je     4020d7 <seghandler+0x21>
  4020c3:	bf 45 39 40 00       	mov    $0x403945,%edi
  4020c8:	e8 33 ed ff ff       	callq  400e00 <puts@plt>
  4020cd:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d2:	e8 32 fc ff ff       	callq  401d09 <check_fail>
  4020d7:	bf b0 3a 40 00       	mov    $0x403ab0,%edi
  4020dc:	e8 1f ed ff ff       	callq  400e00 <puts@plt>
  4020e1:	bf 2f 39 40 00       	mov    $0x40392f,%edi
  4020e6:	e8 15 ed ff ff       	callq  400e00 <puts@plt>
  4020eb:	be 00 00 00 00       	mov    $0x0,%esi
  4020f0:	bf 00 00 00 00       	mov    $0x0,%edi
  4020f5:	e8 91 fc ff ff       	callq  401d8b <notify_server>
  4020fa:	bf 01 00 00 00       	mov    $0x1,%edi
  4020ff:	e8 9c ee ff ff       	callq  400fa0 <exit@plt>

0000000000402104 <illegalhandler>:
  402104:	48 83 ec 08          	sub    $0x8,%rsp
  402108:	83 3d 39 34 20 00 00 	cmpl   $0x0,0x203439(%rip)        # 605548 <is_checker>
  40210f:	74 14                	je     402125 <illegalhandler+0x21>
  402111:	bf 58 39 40 00       	mov    $0x403958,%edi
  402116:	e8 e5 ec ff ff       	callq  400e00 <puts@plt>
  40211b:	b8 00 00 00 00       	mov    $0x0,%eax
  402120:	e8 e4 fb ff ff       	callq  401d09 <check_fail>
  402125:	bf d8 3a 40 00       	mov    $0x403ad8,%edi
  40212a:	e8 d1 ec ff ff       	callq  400e00 <puts@plt>
  40212f:	bf 2f 39 40 00       	mov    $0x40392f,%edi
  402134:	e8 c7 ec ff ff       	callq  400e00 <puts@plt>
  402139:	be 00 00 00 00       	mov    $0x0,%esi
  40213e:	bf 00 00 00 00       	mov    $0x0,%edi
  402143:	e8 43 fc ff ff       	callq  401d8b <notify_server>
  402148:	bf 01 00 00 00       	mov    $0x1,%edi
  40214d:	e8 4e ee ff ff       	callq  400fa0 <exit@plt>

0000000000402152 <sigalrmhandler>:
  402152:	48 83 ec 08          	sub    $0x8,%rsp
  402156:	83 3d eb 33 20 00 00 	cmpl   $0x0,0x2033eb(%rip)        # 605548 <is_checker>
  40215d:	74 14                	je     402173 <sigalrmhandler+0x21>
  40215f:	bf 6c 39 40 00       	mov    $0x40396c,%edi
  402164:	e8 97 ec ff ff       	callq  400e00 <puts@plt>
  402169:	b8 00 00 00 00       	mov    $0x0,%eax
  40216e:	e8 96 fb ff ff       	callq  401d09 <check_fail>
  402173:	ba 05 00 00 00       	mov    $0x5,%edx
  402178:	be 08 3b 40 00       	mov    $0x403b08,%esi
  40217d:	bf 01 00 00 00       	mov    $0x1,%edi
  402182:	b8 00 00 00 00       	mov    $0x0,%eax
  402187:	e8 c4 ed ff ff       	callq  400f50 <__printf_chk@plt>
  40218c:	be 00 00 00 00       	mov    $0x0,%esi
  402191:	bf 00 00 00 00       	mov    $0x0,%edi
  402196:	e8 f0 fb ff ff       	callq  401d8b <notify_server>
  40219b:	bf 01 00 00 00       	mov    $0x1,%edi
  4021a0:	e8 fb ed ff ff       	callq  400fa0 <exit@plt>

00000000004021a5 <launch>:
  4021a5:	55                   	push   %rbp
  4021a6:	48 89 e5             	mov    %rsp,%rbp
  4021a9:	48 83 ec 10          	sub    $0x10,%rsp
  4021ad:	48 89 fa             	mov    %rdi,%rdx
  4021b0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021b7:	00 00 
  4021b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4021bd:	31 c0                	xor    %eax,%eax
  4021bf:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  4021c3:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  4021c7:	48 29 c4             	sub    %rax,%rsp
  4021ca:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  4021cf:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  4021d3:	be f4 00 00 00       	mov    $0xf4,%esi
  4021d8:	e8 63 ec ff ff       	callq  400e40 <memset@plt>
  4021dd:	48 8b 05 0c 33 20 00 	mov    0x20330c(%rip),%rax        # 6054f0 <stdin@@GLIBC_2.2.5>
  4021e4:	48 39 05 45 33 20 00 	cmp    %rax,0x203345(%rip)        # 605530 <infile>
  4021eb:	75 14                	jne    402201 <launch+0x5c>
  4021ed:	be 74 39 40 00       	mov    $0x403974,%esi
  4021f2:	bf 01 00 00 00       	mov    $0x1,%edi
  4021f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4021fc:	e8 4f ed ff ff       	callq  400f50 <__printf_chk@plt>
  402201:	c7 05 31 33 20 00 00 	movl   $0x0,0x203331(%rip)        # 60553c <vlevel>
  402208:	00 00 00 
  40220b:	b8 00 00 00 00       	mov    $0x0,%eax
  402210:	e8 60 fa ff ff       	callq  401c75 <test>
  402215:	83 3d 2c 33 20 00 00 	cmpl   $0x0,0x20332c(%rip)        # 605548 <is_checker>
  40221c:	74 14                	je     402232 <launch+0x8d>
  40221e:	bf 81 39 40 00       	mov    $0x403981,%edi
  402223:	e8 d8 eb ff ff       	callq  400e00 <puts@plt>
  402228:	b8 00 00 00 00       	mov    $0x0,%eax
  40222d:	e8 d7 fa ff ff       	callq  401d09 <check_fail>
  402232:	bf 8c 39 40 00       	mov    $0x40398c,%edi
  402237:	e8 c4 eb ff ff       	callq  400e00 <puts@plt>
  40223c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402240:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402247:	00 00 
  402249:	74 05                	je     402250 <launch+0xab>
  40224b:	e8 d0 eb ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402250:	c9                   	leaveq 
  402251:	c3                   	retq   

0000000000402252 <stable_launch>:
  402252:	53                   	push   %rbx
  402253:	48 89 3d ce 32 20 00 	mov    %rdi,0x2032ce(%rip)        # 605528 <global_offset>
  40225a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402260:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402266:	b9 32 01 00 00       	mov    $0x132,%ecx
  40226b:	ba 07 00 00 00       	mov    $0x7,%edx
  402270:	be 00 00 10 00       	mov    $0x100000,%esi
  402275:	bf 00 60 58 55       	mov    $0x55586000,%edi
  40227a:	e8 b1 eb ff ff       	callq  400e30 <mmap@plt>
  40227f:	48 89 c3             	mov    %rax,%rbx
  402282:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  402288:	74 37                	je     4022c1 <stable_launch+0x6f>
  40228a:	be 00 00 10 00       	mov    $0x100000,%esi
  40228f:	48 89 c7             	mov    %rax,%rdi
  402292:	e8 a9 ec ff ff       	callq  400f40 <munmap@plt>
  402297:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40229c:	ba 40 3b 40 00       	mov    $0x403b40,%edx
  4022a1:	be 01 00 00 00       	mov    $0x1,%esi
  4022a6:	48 8b 3d 53 32 20 00 	mov    0x203253(%rip),%rdi        # 605500 <stderr@@GLIBC_2.2.5>
  4022ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4022b2:	e8 09 ed ff ff       	callq  400fc0 <__fprintf_chk@plt>
  4022b7:	bf 01 00 00 00       	mov    $0x1,%edi
  4022bc:	e8 df ec ff ff       	callq  400fa0 <exit@plt>
  4022c1:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4022c8:	48 89 15 a1 3e 20 00 	mov    %rdx,0x203ea1(%rip)        # 606170 <stack_top>
  4022cf:	48 89 e0             	mov    %rsp,%rax
  4022d2:	48 89 d4             	mov    %rdx,%rsp
  4022d5:	48 89 c2             	mov    %rax,%rdx
  4022d8:	48 89 15 41 32 20 00 	mov    %rdx,0x203241(%rip)        # 605520 <global_save_stack>
  4022df:	48 8b 3d 42 32 20 00 	mov    0x203242(%rip),%rdi        # 605528 <global_offset>
  4022e6:	e8 ba fe ff ff       	callq  4021a5 <launch>
  4022eb:	48 8b 05 2e 32 20 00 	mov    0x20322e(%rip),%rax        # 605520 <global_save_stack>
  4022f2:	48 89 c4             	mov    %rax,%rsp
  4022f5:	be 00 00 10 00       	mov    $0x100000,%esi
  4022fa:	48 89 df             	mov    %rbx,%rdi
  4022fd:	e8 3e ec ff ff       	callq  400f40 <munmap@plt>
  402302:	5b                   	pop    %rbx
  402303:	c3                   	retq   

0000000000402304 <rio_readinitb>:
  402304:	89 37                	mov    %esi,(%rdi)
  402306:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  40230d:	48 8d 47 10          	lea    0x10(%rdi),%rax
  402311:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402315:	c3                   	retq   

0000000000402316 <sigalrm_handler>:
  402316:	48 83 ec 08          	sub    $0x8,%rsp
  40231a:	b9 00 00 00 00       	mov    $0x0,%ecx
  40231f:	ba 80 3b 40 00       	mov    $0x403b80,%edx
  402324:	be 01 00 00 00       	mov    $0x1,%esi
  402329:	48 8b 3d d0 31 20 00 	mov    0x2031d0(%rip),%rdi        # 605500 <stderr@@GLIBC_2.2.5>
  402330:	b8 00 00 00 00       	mov    $0x0,%eax
  402335:	e8 86 ec ff ff       	callq  400fc0 <__fprintf_chk@plt>
  40233a:	bf 01 00 00 00       	mov    $0x1,%edi
  40233f:	e8 5c ec ff ff       	callq  400fa0 <exit@plt>

0000000000402344 <rio_writen>:
  402344:	41 55                	push   %r13
  402346:	41 54                	push   %r12
  402348:	55                   	push   %rbp
  402349:	53                   	push   %rbx
  40234a:	48 83 ec 08          	sub    $0x8,%rsp
  40234e:	41 89 fc             	mov    %edi,%r12d
  402351:	48 89 f5             	mov    %rsi,%rbp
  402354:	49 89 d5             	mov    %rdx,%r13
  402357:	48 89 d3             	mov    %rdx,%rbx
  40235a:	eb 28                	jmp    402384 <rio_writen+0x40>
  40235c:	48 89 da             	mov    %rbx,%rdx
  40235f:	48 89 ee             	mov    %rbp,%rsi
  402362:	44 89 e7             	mov    %r12d,%edi
  402365:	e8 a6 ea ff ff       	callq  400e10 <write@plt>
  40236a:	48 85 c0             	test   %rax,%rax
  40236d:	7f 0f                	jg     40237e <rio_writen+0x3a>
  40236f:	e8 4c ea ff ff       	callq  400dc0 <__errno_location@plt>
  402374:	83 38 04             	cmpl   $0x4,(%rax)
  402377:	75 15                	jne    40238e <rio_writen+0x4a>
  402379:	b8 00 00 00 00       	mov    $0x0,%eax
  40237e:	48 29 c3             	sub    %rax,%rbx
  402381:	48 01 c5             	add    %rax,%rbp
  402384:	48 85 db             	test   %rbx,%rbx
  402387:	75 d3                	jne    40235c <rio_writen+0x18>
  402389:	4c 89 e8             	mov    %r13,%rax
  40238c:	eb 07                	jmp    402395 <rio_writen+0x51>
  40238e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402395:	48 83 c4 08          	add    $0x8,%rsp
  402399:	5b                   	pop    %rbx
  40239a:	5d                   	pop    %rbp
  40239b:	41 5c                	pop    %r12
  40239d:	41 5d                	pop    %r13
  40239f:	c3                   	retq   

00000000004023a0 <rio_read>:
  4023a0:	41 55                	push   %r13
  4023a2:	41 54                	push   %r12
  4023a4:	55                   	push   %rbp
  4023a5:	53                   	push   %rbx
  4023a6:	48 83 ec 08          	sub    $0x8,%rsp
  4023aa:	48 89 fb             	mov    %rdi,%rbx
  4023ad:	49 89 f5             	mov    %rsi,%r13
  4023b0:	49 89 d4             	mov    %rdx,%r12
  4023b3:	eb 2e                	jmp    4023e3 <rio_read+0x43>
  4023b5:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4023b9:	8b 3b                	mov    (%rbx),%edi
  4023bb:	ba 00 20 00 00       	mov    $0x2000,%edx
  4023c0:	48 89 ee             	mov    %rbp,%rsi
  4023c3:	e8 a8 ea ff ff       	callq  400e70 <read@plt>
  4023c8:	89 43 04             	mov    %eax,0x4(%rbx)
  4023cb:	85 c0                	test   %eax,%eax
  4023cd:	79 0c                	jns    4023db <rio_read+0x3b>
  4023cf:	e8 ec e9 ff ff       	callq  400dc0 <__errno_location@plt>
  4023d4:	83 38 04             	cmpl   $0x4,(%rax)
  4023d7:	74 0a                	je     4023e3 <rio_read+0x43>
  4023d9:	eb 37                	jmp    402412 <rio_read+0x72>
  4023db:	85 c0                	test   %eax,%eax
  4023dd:	74 3c                	je     40241b <rio_read+0x7b>
  4023df:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4023e3:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4023e6:	85 ed                	test   %ebp,%ebp
  4023e8:	7e cb                	jle    4023b5 <rio_read+0x15>
  4023ea:	89 e8                	mov    %ebp,%eax
  4023ec:	49 39 c4             	cmp    %rax,%r12
  4023ef:	77 03                	ja     4023f4 <rio_read+0x54>
  4023f1:	44 89 e5             	mov    %r12d,%ebp
  4023f4:	4c 63 e5             	movslq %ebp,%r12
  4023f7:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4023fb:	4c 89 e2             	mov    %r12,%rdx
  4023fe:	4c 89 ef             	mov    %r13,%rdi
  402401:	e8 da ea ff ff       	callq  400ee0 <memcpy@plt>
  402406:	4c 01 63 08          	add    %r12,0x8(%rbx)
  40240a:	29 6b 04             	sub    %ebp,0x4(%rbx)
  40240d:	4c 89 e0             	mov    %r12,%rax
  402410:	eb 0e                	jmp    402420 <rio_read+0x80>
  402412:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402419:	eb 05                	jmp    402420 <rio_read+0x80>
  40241b:	b8 00 00 00 00       	mov    $0x0,%eax
  402420:	48 83 c4 08          	add    $0x8,%rsp
  402424:	5b                   	pop    %rbx
  402425:	5d                   	pop    %rbp
  402426:	41 5c                	pop    %r12
  402428:	41 5d                	pop    %r13
  40242a:	c3                   	retq   

000000000040242b <rio_readlineb>:
  40242b:	41 55                	push   %r13
  40242d:	41 54                	push   %r12
  40242f:	55                   	push   %rbp
  402430:	53                   	push   %rbx
  402431:	48 83 ec 18          	sub    $0x18,%rsp
  402435:	49 89 fd             	mov    %rdi,%r13
  402438:	48 89 f5             	mov    %rsi,%rbp
  40243b:	49 89 d4             	mov    %rdx,%r12
  40243e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402445:	00 00 
  402447:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40244c:	31 c0                	xor    %eax,%eax
  40244e:	bb 01 00 00 00       	mov    $0x1,%ebx
  402453:	eb 3f                	jmp    402494 <rio_readlineb+0x69>
  402455:	ba 01 00 00 00       	mov    $0x1,%edx
  40245a:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  40245f:	4c 89 ef             	mov    %r13,%rdi
  402462:	e8 39 ff ff ff       	callq  4023a0 <rio_read>
  402467:	83 f8 01             	cmp    $0x1,%eax
  40246a:	75 15                	jne    402481 <rio_readlineb+0x56>
  40246c:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402470:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  402475:	88 55 00             	mov    %dl,0x0(%rbp)
  402478:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  40247d:	75 0e                	jne    40248d <rio_readlineb+0x62>
  40247f:	eb 1a                	jmp    40249b <rio_readlineb+0x70>
  402481:	85 c0                	test   %eax,%eax
  402483:	75 22                	jne    4024a7 <rio_readlineb+0x7c>
  402485:	48 83 fb 01          	cmp    $0x1,%rbx
  402489:	75 13                	jne    40249e <rio_readlineb+0x73>
  40248b:	eb 23                	jmp    4024b0 <rio_readlineb+0x85>
  40248d:	48 83 c3 01          	add    $0x1,%rbx
  402491:	48 89 c5             	mov    %rax,%rbp
  402494:	4c 39 e3             	cmp    %r12,%rbx
  402497:	72 bc                	jb     402455 <rio_readlineb+0x2a>
  402499:	eb 03                	jmp    40249e <rio_readlineb+0x73>
  40249b:	48 89 c5             	mov    %rax,%rbp
  40249e:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4024a2:	48 89 d8             	mov    %rbx,%rax
  4024a5:	eb 0e                	jmp    4024b5 <rio_readlineb+0x8a>
  4024a7:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4024ae:	eb 05                	jmp    4024b5 <rio_readlineb+0x8a>
  4024b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4024b5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  4024ba:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4024c1:	00 00 
  4024c3:	74 05                	je     4024ca <rio_readlineb+0x9f>
  4024c5:	e8 56 e9 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  4024ca:	48 83 c4 18          	add    $0x18,%rsp
  4024ce:	5b                   	pop    %rbx
  4024cf:	5d                   	pop    %rbp
  4024d0:	41 5c                	pop    %r12
  4024d2:	41 5d                	pop    %r13
  4024d4:	c3                   	retq   

00000000004024d5 <urlencode>:
  4024d5:	41 54                	push   %r12
  4024d7:	55                   	push   %rbp
  4024d8:	53                   	push   %rbx
  4024d9:	48 83 ec 10          	sub    $0x10,%rsp
  4024dd:	48 89 fb             	mov    %rdi,%rbx
  4024e0:	48 89 f5             	mov    %rsi,%rbp
  4024e3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4024ea:	00 00 
  4024ec:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4024f1:	31 c0                	xor    %eax,%eax
  4024f3:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4024fa:	f2 ae                	repnz scas %es:(%rdi),%al
  4024fc:	48 f7 d1             	not    %rcx
  4024ff:	8d 41 ff             	lea    -0x1(%rcx),%eax
  402502:	e9 aa 00 00 00       	jmpq   4025b1 <urlencode+0xdc>
  402507:	44 0f b6 03          	movzbl (%rbx),%r8d
  40250b:	41 80 f8 2a          	cmp    $0x2a,%r8b
  40250f:	0f 94 c2             	sete   %dl
  402512:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402516:	0f 94 c0             	sete   %al
  402519:	08 c2                	or     %al,%dl
  40251b:	75 24                	jne    402541 <urlencode+0x6c>
  40251d:	41 80 f8 2e          	cmp    $0x2e,%r8b
  402521:	74 1e                	je     402541 <urlencode+0x6c>
  402523:	41 80 f8 5f          	cmp    $0x5f,%r8b
  402527:	74 18                	je     402541 <urlencode+0x6c>
  402529:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  40252d:	3c 09                	cmp    $0x9,%al
  40252f:	76 10                	jbe    402541 <urlencode+0x6c>
  402531:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  402535:	3c 19                	cmp    $0x19,%al
  402537:	76 08                	jbe    402541 <urlencode+0x6c>
  402539:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  40253d:	3c 19                	cmp    $0x19,%al
  40253f:	77 0a                	ja     40254b <urlencode+0x76>
  402541:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402545:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402549:	eb 5f                	jmp    4025aa <urlencode+0xd5>
  40254b:	41 80 f8 20          	cmp    $0x20,%r8b
  40254f:	75 0a                	jne    40255b <urlencode+0x86>
  402551:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402555:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402559:	eb 4f                	jmp    4025aa <urlencode+0xd5>
  40255b:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  40255f:	3c 5f                	cmp    $0x5f,%al
  402561:	0f 96 c2             	setbe  %dl
  402564:	41 80 f8 09          	cmp    $0x9,%r8b
  402568:	0f 94 c0             	sete   %al
  40256b:	08 c2                	or     %al,%dl
  40256d:	74 50                	je     4025bf <urlencode+0xea>
  40256f:	45 0f b6 c0          	movzbl %r8b,%r8d
  402573:	b9 18 3c 40 00       	mov    $0x403c18,%ecx
  402578:	ba 08 00 00 00       	mov    $0x8,%edx
  40257d:	be 01 00 00 00       	mov    $0x1,%esi
  402582:	48 89 e7             	mov    %rsp,%rdi
  402585:	b8 00 00 00 00       	mov    $0x0,%eax
  40258a:	e8 51 ea ff ff       	callq  400fe0 <__sprintf_chk@plt>
  40258f:	0f b6 04 24          	movzbl (%rsp),%eax
  402593:	88 45 00             	mov    %al,0x0(%rbp)
  402596:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40259b:	88 45 01             	mov    %al,0x1(%rbp)
  40259e:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  4025a3:	88 45 02             	mov    %al,0x2(%rbp)
  4025a6:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4025aa:	48 83 c3 01          	add    $0x1,%rbx
  4025ae:	44 89 e0             	mov    %r12d,%eax
  4025b1:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4025b5:	85 c0                	test   %eax,%eax
  4025b7:	0f 85 4a ff ff ff    	jne    402507 <urlencode+0x32>
  4025bd:	eb 05                	jmp    4025c4 <urlencode+0xef>
  4025bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025c4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4025c9:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4025d0:	00 00 
  4025d2:	74 05                	je     4025d9 <urlencode+0x104>
  4025d4:	e8 47 e8 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  4025d9:	48 83 c4 10          	add    $0x10,%rsp
  4025dd:	5b                   	pop    %rbx
  4025de:	5d                   	pop    %rbp
  4025df:	41 5c                	pop    %r12
  4025e1:	c3                   	retq   

00000000004025e2 <submitr>:
  4025e2:	41 57                	push   %r15
  4025e4:	41 56                	push   %r14
  4025e6:	41 55                	push   %r13
  4025e8:	41 54                	push   %r12
  4025ea:	55                   	push   %rbp
  4025eb:	53                   	push   %rbx
  4025ec:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4025f3:	49 89 fc             	mov    %rdi,%r12
  4025f6:	89 74 24 04          	mov    %esi,0x4(%rsp)
  4025fa:	49 89 d7             	mov    %rdx,%r15
  4025fd:	49 89 ce             	mov    %rcx,%r14
  402600:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  402605:	4d 89 cd             	mov    %r9,%r13
  402608:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  40260f:	00 
  402610:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402617:	00 00 
  402619:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  402620:	00 
  402621:	31 c0                	xor    %eax,%eax
  402623:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  40262a:	00 
  40262b:	ba 00 00 00 00       	mov    $0x0,%edx
  402630:	be 01 00 00 00       	mov    $0x1,%esi
  402635:	bf 02 00 00 00       	mov    $0x2,%edi
  40263a:	e8 b1 e9 ff ff       	callq  400ff0 <socket@plt>
  40263f:	85 c0                	test   %eax,%eax
  402641:	79 4e                	jns    402691 <submitr+0xaf>
  402643:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40264a:	3a 20 43 
  40264d:	48 89 03             	mov    %rax,(%rbx)
  402650:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402657:	20 75 6e 
  40265a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40265e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402665:	74 6f 20 
  402668:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40266c:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402673:	65 20 73 
  402676:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40267a:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402681:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402687:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40268c:	e9 97 06 00 00       	jmpq   402d28 <submitr+0x746>
  402691:	89 c5                	mov    %eax,%ebp
  402693:	4c 89 e7             	mov    %r12,%rdi
  402696:	e8 15 e8 ff ff       	callq  400eb0 <gethostbyname@plt>
  40269b:	48 85 c0             	test   %rax,%rax
  40269e:	75 67                	jne    402707 <submitr+0x125>
  4026a0:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4026a7:	3a 20 44 
  4026aa:	48 89 03             	mov    %rax,(%rbx)
  4026ad:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4026b4:	20 75 6e 
  4026b7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026bb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4026c2:	74 6f 20 
  4026c5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026c9:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4026d0:	76 65 20 
  4026d3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026d7:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4026de:	72 20 61 
  4026e1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026e5:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4026ec:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4026f2:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4026f6:	89 ef                	mov    %ebp,%edi
  4026f8:	e8 63 e7 ff ff       	callq  400e60 <close@plt>
  4026fd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402702:	e9 21 06 00 00       	jmpq   402d28 <submitr+0x746>
  402707:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  40270e:	00 00 
  402710:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  402717:	00 00 
  402719:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  402720:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402724:	48 8b 40 18          	mov    0x18(%rax),%rax
  402728:	48 8b 30             	mov    (%rax),%rsi
  40272b:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  402730:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402735:	e8 86 e7 ff ff       	callq  400ec0 <__memmove_chk@plt>
  40273a:	0f b7 44 24 04       	movzwl 0x4(%rsp),%eax
  40273f:	66 c1 c8 08          	ror    $0x8,%ax
  402743:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  402748:	ba 10 00 00 00       	mov    $0x10,%edx
  40274d:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  402752:	89 ef                	mov    %ebp,%edi
  402754:	e8 57 e8 ff ff       	callq  400fb0 <connect@plt>
  402759:	85 c0                	test   %eax,%eax
  40275b:	79 59                	jns    4027b6 <submitr+0x1d4>
  40275d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402764:	3a 20 55 
  402767:	48 89 03             	mov    %rax,(%rbx)
  40276a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402771:	20 74 6f 
  402774:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402778:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40277f:	65 63 74 
  402782:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402786:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40278d:	68 65 20 
  402790:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402794:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40279b:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  4027a1:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  4027a5:	89 ef                	mov    %ebp,%edi
  4027a7:	e8 b4 e6 ff ff       	callq  400e60 <close@plt>
  4027ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027b1:	e9 72 05 00 00       	jmpq   402d28 <submitr+0x746>
  4027b6:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4027bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4027c2:	48 89 f1             	mov    %rsi,%rcx
  4027c5:	4c 89 ef             	mov    %r13,%rdi
  4027c8:	f2 ae                	repnz scas %es:(%rdi),%al
  4027ca:	48 f7 d1             	not    %rcx
  4027cd:	48 89 ca             	mov    %rcx,%rdx
  4027d0:	48 89 f1             	mov    %rsi,%rcx
  4027d3:	4c 89 ff             	mov    %r15,%rdi
  4027d6:	f2 ae                	repnz scas %es:(%rdi),%al
  4027d8:	48 f7 d1             	not    %rcx
  4027db:	49 89 c8             	mov    %rcx,%r8
  4027de:	48 89 f1             	mov    %rsi,%rcx
  4027e1:	4c 89 f7             	mov    %r14,%rdi
  4027e4:	f2 ae                	repnz scas %es:(%rdi),%al
  4027e6:	48 f7 d1             	not    %rcx
  4027e9:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  4027ee:	48 89 f1             	mov    %rsi,%rcx
  4027f1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4027f6:	f2 ae                	repnz scas %es:(%rdi),%al
  4027f8:	48 89 c8             	mov    %rcx,%rax
  4027fb:	48 f7 d0             	not    %rax
  4027fe:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  402803:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402808:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  40280f:	00 
  402810:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402816:	76 72                	jbe    40288a <submitr+0x2a8>
  402818:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40281f:	3a 20 52 
  402822:	48 89 03             	mov    %rax,(%rbx)
  402825:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40282c:	20 73 74 
  40282f:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402833:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40283a:	74 6f 6f 
  40283d:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402841:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  402848:	65 2e 20 
  40284b:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40284f:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402856:	61 73 65 
  402859:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40285d:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402864:	49 54 52 
  402867:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40286b:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402872:	55 46 00 
  402875:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402879:	89 ef                	mov    %ebp,%edi
  40287b:	e8 e0 e5 ff ff       	callq  400e60 <close@plt>
  402880:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402885:	e9 9e 04 00 00       	jmpq   402d28 <submitr+0x746>
  40288a:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402891:	00 
  402892:	b9 00 04 00 00       	mov    $0x400,%ecx
  402897:	b8 00 00 00 00       	mov    $0x0,%eax
  40289c:	48 89 f7             	mov    %rsi,%rdi
  40289f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4028a2:	4c 89 ef             	mov    %r13,%rdi
  4028a5:	e8 2b fc ff ff       	callq  4024d5 <urlencode>
  4028aa:	85 c0                	test   %eax,%eax
  4028ac:	0f 89 8a 00 00 00    	jns    40293c <submitr+0x35a>
  4028b2:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4028b9:	3a 20 52 
  4028bc:	48 89 03             	mov    %rax,(%rbx)
  4028bf:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4028c6:	20 73 74 
  4028c9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028cd:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4028d4:	63 6f 6e 
  4028d7:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028db:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4028e2:	20 61 6e 
  4028e5:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028e9:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4028f0:	67 61 6c 
  4028f3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028f7:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4028fe:	6e 70 72 
  402901:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402905:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  40290c:	6c 65 20 
  40290f:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402913:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40291a:	63 74 65 
  40291d:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402921:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402927:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40292b:	89 ef                	mov    %ebp,%edi
  40292d:	e8 2e e5 ff ff       	callq  400e60 <close@plt>
  402932:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402937:	e9 ec 03 00 00       	jmpq   402d28 <submitr+0x746>
  40293c:	4c 8d ac 24 40 20 00 	lea    0x2040(%rsp),%r13
  402943:	00 
  402944:	41 54                	push   %r12
  402946:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
  40294d:	00 
  40294e:	50                   	push   %rax
  40294f:	4d 89 f9             	mov    %r15,%r9
  402952:	4d 89 f0             	mov    %r14,%r8
  402955:	b9 a8 3b 40 00       	mov    $0x403ba8,%ecx
  40295a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40295f:	be 01 00 00 00       	mov    $0x1,%esi
  402964:	4c 89 ef             	mov    %r13,%rdi
  402967:	b8 00 00 00 00       	mov    $0x0,%eax
  40296c:	e8 6f e6 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  402971:	b8 00 00 00 00       	mov    $0x0,%eax
  402976:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40297d:	4c 89 ef             	mov    %r13,%rdi
  402980:	f2 ae                	repnz scas %es:(%rdi),%al
  402982:	48 f7 d1             	not    %rcx
  402985:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402989:	4c 89 ee             	mov    %r13,%rsi
  40298c:	89 ef                	mov    %ebp,%edi
  40298e:	e8 b1 f9 ff ff       	callq  402344 <rio_writen>
  402993:	48 83 c4 10          	add    $0x10,%rsp
  402997:	48 85 c0             	test   %rax,%rax
  40299a:	79 6e                	jns    402a0a <submitr+0x428>
  40299c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029a3:	3a 20 43 
  4029a6:	48 89 03             	mov    %rax,(%rbx)
  4029a9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029b0:	20 75 6e 
  4029b3:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029b7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029be:	74 6f 20 
  4029c1:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029c5:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4029cc:	20 74 6f 
  4029cf:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4029d3:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4029da:	72 65 73 
  4029dd:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029e1:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4029e8:	65 72 76 
  4029eb:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4029ef:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4029f5:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4029f9:	89 ef                	mov    %ebp,%edi
  4029fb:	e8 60 e4 ff ff       	callq  400e60 <close@plt>
  402a00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a05:	e9 1e 03 00 00       	jmpq   402d28 <submitr+0x746>
  402a0a:	89 ee                	mov    %ebp,%esi
  402a0c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402a11:	e8 ee f8 ff ff       	callq  402304 <rio_readinitb>
  402a16:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a1b:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a22:	00 
  402a23:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402a28:	e8 fe f9 ff ff       	callq  40242b <rio_readlineb>
  402a2d:	48 85 c0             	test   %rax,%rax
  402a30:	7f 7d                	jg     402aaf <submitr+0x4cd>
  402a32:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a39:	3a 20 43 
  402a3c:	48 89 03             	mov    %rax,(%rbx)
  402a3f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a46:	20 75 6e 
  402a49:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402a4d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a54:	74 6f 20 
  402a57:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402a5b:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402a62:	66 69 72 
  402a65:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a69:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402a70:	61 64 65 
  402a73:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a77:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402a7e:	6d 20 72 
  402a81:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a85:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402a8c:	20 73 65 
  402a8f:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a93:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  402a9a:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402a9e:	89 ef                	mov    %ebp,%edi
  402aa0:	e8 bb e3 ff ff       	callq  400e60 <close@plt>
  402aa5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402aaa:	e9 79 02 00 00       	jmpq   402d28 <submitr+0x746>
  402aaf:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402ab6:	00 
  402ab7:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  402abc:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402ac3:	00 
  402ac4:	be 1f 3c 40 00       	mov    $0x403c1f,%esi
  402ac9:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402ad0:	00 
  402ad1:	b8 00 00 00 00       	mov    $0x0,%eax
  402ad6:	e8 55 e4 ff ff       	callq  400f30 <__isoc99_sscanf@plt>
  402adb:	e9 95 00 00 00       	jmpq   402b75 <submitr+0x593>
  402ae0:	ba 00 20 00 00       	mov    $0x2000,%edx
  402ae5:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402aec:	00 
  402aed:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402af2:	e8 34 f9 ff ff       	callq  40242b <rio_readlineb>
  402af7:	48 85 c0             	test   %rax,%rax
  402afa:	7f 79                	jg     402b75 <submitr+0x593>
  402afc:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402b03:	3a 20 43 
  402b06:	48 89 03             	mov    %rax,(%rbx)
  402b09:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402b10:	20 75 6e 
  402b13:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402b17:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b1e:	74 6f 20 
  402b21:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402b25:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402b2c:	68 65 61 
  402b2f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402b33:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402b3a:	66 72 6f 
  402b3d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402b41:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402b48:	20 72 65 
  402b4b:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402b4f:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402b56:	73 65 72 
  402b59:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402b5d:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402b64:	89 ef                	mov    %ebp,%edi
  402b66:	e8 f5 e2 ff ff       	callq  400e60 <close@plt>
  402b6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b70:	e9 b3 01 00 00       	jmpq   402d28 <submitr+0x746>
  402b75:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402b7c:	00 
  402b7d:	b8 0d 00 00 00       	mov    $0xd,%eax
  402b82:	29 d0                	sub    %edx,%eax
  402b84:	75 1b                	jne    402ba1 <submitr+0x5bf>
  402b86:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402b8d:	00 
  402b8e:	b8 0a 00 00 00       	mov    $0xa,%eax
  402b93:	29 d0                	sub    %edx,%eax
  402b95:	75 0a                	jne    402ba1 <submitr+0x5bf>
  402b97:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402b9e:	00 
  402b9f:	f7 d8                	neg    %eax
  402ba1:	85 c0                	test   %eax,%eax
  402ba3:	0f 85 37 ff ff ff    	jne    402ae0 <submitr+0x4fe>
  402ba9:	ba 00 20 00 00       	mov    $0x2000,%edx
  402bae:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402bb5:	00 
  402bb6:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402bbb:	e8 6b f8 ff ff       	callq  40242b <rio_readlineb>
  402bc0:	48 85 c0             	test   %rax,%rax
  402bc3:	0f 8f 83 00 00 00    	jg     402c4c <submitr+0x66a>
  402bc9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402bd0:	3a 20 43 
  402bd3:	48 89 03             	mov    %rax,(%rbx)
  402bd6:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402bdd:	20 75 6e 
  402be0:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402be4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402beb:	74 6f 20 
  402bee:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402bf2:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402bf9:	73 74 61 
  402bfc:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402c00:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402c07:	65 73 73 
  402c0a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402c0e:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402c15:	72 6f 6d 
  402c18:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402c1c:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402c23:	6c 74 20 
  402c26:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402c2a:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402c31:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402c37:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402c3b:	89 ef                	mov    %ebp,%edi
  402c3d:	e8 1e e2 ff ff       	callq  400e60 <close@plt>
  402c42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c47:	e9 dc 00 00 00       	jmpq   402d28 <submitr+0x746>
  402c4c:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402c51:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402c58:	74 37                	je     402c91 <submitr+0x6af>
  402c5a:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402c61:	00 
  402c62:	b9 e8 3b 40 00       	mov    $0x403be8,%ecx
  402c67:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402c6e:	be 01 00 00 00       	mov    $0x1,%esi
  402c73:	48 89 df             	mov    %rbx,%rdi
  402c76:	b8 00 00 00 00       	mov    $0x0,%eax
  402c7b:	e8 60 e3 ff ff       	callq  400fe0 <__sprintf_chk@plt>
  402c80:	89 ef                	mov    %ebp,%edi
  402c82:	e8 d9 e1 ff ff       	callq  400e60 <close@plt>
  402c87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c8c:	e9 97 00 00 00       	jmpq   402d28 <submitr+0x746>
  402c91:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402c98:	00 
  402c99:	48 89 df             	mov    %rbx,%rdi
  402c9c:	e8 4f e1 ff ff       	callq  400df0 <strcpy@plt>
  402ca1:	89 ef                	mov    %ebp,%edi
  402ca3:	e8 b8 e1 ff ff       	callq  400e60 <close@plt>
  402ca8:	0f b6 03             	movzbl (%rbx),%eax
  402cab:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402cb0:	29 c2                	sub    %eax,%edx
  402cb2:	75 22                	jne    402cd6 <submitr+0x6f4>
  402cb4:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402cb8:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402cbd:	29 c8                	sub    %ecx,%eax
  402cbf:	75 17                	jne    402cd8 <submitr+0x6f6>
  402cc1:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402cc5:	b8 0a 00 00 00       	mov    $0xa,%eax
  402cca:	29 c8                	sub    %ecx,%eax
  402ccc:	75 0a                	jne    402cd8 <submitr+0x6f6>
  402cce:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402cd2:	f7 d8                	neg    %eax
  402cd4:	eb 02                	jmp    402cd8 <submitr+0x6f6>
  402cd6:	89 d0                	mov    %edx,%eax
  402cd8:	85 c0                	test   %eax,%eax
  402cda:	74 40                	je     402d1c <submitr+0x73a>
  402cdc:	bf 30 3c 40 00       	mov    $0x403c30,%edi
  402ce1:	b9 05 00 00 00       	mov    $0x5,%ecx
  402ce6:	48 89 de             	mov    %rbx,%rsi
  402ce9:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402ceb:	0f 97 c0             	seta   %al
  402cee:	0f 92 c1             	setb   %cl
  402cf1:	29 c8                	sub    %ecx,%eax
  402cf3:	0f be c0             	movsbl %al,%eax
  402cf6:	85 c0                	test   %eax,%eax
  402cf8:	74 2e                	je     402d28 <submitr+0x746>
  402cfa:	85 d2                	test   %edx,%edx
  402cfc:	75 13                	jne    402d11 <submitr+0x72f>
  402cfe:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402d02:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402d07:	29 c2                	sub    %eax,%edx
  402d09:	75 06                	jne    402d11 <submitr+0x72f>
  402d0b:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402d0f:	f7 da                	neg    %edx
  402d11:	85 d2                	test   %edx,%edx
  402d13:	75 0e                	jne    402d23 <submitr+0x741>
  402d15:	b8 00 00 00 00       	mov    $0x0,%eax
  402d1a:	eb 0c                	jmp    402d28 <submitr+0x746>
  402d1c:	b8 00 00 00 00       	mov    $0x0,%eax
  402d21:	eb 05                	jmp    402d28 <submitr+0x746>
  402d23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d28:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402d2f:	00 
  402d30:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402d37:	00 00 
  402d39:	74 05                	je     402d40 <submitr+0x75e>
  402d3b:	e8 e0 e0 ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402d40:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402d47:	5b                   	pop    %rbx
  402d48:	5d                   	pop    %rbp
  402d49:	41 5c                	pop    %r12
  402d4b:	41 5d                	pop    %r13
  402d4d:	41 5e                	pop    %r14
  402d4f:	41 5f                	pop    %r15
  402d51:	c3                   	retq   

0000000000402d52 <init_timeout>:
  402d52:	85 ff                	test   %edi,%edi
  402d54:	74 23                	je     402d79 <init_timeout+0x27>
  402d56:	53                   	push   %rbx
  402d57:	89 fb                	mov    %edi,%ebx
  402d59:	85 ff                	test   %edi,%edi
  402d5b:	79 05                	jns    402d62 <init_timeout+0x10>
  402d5d:	bb 00 00 00 00       	mov    $0x0,%ebx
  402d62:	be 16 23 40 00       	mov    $0x402316,%esi
  402d67:	bf 0e 00 00 00       	mov    $0xe,%edi
  402d6c:	e8 2f e1 ff ff       	callq  400ea0 <signal@plt>
  402d71:	89 df                	mov    %ebx,%edi
  402d73:	e8 d8 e0 ff ff       	callq  400e50 <alarm@plt>
  402d78:	5b                   	pop    %rbx
  402d79:	f3 c3                	repz retq 

0000000000402d7b <init_driver>:
  402d7b:	55                   	push   %rbp
  402d7c:	53                   	push   %rbx
  402d7d:	48 83 ec 28          	sub    $0x28,%rsp
  402d81:	48 89 fd             	mov    %rdi,%rbp
  402d84:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402d8b:	00 00 
  402d8d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402d92:	31 c0                	xor    %eax,%eax
  402d94:	be 01 00 00 00       	mov    $0x1,%esi
  402d99:	bf 0d 00 00 00       	mov    $0xd,%edi
  402d9e:	e8 fd e0 ff ff       	callq  400ea0 <signal@plt>
  402da3:	be 01 00 00 00       	mov    $0x1,%esi
  402da8:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402dad:	e8 ee e0 ff ff       	callq  400ea0 <signal@plt>
  402db2:	be 01 00 00 00       	mov    $0x1,%esi
  402db7:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402dbc:	e8 df e0 ff ff       	callq  400ea0 <signal@plt>
  402dc1:	ba 00 00 00 00       	mov    $0x0,%edx
  402dc6:	be 01 00 00 00       	mov    $0x1,%esi
  402dcb:	bf 02 00 00 00       	mov    $0x2,%edi
  402dd0:	e8 1b e2 ff ff       	callq  400ff0 <socket@plt>
  402dd5:	85 c0                	test   %eax,%eax
  402dd7:	79 4f                	jns    402e28 <init_driver+0xad>
  402dd9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402de0:	3a 20 43 
  402de3:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402de7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402dee:	20 75 6e 
  402df1:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402df5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402dfc:	74 6f 20 
  402dff:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e03:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402e0a:	65 20 73 
  402e0d:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402e11:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402e18:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402e1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e23:	e9 2a 01 00 00       	jmpq   402f52 <init_driver+0x1d7>
  402e28:	89 c3                	mov    %eax,%ebx
  402e2a:	bf 35 3c 40 00       	mov    $0x403c35,%edi
  402e2f:	e8 7c e0 ff ff       	callq  400eb0 <gethostbyname@plt>
  402e34:	48 85 c0             	test   %rax,%rax
  402e37:	75 68                	jne    402ea1 <init_driver+0x126>
  402e39:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402e40:	3a 20 44 
  402e43:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e47:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402e4e:	20 75 6e 
  402e51:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402e55:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402e5c:	74 6f 20 
  402e5f:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e63:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402e6a:	76 65 20 
  402e6d:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402e71:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402e78:	72 20 61 
  402e7b:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402e7f:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402e86:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402e8c:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402e90:	89 df                	mov    %ebx,%edi
  402e92:	e8 c9 df ff ff       	callq  400e60 <close@plt>
  402e97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e9c:	e9 b1 00 00 00       	jmpq   402f52 <init_driver+0x1d7>
  402ea1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402ea8:	00 
  402ea9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402eb0:	00 00 
  402eb2:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402eb8:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402ebc:	48 8b 40 18          	mov    0x18(%rax),%rax
  402ec0:	48 8b 30             	mov    (%rax),%rsi
  402ec3:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402ec8:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402ecd:	e8 ee df ff ff       	callq  400ec0 <__memmove_chk@plt>
  402ed2:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  402ed9:	ba 10 00 00 00       	mov    $0x10,%edx
  402ede:	48 89 e6             	mov    %rsp,%rsi
  402ee1:	89 df                	mov    %ebx,%edi
  402ee3:	e8 c8 e0 ff ff       	callq  400fb0 <connect@plt>
  402ee8:	85 c0                	test   %eax,%eax
  402eea:	79 50                	jns    402f3c <init_driver+0x1c1>
  402eec:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402ef3:	3a 20 55 
  402ef6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402efa:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402f01:	20 74 6f 
  402f04:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402f08:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402f0f:	65 63 74 
  402f12:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402f16:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402f1d:	65 72 76 
  402f20:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402f24:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402f2a:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402f2e:	89 df                	mov    %ebx,%edi
  402f30:	e8 2b df ff ff       	callq  400e60 <close@plt>
  402f35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402f3a:	eb 16                	jmp    402f52 <init_driver+0x1d7>
  402f3c:	89 df                	mov    %ebx,%edi
  402f3e:	e8 1d df ff ff       	callq  400e60 <close@plt>
  402f43:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402f49:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402f4d:	b8 00 00 00 00       	mov    $0x0,%eax
  402f52:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402f57:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402f5e:	00 00 
  402f60:	74 05                	je     402f67 <init_driver+0x1ec>
  402f62:	e8 b9 de ff ff       	callq  400e20 <__stack_chk_fail@plt>
  402f67:	48 83 c4 28          	add    $0x28,%rsp
  402f6b:	5b                   	pop    %rbx
  402f6c:	5d                   	pop    %rbp
  402f6d:	c3                   	retq   

0000000000402f6e <driver_post>:
  402f6e:	53                   	push   %rbx
  402f6f:	4c 89 cb             	mov    %r9,%rbx
  402f72:	45 85 c0             	test   %r8d,%r8d
  402f75:	74 27                	je     402f9e <driver_post+0x30>
  402f77:	48 89 ca             	mov    %rcx,%rdx
  402f7a:	be 44 3c 40 00       	mov    $0x403c44,%esi
  402f7f:	bf 01 00 00 00       	mov    $0x1,%edi
  402f84:	b8 00 00 00 00       	mov    $0x0,%eax
  402f89:	e8 c2 df ff ff       	callq  400f50 <__printf_chk@plt>
  402f8e:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402f93:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402f97:	b8 00 00 00 00       	mov    $0x0,%eax
  402f9c:	eb 3f                	jmp    402fdd <driver_post+0x6f>
  402f9e:	48 85 ff             	test   %rdi,%rdi
  402fa1:	74 2c                	je     402fcf <driver_post+0x61>
  402fa3:	80 3f 00             	cmpb   $0x0,(%rdi)
  402fa6:	74 27                	je     402fcf <driver_post+0x61>
  402fa8:	48 83 ec 08          	sub    $0x8,%rsp
  402fac:	41 51                	push   %r9
  402fae:	49 89 c9             	mov    %rcx,%r9
  402fb1:	49 89 d0             	mov    %rdx,%r8
  402fb4:	48 89 f9             	mov    %rdi,%rcx
  402fb7:	48 89 f2             	mov    %rsi,%rdx
  402fba:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  402fbf:	bf 35 3c 40 00       	mov    $0x403c35,%edi
  402fc4:	e8 19 f6 ff ff       	callq  4025e2 <submitr>
  402fc9:	48 83 c4 10          	add    $0x10,%rsp
  402fcd:	eb 0e                	jmp    402fdd <driver_post+0x6f>
  402fcf:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402fd4:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402fd8:	b8 00 00 00 00       	mov    $0x0,%eax
  402fdd:	5b                   	pop    %rbx
  402fde:	c3                   	retq   

0000000000402fdf <check>:
  402fdf:	89 f8                	mov    %edi,%eax
  402fe1:	c1 e8 1c             	shr    $0x1c,%eax
  402fe4:	85 c0                	test   %eax,%eax
  402fe6:	74 1d                	je     403005 <check+0x26>
  402fe8:	b9 00 00 00 00       	mov    $0x0,%ecx
  402fed:	eb 0b                	jmp    402ffa <check+0x1b>
  402fef:	89 f8                	mov    %edi,%eax
  402ff1:	d3 e8                	shr    %cl,%eax
  402ff3:	3c 0a                	cmp    $0xa,%al
  402ff5:	74 14                	je     40300b <check+0x2c>
  402ff7:	83 c1 08             	add    $0x8,%ecx
  402ffa:	83 f9 1f             	cmp    $0x1f,%ecx
  402ffd:	7e f0                	jle    402fef <check+0x10>
  402fff:	b8 01 00 00 00       	mov    $0x1,%eax
  403004:	c3                   	retq   
  403005:	b8 00 00 00 00       	mov    $0x0,%eax
  40300a:	c3                   	retq   
  40300b:	b8 00 00 00 00       	mov    $0x0,%eax
  403010:	c3                   	retq   

0000000000403011 <gencookie>:
  403011:	53                   	push   %rbx
  403012:	83 c7 01             	add    $0x1,%edi
  403015:	e8 b6 dd ff ff       	callq  400dd0 <srandom@plt>
  40301a:	e8 e1 de ff ff       	callq  400f00 <random@plt>
  40301f:	89 c3                	mov    %eax,%ebx
  403021:	89 c7                	mov    %eax,%edi
  403023:	e8 b7 ff ff ff       	callq  402fdf <check>
  403028:	85 c0                	test   %eax,%eax
  40302a:	74 ee                	je     40301a <gencookie+0x9>
  40302c:	89 d8                	mov    %ebx,%eax
  40302e:	5b                   	pop    %rbx
  40302f:	c3                   	retq   

0000000000403030 <__libc_csu_init>:
  403030:	41 57                	push   %r15
  403032:	41 56                	push   %r14
  403034:	41 89 ff             	mov    %edi,%r15d
  403037:	41 55                	push   %r13
  403039:	41 54                	push   %r12
  40303b:	4c 8d 25 ce 1d 20 00 	lea    0x201dce(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  403042:	55                   	push   %rbp
  403043:	48 8d 2d ce 1d 20 00 	lea    0x201dce(%rip),%rbp        # 604e18 <__init_array_end>
  40304a:	53                   	push   %rbx
  40304b:	49 89 f6             	mov    %rsi,%r14
  40304e:	49 89 d5             	mov    %rdx,%r13
  403051:	4c 29 e5             	sub    %r12,%rbp
  403054:	48 83 ec 08          	sub    $0x8,%rsp
  403058:	48 c1 fd 03          	sar    $0x3,%rbp
  40305c:	e8 07 dd ff ff       	callq  400d68 <_init>
  403061:	48 85 ed             	test   %rbp,%rbp
  403064:	74 20                	je     403086 <__libc_csu_init+0x56>
  403066:	31 db                	xor    %ebx,%ebx
  403068:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40306f:	00 
  403070:	4c 89 ea             	mov    %r13,%rdx
  403073:	4c 89 f6             	mov    %r14,%rsi
  403076:	44 89 ff             	mov    %r15d,%edi
  403079:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40307d:	48 83 c3 01          	add    $0x1,%rbx
  403081:	48 39 eb             	cmp    %rbp,%rbx
  403084:	75 ea                	jne    403070 <__libc_csu_init+0x40>
  403086:	48 83 c4 08          	add    $0x8,%rsp
  40308a:	5b                   	pop    %rbx
  40308b:	5d                   	pop    %rbp
  40308c:	41 5c                	pop    %r12
  40308e:	41 5d                	pop    %r13
  403090:	41 5e                	pop    %r14
  403092:	41 5f                	pop    %r15
  403094:	c3                   	retq   
  403095:	90                   	nop
  403096:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40309d:	00 00 00 

00000000004030a0 <__libc_csu_fini>:
  4030a0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004030a4 <_fini>:
  4030a4:	48 83 ec 08          	sub    $0x8,%rsp
  4030a8:	48 83 c4 08          	add    $0x8,%rsp
  4030ac:	c3                   	retq   
