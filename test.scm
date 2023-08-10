#lang sicp
(load ".\\sicp.scm")
(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(define a (make-rat 1 -3))
(print-rat a)


'(+ -)
'(1 2 3)

(define withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "xxxxxxxxxxxxxx"))))
(withdraw 50)
(withdraw 30)
