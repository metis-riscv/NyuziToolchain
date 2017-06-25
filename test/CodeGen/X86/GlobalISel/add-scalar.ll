; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-linux-gnu -global-isel -verify-machineinstrs < %s -o - | FileCheck %s --check-prefix=ALL --check-prefix=X64
; RUN: llc -mtriple=i386-linux-gnu   -global-isel -verify-machineinstrs < %s -o - | FileCheck %s --check-prefix=ALL --check-prefix=X32

define i64 @test_add_i64(i64 %arg1, i64 %arg2) {
; X64-LABEL: test_add_i64:
; X64:       # BB#0:
; X64-NEXT:    leaq (%rsi,%rdi), %rax
; X64-NEXT:    retq
;
; X32-LABEL: test_add_i64:
; X32:       # BB#0:
; X32-NEXT:    pushl %ebp
; X32-NEXT:  .Lcfi0:
; X32-NEXT:    .cfi_def_cfa_offset 8
; X32-NEXT:  .Lcfi1:
; X32-NEXT:    .cfi_offset %ebp, -8
; X32-NEXT:    movl %esp, %ebp
; X32-NEXT:  .Lcfi2:
; X32-NEXT:    .cfi_def_cfa_register %ebp
; X32-NEXT:    movl 16(%ebp), %eax
; X32-NEXT:    movl 20(%ebp), %edx
; X32-NEXT:    addl 8(%ebp), %eax
; X32-NEXT:    adcl 12(%ebp), %edx
; X32-NEXT:    popl %ebp
; X32-NEXT:    retl
  %ret = add i64 %arg1, %arg2
  ret i64 %ret
}

define i32 @test_add_i32(i32 %arg1, i32 %arg2) {
; X64-LABEL: test_add_i32:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    # kill: %ESI<def> %ESI<kill> %RSI<def>
; X64-NEXT:    leal (%rsi,%rdi), %eax
; X64-NEXT:    retq
;
; X32-LABEL: test_add_i32:
; X32:       # BB#0:
; X32-NEXT:    movl 8(%esp), %eax
; X32-NEXT:    addl 4(%esp), %eax
; X32-NEXT:    retl
  %ret = add i32 %arg1, %arg2
  ret i32 %ret
}

define i16 @test_add_i16(i16 %arg1, i16 %arg2) {
; X64-LABEL: test_add_i16:
; X64:       # BB#0:
; X64-NEXT:    # kill: %DI<def> %DI<kill> %RDI<def>
; X64-NEXT:    # kill: %SI<def> %SI<kill> %RSI<def>
; X64-NEXT:    leal (%rsi,%rdi), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
;
; X32-LABEL: test_add_i16:
; X32:       # BB#0:
; X32-NEXT:    movzwl 8(%esp), %eax
; X32-NEXT:    addw 4(%esp), %ax
; X32-NEXT:    retl
  %ret = add i16 %arg1, %arg2
  ret i16 %ret
}

define i8 @test_add_i8(i8 %arg1, i8 %arg2) {
; X64-LABEL: test_add_i8:
; X64:       # BB#0:
; X64-NEXT:    addb %dil, %sil
; X64-NEXT:    movl %esi, %eax
; X64-NEXT:    retq
;
; X32-LABEL: test_add_i8:
; X32:       # BB#0:
; X32-NEXT:    movb 8(%esp), %al
; X32-NEXT:    addb 4(%esp), %al
; X32-NEXT:    retl
  %ret = add i8 %arg1, %arg2
  ret i8 %ret
}
