#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (double f)
  (lambda (x) (f (f x))))
(((double (double double)) inc) 5)
