#lang sicp
(load ".\\sicp.scm")

(define (make-monitored f)
  (define (inner c)
    ;; wrong
    ;; (define reset-count
    (define (reset-count)
        (set! c 0)) 
    (define (call m)
      (begin
        (set! c (+ c 1))
        (f m)))
    (define (mf command)
      (cond ((eq? command 'how-many-calls?) c)
            ;; wrong and i dont know why??
            ;; ((eq? command 'reset-count) reset-count)
            ;; !!!maybe reset-count should be a procedure instead of a vari

            ((eq? command 'reset-count) (reset-count))
            ;; correct and i dont know why
            ;; ((eq? command 'reset-count) (set! c 0))
            (else (call command))))
    mf)
  (inner 0))

#|
(define (make-monitored function)
  (define (times-called c)
    (define (mf message)
      (cond ((eq? message 'how-many-calls?) c)
            ((eq? message 'reset-count) (set! c 0))
            (else (set! c (+ c 1))
                  (function message))))
    mf)
  (times-called 0)) 

|#
(define s (make-monitored sqrt))

;; (display (s 'how-many-calls?))

(display (s 100))(newline)

(display (s 'how-many-calls?))(newline)

(display (s 'reset-count))(newline)
(s 100)
(s 144)
(display (s 'how-many-calls?))(newline)
