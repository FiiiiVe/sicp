#lang sicp
(load ".\\sicp.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define r1 (make-interval 3 5))
(define r2 (make-interval 8 12))
(print-interval (par1 r1 r2))
(print-interval (par2 r1 r2))
;; 确实不一样


(print-interval (div-interval r1 r1))

(print-interval (div-interval r1 r2))


;;需要先运行2.12
(define r3 (make-center-percent 4 0.1))
(define r4 (make-center-percent 10 0.15))
(print-interval (div-interval r3 r3))
(print-interval (div-interval r3 r4))
;; 除法会根据精度（误差）不同，得到不同的答案，除法就是这么定义的。。可能有更好的方法定义除法，但这不重要
