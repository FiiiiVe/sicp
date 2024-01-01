#lang sicp
(load ".\\sicp.scm")

(define (squarer a b)
  (define (process-new-value)
    (cond (((has-value? a)
            (set-value! b
                        (square (get-value a))
                        me))
           ((has-value? b)
            (set-value! a
                        ;; wrong, if b < 0, error?
                        (sqrt (get-value b))
                        me))
           (else 'done))))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    ;; .....
    'done)
  me)
