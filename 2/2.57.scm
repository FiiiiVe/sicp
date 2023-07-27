#lang sicp
(load ".\\sicp.scm")

(deriv '(+ x 3) 'x)
(display (deriv '(* (* x y) (+ x 3)) 'x))
(newline)

(define (addend s) (cadr s))
(define (augend s)
  (let ((forth (cdddr s)))
    (if (null? forth)
        (caddr s)
        (cons '+ (cddr s)))))
(display (deriv '(+ x x x y) 'x))
(newline)

(define (multiplier p) (cadr p))
(define (multiplicand p)
  (let ((forth (cdddr p)))
    (if (null? forth)
        (caddr p)
        (cons '* (cddr p)))))
(display (deriv '(* x y (+ x 3)) 'x))
