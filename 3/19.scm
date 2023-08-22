#lang sicp
(load ".\\sicp.scm")


(define (check-cycle a)
  ;;(define slow x)
  ;;(define fast x)
  (define virtual (cons 0 a))
  (define (inner x y)
    (cond ((null? y) #f)
          ((null? (cdr y)) #f)
          ((and (eq? x y) (not (eq? x virtual))) #t)
          (else (begin
                  ;;(set! slow (cdr slow))
                  ;;(set! fast (cddr fast))
                  (inner (cdr x) (cddr y))
                  ))))
  (inner virtual virtual))


(display (check-cycle '(1 2 3)))


(display (check-cycle (make-cycle '(1 2 3))))
