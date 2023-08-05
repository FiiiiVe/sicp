#lang sicp
(load ".\\sicp.scm")

(define (reverse l)
  (if (null? l)
      '()
      (append (reverse (cdr l)) (list (car l)))))


;; 没定义过add,模拟一下只是scheme-number
(define (add a b) (+ a b))

(define (len l)
    (if (null? l)
        0
        (+ 1 (len (cdr l)))))

;; 练习想复杂了
;; 其实可以error Cannot adjoin lower-order term to terms,不需要这么麻烦处理里面的东西
;; adjoin之前的定义就是不会加更低的term进来的
(define (adjoin-term term term-list)
  (define (inner term term-list length)
    (cond ((> (order term) (- length 1))
           (inner term (cons 0 term-list) (+ length 1)))
          ((= (order term) (- length 1))
           (cons (add (coeff term)
                      (car term-list))
                 (rest-terms term-list)))
          (else (cons (car term-list)
                      (inner term (cdr term-list) (- length 1))))))
  ;;(reverse (inner term (reverse term-list)))
  (inner term term-list (len term-list))
  )
(define (first-term term-list)
  (make-term (- (len (cdr term-list)) 1)
             (car term-list)))
(define (rest-terms term-list) (cdr term-list))
(define (empty-termlist? term-list) (null? term-list))

(define (the-empty-termlist) '())

(define (make-term order term) (list order term))
(define (order term) (car term))
(define (coeff term) (cadr term))


(define sample-term-list '(5 3 0 1))
(define sample-term (make-term 6 1))

(display (adjoin-term sample-term sample-term-list))
(display (adjoin-term (make-term 2 2) sample-term-list))
