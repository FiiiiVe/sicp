#lang sicp
(load ".\\sicp.scm")

(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))


(define segment (make-segment (make-vect 2 2)
                              (make-vect 1 3)))
(display (start-segment segment))
(display (end-segment segment))
