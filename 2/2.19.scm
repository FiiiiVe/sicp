#lang sicp
(load ".\\sicp.scm")
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))
(define us-coins (list 50 25 10 5 1))

;; -------------------
(define (no-more? list)
  (null? list))
(define (except-first-denomination list)
  (cdr list))
(define (first-denomination list)
  (car list))



(cc 100 us-coins)
;; voin-values排序不会影响cc的回答，因为每个币种都会经历使用0个~（超过amount）个
