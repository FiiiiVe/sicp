#lang sicp
(load ".\\sicp.scm")

;; 错误解法，应该用adder,mutiplier,constant
;; a+b=c*2
(define (average a b c)
  (define (process-new-value)
    (cond ((and  (has-value? a) (has-value? b))
           (set-value! c
                       (/ (+ (get-value a) (get-value b)) 2)
                       me))
          ((and (has-value? a) (has-value? c))
           (set-value! c
                       (- (* c 2) a)
                       me))
          ((and (has-value? b) (has-value? c))
           (set-value! c
                       (- (* c 2) b)
                       me))))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (forget-value! c me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'i-have-new-value)
           (process-new-value))
          ((eq? request 'i-lost-my-value)
           (process-forget-valu))
          (else (error "unknown request"))))
  (connect a me)
  (connect b me)
  (connect c me)
  me)

(define a (make-connector))
(probe "A" a)
(define b (make-connector))
(probe "B" b)
(define c (make-connector))
(probe "C" c)
(average a b c)

(set-value! b 10 'uesr)
(set-value! c 30 'user)
