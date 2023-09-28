#lang sicp
(load ".\\sicp.scm")

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
          (logical-or (get-signal a2) (get-signal a1))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (logical-or a b)
  (cond ((or (and (= a 0) (= b 0))
             (and (= a 1) (= b 1)))
         0)
        ((or (and (= a 1) (= b 0))
             (and (= a 0) (= b 1)))
         1)
        (else (error "invalid input"))))
