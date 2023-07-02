#lang sicp
(load ".\\sicp.scm")

(define (3-sum? l)
  (let ((a (car l))
        (b (cadr l))
        (c (caddr l)))
    (= s (+ a b c))))

(define (unique-3-collection n)
  (flatmap
   append
   (flatmap
    append
    (map (lambda (i)
           (map (lambda (j)
                  (map (lambda (k) (list i j k))
                       (enumerate-interval 1 (- j 1))))
                (enumerate-interval 1 (- i 1))))
         (enumerate-interval 1 n)))))

(define s 20)
(define (sum-3-collection n)
  (filter 3-sum?
          (unique-3-collection n)))
(sum-3-collection 20)
