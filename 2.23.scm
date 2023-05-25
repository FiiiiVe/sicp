#lang sicp
(load ".\\sicp.scm")
(define (for-each proc list)
  (if (null? list)
      nil
      (if (null? (cdr list))
          (proc (car list))
          (for-each proc (cdr list)))))

(for-each (lambda (x) (newline) (display x))
          (list 1 3 3 4 5 6))

