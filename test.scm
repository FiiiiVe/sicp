#lang sicp
(load ".\\sicp.scm")


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

(define a (list nil 'a))
(define b (list nil 'b))
(set-cdr! (cdr b) a)
(set-car! a b)
(cadr b)
(cddr b)
