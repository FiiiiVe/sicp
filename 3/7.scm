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
    (cond ((not (is-password-right? p)) (error "wrong password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'is-password-right?) is-password-right?)
          (else (error "unknown"))))
  (define (is-password-right? o-p)
    (eq? o-p password))
  dispatch)

(define acc (make-account 100 'p))

(display ((acc 'p 'withdraw) 40))(newline)

;; (display ((acc 'o-p 'deposit) 50 ))

(define (make-joint acc password other-password)
  (define (dispatch p m)
    (cond ((eq? p other-password) (acc password m))
          (else (error "wrong password"))))
  (if (acc password 'is-password-right?)
      dispatch
      (error "wrong password")))
(define paul-acc
  (make-joint acc 'p 'my-p))
(display ((paul-acc 'my-p 'withdraw) 20))(newline)
(display ((acc 'p 'withdraw) 20))(newline)
(display ((paul-acc 'my-p 'withdraw) 20))(newline)
