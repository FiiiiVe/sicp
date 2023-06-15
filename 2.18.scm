#lang sicp
(load ".\\sicp.scm")
(define (reverse2 list)
  (define (iter items ans)
    (if (null? items)
        ans
        (iter (cdr items)
              (cons (car items) ans))))
  (iter list nil))
(reverse nil)
(reverse2 (list 1 4 9 16 25))


(define (reverse3 items)
  (if (null? items)
      nil
      (append (reverse3 (cdr items))
              (list (car items)))))
(reverse3 (list 1 2 3 (list 1 2) 5))
