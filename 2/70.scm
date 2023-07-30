#lang sicp
(load ".\\sicp.scm")

;; from 2.68
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
        (else '())))
;; from 2.69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge weight-ordered-leaves)
  (define (inner-merge node1 node2)
    (make-code-tree node1 node2))
  (cond ((not (pair? weight-ordered-leaves)) (error "bad input, --" weight-ordered-leaves))
        ((null? (cdr weight-ordered-leaves)) (car weight-ordered-leaves))
        (else (successive-merge (adjoin-set-tree
                                 (inner-merge (car weight-ordered-leaves)
                                              (cadr weight-ordered-leaves))
                                 (cddr weight-ordered-leaves))))))


;; -----------------
(define pairs (list (list 'A 2) (list 'NA 16) (list 'BOOM 1)
                    (list 'SHA 3) (list 'GET 2)
                    (list 'YIP 9) (list 'JOB 2) (list 'WAH 1)))
(define tree (generate-huffman-tree pairs))
(define bits (encode (list 'GET 'A 'JOB
              'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
              'GET 'A 'JOB
              'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
              'WAH 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP 'YIP
              'SHA 'BOOM) tree))
;; (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)
(length bits)
;; 84

;; 如果定长编码，8个字符，需要3位，一共36次，共需要3*36=108位

