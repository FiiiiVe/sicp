#lang sicp
(load ".\\sicp.scm")

(define (union-set-order set1 set2)
  (define (reverse list)
    (define (inner ans rest)
      (if (null? rest)
          ans
          (inner (cons (car rest) ans) (cdr rest))))
    (inner '() list))
  (define (union-inner-desc set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else (let ((x1 (car set1))
                (x2 (car set2)))
            (cond ((= x1 x2) (cons x1 (union-inner-desc (cdr set1) (cdr set2))))
                  ((< x1 x2) (cons x1 (union-inner-desc (cdr set1) set2)))
                  (else (cons x2 (union-inner-desc set1 (cdr set2)))))))))
  ;;(reverse
  (union-inner-desc set1 set2))
  ;;)

(union-set-order '(1 3 5 7 9) '(2 4 6 8))
