#lang sicp
(load ".\\sicp.scm")


;; Ramanujan
(define (triple-sum s)
  (+ (* (car s) (car s) (car s)) (* (cdr s) (cdr s) (cdr s))))

(define (merge-weighted-a s t)
  (cond ((stream-null? s) t)
        ((stream-null? t) s)
        (else
         (let ((s-car (stream-car s))
               (t-car (stream-car t)))
           (cond ((< (triple-sum s-car) (triple-sum t-car))
                  (cons-stream s-car (merge-weighted-a (stream-cdr s) t)))
                 ((> (triple-sum s-car) (triple-sum t-car))
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

(define weighted-stream (weighted-pairs ingeter integer))
(define Ranmanujan-stream (stream-map triple-sum weighted-stream))

(define (filter s)
  (cond ((stream-null? s) the-empty-stream)
        ((= (stream-car s) (stream-cadr s))
         (stream-cons (stream-car s)
                      (filter
                       (stream-filter (lambda (x) (> x (stream-car s)))
                                      (stream-cddr s)))))
        (else (filter (stream-cdr s))))

(define Ranmanujan (filter Ranmanujan-stream))
