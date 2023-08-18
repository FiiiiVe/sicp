#lang sicp
(load ".\\sicp.scm")
(define (count-pairs x)
  (define (add-if-absent? item arr)
    (cond ((null? arr) (begin
                         (set! viewed (cons x '()))
                          #f))
          ((null? (cdr arr)) (if (eq? item (car arr))
                                 #t
                                 (begin
                                   (set-cdr! arr (list x))
                                   #f
                                   )))
          (else (add-if-absent? item (cdr arr)))))
  (define viewed '())
  (define (inner x)
    (if (or
         (not (pair? x))
         (add-if-absent? x viewed))
        (begin
          ;;  (display x)(newline)
          ;;  (display viewed)(newline)(newline)
          0)
        (begin
          (display x)(newline)
          (display viewed)(newline)(newline)
            (+ (inner (car x))
               (inner (cdr x))
               1))))
    
  (inner x))



(define x '(1))
(define y (cons x x))
 (display (count-pairs (list y)))
;;(set-cdr! x 2)
;;x
