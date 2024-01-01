#lang sicp
(load ".\\sicp.scm")

(define (c+ a b)
  (let ((c (makc-connector)))
    (adder a b c)
    c))

(define (c- a b)
  (let ((c (make-connector)))
    (subber a b c)
    c))

(define (c* a b)
  (let ((c (make-connector)))
    (mutiplier a b c )
    c))

(define (c/ a b)
  (let ((c (make-connector)))
    (divider a b c )
    c))

(define (cv a)
  (let (( c (make-connector)))
    (constant c a)
    c))
