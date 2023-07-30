#lang sicp
(load ".\\sicp.scm")

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


(define sample-pairs (list (list 'A 4) (list 'B 2)
                           (list 'C 1) (list 'D 1)))
(generate-huffman-tree sample-pairs)
