#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(sqrt 50)
