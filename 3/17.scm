#lang sicp
(load ".\\sicp.scm")
(define (count-pairs x)
  (define (add-if-absent? item arr)
    (cond ((null? arr) (begin
                         (set! viewed (cons item '()))
                         #f))
          ((eq? item (car arr)) #t)
          ((null? (cdr arr)) (begin
                               (set-cdr! arr (list item))
                               #f
                               ))
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
         ;; (display x)(newline)
         ;; (display viewed)(newline)(newline)
            (+ (inner (car x))
               (inner (cdr x))
               1))))
  (inner x))

(display
 (count-pairs '(1 2 3)))


(define x '(1))
(define y (cons x x))
(display (count-pairs (list y)))


(define x '(1))
(define y (cons x x))
(define z (cons y y))
(display
 (count-pairs z))


(define x '(1 2 3))
(set-cdr! (cddr x) x)
(display (count-pairs x))
