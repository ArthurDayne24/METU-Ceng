
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b50 <_init>:
  400b50:	48 83 ec 08          	sub    $0x8,%rsp
  400b54:	48 8b 05 9d 34 20 00 	mov    0x20349d(%rip),%rax        # 603ff8 <_DYNAMIC+0x1d0>
  400b5b:	48 85 c0             	test   %rax,%rax
  400b5e:	74 05                	je     400b65 <_init+0x15>
  400b60:	e8 1b 01 00 00       	callq  400c80 <__gmon_start__@plt>
  400b65:	48 83 c4 08          	add    $0x8,%rsp
  400b69:	c3                   	retq   

Disassembly of section .plt:

0000000000400b70 <getenv@plt-0x10>:
  400b70:	ff 35 92 34 20 00    	pushq  0x203492(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b76:	ff 25 94 34 20 00    	jmpq   *0x203494(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b80 <getenv@plt>:
  400b80:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400b86:	68 00 00 00 00       	pushq  $0x0
  400b8b:	e9 e0 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400b90 <strcasecmp@plt>:
  400b90:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400b96:	68 01 00 00 00       	pushq  $0x1
  400b9b:	e9 d0 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400ba0 <__errno_location@plt>:
  400ba0:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400ba6:	68 02 00 00 00       	pushq  $0x2
  400bab:	e9 c0 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400bb0 <strcpy@plt>:
  400bb0:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400bb6:	68 03 00 00 00       	pushq  $0x3
  400bbb:	e9 b0 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400bc0 <puts@plt>:
  400bc0:	ff 25 72 34 20 00    	jmpq   *0x203472(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400bc6:	68 04 00 00 00       	pushq  $0x4
  400bcb:	e9 a0 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400bd0 <write@plt>:
  400bd0:	ff 25 6a 34 20 00    	jmpq   *0x20346a(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400bd6:	68 05 00 00 00       	pushq  $0x5
  400bdb:	e9 90 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400be0 <__stack_chk_fail@plt>:
  400be0:	ff 25 62 34 20 00    	jmpq   *0x203462(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400be6:	68 06 00 00 00       	pushq  $0x6
  400beb:	e9 80 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400bf0 <alarm@plt>:
  400bf0:	ff 25 5a 34 20 00    	jmpq   *0x20345a(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400bf6:	68 07 00 00 00       	pushq  $0x7
  400bfb:	e9 70 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c00 <close@plt>:
  400c00:	ff 25 52 34 20 00    	jmpq   *0x203452(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400c06:	68 08 00 00 00       	pushq  $0x8
  400c0b:	e9 60 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c10 <read@plt>:
  400c10:	ff 25 4a 34 20 00    	jmpq   *0x20344a(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400c16:	68 09 00 00 00       	pushq  $0x9
  400c1b:	e9 50 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c20 <__libc_start_main@plt>:
  400c20:	ff 25 42 34 20 00    	jmpq   *0x203442(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400c26:	68 0a 00 00 00       	pushq  $0xa
  400c2b:	e9 40 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c30 <fgets@plt>:
  400c30:	ff 25 3a 34 20 00    	jmpq   *0x20343a(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400c36:	68 0b 00 00 00       	pushq  $0xb
  400c3b:	e9 30 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c40 <signal@plt>:
  400c40:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400c46:	68 0c 00 00 00       	pushq  $0xc
  400c4b:	e9 20 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c50 <gethostbyname@plt>:
  400c50:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400c56:	68 0d 00 00 00       	pushq  $0xd
  400c5b:	e9 10 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c60 <__memmove_chk@plt>:
  400c60:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400c66:	68 0e 00 00 00       	pushq  $0xe
  400c6b:	e9 00 ff ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c70 <__memcpy_chk@plt>:
  400c70:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400c76:	68 0f 00 00 00       	pushq  $0xf
  400c7b:	e9 f0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c80 <__gmon_start__@plt>:
  400c80:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400c86:	68 10 00 00 00       	pushq  $0x10
  400c8b:	e9 e0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400c90 <strtol@plt>:
  400c90:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400c96:	68 11 00 00 00       	pushq  $0x11
  400c9b:	e9 d0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400ca0 <fflush@plt>:
  400ca0:	ff 25 02 34 20 00    	jmpq   *0x203402(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400ca6:	68 12 00 00 00       	pushq  $0x12
  400cab:	e9 c0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400cb0 <__isoc99_sscanf@plt>:
  400cb0:	ff 25 fa 33 20 00    	jmpq   *0x2033fa(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400cb6:	68 13 00 00 00       	pushq  $0x13
  400cbb:	e9 b0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400cc0 <__printf_chk@plt>:
  400cc0:	ff 25 f2 33 20 00    	jmpq   *0x2033f2(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400cc6:	68 14 00 00 00       	pushq  $0x14
  400ccb:	e9 a0 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400cd0 <fopen@plt>:
  400cd0:	ff 25 ea 33 20 00    	jmpq   *0x2033ea(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400cd6:	68 15 00 00 00       	pushq  $0x15
  400cdb:	e9 90 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400ce0 <gethostname@plt>:
  400ce0:	ff 25 e2 33 20 00    	jmpq   *0x2033e2(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400ce6:	68 16 00 00 00       	pushq  $0x16
  400ceb:	e9 80 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400cf0 <exit@plt>:
  400cf0:	ff 25 da 33 20 00    	jmpq   *0x2033da(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400cf6:	68 17 00 00 00       	pushq  $0x17
  400cfb:	e9 70 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d00 <connect@plt>:
  400d00:	ff 25 d2 33 20 00    	jmpq   *0x2033d2(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400d06:	68 18 00 00 00       	pushq  $0x18
  400d0b:	e9 60 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d10 <__fprintf_chk@plt>:
  400d10:	ff 25 ca 33 20 00    	jmpq   *0x2033ca(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400d16:	68 19 00 00 00       	pushq  $0x19
  400d1b:	e9 50 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d20 <sleep@plt>:
  400d20:	ff 25 c2 33 20 00    	jmpq   *0x2033c2(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400d26:	68 1a 00 00 00       	pushq  $0x1a
  400d2b:	e9 40 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d30 <__ctype_b_loc@plt>:
  400d30:	ff 25 ba 33 20 00    	jmpq   *0x2033ba(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400d36:	68 1b 00 00 00       	pushq  $0x1b
  400d3b:	e9 30 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d40 <__sprintf_chk@plt>:
  400d40:	ff 25 b2 33 20 00    	jmpq   *0x2033b2(%rip)        # 6040f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400d46:	68 1c 00 00 00       	pushq  $0x1c
  400d4b:	e9 20 fe ff ff       	jmpq   400b70 <_init+0x20>

0000000000400d50 <socket@plt>:
  400d50:	ff 25 aa 33 20 00    	jmpq   *0x2033aa(%rip)        # 604100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400d56:	68 1d 00 00 00       	pushq  $0x1d
  400d5b:	e9 10 fe ff ff       	jmpq   400b70 <_init+0x20>

Disassembly of section .text:

0000000000400d60 <_start>:
  400d60:	31 ed                	xor    %ebp,%ebp
  400d62:	49 89 d1             	mov    %rdx,%r9
  400d65:	5e                   	pop    %rsi
  400d66:	48 89 e2             	mov    %rsp,%rdx
  400d69:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d6d:	50                   	push   %rax
  400d6e:	54                   	push   %rsp
  400d6f:	49 c7 c0 b0 25 40 00 	mov    $0x4025b0,%r8
  400d76:	48 c7 c1 40 25 40 00 	mov    $0x402540,%rcx
  400d7d:	48 c7 c7 4d 0e 40 00 	mov    $0x400e4d,%rdi
  400d84:	e8 97 fe ff ff       	callq  400c20 <__libc_start_main@plt>
  400d89:	f4                   	hlt    
  400d8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400d90 <deregister_tm_clones>:
  400d90:	b8 e7 4d 60 00       	mov    $0x604de7,%eax
  400d95:	55                   	push   %rbp
  400d96:	48 2d e0 4d 60 00    	sub    $0x604de0,%rax
  400d9c:	48 83 f8 0e          	cmp    $0xe,%rax
  400da0:	48 89 e5             	mov    %rsp,%rbp
  400da3:	77 02                	ja     400da7 <deregister_tm_clones+0x17>
  400da5:	5d                   	pop    %rbp
  400da6:	c3                   	retq   
  400da7:	b8 00 00 00 00       	mov    $0x0,%eax
  400dac:	48 85 c0             	test   %rax,%rax
  400daf:	74 f4                	je     400da5 <deregister_tm_clones+0x15>
  400db1:	5d                   	pop    %rbp
  400db2:	bf e0 4d 60 00       	mov    $0x604de0,%edi
  400db7:	ff e0                	jmpq   *%rax
  400db9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400dc0 <register_tm_clones>:
  400dc0:	b8 e0 4d 60 00       	mov    $0x604de0,%eax
  400dc5:	55                   	push   %rbp
  400dc6:	48 2d e0 4d 60 00    	sub    $0x604de0,%rax
  400dcc:	48 c1 f8 03          	sar    $0x3,%rax
  400dd0:	48 89 e5             	mov    %rsp,%rbp
  400dd3:	48 89 c2             	mov    %rax,%rdx
  400dd6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400dda:	48 01 d0             	add    %rdx,%rax
  400ddd:	48 d1 f8             	sar    %rax
  400de0:	75 02                	jne    400de4 <register_tm_clones+0x24>
  400de2:	5d                   	pop    %rbp
  400de3:	c3                   	retq   
  400de4:	ba 00 00 00 00       	mov    $0x0,%edx
  400de9:	48 85 d2             	test   %rdx,%rdx
  400dec:	74 f4                	je     400de2 <register_tm_clones+0x22>
  400dee:	5d                   	pop    %rbp
  400def:	48 89 c6             	mov    %rax,%rsi
  400df2:	bf e0 4d 60 00       	mov    $0x604de0,%edi
  400df7:	ff e2                	jmpq   *%rdx
  400df9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400e00 <__do_global_dtors_aux>:
  400e00:	80 3d f1 3f 20 00 00 	cmpb   $0x0,0x203ff1(%rip)        # 604df8 <completed.6973>
  400e07:	75 11                	jne    400e1a <__do_global_dtors_aux+0x1a>
  400e09:	55                   	push   %rbp
  400e0a:	48 89 e5             	mov    %rsp,%rbp
  400e0d:	e8 7e ff ff ff       	callq  400d90 <deregister_tm_clones>
  400e12:	5d                   	pop    %rbp
  400e13:	c6 05 de 3f 20 00 01 	movb   $0x1,0x203fde(%rip)        # 604df8 <completed.6973>
  400e1a:	f3 c3                	repz retq 
  400e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e20 <frame_dummy>:
  400e20:	48 83 3d f8 2f 20 00 	cmpq   $0x0,0x202ff8(%rip)        # 603e20 <__JCR_END__>
  400e27:	00 
  400e28:	74 1e                	je     400e48 <frame_dummy+0x28>
  400e2a:	b8 00 00 00 00       	mov    $0x0,%eax
  400e2f:	48 85 c0             	test   %rax,%rax
  400e32:	74 14                	je     400e48 <frame_dummy+0x28>
  400e34:	55                   	push   %rbp
  400e35:	bf 20 3e 60 00       	mov    $0x603e20,%edi
  400e3a:	48 89 e5             	mov    %rsp,%rbp
  400e3d:	ff d0                	callq  *%rax
  400e3f:	5d                   	pop    %rbp
  400e40:	e9 7b ff ff ff       	jmpq   400dc0 <register_tm_clones>
  400e45:	0f 1f 00             	nopl   (%rax)
  400e48:	e9 73 ff ff ff       	jmpq   400dc0 <register_tm_clones>

0000000000400e4d <main>:
  400e4d:	53                   	push   %rbx
  400e4e:	83 ff 01             	cmp    $0x1,%edi
  400e51:	75 10                	jne    400e63 <main+0x16>
  400e53:	48 8b 05 8e 3f 20 00 	mov    0x203f8e(%rip),%rax        # 604de8 <stdin@@GLIBC_2.2.5>
  400e5a:	48 89 05 9f 3f 20 00 	mov    %rax,0x203f9f(%rip)        # 604e00 <infile>
  400e61:	eb 63                	jmp    400ec6 <main+0x79>
  400e63:	48 89 f3             	mov    %rsi,%rbx
  400e66:	83 ff 02             	cmp    $0x2,%edi
  400e69:	75 3a                	jne    400ea5 <main+0x58>
  400e6b:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400e6f:	be b8 30 40 00       	mov    $0x4030b8,%esi
  400e74:	e8 57 fe ff ff       	callq  400cd0 <fopen@plt>
  400e79:	48 89 05 80 3f 20 00 	mov    %rax,0x203f80(%rip)        # 604e00 <infile>
  400e80:	48 85 c0             	test   %rax,%rax
  400e83:	75 41                	jne    400ec6 <main+0x79>
  400e85:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  400e89:	48 8b 13             	mov    (%rbx),%rdx
  400e8c:	be c4 25 40 00       	mov    $0x4025c4,%esi
  400e91:	bf 01 00 00 00       	mov    $0x1,%edi
  400e96:	e8 25 fe ff ff       	callq  400cc0 <__printf_chk@plt>
  400e9b:	bf 08 00 00 00       	mov    $0x8,%edi
  400ea0:	e8 4b fe ff ff       	callq  400cf0 <exit@plt>
  400ea5:	48 8b 16             	mov    (%rsi),%rdx
  400ea8:	be e1 25 40 00       	mov    $0x4025e1,%esi
  400ead:	bf 01 00 00 00       	mov    $0x1,%edi
  400eb2:	b8 00 00 00 00       	mov    $0x0,%eax
  400eb7:	e8 04 fe ff ff       	callq  400cc0 <__printf_chk@plt>
  400ebc:	bf 08 00 00 00       	mov    $0x8,%edi
  400ec1:	e8 2a fe ff ff       	callq  400cf0 <exit@plt>
  400ec6:	e8 07 06 00 00       	callq  4014d2 <initialize_bomb>
  400ecb:	bf 48 26 40 00       	mov    $0x402648,%edi
  400ed0:	e8 eb fc ff ff       	callq  400bc0 <puts@plt>
  400ed5:	bf 88 26 40 00       	mov    $0x402688,%edi
  400eda:	e8 e1 fc ff ff       	callq  400bc0 <puts@plt>
  400edf:	e8 d0 08 00 00       	callq  4017b4 <read_line>
  400ee4:	48 89 c7             	mov    %rax,%rdi
  400ee7:	e8 a4 00 00 00       	callq  400f90 <phase_1>
  400eec:	e8 e9 09 00 00       	callq  4018da <phase_defused>
  400ef1:	bf b8 26 40 00       	mov    $0x4026b8,%edi
  400ef6:	e8 c5 fc ff ff       	callq  400bc0 <puts@plt>
  400efb:	e8 b4 08 00 00       	callq  4017b4 <read_line>
  400f00:	48 89 c7             	mov    %rax,%rdi
  400f03:	e8 a4 00 00 00       	callq  400fac <phase_2>
  400f08:	e8 cd 09 00 00       	callq  4018da <phase_defused>
  400f0d:	bf fb 25 40 00       	mov    $0x4025fb,%edi
  400f12:	e8 a9 fc ff ff       	callq  400bc0 <puts@plt>
  400f17:	e8 98 08 00 00       	callq  4017b4 <read_line>
  400f1c:	48 89 c7             	mov    %rax,%rdi
  400f1f:	e8 d3 00 00 00       	callq  400ff7 <phase_3>
  400f24:	e8 b1 09 00 00       	callq  4018da <phase_defused>
  400f29:	bf 19 26 40 00       	mov    $0x402619,%edi
  400f2e:	e8 8d fc ff ff       	callq  400bc0 <puts@plt>
  400f33:	e8 7c 08 00 00       	callq  4017b4 <read_line>
  400f38:	48 89 c7             	mov    %rax,%rdi
  400f3b:	e8 37 02 00 00       	callq  401177 <phase_4>
  400f40:	e8 95 09 00 00       	callq  4018da <phase_defused>
  400f45:	bf e8 26 40 00       	mov    $0x4026e8,%edi
  400f4a:	e8 71 fc ff ff       	callq  400bc0 <puts@plt>
  400f4f:	e8 60 08 00 00       	callq  4017b4 <read_line>
  400f54:	48 89 c7             	mov    %rax,%rdi
  400f57:	e8 72 02 00 00       	callq  4011ce <phase_5>
  400f5c:	e8 79 09 00 00       	callq  4018da <phase_defused>
  400f61:	bf 28 26 40 00       	mov    $0x402628,%edi
  400f66:	e8 55 fc ff ff       	callq  400bc0 <puts@plt>
  400f6b:	e8 44 08 00 00       	callq  4017b4 <read_line>
  400f70:	48 89 c7             	mov    %rax,%rdi
  400f73:	e8 dc 02 00 00       	callq  401254 <phase_6>
  400f78:	e8 5d 09 00 00       	callq  4018da <phase_defused>
  400f7d:	b8 00 00 00 00       	mov    $0x0,%eax
  400f82:	5b                   	pop    %rbx
  400f83:	c3                   	retq   
  400f84:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f8b:	00 00 00 
  400f8e:	66 90                	xchg   %ax,%ax

0000000000400f90 <phase_1>:
  400f90:	48 83 ec 08          	sub    $0x8,%rsp
  400f94:	be 10 27 40 00       	mov    $0x402710,%esi
  400f99:	e8 ca 04 00 00       	callq  401468 <strings_not_equal>
  400f9e:	85 c0                	test   %eax,%eax
  400fa0:	74 05                	je     400fa7 <phase_1+0x17>
  400fa2:	e8 95 07 00 00       	callq  40173c <explode_bomb>
  400fa7:	48 83 c4 08          	add    $0x8,%rsp
  400fab:	c3                   	retq   

0000000000400fac <phase_2>:
  400fac:	55                   	push   %rbp
  400fad:	53                   	push   %rbx
  400fae:	48 83 ec 28          	sub    $0x28,%rsp
  400fb2:	48 89 e6             	mov    %rsp,%rsi
  400fb5:	e8 b8 07 00 00       	callq  401772 <read_six_numbers>
  400fba:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  400fbe:	79 24                	jns    400fe4 <phase_2+0x38>
  400fc0:	e8 77 07 00 00       	callq  40173c <explode_bomb>
  400fc5:	eb 1d                	jmp    400fe4 <phase_2+0x38>
  400fc7:	89 d8                	mov    %ebx,%eax
  400fc9:	03 45 fc             	add    -0x4(%rbp),%eax
  400fcc:	39 45 00             	cmp    %eax,0x0(%rbp)
  400fcf:	74 05                	je     400fd6 <phase_2+0x2a>
  400fd1:	e8 66 07 00 00       	callq  40173c <explode_bomb>
  400fd6:	83 c3 01             	add    $0x1,%ebx
  400fd9:	48 83 c5 04          	add    $0x4,%rbp
  400fdd:	83 fb 06             	cmp    $0x6,%ebx
  400fe0:	75 e5                	jne    400fc7 <phase_2+0x1b>
  400fe2:	eb 0c                	jmp    400ff0 <phase_2+0x44>
  400fe4:	48 8d 6c 24 04       	lea    0x4(%rsp),%rbp
  400fe9:	bb 01 00 00 00       	mov    $0x1,%ebx
  400fee:	eb d7                	jmp    400fc7 <phase_2+0x1b>
  400ff0:	48 83 c4 28          	add    $0x28,%rsp
  400ff4:	5b                   	pop    %rbx
  400ff5:	5d                   	pop    %rbp
  400ff6:	c3                   	retq   

0000000000400ff7 <phase_3>:
  400ff7:	48 83 ec 18          	sub    $0x18,%rsp
  400ffb:	4c 8d 44 24 0c       	lea    0xc(%rsp),%r8
  401000:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
  401005:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  40100a:	be 6e 27 40 00       	mov    $0x40276e,%esi
  40100f:	b8 00 00 00 00       	mov    $0x0,%eax
  401014:	e8 97 fc ff ff       	callq  400cb0 <__isoc99_sscanf@plt>
  401019:	83 f8 02             	cmp    $0x2,%eax
  40101c:	7f 05                	jg     401023 <phase_3+0x2c>
  40101e:	e8 19 07 00 00       	callq  40173c <explode_bomb>
  401023:	83 7c 24 08 07       	cmpl   $0x7,0x8(%rsp)
  401028:	0f 87 fc 00 00 00    	ja     40112a <phase_3+0x133>
  40102e:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401032:	ff 24 c5 80 27 40 00 	jmpq   *0x402780(,%rax,8)
  401039:	b8 62 00 00 00       	mov    $0x62,%eax
  40103e:	81 7c 24 0c 6b 01 00 	cmpl   $0x16b,0xc(%rsp)
  401045:	00 
  401046:	0f 84 e8 00 00 00    	je     401134 <phase_3+0x13d>
  40104c:	e8 eb 06 00 00       	callq  40173c <explode_bomb>
  401051:	b8 62 00 00 00       	mov    $0x62,%eax
  401056:	e9 d9 00 00 00       	jmpq   401134 <phase_3+0x13d>
  40105b:	b8 71 00 00 00       	mov    $0x71,%eax
  401060:	81 7c 24 0c 59 02 00 	cmpl   $0x259,0xc(%rsp)
  401067:	00 
  401068:	0f 84 c6 00 00 00    	je     401134 <phase_3+0x13d>
  40106e:	e8 c9 06 00 00       	callq  40173c <explode_bomb>
  401073:	b8 71 00 00 00       	mov    $0x71,%eax
  401078:	e9 b7 00 00 00       	jmpq   401134 <phase_3+0x13d>
  40107d:	b8 74 00 00 00       	mov    $0x74,%eax
  401082:	81 7c 24 0c 06 01 00 	cmpl   $0x106,0xc(%rsp)
  401089:	00 
  40108a:	0f 84 a4 00 00 00    	je     401134 <phase_3+0x13d>
  401090:	e8 a7 06 00 00       	callq  40173c <explode_bomb>
  401095:	b8 74 00 00 00       	mov    $0x74,%eax
  40109a:	e9 95 00 00 00       	jmpq   401134 <phase_3+0x13d>
  40109f:	b8 79 00 00 00       	mov    $0x79,%eax
  4010a4:	81 7c 24 0c b0 02 00 	cmpl   $0x2b0,0xc(%rsp)
  4010ab:	00 
  4010ac:	0f 84 82 00 00 00    	je     401134 <phase_3+0x13d>
  4010b2:	e8 85 06 00 00       	callq  40173c <explode_bomb>
  4010b7:	b8 79 00 00 00       	mov    $0x79,%eax
  4010bc:	eb 76                	jmp    401134 <phase_3+0x13d>
  4010be:	b8 6e 00 00 00       	mov    $0x6e,%eax
  4010c3:	81 7c 24 0c c4 02 00 	cmpl   $0x2c4,0xc(%rsp)
  4010ca:	00 
  4010cb:	74 67                	je     401134 <phase_3+0x13d>
  4010cd:	e8 6a 06 00 00       	callq  40173c <explode_bomb>
  4010d2:	b8 6e 00 00 00       	mov    $0x6e,%eax
  4010d7:	eb 5b                	jmp    401134 <phase_3+0x13d>
  4010d9:	b8 72 00 00 00       	mov    $0x72,%eax
  4010de:	81 7c 24 0c 9d 02 00 	cmpl   $0x29d,0xc(%rsp)
  4010e5:	00 
  4010e6:	74 4c                	je     401134 <phase_3+0x13d>
  4010e8:	e8 4f 06 00 00       	callq  40173c <explode_bomb>
  4010ed:	b8 72 00 00 00       	mov    $0x72,%eax
  4010f2:	eb 40                	jmp    401134 <phase_3+0x13d>
  4010f4:	b8 62 00 00 00       	mov    $0x62,%eax
  4010f9:	81 7c 24 0c 58 03 00 	cmpl   $0x358,0xc(%rsp)
  401100:	00 
  401101:	74 31                	je     401134 <phase_3+0x13d>
  401103:	e8 34 06 00 00       	callq  40173c <explode_bomb>
  401108:	b8 62 00 00 00       	mov    $0x62,%eax
  40110d:	eb 25                	jmp    401134 <phase_3+0x13d>
  40110f:	b8 75 00 00 00       	mov    $0x75,%eax
  401114:	81 7c 24 0c d0 00 00 	cmpl   $0xd0,0xc(%rsp)
  40111b:	00 
  40111c:	74 16                	je     401134 <phase_3+0x13d>
  40111e:	e8 19 06 00 00       	callq  40173c <explode_bomb>
  401123:	b8 75 00 00 00       	mov    $0x75,%eax
  401128:	eb 0a                	jmp    401134 <phase_3+0x13d>
  40112a:	e8 0d 06 00 00       	callq  40173c <explode_bomb>
  40112f:	b8 79 00 00 00       	mov    $0x79,%eax
  401134:	3a 44 24 07          	cmp    0x7(%rsp),%al
  401138:	74 05                	je     40113f <phase_3+0x148>
  40113a:	e8 fd 05 00 00       	callq  40173c <explode_bomb>
  40113f:	48 83 c4 18          	add    $0x18,%rsp
  401143:	c3                   	retq   

0000000000401144 <func4>:
  401144:	53                   	push   %rbx
  401145:	89 d0                	mov    %edx,%eax
  401147:	29 f0                	sub    %esi,%eax
  401149:	89 c3                	mov    %eax,%ebx
  40114b:	c1 eb 1f             	shr    $0x1f,%ebx
  40114e:	01 d8                	add    %ebx,%eax
  401150:	d1 f8                	sar    %eax
  401152:	8d 1c 30             	lea    (%rax,%rsi,1),%ebx
  401155:	39 fb                	cmp    %edi,%ebx
  401157:	7e 0c                	jle    401165 <func4+0x21>
  401159:	8d 53 ff             	lea    -0x1(%rbx),%edx
  40115c:	e8 e3 ff ff ff       	callq  401144 <func4>
  401161:	01 d8                	add    %ebx,%eax
  401163:	eb 10                	jmp    401175 <func4+0x31>
  401165:	89 d8                	mov    %ebx,%eax
  401167:	39 fb                	cmp    %edi,%ebx
  401169:	7d 0a                	jge    401175 <func4+0x31>
  40116b:	8d 73 01             	lea    0x1(%rbx),%esi
  40116e:	e8 d1 ff ff ff       	callq  401144 <func4>
  401173:	01 d8                	add    %ebx,%eax
  401175:	5b                   	pop    %rbx
  401176:	c3                   	retq   

0000000000401177 <phase_4>:
  401177:	48 83 ec 18          	sub    $0x18,%rsp
  40117b:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  401180:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  401185:	be 1d 2a 40 00       	mov    $0x402a1d,%esi
  40118a:	b8 00 00 00 00       	mov    $0x0,%eax
  40118f:	e8 1c fb ff ff       	callq  400cb0 <__isoc99_sscanf@plt>
  401194:	83 f8 02             	cmp    $0x2,%eax
  401197:	75 07                	jne    4011a0 <phase_4+0x29>
  401199:	83 7c 24 08 0e       	cmpl   $0xe,0x8(%rsp)
  40119e:	76 05                	jbe    4011a5 <phase_4+0x2e>
  4011a0:	e8 97 05 00 00       	callq  40173c <explode_bomb>
  4011a5:	ba 0e 00 00 00       	mov    $0xe,%edx
  4011aa:	be 00 00 00 00       	mov    $0x0,%esi
  4011af:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  4011b3:	e8 8c ff ff ff       	callq  401144 <func4>
  4011b8:	83 f8 2d             	cmp    $0x2d,%eax
  4011bb:	75 07                	jne    4011c4 <phase_4+0x4d>
  4011bd:	83 7c 24 0c 2d       	cmpl   $0x2d,0xc(%rsp)
  4011c2:	74 05                	je     4011c9 <phase_4+0x52>
  4011c4:	e8 73 05 00 00       	callq  40173c <explode_bomb>
  4011c9:	48 83 c4 18          	add    $0x18,%rsp
  4011cd:	c3                   	retq   

00000000004011ce <phase_5>:
  4011ce:	53                   	push   %rbx
  4011cf:	48 83 ec 10          	sub    $0x10,%rsp
  4011d3:	48 89 fb             	mov    %rdi,%rbx
  4011d6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011dd:	00 00 
  4011df:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4011e4:	31 c0                	xor    %eax,%eax
  4011e6:	e8 60 02 00 00       	callq  40144b <string_length>
  4011eb:	83 f8 06             	cmp    $0x6,%eax
  4011ee:	74 42                	je     401232 <phase_5+0x64>
  4011f0:	e8 47 05 00 00       	callq  40173c <explode_bomb>
  4011f5:	eb 3b                	jmp    401232 <phase_5+0x64>
  4011f7:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
  4011fb:	83 e2 0f             	and    $0xf,%edx
  4011fe:	0f b6 92 c0 27 40 00 	movzbl 0x4027c0(%rdx),%edx
  401205:	88 14 04             	mov    %dl,(%rsp,%rax,1)
  401208:	48 83 c0 01          	add    $0x1,%rax
  40120c:	48 83 f8 06          	cmp    $0x6,%rax
  401210:	75 e5                	jne    4011f7 <phase_5+0x29>
  401212:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  401217:	be 77 27 40 00       	mov    $0x402777,%esi
  40121c:	48 89 e7             	mov    %rsp,%rdi
  40121f:	e8 44 02 00 00       	callq  401468 <strings_not_equal>
  401224:	85 c0                	test   %eax,%eax
  401226:	74 11                	je     401239 <phase_5+0x6b>
  401228:	e8 0f 05 00 00       	callq  40173c <explode_bomb>
  40122d:	0f 1f 00             	nopl   (%rax)
  401230:	eb 07                	jmp    401239 <phase_5+0x6b>
  401232:	b8 00 00 00 00       	mov    $0x0,%eax
  401237:	eb be                	jmp    4011f7 <phase_5+0x29>
  401239:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40123e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401245:	00 00 
  401247:	74 05                	je     40124e <phase_5+0x80>
  401249:	e8 92 f9 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  40124e:	48 83 c4 10          	add    $0x10,%rsp
  401252:	5b                   	pop    %rbx
  401253:	c3                   	retq   

0000000000401254 <phase_6>:
  401254:	41 55                	push   %r13
  401256:	41 54                	push   %r12
  401258:	55                   	push   %rbp
  401259:	53                   	push   %rbx
  40125a:	48 83 ec 58          	sub    $0x58,%rsp
  40125e:	48 89 e6             	mov    %rsp,%rsi
  401261:	e8 0c 05 00 00       	callq  401772 <read_six_numbers>
  401266:	49 89 e5             	mov    %rsp,%r13
  401269:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  40126f:	4c 89 ed             	mov    %r13,%rbp
  401272:	41 8b 45 00          	mov    0x0(%r13),%eax
  401276:	83 e8 01             	sub    $0x1,%eax
  401279:	83 f8 05             	cmp    $0x5,%eax
  40127c:	76 05                	jbe    401283 <phase_6+0x2f>
  40127e:	e8 b9 04 00 00       	callq  40173c <explode_bomb>
  401283:	41 83 c4 01          	add    $0x1,%r12d
  401287:	41 83 fc 06          	cmp    $0x6,%r12d
  40128b:	75 07                	jne    401294 <phase_6+0x40>
  40128d:	be 00 00 00 00       	mov    $0x0,%esi
  401292:	eb 42                	jmp    4012d6 <phase_6+0x82>
  401294:	44 89 e3             	mov    %r12d,%ebx
  401297:	48 63 c3             	movslq %ebx,%rax
  40129a:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  40129d:	39 45 00             	cmp    %eax,0x0(%rbp)
  4012a0:	75 05                	jne    4012a7 <phase_6+0x53>
  4012a2:	e8 95 04 00 00       	callq  40173c <explode_bomb>
  4012a7:	83 c3 01             	add    $0x1,%ebx
  4012aa:	83 fb 05             	cmp    $0x5,%ebx
  4012ad:	7e e8                	jle    401297 <phase_6+0x43>
  4012af:	49 83 c5 04          	add    $0x4,%r13
  4012b3:	eb ba                	jmp    40126f <phase_6+0x1b>
  4012b5:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  4012b9:	83 c0 01             	add    $0x1,%eax
  4012bc:	39 c8                	cmp    %ecx,%eax
  4012be:	75 f5                	jne    4012b5 <phase_6+0x61>
  4012c0:	eb 05                	jmp    4012c7 <phase_6+0x73>
  4012c2:	ba 20 43 60 00       	mov    $0x604320,%edx
  4012c7:	48 89 54 74 20       	mov    %rdx,0x20(%rsp,%rsi,2)
  4012cc:	48 83 c6 04          	add    $0x4,%rsi
  4012d0:	48 83 fe 18          	cmp    $0x18,%rsi
  4012d4:	74 14                	je     4012ea <phase_6+0x96>
  4012d6:	8b 0c 34             	mov    (%rsp,%rsi,1),%ecx
  4012d9:	83 f9 01             	cmp    $0x1,%ecx
  4012dc:	7e e4                	jle    4012c2 <phase_6+0x6e>
  4012de:	b8 01 00 00 00       	mov    $0x1,%eax
  4012e3:	ba 20 43 60 00       	mov    $0x604320,%edx
  4012e8:	eb cb                	jmp    4012b5 <phase_6+0x61>
  4012ea:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  4012ef:	48 8d 44 24 28       	lea    0x28(%rsp),%rax
  4012f4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  4012f9:	48 89 d9             	mov    %rbx,%rcx
  4012fc:	48 8b 10             	mov    (%rax),%rdx
  4012ff:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  401303:	48 83 c0 08          	add    $0x8,%rax
  401307:	48 39 f0             	cmp    %rsi,%rax
  40130a:	74 05                	je     401311 <phase_6+0xbd>
  40130c:	48 89 d1             	mov    %rdx,%rcx
  40130f:	eb eb                	jmp    4012fc <phase_6+0xa8>
  401311:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  401318:	00 
  401319:	bd 05 00 00 00       	mov    $0x5,%ebp
  40131e:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401322:	8b 00                	mov    (%rax),%eax
  401324:	39 03                	cmp    %eax,(%rbx)
  401326:	7d 05                	jge    40132d <phase_6+0xd9>
  401328:	e8 0f 04 00 00       	callq  40173c <explode_bomb>
  40132d:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  401331:	83 ed 01             	sub    $0x1,%ebp
  401334:	75 e8                	jne    40131e <phase_6+0xca>
  401336:	48 83 c4 58          	add    $0x58,%rsp
  40133a:	5b                   	pop    %rbx
  40133b:	5d                   	pop    %rbp
  40133c:	41 5c                	pop    %r12
  40133e:	41 5d                	pop    %r13
  401340:	c3                   	retq   

0000000000401341 <fun7>:
  401341:	48 83 ec 08          	sub    $0x8,%rsp
  401345:	48 85 ff             	test   %rdi,%rdi
  401348:	74 2b                	je     401375 <fun7+0x34>
  40134a:	8b 17                	mov    (%rdi),%edx
  40134c:	39 f2                	cmp    %esi,%edx
  40134e:	7e 0d                	jle    40135d <fun7+0x1c>
  401350:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401354:	e8 e8 ff ff ff       	callq  401341 <fun7>
  401359:	01 c0                	add    %eax,%eax
  40135b:	eb 1d                	jmp    40137a <fun7+0x39>
  40135d:	b8 00 00 00 00       	mov    $0x0,%eax
  401362:	39 f2                	cmp    %esi,%edx
  401364:	74 14                	je     40137a <fun7+0x39>
  401366:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  40136a:	e8 d2 ff ff ff       	callq  401341 <fun7>
  40136f:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401373:	eb 05                	jmp    40137a <fun7+0x39>
  401375:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40137a:	48 83 c4 08          	add    $0x8,%rsp
  40137e:	c3                   	retq   

000000000040137f <secret_phase>:
  40137f:	53                   	push   %rbx
  401380:	e8 2f 04 00 00       	callq  4017b4 <read_line>
  401385:	ba 0a 00 00 00       	mov    $0xa,%edx
  40138a:	be 00 00 00 00       	mov    $0x0,%esi
  40138f:	48 89 c7             	mov    %rax,%rdi
  401392:	e8 f9 f8 ff ff       	callq  400c90 <strtol@plt>
  401397:	48 89 c3             	mov    %rax,%rbx
  40139a:	8d 40 ff             	lea    -0x1(%rax),%eax
  40139d:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  4013a2:	76 05                	jbe    4013a9 <secret_phase+0x2a>
  4013a4:	e8 93 03 00 00       	callq  40173c <explode_bomb>
  4013a9:	89 de                	mov    %ebx,%esi
  4013ab:	bf 40 41 60 00       	mov    $0x604140,%edi
  4013b0:	e8 8c ff ff ff       	callq  401341 <fun7>
  4013b5:	83 f8 07             	cmp    $0x7,%eax
  4013b8:	74 05                	je     4013bf <secret_phase+0x40>
  4013ba:	e8 7d 03 00 00       	callq  40173c <explode_bomb>
  4013bf:	bf 48 27 40 00       	mov    $0x402748,%edi
  4013c4:	e8 f7 f7 ff ff       	callq  400bc0 <puts@plt>
  4013c9:	e8 0c 05 00 00       	callq  4018da <phase_defused>
  4013ce:	5b                   	pop    %rbx
  4013cf:	c3                   	retq   

00000000004013d0 <sig_handler>:
  4013d0:	48 83 ec 08          	sub    $0x8,%rsp
  4013d4:	bf d0 27 40 00       	mov    $0x4027d0,%edi
  4013d9:	e8 e2 f7 ff ff       	callq  400bc0 <puts@plt>
  4013de:	bf 03 00 00 00       	mov    $0x3,%edi
  4013e3:	e8 38 f9 ff ff       	callq  400d20 <sleep@plt>
  4013e8:	be 99 29 40 00       	mov    $0x402999,%esi
  4013ed:	bf 01 00 00 00       	mov    $0x1,%edi
  4013f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4013f7:	e8 c4 f8 ff ff       	callq  400cc0 <__printf_chk@plt>
  4013fc:	48 8b 3d dd 39 20 00 	mov    0x2039dd(%rip),%rdi        # 604de0 <__TMC_END__>
  401403:	e8 98 f8 ff ff       	callq  400ca0 <fflush@plt>
  401408:	bf 01 00 00 00       	mov    $0x1,%edi
  40140d:	e8 0e f9 ff ff       	callq  400d20 <sleep@plt>
  401412:	bf a1 29 40 00       	mov    $0x4029a1,%edi
  401417:	e8 a4 f7 ff ff       	callq  400bc0 <puts@plt>
  40141c:	bf 10 00 00 00       	mov    $0x10,%edi
  401421:	e8 ca f8 ff ff       	callq  400cf0 <exit@plt>

0000000000401426 <invalid_phase>:
  401426:	48 83 ec 08          	sub    $0x8,%rsp
  40142a:	48 89 fa             	mov    %rdi,%rdx
  40142d:	be a9 29 40 00       	mov    $0x4029a9,%esi
  401432:	bf 01 00 00 00       	mov    $0x1,%edi
  401437:	b8 00 00 00 00       	mov    $0x0,%eax
  40143c:	e8 7f f8 ff ff       	callq  400cc0 <__printf_chk@plt>
  401441:	bf 08 00 00 00       	mov    $0x8,%edi
  401446:	e8 a5 f8 ff ff       	callq  400cf0 <exit@plt>

000000000040144b <string_length>:
  40144b:	80 3f 00             	cmpb   $0x0,(%rdi)
  40144e:	74 12                	je     401462 <string_length+0x17>
  401450:	48 89 fa             	mov    %rdi,%rdx
  401453:	48 83 c2 01          	add    $0x1,%rdx
  401457:	89 d0                	mov    %edx,%eax
  401459:	29 f8                	sub    %edi,%eax
  40145b:	80 3a 00             	cmpb   $0x0,(%rdx)
  40145e:	75 f3                	jne    401453 <string_length+0x8>
  401460:	f3 c3                	repz retq 
  401462:	b8 00 00 00 00       	mov    $0x0,%eax
  401467:	c3                   	retq   

0000000000401468 <strings_not_equal>:
  401468:	41 54                	push   %r12
  40146a:	55                   	push   %rbp
  40146b:	53                   	push   %rbx
  40146c:	48 89 fb             	mov    %rdi,%rbx
  40146f:	48 89 f5             	mov    %rsi,%rbp
  401472:	e8 d4 ff ff ff       	callq  40144b <string_length>
  401477:	41 89 c4             	mov    %eax,%r12d
  40147a:	48 89 ef             	mov    %rbp,%rdi
  40147d:	e8 c9 ff ff ff       	callq  40144b <string_length>
  401482:	ba 01 00 00 00       	mov    $0x1,%edx
  401487:	41 39 c4             	cmp    %eax,%r12d
  40148a:	75 3f                	jne    4014cb <strings_not_equal+0x63>
  40148c:	0f b6 03             	movzbl (%rbx),%eax
  40148f:	84 c0                	test   %al,%al
  401491:	74 25                	je     4014b8 <strings_not_equal+0x50>
  401493:	3a 45 00             	cmp    0x0(%rbp),%al
  401496:	74 0a                	je     4014a2 <strings_not_equal+0x3a>
  401498:	eb 25                	jmp    4014bf <strings_not_equal+0x57>
  40149a:	3a 45 00             	cmp    0x0(%rbp),%al
  40149d:	0f 1f 00             	nopl   (%rax)
  4014a0:	75 24                	jne    4014c6 <strings_not_equal+0x5e>
  4014a2:	48 83 c3 01          	add    $0x1,%rbx
  4014a6:	48 83 c5 01          	add    $0x1,%rbp
  4014aa:	0f b6 03             	movzbl (%rbx),%eax
  4014ad:	84 c0                	test   %al,%al
  4014af:	75 e9                	jne    40149a <strings_not_equal+0x32>
  4014b1:	ba 00 00 00 00       	mov    $0x0,%edx
  4014b6:	eb 13                	jmp    4014cb <strings_not_equal+0x63>
  4014b8:	ba 00 00 00 00       	mov    $0x0,%edx
  4014bd:	eb 0c                	jmp    4014cb <strings_not_equal+0x63>
  4014bf:	ba 01 00 00 00       	mov    $0x1,%edx
  4014c4:	eb 05                	jmp    4014cb <strings_not_equal+0x63>
  4014c6:	ba 01 00 00 00       	mov    $0x1,%edx
  4014cb:	89 d0                	mov    %edx,%eax
  4014cd:	5b                   	pop    %rbx
  4014ce:	5d                   	pop    %rbp
  4014cf:	41 5c                	pop    %r12
  4014d1:	c3                   	retq   

00000000004014d2 <initialize_bomb>:
  4014d2:	53                   	push   %rbx
  4014d3:	48 81 ec 50 20 00 00 	sub    $0x2050,%rsp
  4014da:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4014e1:	00 00 
  4014e3:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
  4014ea:	00 
  4014eb:	31 c0                	xor    %eax,%eax
  4014ed:	be d0 13 40 00       	mov    $0x4013d0,%esi
  4014f2:	bf 02 00 00 00       	mov    $0x2,%edi
  4014f7:	e8 44 f7 ff ff       	callq  400c40 <signal@plt>
  4014fc:	be 40 00 00 00       	mov    $0x40,%esi
  401501:	48 89 e7             	mov    %rsp,%rdi
  401504:	e8 d7 f7 ff ff       	callq  400ce0 <gethostname@plt>
  401509:	85 c0                	test   %eax,%eax
  40150b:	75 13                	jne    401520 <initialize_bomb+0x4e>
  40150d:	48 8b 3d 8c 32 20 00 	mov    0x20328c(%rip),%rdi        # 6047a0 <host_table>
  401514:	bb a8 47 60 00       	mov    $0x6047a8,%ebx
  401519:	48 85 ff             	test   %rdi,%rdi
  40151c:	75 16                	jne    401534 <initialize_bomb+0x62>
  40151e:	eb 52                	jmp    401572 <initialize_bomb+0xa0>
  401520:	bf 08 28 40 00       	mov    $0x402808,%edi
  401525:	e8 96 f6 ff ff       	callq  400bc0 <puts@plt>
  40152a:	bf 08 00 00 00       	mov    $0x8,%edi
  40152f:	e8 bc f7 ff ff       	callq  400cf0 <exit@plt>
  401534:	48 89 e6             	mov    %rsp,%rsi
  401537:	e8 54 f6 ff ff       	callq  400b90 <strcasecmp@plt>
  40153c:	85 c0                	test   %eax,%eax
  40153e:	74 46                	je     401586 <initialize_bomb+0xb4>
  401540:	48 83 c3 08          	add    $0x8,%rbx
  401544:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
  401548:	48 85 ff             	test   %rdi,%rdi
  40154b:	75 e7                	jne    401534 <initialize_bomb+0x62>
  40154d:	eb 23                	jmp    401572 <initialize_bomb+0xa0>
  40154f:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  401554:	be ba 29 40 00       	mov    $0x4029ba,%esi
  401559:	bf 01 00 00 00       	mov    $0x1,%edi
  40155e:	b8 00 00 00 00       	mov    $0x0,%eax
  401563:	e8 58 f7 ff ff       	callq  400cc0 <__printf_chk@plt>
  401568:	bf 08 00 00 00       	mov    $0x8,%edi
  40156d:	e8 7e f7 ff ff       	callq  400cf0 <exit@plt>
  401572:	bf 40 28 40 00       	mov    $0x402840,%edi
  401577:	e8 44 f6 ff ff       	callq  400bc0 <puts@plt>
  40157c:	bf 08 00 00 00       	mov    $0x8,%edi
  401581:	e8 6a f7 ff ff       	callq  400cf0 <exit@plt>
  401586:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40158b:	e8 62 0d 00 00       	callq  4022f2 <init_driver>
  401590:	85 c0                	test   %eax,%eax
  401592:	78 bb                	js     40154f <initialize_bomb+0x7d>
  401594:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
  40159b:	00 
  40159c:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4015a3:	00 00 
  4015a5:	74 05                	je     4015ac <initialize_bomb+0xda>
  4015a7:	e8 34 f6 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  4015ac:	48 81 c4 50 20 00 00 	add    $0x2050,%rsp
  4015b3:	5b                   	pop    %rbx
  4015b4:	c3                   	retq   

00000000004015b5 <initialize_bomb_solve>:
  4015b5:	f3 c3                	repz retq 

00000000004015b7 <blank_line>:
  4015b7:	55                   	push   %rbp
  4015b8:	53                   	push   %rbx
  4015b9:	48 83 ec 08          	sub    $0x8,%rsp
  4015bd:	48 89 fb             	mov    %rdi,%rbx
  4015c0:	eb 17                	jmp    4015d9 <blank_line+0x22>
  4015c2:	e8 69 f7 ff ff       	callq  400d30 <__ctype_b_loc@plt>
  4015c7:	48 83 c3 01          	add    $0x1,%rbx
  4015cb:	48 0f be ed          	movsbq %bpl,%rbp
  4015cf:	48 8b 00             	mov    (%rax),%rax
  4015d2:	f6 44 68 01 20       	testb  $0x20,0x1(%rax,%rbp,2)
  4015d7:	74 0f                	je     4015e8 <blank_line+0x31>
  4015d9:	0f b6 2b             	movzbl (%rbx),%ebp
  4015dc:	40 84 ed             	test   %bpl,%bpl
  4015df:	75 e1                	jne    4015c2 <blank_line+0xb>
  4015e1:	b8 01 00 00 00       	mov    $0x1,%eax
  4015e6:	eb 05                	jmp    4015ed <blank_line+0x36>
  4015e8:	b8 00 00 00 00       	mov    $0x0,%eax
  4015ed:	48 83 c4 08          	add    $0x8,%rsp
  4015f1:	5b                   	pop    %rbx
  4015f2:	5d                   	pop    %rbp
  4015f3:	c3                   	retq   

00000000004015f4 <skip>:
  4015f4:	53                   	push   %rbx
  4015f5:	48 63 05 00 38 20 00 	movslq 0x203800(%rip),%rax        # 604dfc <num_input_strings>
  4015fc:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  401600:	48 c1 e7 04          	shl    $0x4,%rdi
  401604:	48 81 c7 20 4e 60 00 	add    $0x604e20,%rdi
  40160b:	48 8b 15 ee 37 20 00 	mov    0x2037ee(%rip),%rdx        # 604e00 <infile>
  401612:	be 50 00 00 00       	mov    $0x50,%esi
  401617:	e8 14 f6 ff ff       	callq  400c30 <fgets@plt>
  40161c:	48 89 c3             	mov    %rax,%rbx
  40161f:	48 85 c0             	test   %rax,%rax
  401622:	74 0c                	je     401630 <skip+0x3c>
  401624:	48 89 c7             	mov    %rax,%rdi
  401627:	e8 8b ff ff ff       	callq  4015b7 <blank_line>
  40162c:	85 c0                	test   %eax,%eax
  40162e:	75 c5                	jne    4015f5 <skip+0x1>
  401630:	48 89 d8             	mov    %rbx,%rax
  401633:	5b                   	pop    %rbx
  401634:	c3                   	retq   

0000000000401635 <send_msg>:
  401635:	48 81 ec 28 40 00 00 	sub    $0x4028,%rsp
  40163c:	41 89 f9             	mov    %edi,%r9d
  40163f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401646:	00 00 
  401648:	48 89 84 24 18 40 00 	mov    %rax,0x4018(%rsp)
  40164f:	00 
  401650:	31 c0                	xor    %eax,%eax
  401652:	8b 35 a4 37 20 00    	mov    0x2037a4(%rip),%esi        # 604dfc <num_input_strings>
  401658:	8d 46 ff             	lea    -0x1(%rsi),%eax
  40165b:	48 98                	cltq   
  40165d:	4c 8d 04 80          	lea    (%rax,%rax,4),%r8
  401661:	49 c1 e0 04          	shl    $0x4,%r8
  401665:	49 81 c0 20 4e 60 00 	add    $0x604e20,%r8
  40166c:	4c 89 c7             	mov    %r8,%rdi
  40166f:	b8 00 00 00 00       	mov    $0x0,%eax
  401674:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40167b:	f2 ae                	repnz scas %es:(%rdi),%al
  40167d:	48 f7 d1             	not    %rcx
  401680:	48 83 c1 63          	add    $0x63,%rcx
  401684:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  40168b:	76 19                	jbe    4016a6 <send_msg+0x71>
  40168d:	be 78 28 40 00       	mov    $0x402878,%esi
  401692:	bf 01 00 00 00       	mov    $0x1,%edi
  401697:	e8 24 f6 ff ff       	callq  400cc0 <__printf_chk@plt>
  40169c:	bf 08 00 00 00       	mov    $0x8,%edi
  4016a1:	e8 4a f6 ff ff       	callq  400cf0 <exit@plt>
  4016a6:	45 85 c9             	test   %r9d,%r9d
  4016a9:	b8 d4 29 40 00       	mov    $0x4029d4,%eax
  4016ae:	41 b9 dc 29 40 00    	mov    $0x4029dc,%r9d
  4016b4:	4c 0f 45 c8          	cmovne %rax,%r9
  4016b8:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4016bd:	89 34 24             	mov    %esi,(%rsp)
  4016c0:	44 8b 05 b9 30 20 00 	mov    0x2030b9(%rip),%r8d        # 604780 <bomb_id>
  4016c7:	b9 e5 29 40 00       	mov    $0x4029e5,%ecx
  4016cc:	ba 00 20 00 00       	mov    $0x2000,%edx
  4016d1:	be 01 00 00 00       	mov    $0x1,%esi
  4016d6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4016db:	b8 00 00 00 00       	mov    $0x0,%eax
  4016e0:	e8 5b f6 ff ff       	callq  400d40 <__sprintf_chk@plt>
  4016e5:	48 8d 8c 24 10 20 00 	lea    0x2010(%rsp),%rcx
  4016ec:	00 
  4016ed:	ba 00 00 00 00       	mov    $0x0,%edx
  4016f2:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  4016f7:	bf 80 43 60 00       	mov    $0x604380,%edi
  4016fc:	e8 c6 0d 00 00       	callq  4024c7 <driver_post>
  401701:	85 c0                	test   %eax,%eax
  401703:	79 17                	jns    40171c <send_msg+0xe7>
  401705:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  40170c:	00 
  40170d:	e8 ae f4 ff ff       	callq  400bc0 <puts@plt>
  401712:	bf 00 00 00 00       	mov    $0x0,%edi
  401717:	e8 d4 f5 ff ff       	callq  400cf0 <exit@plt>
  40171c:	48 8b 84 24 18 40 00 	mov    0x4018(%rsp),%rax
  401723:	00 
  401724:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40172b:	00 00 
  40172d:	74 05                	je     401734 <send_msg+0xff>
  40172f:	e8 ac f4 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  401734:	48 81 c4 28 40 00 00 	add    $0x4028,%rsp
  40173b:	c3                   	retq   

000000000040173c <explode_bomb>:
  40173c:	48 83 ec 08          	sub    $0x8,%rsp
  401740:	bf f1 29 40 00       	mov    $0x4029f1,%edi
  401745:	e8 76 f4 ff ff       	callq  400bc0 <puts@plt>
  40174a:	bf fa 29 40 00       	mov    $0x4029fa,%edi
  40174f:	e8 6c f4 ff ff       	callq  400bc0 <puts@plt>
  401754:	bf 00 00 00 00       	mov    $0x0,%edi
  401759:	e8 d7 fe ff ff       	callq  401635 <send_msg>
  40175e:	bf a0 28 40 00       	mov    $0x4028a0,%edi
  401763:	e8 58 f4 ff ff       	callq  400bc0 <puts@plt>
  401768:	bf 08 00 00 00       	mov    $0x8,%edi
  40176d:	e8 7e f5 ff ff       	callq  400cf0 <exit@plt>

0000000000401772 <read_six_numbers>:
  401772:	48 83 ec 18          	sub    $0x18,%rsp
  401776:	48 89 f2             	mov    %rsi,%rdx
  401779:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  40177d:	48 8d 46 14          	lea    0x14(%rsi),%rax
  401781:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401786:	48 8d 46 10          	lea    0x10(%rsi),%rax
  40178a:	48 89 04 24          	mov    %rax,(%rsp)
  40178e:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401792:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401796:	be 11 2a 40 00       	mov    $0x402a11,%esi
  40179b:	b8 00 00 00 00       	mov    $0x0,%eax
  4017a0:	e8 0b f5 ff ff       	callq  400cb0 <__isoc99_sscanf@plt>
  4017a5:	83 f8 05             	cmp    $0x5,%eax
  4017a8:	7f 05                	jg     4017af <read_six_numbers+0x3d>
  4017aa:	e8 8d ff ff ff       	callq  40173c <explode_bomb>
  4017af:	48 83 c4 18          	add    $0x18,%rsp
  4017b3:	c3                   	retq   

00000000004017b4 <read_line>:
  4017b4:	48 83 ec 08          	sub    $0x8,%rsp
  4017b8:	b8 00 00 00 00       	mov    $0x0,%eax
  4017bd:	e8 32 fe ff ff       	callq  4015f4 <skip>
  4017c2:	48 85 c0             	test   %rax,%rax
  4017c5:	75 6e                	jne    401835 <read_line+0x81>
  4017c7:	48 8b 05 1a 36 20 00 	mov    0x20361a(%rip),%rax        # 604de8 <stdin@@GLIBC_2.2.5>
  4017ce:	48 39 05 2b 36 20 00 	cmp    %rax,0x20362b(%rip)        # 604e00 <infile>
  4017d5:	75 14                	jne    4017eb <read_line+0x37>
  4017d7:	bf 23 2a 40 00       	mov    $0x402a23,%edi
  4017dc:	e8 df f3 ff ff       	callq  400bc0 <puts@plt>
  4017e1:	bf 08 00 00 00       	mov    $0x8,%edi
  4017e6:	e8 05 f5 ff ff       	callq  400cf0 <exit@plt>
  4017eb:	bf 41 2a 40 00       	mov    $0x402a41,%edi
  4017f0:	e8 8b f3 ff ff       	callq  400b80 <getenv@plt>
  4017f5:	48 85 c0             	test   %rax,%rax
  4017f8:	74 0a                	je     401804 <read_line+0x50>
  4017fa:	bf 00 00 00 00       	mov    $0x0,%edi
  4017ff:	e8 ec f4 ff ff       	callq  400cf0 <exit@plt>
  401804:	48 8b 05 dd 35 20 00 	mov    0x2035dd(%rip),%rax        # 604de8 <stdin@@GLIBC_2.2.5>
  40180b:	48 89 05 ee 35 20 00 	mov    %rax,0x2035ee(%rip)        # 604e00 <infile>
  401812:	b8 00 00 00 00       	mov    $0x0,%eax
  401817:	e8 d8 fd ff ff       	callq  4015f4 <skip>
  40181c:	48 85 c0             	test   %rax,%rax
  40181f:	75 14                	jne    401835 <read_line+0x81>
  401821:	bf 23 2a 40 00       	mov    $0x402a23,%edi
  401826:	e8 95 f3 ff ff       	callq  400bc0 <puts@plt>
  40182b:	bf 00 00 00 00       	mov    $0x0,%edi
  401830:	e8 bb f4 ff ff       	callq  400cf0 <exit@plt>
  401835:	8b 15 c1 35 20 00    	mov    0x2035c1(%rip),%edx        # 604dfc <num_input_strings>
  40183b:	48 63 c2             	movslq %edx,%rax
  40183e:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
  401842:	48 c1 e6 04          	shl    $0x4,%rsi
  401846:	48 81 c6 20 4e 60 00 	add    $0x604e20,%rsi
  40184d:	48 89 f7             	mov    %rsi,%rdi
  401850:	b8 00 00 00 00       	mov    $0x0,%eax
  401855:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40185c:	f2 ae                	repnz scas %es:(%rdi),%al
  40185e:	48 f7 d1             	not    %rcx
  401861:	48 83 e9 01          	sub    $0x1,%rcx
  401865:	83 f9 4e             	cmp    $0x4e,%ecx
  401868:	7e 46                	jle    4018b0 <read_line+0xfc>
  40186a:	bf 4c 2a 40 00       	mov    $0x402a4c,%edi
  40186f:	e8 4c f3 ff ff       	callq  400bc0 <puts@plt>
  401874:	8b 05 82 35 20 00    	mov    0x203582(%rip),%eax        # 604dfc <num_input_strings>
  40187a:	8d 50 01             	lea    0x1(%rax),%edx
  40187d:	89 15 79 35 20 00    	mov    %edx,0x203579(%rip)        # 604dfc <num_input_strings>
  401883:	48 98                	cltq   
  401885:	48 6b c0 50          	imul   $0x50,%rax,%rax
  401889:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  401890:	75 6e 63 
  401893:	48 89 b8 20 4e 60 00 	mov    %rdi,0x604e20(%rax)
  40189a:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  4018a1:	2a 2a 00 
  4018a4:	48 89 b8 28 4e 60 00 	mov    %rdi,0x604e28(%rax)
  4018ab:	e8 8c fe ff ff       	callq  40173c <explode_bomb>
  4018b0:	83 e9 01             	sub    $0x1,%ecx
  4018b3:	48 63 c9             	movslq %ecx,%rcx
  4018b6:	48 63 c2             	movslq %edx,%rax
  4018b9:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4018bd:	48 c1 e0 04          	shl    $0x4,%rax
  4018c1:	c6 84 01 20 4e 60 00 	movb   $0x0,0x604e20(%rcx,%rax,1)
  4018c8:	00 
  4018c9:	83 c2 01             	add    $0x1,%edx
  4018cc:	89 15 2a 35 20 00    	mov    %edx,0x20352a(%rip)        # 604dfc <num_input_strings>
  4018d2:	48 89 f0             	mov    %rsi,%rax
  4018d5:	48 83 c4 08          	add    $0x8,%rsp
  4018d9:	c3                   	retq   

00000000004018da <phase_defused>:
  4018da:	48 83 ec 78          	sub    $0x78,%rsp
  4018de:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4018e5:	00 00 
  4018e7:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  4018ec:	31 c0                	xor    %eax,%eax
  4018ee:	bf 01 00 00 00       	mov    $0x1,%edi
  4018f3:	e8 3d fd ff ff       	callq  401635 <send_msg>
  4018f8:	83 3d fd 34 20 00 06 	cmpl   $0x6,0x2034fd(%rip)        # 604dfc <num_input_strings>
  4018ff:	75 6d                	jne    40196e <phase_defused+0x94>
  401901:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  401906:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  40190b:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  401910:	be 67 2a 40 00       	mov    $0x402a67,%esi
  401915:	bf 10 4f 60 00       	mov    $0x604f10,%edi
  40191a:	b8 00 00 00 00       	mov    $0x0,%eax
  40191f:	e8 8c f3 ff ff       	callq  400cb0 <__isoc99_sscanf@plt>
  401924:	83 f8 03             	cmp    $0x3,%eax
  401927:	75 31                	jne    40195a <phase_defused+0x80>
  401929:	be 70 2a 40 00       	mov    $0x402a70,%esi
  40192e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401933:	e8 30 fb ff ff       	callq  401468 <strings_not_equal>
  401938:	85 c0                	test   %eax,%eax
  40193a:	75 1e                	jne    40195a <phase_defused+0x80>
  40193c:	bf c8 28 40 00       	mov    $0x4028c8,%edi
  401941:	e8 7a f2 ff ff       	callq  400bc0 <puts@plt>
  401946:	bf f0 28 40 00       	mov    $0x4028f0,%edi
  40194b:	e8 70 f2 ff ff       	callq  400bc0 <puts@plt>
  401950:	b8 00 00 00 00       	mov    $0x0,%eax
  401955:	e8 25 fa ff ff       	callq  40137f <secret_phase>
  40195a:	bf 28 29 40 00       	mov    $0x402928,%edi
  40195f:	e8 5c f2 ff ff       	callq  400bc0 <puts@plt>
  401964:	bf 58 29 40 00       	mov    $0x402958,%edi
  401969:	e8 52 f2 ff ff       	callq  400bc0 <puts@plt>
  40196e:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  401973:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40197a:	00 00 
  40197c:	74 05                	je     401983 <phase_defused+0xa9>
  40197e:	e8 5d f2 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  401983:	48 83 c4 78          	add    $0x78,%rsp
  401987:	c3                   	retq   
  401988:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40198f:	00 

0000000000401990 <sigalrm_handler>:
  401990:	48 83 ec 08          	sub    $0x8,%rsp
  401994:	b9 00 00 00 00       	mov    $0x0,%ecx
  401999:	ba b8 2f 40 00       	mov    $0x402fb8,%edx
  40199e:	be 01 00 00 00       	mov    $0x1,%esi
  4019a3:	48 8b 3d 46 34 20 00 	mov    0x203446(%rip),%rdi        # 604df0 <stderr@@GLIBC_2.2.5>
  4019aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4019af:	e8 5c f3 ff ff       	callq  400d10 <__fprintf_chk@plt>
  4019b4:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b9:	e8 32 f3 ff ff       	callq  400cf0 <exit@plt>

00000000004019be <rio_readlineb>:
  4019be:	41 57                	push   %r15
  4019c0:	41 56                	push   %r14
  4019c2:	41 55                	push   %r13
  4019c4:	41 54                	push   %r12
  4019c6:	55                   	push   %rbp
  4019c7:	53                   	push   %rbx
  4019c8:	48 83 ec 38          	sub    $0x38,%rsp
  4019cc:	49 89 f6             	mov    %rsi,%r14
  4019cf:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  4019d4:	48 83 fa 01          	cmp    $0x1,%rdx
  4019d8:	0f 86 c9 00 00 00    	jbe    401aa7 <rio_readlineb+0xe9>
  4019de:	48 89 fb             	mov    %rdi,%rbx
  4019e1:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  4019e7:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4019eb:	eb 30                	jmp    401a1d <rio_readlineb+0x5f>
  4019ed:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019f2:	4c 89 e6             	mov    %r12,%rsi
  4019f5:	8b 3b                	mov    (%rbx),%edi
  4019f7:	e8 14 f2 ff ff       	callq  400c10 <read@plt>
  4019fc:	89 43 04             	mov    %eax,0x4(%rbx)
  4019ff:	85 c0                	test   %eax,%eax
  401a01:	79 12                	jns    401a15 <rio_readlineb+0x57>
  401a03:	e8 98 f1 ff ff       	callq  400ba0 <__errno_location@plt>
  401a08:	83 38 04             	cmpl   $0x4,(%rax)
  401a0b:	74 10                	je     401a1d <rio_readlineb+0x5f>
  401a0d:	0f 1f 00             	nopl   (%rax)
  401a10:	e9 a1 00 00 00       	jmpq   401ab6 <rio_readlineb+0xf8>
  401a15:	85 c0                	test   %eax,%eax
  401a17:	74 71                	je     401a8a <rio_readlineb+0xcc>
  401a19:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  401a1d:	8b 6b 04             	mov    0x4(%rbx),%ebp
  401a20:	85 ed                	test   %ebp,%ebp
  401a22:	7e c9                	jle    4019ed <rio_readlineb+0x2f>
  401a24:	85 ed                	test   %ebp,%ebp
  401a26:	41 0f 95 c7          	setne  %r15b
  401a2a:	41 0f b6 c7          	movzbl %r15b,%eax
  401a2e:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401a32:	45 0f b6 ff          	movzbl %r15b,%r15d
  401a36:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  401a3a:	48 89 ce             	mov    %rcx,%rsi
  401a3d:	b9 01 00 00 00       	mov    $0x1,%ecx
  401a42:	4c 89 fa             	mov    %r15,%rdx
  401a45:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  401a4a:	48 8d 7c 24 2f       	lea    0x2f(%rsp),%rdi
  401a4f:	e8 1c f2 ff ff       	callq  400c70 <__memcpy_chk@plt>
  401a54:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
  401a59:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
  401a5d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401a61:	29 c5                	sub    %eax,%ebp
  401a63:	89 6b 04             	mov    %ebp,0x4(%rbx)
  401a66:	83 f8 01             	cmp    $0x1,%eax
  401a69:	75 13                	jne    401a7e <rio_readlineb+0xc0>
  401a6b:	49 83 c6 01          	add    $0x1,%r14
  401a6f:	0f b6 44 24 2f       	movzbl 0x2f(%rsp),%eax
  401a74:	41 88 46 ff          	mov    %al,-0x1(%r14)
  401a78:	3c 0a                	cmp    $0xa,%al
  401a7a:	75 18                	jne    401a94 <rio_readlineb+0xd6>
  401a7c:	eb 2f                	jmp    401aad <rio_readlineb+0xef>
  401a7e:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401a83:	75 3a                	jne    401abf <rio_readlineb+0x101>
  401a85:	44 89 e8             	mov    %r13d,%eax
  401a88:	eb 03                	jmp    401a8d <rio_readlineb+0xcf>
  401a8a:	44 89 e8             	mov    %r13d,%eax
  401a8d:	83 f8 01             	cmp    $0x1,%eax
  401a90:	75 1b                	jne    401aad <rio_readlineb+0xef>
  401a92:	eb 34                	jmp    401ac8 <rio_readlineb+0x10a>
  401a94:	41 83 c5 01          	add    $0x1,%r13d
  401a98:	49 63 c5             	movslq %r13d,%rax
  401a9b:	48 3b 44 24 18       	cmp    0x18(%rsp),%rax
  401aa0:	73 0b                	jae    401aad <rio_readlineb+0xef>
  401aa2:	e9 76 ff ff ff       	jmpq   401a1d <rio_readlineb+0x5f>
  401aa7:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  401aad:	41 c6 06 00          	movb   $0x0,(%r14)
  401ab1:	49 63 c5             	movslq %r13d,%rax
  401ab4:	eb 17                	jmp    401acd <rio_readlineb+0x10f>
  401ab6:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401abd:	eb 0e                	jmp    401acd <rio_readlineb+0x10f>
  401abf:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401ac6:	eb 05                	jmp    401acd <rio_readlineb+0x10f>
  401ac8:	b8 00 00 00 00       	mov    $0x0,%eax
  401acd:	48 83 c4 38          	add    $0x38,%rsp
  401ad1:	5b                   	pop    %rbx
  401ad2:	5d                   	pop    %rbp
  401ad3:	41 5c                	pop    %r12
  401ad5:	41 5d                	pop    %r13
  401ad7:	41 5e                	pop    %r14
  401ad9:	41 5f                	pop    %r15
  401adb:	c3                   	retq   

0000000000401adc <submitr>:
  401adc:	41 57                	push   %r15
  401ade:	41 56                	push   %r14
  401ae0:	41 55                	push   %r13
  401ae2:	41 54                	push   %r12
  401ae4:	55                   	push   %rbp
  401ae5:	53                   	push   %rbx
  401ae6:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  401aed:	48 89 fd             	mov    %rdi,%rbp
  401af0:	41 89 f5             	mov    %esi,%r13d
  401af3:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  401af8:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  401afd:	4d 89 c7             	mov    %r8,%r15
  401b00:	4c 89 cb             	mov    %r9,%rbx
  401b03:	4c 8b b4 24 a0 a0 00 	mov    0xa0a0(%rsp),%r14
  401b0a:	00 
  401b0b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401b12:	00 00 
  401b14:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  401b1b:	00 
  401b1c:	31 c0                	xor    %eax,%eax
  401b1e:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  401b25:	00 
  401b26:	ba 00 00 00 00       	mov    $0x0,%edx
  401b2b:	be 01 00 00 00       	mov    $0x1,%esi
  401b30:	bf 02 00 00 00       	mov    $0x2,%edi
  401b35:	e8 16 f2 ff ff       	callq  400d50 <socket@plt>
  401b3a:	41 89 c4             	mov    %eax,%r12d
  401b3d:	85 c0                	test   %eax,%eax
  401b3f:	79 50                	jns    401b91 <submitr+0xb5>
  401b41:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401b48:	3a 20 43 
  401b4b:	49 89 06             	mov    %rax,(%r14)
  401b4e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401b55:	20 75 6e 
  401b58:	49 89 46 08          	mov    %rax,0x8(%r14)
  401b5c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b63:	74 6f 20 
  401b66:	49 89 46 10          	mov    %rax,0x10(%r14)
  401b6a:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  401b71:	65 20 73 
  401b74:	49 89 46 18          	mov    %rax,0x18(%r14)
  401b78:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  401b7f:	65 
  401b80:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401b87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b8c:	e9 11 06 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401b91:	48 89 ef             	mov    %rbp,%rdi
  401b94:	e8 b7 f0 ff ff       	callq  400c50 <gethostbyname@plt>
  401b99:	48 85 c0             	test   %rax,%rax
  401b9c:	75 6b                	jne    401c09 <submitr+0x12d>
  401b9e:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401ba5:	3a 20 44 
  401ba8:	49 89 06             	mov    %rax,(%r14)
  401bab:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401bb2:	20 75 6e 
  401bb5:	49 89 46 08          	mov    %rax,0x8(%r14)
  401bb9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401bc0:	74 6f 20 
  401bc3:	49 89 46 10          	mov    %rax,0x10(%r14)
  401bc7:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  401bce:	76 65 20 
  401bd1:	49 89 46 18          	mov    %rax,0x18(%r14)
  401bd5:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  401bdc:	72 20 61 
  401bdf:	49 89 46 20          	mov    %rax,0x20(%r14)
  401be3:	41 c7 46 28 64 64 72 	movl   $0x65726464,0x28(%r14)
  401bea:	65 
  401beb:	66 41 c7 46 2c 73 73 	movw   $0x7373,0x2c(%r14)
  401bf2:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  401bf7:	44 89 e7             	mov    %r12d,%edi
  401bfa:	e8 01 f0 ff ff       	callq  400c00 <close@plt>
  401bff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c04:	e9 99 05 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401c09:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  401c10:	00 00 
  401c12:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  401c19:	00 00 
  401c1b:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  401c22:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401c26:	48 8b 40 18          	mov    0x18(%rax),%rax
  401c2a:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  401c2f:	b9 0c 00 00 00       	mov    $0xc,%ecx
  401c34:	48 8b 30             	mov    (%rax),%rsi
  401c37:	e8 24 f0 ff ff       	callq  400c60 <__memmove_chk@plt>
  401c3c:	66 41 c1 cd 08       	ror    $0x8,%r13w
  401c41:	66 44 89 6c 24 32    	mov    %r13w,0x32(%rsp)
  401c47:	ba 10 00 00 00       	mov    $0x10,%edx
  401c4c:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  401c51:	44 89 e7             	mov    %r12d,%edi
  401c54:	e8 a7 f0 ff ff       	callq  400d00 <connect@plt>
  401c59:	85 c0                	test   %eax,%eax
  401c5b:	79 5d                	jns    401cba <submitr+0x1de>
  401c5d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401c64:	3a 20 55 
  401c67:	49 89 06             	mov    %rax,(%r14)
  401c6a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401c71:	20 74 6f 
  401c74:	49 89 46 08          	mov    %rax,0x8(%r14)
  401c78:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  401c7f:	65 63 74 
  401c82:	49 89 46 10          	mov    %rax,0x10(%r14)
  401c86:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  401c8d:	68 65 20 
  401c90:	49 89 46 18          	mov    %rax,0x18(%r14)
  401c94:	41 c7 46 20 73 65 72 	movl   $0x76726573,0x20(%r14)
  401c9b:	76 
  401c9c:	66 41 c7 46 24 65 72 	movw   $0x7265,0x24(%r14)
  401ca3:	41 c6 46 26 00       	movb   $0x0,0x26(%r14)
  401ca8:	44 89 e7             	mov    %r12d,%edi
  401cab:	e8 50 ef ff ff       	callq  400c00 <close@plt>
  401cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401cb5:	e9 e8 04 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401cba:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401cc1:	48 89 df             	mov    %rbx,%rdi
  401cc4:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc9:	48 89 d1             	mov    %rdx,%rcx
  401ccc:	f2 ae                	repnz scas %es:(%rdi),%al
  401cce:	48 f7 d1             	not    %rcx
  401cd1:	48 89 ce             	mov    %rcx,%rsi
  401cd4:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401cd9:	48 89 d1             	mov    %rdx,%rcx
  401cdc:	f2 ae                	repnz scas %es:(%rdi),%al
  401cde:	49 89 c8             	mov    %rcx,%r8
  401ce1:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401ce6:	48 89 d1             	mov    %rdx,%rcx
  401ce9:	f2 ae                	repnz scas %es:(%rdi),%al
  401ceb:	48 f7 d1             	not    %rcx
  401cee:	49 89 c9             	mov    %rcx,%r9
  401cf1:	4c 89 ff             	mov    %r15,%rdi
  401cf4:	48 89 d1             	mov    %rdx,%rcx
  401cf7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cf9:	4d 29 c1             	sub    %r8,%r9
  401cfc:	49 29 c9             	sub    %rcx,%r9
  401cff:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401d04:	49 8d 44 01 7b       	lea    0x7b(%r9,%rax,1),%rax
  401d09:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401d0f:	76 73                	jbe    401d84 <submitr+0x2a8>
  401d11:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401d18:	3a 20 52 
  401d1b:	49 89 06             	mov    %rax,(%r14)
  401d1e:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401d25:	20 73 74 
  401d28:	49 89 46 08          	mov    %rax,0x8(%r14)
  401d2c:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401d33:	74 6f 6f 
  401d36:	49 89 46 10          	mov    %rax,0x10(%r14)
  401d3a:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401d41:	65 2e 20 
  401d44:	49 89 46 18          	mov    %rax,0x18(%r14)
  401d48:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401d4f:	61 73 65 
  401d52:	49 89 46 20          	mov    %rax,0x20(%r14)
  401d56:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401d5d:	49 54 52 
  401d60:	49 89 46 28          	mov    %rax,0x28(%r14)
  401d64:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401d6b:	55 46 00 
  401d6e:	49 89 46 30          	mov    %rax,0x30(%r14)
  401d72:	44 89 e7             	mov    %r12d,%edi
  401d75:	e8 86 ee ff ff       	callq  400c00 <close@plt>
  401d7a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d7f:	e9 1e 04 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401d84:	48 8d 94 24 40 20 00 	lea    0x2040(%rsp),%rdx
  401d8b:	00 
  401d8c:	b9 00 04 00 00       	mov    $0x400,%ecx
  401d91:	b8 00 00 00 00       	mov    $0x0,%eax
  401d96:	48 89 d7             	mov    %rdx,%rdi
  401d99:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401d9c:	48 89 df             	mov    %rbx,%rdi
  401d9f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401da6:	f2 ae                	repnz scas %es:(%rdi),%al
  401da8:	48 f7 d1             	not    %rcx
  401dab:	48 83 e9 01          	sub    $0x1,%rcx
  401daf:	85 c9                	test   %ecx,%ecx
  401db1:	0f 84 07 04 00 00    	je     4021be <submitr+0x6e2>
  401db7:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401dba:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
  401dbf:	48 89 d5             	mov    %rdx,%rbp
  401dc2:	44 0f b6 03          	movzbl (%rbx),%r8d
  401dc6:	41 80 f8 2a          	cmp    $0x2a,%r8b
  401dca:	74 23                	je     401def <submitr+0x313>
  401dcc:	41 8d 40 d3          	lea    -0x2d(%r8),%eax
  401dd0:	3c 01                	cmp    $0x1,%al
  401dd2:	76 1b                	jbe    401def <submitr+0x313>
  401dd4:	41 80 f8 5f          	cmp    $0x5f,%r8b
  401dd8:	74 15                	je     401def <submitr+0x313>
  401dda:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  401dde:	3c 09                	cmp    $0x9,%al
  401de0:	76 0d                	jbe    401def <submitr+0x313>
  401de2:	44 89 c0             	mov    %r8d,%eax
  401de5:	83 e0 df             	and    $0xffffffdf,%eax
  401de8:	83 e8 41             	sub    $0x41,%eax
  401deb:	3c 19                	cmp    $0x19,%al
  401ded:	77 0a                	ja     401df9 <submitr+0x31d>
  401def:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401df3:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  401df7:	eb 6c                	jmp    401e65 <submitr+0x389>
  401df9:	41 80 f8 20          	cmp    $0x20,%r8b
  401dfd:	75 0a                	jne    401e09 <submitr+0x32d>
  401dff:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401e03:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401e07:	eb 5c                	jmp    401e65 <submitr+0x389>
  401e09:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  401e0d:	3c 5f                	cmp    $0x5f,%al
  401e0f:	76 0a                	jbe    401e1b <submitr+0x33f>
  401e11:	41 80 f8 09          	cmp    $0x9,%r8b
  401e15:	0f 85 0c 04 00 00    	jne    402227 <submitr+0x74b>
  401e1b:	45 0f b6 c0          	movzbl %r8b,%r8d
  401e1f:	b9 88 30 40 00       	mov    $0x403088,%ecx
  401e24:	ba 08 00 00 00       	mov    $0x8,%edx
  401e29:	be 01 00 00 00       	mov    $0x1,%esi
  401e2e:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401e35:	00 
  401e36:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3b:	e8 00 ef ff ff       	callq  400d40 <__sprintf_chk@plt>
  401e40:	0f b6 84 24 40 80 00 	movzbl 0x8040(%rsp),%eax
  401e47:	00 
  401e48:	88 45 00             	mov    %al,0x0(%rbp)
  401e4b:	0f b6 84 24 41 80 00 	movzbl 0x8041(%rsp),%eax
  401e52:	00 
  401e53:	88 45 01             	mov    %al,0x1(%rbp)
  401e56:	48 8d 45 03          	lea    0x3(%rbp),%rax
  401e5a:	0f b6 94 24 42 80 00 	movzbl 0x8042(%rsp),%edx
  401e61:	00 
  401e62:	88 55 02             	mov    %dl,0x2(%rbp)
  401e65:	48 83 c3 01          	add    $0x1,%rbx
  401e69:	4c 39 eb             	cmp    %r13,%rbx
  401e6c:	0f 84 4c 03 00 00    	je     4021be <submitr+0x6e2>
  401e72:	48 89 c5             	mov    %rax,%rbp
  401e75:	e9 48 ff ff ff       	jmpq   401dc2 <submitr+0x2e6>
  401e7a:	48 89 da             	mov    %rbx,%rdx
  401e7d:	48 89 ee             	mov    %rbp,%rsi
  401e80:	44 89 e7             	mov    %r12d,%edi
  401e83:	e8 48 ed ff ff       	callq  400bd0 <write@plt>
  401e88:	48 85 c0             	test   %rax,%rax
  401e8b:	7f 0f                	jg     401e9c <submitr+0x3c0>
  401e8d:	e8 0e ed ff ff       	callq  400ba0 <__errno_location@plt>
  401e92:	83 38 04             	cmpl   $0x4,(%rax)
  401e95:	75 12                	jne    401ea9 <submitr+0x3cd>
  401e97:	b8 00 00 00 00       	mov    $0x0,%eax
  401e9c:	48 01 c5             	add    %rax,%rbp
  401e9f:	48 29 c3             	sub    %rax,%rbx
  401ea2:	75 d6                	jne    401e7a <submitr+0x39e>
  401ea4:	4d 85 ed             	test   %r13,%r13
  401ea7:	79 5f                	jns    401f08 <submitr+0x42c>
  401ea9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401eb0:	3a 20 43 
  401eb3:	49 89 06             	mov    %rax,(%r14)
  401eb6:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ebd:	20 75 6e 
  401ec0:	49 89 46 08          	mov    %rax,0x8(%r14)
  401ec4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401ecb:	74 6f 20 
  401ece:	49 89 46 10          	mov    %rax,0x10(%r14)
  401ed2:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  401ed9:	20 74 6f 
  401edc:	49 89 46 18          	mov    %rax,0x18(%r14)
  401ee0:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
  401ee7:	73 65 72 
  401eea:	49 89 46 20          	mov    %rax,0x20(%r14)
  401eee:	41 c7 46 28 76 65 72 	movl   $0x726576,0x28(%r14)
  401ef5:	00 
  401ef6:	44 89 e7             	mov    %r12d,%edi
  401ef9:	e8 02 ed ff ff       	callq  400c00 <close@plt>
  401efe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f03:	e9 9a 02 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401f08:	44 89 a4 24 40 80 00 	mov    %r12d,0x8040(%rsp)
  401f0f:	00 
  401f10:	c7 84 24 44 80 00 00 	movl   $0x0,0x8044(%rsp)
  401f17:	00 00 00 00 
  401f1b:	48 8d 84 24 50 80 00 	lea    0x8050(%rsp),%rax
  401f22:	00 
  401f23:	48 89 84 24 48 80 00 	mov    %rax,0x8048(%rsp)
  401f2a:	00 
  401f2b:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f30:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  401f35:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401f3c:	00 
  401f3d:	e8 7c fa ff ff       	callq  4019be <rio_readlineb>
  401f42:	48 85 c0             	test   %rax,%rax
  401f45:	7f 74                	jg     401fbb <submitr+0x4df>
  401f47:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401f4e:	3a 20 43 
  401f51:	49 89 06             	mov    %rax,(%r14)
  401f54:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401f5b:	20 75 6e 
  401f5e:	49 89 46 08          	mov    %rax,0x8(%r14)
  401f62:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401f69:	74 6f 20 
  401f6c:	49 89 46 10          	mov    %rax,0x10(%r14)
  401f70:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  401f77:	66 69 72 
  401f7a:	49 89 46 18          	mov    %rax,0x18(%r14)
  401f7e:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  401f85:	61 64 65 
  401f88:	49 89 46 20          	mov    %rax,0x20(%r14)
  401f8c:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
  401f93:	6d 20 73 
  401f96:	49 89 46 28          	mov    %rax,0x28(%r14)
  401f9a:	41 c7 46 30 65 72 76 	movl   $0x65767265,0x30(%r14)
  401fa1:	65 
  401fa2:	66 41 c7 46 34 72 00 	movw   $0x72,0x34(%r14)
  401fa9:	44 89 e7             	mov    %r12d,%edi
  401fac:	e8 4f ec ff ff       	callq  400c00 <close@plt>
  401fb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fb6:	e9 e7 01 00 00       	jmpq   4021a2 <submitr+0x6c6>
  401fbb:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  401fc2:	00 
  401fc3:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  401fc8:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  401fcf:	00 
  401fd0:	be 8f 30 40 00       	mov    $0x40308f,%esi
  401fd5:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401fda:	b8 00 00 00 00       	mov    $0x0,%eax
  401fdf:	e8 cc ec ff ff       	callq  400cb0 <__isoc99_sscanf@plt>
  401fe4:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  401fe9:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  401ff0:	0f 84 be 00 00 00    	je     4020b4 <submitr+0x5d8>
  401ff6:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  401ffd:	00 
  401ffe:	b9 e0 2f 40 00       	mov    $0x402fe0,%ecx
  402003:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40200a:	be 01 00 00 00       	mov    $0x1,%esi
  40200f:	4c 89 f7             	mov    %r14,%rdi
  402012:	b8 00 00 00 00       	mov    $0x0,%eax
  402017:	e8 24 ed ff ff       	callq  400d40 <__sprintf_chk@plt>
  40201c:	44 89 e7             	mov    %r12d,%edi
  40201f:	e8 dc eb ff ff       	callq  400c00 <close@plt>
  402024:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402029:	e9 74 01 00 00       	jmpq   4021a2 <submitr+0x6c6>
  40202e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402033:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402038:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40203f:	00 
  402040:	e8 79 f9 ff ff       	callq  4019be <rio_readlineb>
  402045:	48 85 c0             	test   %rax,%rax
  402048:	7f 6a                	jg     4020b4 <submitr+0x5d8>
  40204a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402051:	3a 20 43 
  402054:	49 89 06             	mov    %rax,(%r14)
  402057:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40205e:	20 75 6e 
  402061:	49 89 46 08          	mov    %rax,0x8(%r14)
  402065:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40206c:	74 6f 20 
  40206f:	49 89 46 10          	mov    %rax,0x10(%r14)
  402073:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  40207a:	68 65 61 
  40207d:	49 89 46 18          	mov    %rax,0x18(%r14)
  402081:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402088:	66 72 6f 
  40208b:	49 89 46 20          	mov    %rax,0x20(%r14)
  40208f:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
  402096:	76 65 72 
  402099:	49 89 46 28          	mov    %rax,0x28(%r14)
  40209d:	41 c6 46 30 00       	movb   $0x0,0x30(%r14)
  4020a2:	44 89 e7             	mov    %r12d,%edi
  4020a5:	e8 56 eb ff ff       	callq  400c00 <close@plt>
  4020aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020af:	e9 ee 00 00 00       	jmpq   4021a2 <submitr+0x6c6>
  4020b4:	80 7c 24 40 0d       	cmpb   $0xd,0x40(%rsp)
  4020b9:	0f 85 6f ff ff ff    	jne    40202e <submitr+0x552>
  4020bf:	80 7c 24 41 0a       	cmpb   $0xa,0x41(%rsp)
  4020c4:	0f 85 64 ff ff ff    	jne    40202e <submitr+0x552>
  4020ca:	80 7c 24 42 00       	cmpb   $0x0,0x42(%rsp)
  4020cf:	0f 85 59 ff ff ff    	jne    40202e <submitr+0x552>
  4020d5:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020da:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4020df:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4020e6:	00 
  4020e7:	e8 d2 f8 ff ff       	callq  4019be <rio_readlineb>
  4020ec:	48 85 c0             	test   %rax,%rax
  4020ef:	7f 70                	jg     402161 <submitr+0x685>
  4020f1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4020f8:	3a 20 43 
  4020fb:	49 89 06             	mov    %rax,(%r14)
  4020fe:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402105:	20 75 6e 
  402108:	49 89 46 08          	mov    %rax,0x8(%r14)
  40210c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402113:	74 6f 20 
  402116:	49 89 46 10          	mov    %rax,0x10(%r14)
  40211a:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402121:	73 74 61 
  402124:	49 89 46 18          	mov    %rax,0x18(%r14)
  402128:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  40212f:	65 73 73 
  402132:	49 89 46 20          	mov    %rax,0x20(%r14)
  402136:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  40213d:	72 6f 6d 
  402140:	49 89 46 28          	mov    %rax,0x28(%r14)
  402144:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  40214b:	65 72 00 
  40214e:	49 89 46 30          	mov    %rax,0x30(%r14)
  402152:	44 89 e7             	mov    %r12d,%edi
  402155:	e8 a6 ea ff ff       	callq  400c00 <close@plt>
  40215a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40215f:	eb 41                	jmp    4021a2 <submitr+0x6c6>
  402161:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402166:	4c 89 f7             	mov    %r14,%rdi
  402169:	e8 42 ea ff ff       	callq  400bb0 <strcpy@plt>
  40216e:	44 89 e7             	mov    %r12d,%edi
  402171:	e8 8a ea ff ff       	callq  400c00 <close@plt>
  402176:	41 0f b6 06          	movzbl (%r14),%eax
  40217a:	ba 4f 00 00 00       	mov    $0x4f,%edx
  40217f:	29 c2                	sub    %eax,%edx
  402181:	75 15                	jne    402198 <submitr+0x6bc>
  402183:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
  402188:	ba 4b 00 00 00       	mov    $0x4b,%edx
  40218d:	29 c2                	sub    %eax,%edx
  40218f:	75 07                	jne    402198 <submitr+0x6bc>
  402191:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  402196:	f7 da                	neg    %edx
  402198:	85 d2                	test   %edx,%edx
  40219a:	0f 95 c0             	setne  %al
  40219d:	0f b6 c0             	movzbl %al,%eax
  4021a0:	f7 d8                	neg    %eax
  4021a2:	48 8b 94 24 58 a0 00 	mov    0xa058(%rsp),%rdx
  4021a9:	00 
  4021aa:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  4021b1:	00 00 
  4021b3:	0f 84 00 01 00 00    	je     4022b9 <submitr+0x7dd>
  4021b9:	e9 f6 00 00 00       	jmpq   4022b4 <submitr+0x7d8>
  4021be:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  4021c5:	00 
  4021c6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021cb:	4c 89 3c 24          	mov    %r15,(%rsp)
  4021cf:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
  4021d4:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  4021d9:	b9 10 30 40 00       	mov    $0x403010,%ecx
  4021de:	ba 00 20 00 00       	mov    $0x2000,%edx
  4021e3:	be 01 00 00 00       	mov    $0x1,%esi
  4021e8:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4021ed:	b8 00 00 00 00       	mov    $0x0,%eax
  4021f2:	e8 49 eb ff ff       	callq  400d40 <__sprintf_chk@plt>
  4021f7:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4021fc:	b8 00 00 00 00       	mov    $0x0,%eax
  402201:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402208:	f2 ae                	repnz scas %es:(%rdi),%al
  40220a:	48 f7 d1             	not    %rcx
  40220d:	48 83 e9 01          	sub    $0x1,%rcx
  402211:	49 89 cd             	mov    %rcx,%r13
  402214:	0f 84 ee fc ff ff    	je     401f08 <submitr+0x42c>
  40221a:	48 89 cb             	mov    %rcx,%rbx
  40221d:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  402222:	e9 53 fc ff ff       	jmpq   401e7a <submitr+0x39e>
  402227:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40222e:	3a 20 52 
  402231:	49 89 06             	mov    %rax,(%r14)
  402234:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40223b:	20 73 74 
  40223e:	49 89 46 08          	mov    %rax,0x8(%r14)
  402242:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402249:	63 6f 6e 
  40224c:	49 89 46 10          	mov    %rax,0x10(%r14)
  402250:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402257:	20 61 6e 
  40225a:	49 89 46 18          	mov    %rax,0x18(%r14)
  40225e:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402265:	67 61 6c 
  402268:	49 89 46 20          	mov    %rax,0x20(%r14)
  40226c:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402273:	6e 70 72 
  402276:	49 89 46 28          	mov    %rax,0x28(%r14)
  40227a:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402281:	6c 65 20 
  402284:	49 89 46 30          	mov    %rax,0x30(%r14)
  402288:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40228f:	63 74 65 
  402292:	49 89 46 38          	mov    %rax,0x38(%r14)
  402296:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  40229d:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  4022a2:	44 89 e7             	mov    %r12d,%edi
  4022a5:	e8 56 e9 ff ff       	callq  400c00 <close@plt>
  4022aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022af:	e9 ee fe ff ff       	jmpq   4021a2 <submitr+0x6c6>
  4022b4:	e8 27 e9 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  4022b9:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  4022c0:	5b                   	pop    %rbx
  4022c1:	5d                   	pop    %rbp
  4022c2:	41 5c                	pop    %r12
  4022c4:	41 5d                	pop    %r13
  4022c6:	41 5e                	pop    %r14
  4022c8:	41 5f                	pop    %r15
  4022ca:	c3                   	retq   

00000000004022cb <init_timeout>:
  4022cb:	53                   	push   %rbx
  4022cc:	89 fb                	mov    %edi,%ebx
  4022ce:	85 ff                	test   %edi,%edi
  4022d0:	74 1e                	je     4022f0 <init_timeout+0x25>
  4022d2:	be 90 19 40 00       	mov    $0x401990,%esi
  4022d7:	bf 0e 00 00 00       	mov    $0xe,%edi
  4022dc:	e8 5f e9 ff ff       	callq  400c40 <signal@plt>
  4022e1:	85 db                	test   %ebx,%ebx
  4022e3:	bf 00 00 00 00       	mov    $0x0,%edi
  4022e8:	0f 49 fb             	cmovns %ebx,%edi
  4022eb:	e8 00 e9 ff ff       	callq  400bf0 <alarm@plt>
  4022f0:	5b                   	pop    %rbx
  4022f1:	c3                   	retq   

00000000004022f2 <init_driver>:
  4022f2:	55                   	push   %rbp
  4022f3:	53                   	push   %rbx
  4022f4:	48 83 ec 28          	sub    $0x28,%rsp
  4022f8:	48 89 fd             	mov    %rdi,%rbp
  4022fb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402302:	00 00 
  402304:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402309:	31 c0                	xor    %eax,%eax
  40230b:	be 01 00 00 00       	mov    $0x1,%esi
  402310:	bf 0d 00 00 00       	mov    $0xd,%edi
  402315:	e8 26 e9 ff ff       	callq  400c40 <signal@plt>
  40231a:	be 01 00 00 00       	mov    $0x1,%esi
  40231f:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402324:	e8 17 e9 ff ff       	callq  400c40 <signal@plt>
  402329:	be 01 00 00 00       	mov    $0x1,%esi
  40232e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402333:	e8 08 e9 ff ff       	callq  400c40 <signal@plt>
  402338:	ba 00 00 00 00       	mov    $0x0,%edx
  40233d:	be 01 00 00 00       	mov    $0x1,%esi
  402342:	bf 02 00 00 00       	mov    $0x2,%edi
  402347:	e8 04 ea ff ff       	callq  400d50 <socket@plt>
  40234c:	89 c3                	mov    %eax,%ebx
  40234e:	85 c0                	test   %eax,%eax
  402350:	79 4f                	jns    4023a1 <init_driver+0xaf>
  402352:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402359:	3a 20 43 
  40235c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402360:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402367:	20 75 6e 
  40236a:	48 89 45 08          	mov    %rax,0x8(%rbp)
  40236e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402375:	74 6f 20 
  402378:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40237c:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402383:	65 20 73 
  402386:	48 89 45 18          	mov    %rax,0x18(%rbp)
  40238a:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402391:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402397:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40239c:	e9 0a 01 00 00       	jmpq   4024ab <init_driver+0x1b9>
  4023a1:	bf a0 30 40 00       	mov    $0x4030a0,%edi
  4023a6:	e8 a5 e8 ff ff       	callq  400c50 <gethostbyname@plt>
  4023ab:	48 85 c0             	test   %rax,%rax
  4023ae:	75 68                	jne    402418 <init_driver+0x126>
  4023b0:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4023b7:	3a 20 44 
  4023ba:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4023be:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4023c5:	20 75 6e 
  4023c8:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4023cc:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4023d3:	74 6f 20 
  4023d6:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4023da:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4023e1:	76 65 20 
  4023e4:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4023e8:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023ef:	72 20 61 
  4023f2:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4023f6:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4023fd:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402403:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402407:	89 df                	mov    %ebx,%edi
  402409:	e8 f2 e7 ff ff       	callq  400c00 <close@plt>
  40240e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402413:	e9 93 00 00 00       	jmpq   4024ab <init_driver+0x1b9>
  402418:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  40241f:	00 
  402420:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402427:	00 00 
  402429:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  40242f:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402433:	48 8b 40 18          	mov    0x18(%rax),%rax
  402437:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  40243c:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402441:	48 8b 30             	mov    (%rax),%rsi
  402444:	e8 17 e8 ff ff       	callq  400c60 <__memmove_chk@plt>
  402449:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  402450:	ba 10 00 00 00       	mov    $0x10,%edx
  402455:	48 89 e6             	mov    %rsp,%rsi
  402458:	89 df                	mov    %ebx,%edi
  40245a:	e8 a1 e8 ff ff       	callq  400d00 <connect@plt>
  40245f:	85 c0                	test   %eax,%eax
  402461:	79 32                	jns    402495 <init_driver+0x1a3>
  402463:	41 b8 a0 30 40 00    	mov    $0x4030a0,%r8d
  402469:	b9 60 30 40 00       	mov    $0x403060,%ecx
  40246e:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402475:	be 01 00 00 00       	mov    $0x1,%esi
  40247a:	48 89 ef             	mov    %rbp,%rdi
  40247d:	b8 00 00 00 00       	mov    $0x0,%eax
  402482:	e8 b9 e8 ff ff       	callq  400d40 <__sprintf_chk@plt>
  402487:	89 df                	mov    %ebx,%edi
  402489:	e8 72 e7 ff ff       	callq  400c00 <close@plt>
  40248e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402493:	eb 16                	jmp    4024ab <init_driver+0x1b9>
  402495:	89 df                	mov    %ebx,%edi
  402497:	e8 64 e7 ff ff       	callq  400c00 <close@plt>
  40249c:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4024a2:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4024a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4024ab:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  4024b0:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4024b7:	00 00 
  4024b9:	74 05                	je     4024c0 <init_driver+0x1ce>
  4024bb:	e8 20 e7 ff ff       	callq  400be0 <__stack_chk_fail@plt>
  4024c0:	48 83 c4 28          	add    $0x28,%rsp
  4024c4:	5b                   	pop    %rbx
  4024c5:	5d                   	pop    %rbp
  4024c6:	c3                   	retq   

00000000004024c7 <driver_post>:
  4024c7:	53                   	push   %rbx
  4024c8:	48 83 ec 10          	sub    $0x10,%rsp
  4024cc:	48 89 cb             	mov    %rcx,%rbx
  4024cf:	85 d2                	test   %edx,%edx
  4024d1:	74 27                	je     4024fa <driver_post+0x33>
  4024d3:	48 89 f2             	mov    %rsi,%rdx
  4024d6:	be ba 30 40 00       	mov    $0x4030ba,%esi
  4024db:	bf 01 00 00 00       	mov    $0x1,%edi
  4024e0:	b8 00 00 00 00       	mov    $0x0,%eax
  4024e5:	e8 d6 e7 ff ff       	callq  400cc0 <__printf_chk@plt>
  4024ea:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4024ef:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4024f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4024f8:	eb 3e                	jmp    402538 <driver_post+0x71>
  4024fa:	48 85 ff             	test   %rdi,%rdi
  4024fd:	74 2b                	je     40252a <driver_post+0x63>
  4024ff:	80 3f 00             	cmpb   $0x0,(%rdi)
  402502:	74 26                	je     40252a <driver_post+0x63>
  402504:	48 89 0c 24          	mov    %rcx,(%rsp)
  402508:	49 89 f1             	mov    %rsi,%r9
  40250b:	41 b8 d1 30 40 00    	mov    $0x4030d1,%r8d
  402511:	48 89 f9             	mov    %rdi,%rcx
  402514:	ba d5 30 40 00       	mov    $0x4030d5,%edx
  402519:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  40251e:	bf a0 30 40 00       	mov    $0x4030a0,%edi
  402523:	e8 b4 f5 ff ff       	callq  401adc <submitr>
  402528:	eb 0e                	jmp    402538 <driver_post+0x71>
  40252a:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  40252f:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402533:	b8 00 00 00 00       	mov    $0x0,%eax
  402538:	48 83 c4 10          	add    $0x10,%rsp
  40253c:	5b                   	pop    %rbx
  40253d:	c3                   	retq   
  40253e:	66 90                	xchg   %ax,%ax

0000000000402540 <__libc_csu_init>:
  402540:	41 57                	push   %r15
  402542:	41 89 ff             	mov    %edi,%r15d
  402545:	41 56                	push   %r14
  402547:	49 89 f6             	mov    %rsi,%r14
  40254a:	41 55                	push   %r13
  40254c:	49 89 d5             	mov    %rdx,%r13
  40254f:	41 54                	push   %r12
  402551:	4c 8d 25 b8 18 20 00 	lea    0x2018b8(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402558:	55                   	push   %rbp
  402559:	48 8d 2d b8 18 20 00 	lea    0x2018b8(%rip),%rbp        # 603e18 <__init_array_end>
  402560:	53                   	push   %rbx
  402561:	4c 29 e5             	sub    %r12,%rbp
  402564:	31 db                	xor    %ebx,%ebx
  402566:	48 c1 fd 03          	sar    $0x3,%rbp
  40256a:	48 83 ec 08          	sub    $0x8,%rsp
  40256e:	e8 dd e5 ff ff       	callq  400b50 <_init>
  402573:	48 85 ed             	test   %rbp,%rbp
  402576:	74 1e                	je     402596 <__libc_csu_init+0x56>
  402578:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40257f:	00 
  402580:	4c 89 ea             	mov    %r13,%rdx
  402583:	4c 89 f6             	mov    %r14,%rsi
  402586:	44 89 ff             	mov    %r15d,%edi
  402589:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40258d:	48 83 c3 01          	add    $0x1,%rbx
  402591:	48 39 eb             	cmp    %rbp,%rbx
  402594:	75 ea                	jne    402580 <__libc_csu_init+0x40>
  402596:	48 83 c4 08          	add    $0x8,%rsp
  40259a:	5b                   	pop    %rbx
  40259b:	5d                   	pop    %rbp
  40259c:	41 5c                	pop    %r12
  40259e:	41 5d                	pop    %r13
  4025a0:	41 5e                	pop    %r14
  4025a2:	41 5f                	pop    %r15
  4025a4:	c3                   	retq   
  4025a5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4025ac:	00 00 00 00 

00000000004025b0 <__libc_csu_fini>:
  4025b0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004025b4 <_fini>:
  4025b4:	48 83 ec 08          	sub    $0x8,%rsp
  4025b8:	48 83 c4 08          	add    $0x8,%rsp
  4025bc:	c3                   	retq   
