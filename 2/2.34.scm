#lang sicp
(load ".\\sicp.scm")


(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (car coefficient-sequence)
                                                   (* x (horner-eval x (cdr coefficient-sequence)))))
              0
              coefficient-sequence))

(define (horner-eval2 x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff
                                                   (* x higher-terms)))
              0
              coefficient-sequence))
(horner-eval2 2 (list 1 3 0 5 0 1))
