#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (compose f g)
  (lambda (x) (f (g x))))
((compose square inc) 6)
