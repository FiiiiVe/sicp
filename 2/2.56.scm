#lang sicp
(load ".\\sicp.scm")

;; 原版
(define (make-exponentiation base ex) (list '** base ex))
;; 改进
(define (make-exponentiation base ex)
  (cond ((and (number? ex) (eq 0 ex)) 1)
        ((and (number? ex) (eq 1 ex)) base)
        (else (list '** base ex))))

(define (base exponentiation) (cadr exponentiation))

(define (exponent exponentiation) (caddr exponentiation))

(define (exponentiation? v) (and (pair? v)
                                 (eq? '** (car v))))


;; 在cond中补充
((exponentiation? exp)
 (let ((b (base exp))
       (ex (exponent exp)))

   (make-product (deriv b var)
                 (make-product ex
                               (make-exponentiation base
                                                    (- ex 1))))))
