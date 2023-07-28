#lang sicp
(load ".\\sicp.scm")

;; 如果元素可以重复
;; 不需要改(define (elements-of-sets? ele set))


(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (remove-set-element? ele set)
  (define (inner ele prev set)
    (cond ((null? set) #f)
          ((equal? ele (car set))
           (begin
            (cons prev (cdr set))
            #t))
          (else (inner ele (car set) (cdr set)))))
  (inner ele '() set))

(define s '(1 2 3 4 5))
(display (remove-set-element? 3 s))
(display s)
;;(define (intersection-set set1 set2)
;;  )

