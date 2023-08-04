#lang sicp
(load ".\\sicp.scm")

(define (zero? a)
  (if (pair? a)
      (zero? (coeff a))
      (= 0 a)))
