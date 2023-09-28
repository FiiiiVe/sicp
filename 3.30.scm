#lang sicp
(load ".\\sicp.scm")

(define (ripple-carry-adder A B S C)
  (define (iter a b s c-in c-out)
    (if (null? (car A))
        (set-signal c-in 0)
        (iter a b s c-in c-out)))
  (full-adder (car A) B (make-wire) S C))
