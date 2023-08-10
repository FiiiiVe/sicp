#lang sicp
(load ".\\sicp.scm")

(define (make-monitored f)
  (define (inner c)
    (define how-many-calls? c)
    (define reset-count
      (begin
        (set! c 0)))
    (define (call m)
      (begin
        (set! c (+ c 1))
        (display c)
        (f m)))
    (define (mf command)
      (cond ((eq? command 'how-many-calls?) how-many-calls?)
            ((eq? command 'reset-count) reset-count)
            (else (call command))))
    mf)
  (inner 0))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)
