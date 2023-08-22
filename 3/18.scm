#lang sicp
(load ".\\sicp.scm")

(define (check-cycle x)
  (define viewed '())
  (define (contains? item arr)
    (cond
     ((null? arr) #f)
     ((eq? item (car arr)) #t)
     (else (contains? item (cdr arr)))))
  (define (inner x)
    (cond ((null? x) #f)
          ((contains? (car x) viewed) #t)
          (else (begin
                  (set-cdr! (last-pair viewed) x)
                  (inner (cdr x))))))
  (set! viewed (list x))
  (inner x))


(display (check-cycle '(1 2 3)))


(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(display (check-cycle (make-cycle '(1 2 3))))
