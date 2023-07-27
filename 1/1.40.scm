#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
(newtons-method (cubic 2 5 8) 1)
