#lang sicp
(load ".\\sicp.scm")

(define (install-scheme-number-package)
  ;; ...
  (put 'raise '(scheme-number) (lambda (x) (make-rational x 1)))
  'done)

(define (install-rational-package)
  ;; ...
  ;; 这里不知道实数的定义是怎么样的。。所以直接raise为虚数
  (put 'raise
       '(rational)
       (lambda (x) (make-complex-from-real-imag (/ (numer x) (dunom x)) 0 )))
  'done)

(define (raise x) (apply-generic 'raise x))
