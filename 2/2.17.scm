#lang sicp
(load ".\\sicp.scm")
(define (last-pair head)
  (if (null? (cdr head))
      head
      (last-pair (cdr head))))
(last-pair (list 23 34 45 56 67))
