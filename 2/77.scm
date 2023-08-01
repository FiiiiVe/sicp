#lang sicp
(load ".\\sicp.scm")

#|
(magnitude z) 的求值过程

一些方法定义：
(define (magnitude z) (apply-generic 'magnitude z))

(define (apply-generic op . args)
  (let ((type-aags (map type-tag args)))
    (let ((proc (get op type-args)))
      (if proc
        (apply proc (map contents args))
        (error)))))

(define (install-polar-package)
  (define (magnitude z) (car z))
  (put 'magnitude '(polar) magnitude))

(define (install-rectangular-package)
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
             (square (imag-part z)))))
  (put 'magnitude '(rectangular) magnitude))

(put 'magnitude '(complex) magnitude)

------------------
(magnitude z)
-> (apply-generic 'magnitude z[complex])
-> (apply 'magnitude (content z))
-> (apply-generic 'magnitude z[rect or polar])
-> (apply 'magnitude (content z))
-> (real-magnitude z)

所以共调用apply-generic两次，类似网络拆包，把header拆掉，并传给相应的下层

|#
