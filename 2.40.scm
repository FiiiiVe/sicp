#lang sicp
(load ".\\sicp.scm")

(define (unique-pairs n)
  (flatmap append
           (map (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n))))

(define (simle-prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(display-matrix (prime-sum-pairs 6))
(display-matrix (simle-prime-sum-pairs 6))
