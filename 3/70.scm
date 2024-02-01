#lang sicp
(load ".\\sicp.scm")


(define (merge-weighted-a s t)
  (cond ((stream-null? s) t)
        ((stream-null? t) s)
        (else
         (let ((s-car (stream-car s))
               (t-car (stream-car t)))
           (cond ((< (+ (car s-car) (cadr s-car)) (+ (car t-car) (cadr t-car)))
                  (cons-stream s-car (merge-weighted-a (stream-cdr s) t)))
                 ((> (+ (car s-car) (cadr s-sar)) (+ (car t-car) (cadr t-car)))
                  (cons-stream t-car (merge-weighted-a s (stream-cdr t))))
                 (else
                  (cons-stream s-car (merge-weighted-a (stream-cdr s) (stream-cdr t)))))))))

(define (merge-weighted-b s t)
  ;;...)

(define (weighted-pairs s t)
  (cons-stream
   (lsit (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t)))))
