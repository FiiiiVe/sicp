#lang sicp
(load ".\\sicp.scm")
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(define a (make-rat 1 -3))
(print-rat a)
