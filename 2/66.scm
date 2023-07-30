#lang sicp
(load ".\\sicp.scm")
 (define (lookup given-key tree-of-records)
   (cond ((null? tree-of-records) false)
         ((equal? given-key (key (car tree-of-records)))
          ((car tree-of-records)))
         ((small? given-key (key (car tree-of-records)))
          (lookup given-key (cadr tree-of-records)))
         (else (lookup given-key (caddr tree-of-records)))))
