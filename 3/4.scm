#lang sicp
(load ".\\sicp.scm")

(define (make-account balance password)
  (define continuous-wrong 0)
  (define (check f)
    (if f
        (set! continuous-wrong 0)
        (begin (set! continuous-wrong (+ continuous-wrong 1))
               (if (>= continuous-wrong 7)
                   (error "call police")))))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "money not enough"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? password p))
           (begin
             (error "wrong password")
             (check #f)))
          ((eq? m 'withdraw)
           (begin
             (check #t)
             withdraw))
          ((eq? m 'deposit)
           (begin
             (check #t)
             deposit))
          (else (error "unknown"))))
  dispatch)

(define acc (make-account 100 'p))

(display ((acc 'p 'withdraw) 40))

(display ((acc 'o-p 'deposit) 50 ))
(display ((acc 'o-p 'deposit) 50 ))
(display ((acc 'o-p 'deposit) 50 ))
(display ((acc 'o-p 'deposit) 50 ))
(display ((acc 'o-p 'deposit) 50 ))
(display ((acc 'o-p 'deposit) 50 ))
