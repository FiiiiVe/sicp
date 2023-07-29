#lang sicp
(load ".\\sicp.scm")

;; 如果元素可以重复
;; 不需要改(define (elements-of-sets? ele set))


(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (remove-set-element ele set)
  (cond ((null? set) '())
        ((equal? ele (car set)) (cdr set))
        (else (cons (car set) (remove-set-element ele (cdr set))))))

(define s '(1 2 3 4 5))
(display (remove-set-element 3 s))(newline)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((elements-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) (remove-set-element (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))

(intersection-set '(1 2 3 4 5) '(2 3 4 5 6)) 
