#lang sicp
(load ".\\sicp.scm")

#|
a) 如果这样则会无限循环直到堆栈溢出 (apply-generic op '(a b)) -> (apply-generic op '((a->a a) b))

b) 不能，如a)中所描述的场景会内存溢出

c) 没理解为什么同类型会做转换，难道不是同类型type->type是找不到的嘛
   补充：可能是为了防止有人实现了type->type导致了死循环。。。。。。。。那做个校验就行了，type相等抛出error

|#
