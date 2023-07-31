#lang sicp
(load ".\\sicp.scm")

;; a) 其实我不知道为什么不能吧number？和same-variable加到type中。。

;; b)
(put 'deriv '(+) deriv-sum)
(put 'deriv '(*) deriv-product)

(define (deriv-sum exp-operands var)
  (make-sum (deriv (car exp-operands) var)
            (deriv (cdr exp-operands) var)))
(define (deriv-product exp-operands var)
  (make-sum
   (make-product (car exp-operands)
                 (deriv (cdr exp-operands) var))
   (make-product (deriv (car exp-operands) var)
                 (cdr exp-operands))))

