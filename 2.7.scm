#lang sicp
(load ".\\sicp.scm")


;; 太简单了，在sicp.scm中直接定义了
(define (upper-bound in) (car in))
(define (lower-bound in) (cdr in))
