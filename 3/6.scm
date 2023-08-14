#lang sicp
(load ".\\sicp.scm")

(define rand
  (define rand-init 10)
  (define (generate)
    (let ((x rand-init))
      (lambda ()
        (set! x (rand-update x))
        x)))
  (define (reset new-value)
    (set! x new-value))
  (define (mf f)
    (cond ((eq? f 'generate) generate)
          ((eq? f 'reset) reset)
          (else (error "xxxx"))))
  mf)

