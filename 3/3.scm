#lang sicp
(load ".\\sicp.scm")

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "money not enough"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? password p)) (error "wrong password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "unknown"))))
  dispatch)

(define acc (make-account 100 'p))

(display ((acc 'p 'withdraw) 40))

(display ((acc 'o-p 'deposit) 50 ))
