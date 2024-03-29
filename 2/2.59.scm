#lang sicp
(load ".\\sicp.scm")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((elements-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1)
                    (union-set (cdr set1) set2)))))

(union-set '(1 2 3) '(2 3 4))
