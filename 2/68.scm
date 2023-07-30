#lang sicp
(load ".\\sicp.scm")


;; from exercise 2.67
(define sample-tree
   (make-code-tree (make-leaf 'A 4)
                   (make-code-tree (make-leaf 'B 2)
                                   (make-code-tree (make-leaf 'D 1)
                                                   (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define mess (decode sample-message sample-tree))
;; (A D A B B C A)

;; ------------
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((elements-of-set? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((elements-of-set? symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "bad input, --" tree))))

(encode mess sample-tree)
