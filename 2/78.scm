#lang sicp
(load ".\\sicp.scm")

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
        ((pair? datum) (car datum))
        (else (error))))

(define (contents datum)
  (cond ((number? datum) datum)
        (pair? datum) (cdr datum)
        (else (error))))

(define (attach-tag type-tag contents)
  (cond ((number? contents) contents)
        (else (cons type-tag contents))))
