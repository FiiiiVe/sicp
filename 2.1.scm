#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((nn (/ n g))
          (dd (/ d g)))
      (cond ((> dd 0)
             (cons nn dd))
            (else (cons (- 0 nn) (- 0 dd)))))))
(print-rat (make-rat -2 -6))

(print-rat (make-rat 2 6))
(print-rat (make-rat 2 -6))
(print-rat (make-rat -2 6))
