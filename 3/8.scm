#lang sicp
(load ".\\sicp.scm")

(define f
  (let ((called? #f))
    (lambda (x)
      (if called?
          0
          (begin
            (set! called? #t)
            x)))))


(display (+ (f 0) (f 1)))


(define f
   (let ((called? #f))
     (lambda (x)
       (if called?
           0
           (begin
             (set! called? #t)
             x)))))

(display (+ (f 1) (f 0)))
