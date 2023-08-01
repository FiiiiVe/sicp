#lang sicp
(load ".\\sicp.scm")

(define (install-scheme-number-package)
  ;; ...
  (put 'zero '(scheme-number) (lambda (x) (= x 0)))
  'done)

(define (install-ration-package)
  ;; ...
  (put 'zero
       '(ration)
       (lambda (x) (and (= 0 (numer x))
                        (not (= 0 (denom x))))))
  'done)

(define (install-complex-package)
  ;; ...
  (put 'zero
       'complex
       (lambda (x) (and (= 0 (real-part x))
                        (= 0 (imag-part x)))))
  'done)

(define (zero? x) (apply-generic 'zero x))
