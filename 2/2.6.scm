#lang sicp
(load "F:\\workspace\\sicp\\sicp.scm")

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;; 不知道题中的0和加一都是什么意思，0为什么可以实现为zero？他并不能像数据抽象一样代替0使用啊
;; 哦，题中的0是抽象概念上的0，跟之前1.43的repeated很像，就是少了一个次数n的参数
;; 代换模型
;;(add-1 zero)
;;(lambda (f) (lambda (x) (f ((zero f) x))))
;;(lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) y)) f) x))))
;;(lambda (f) (lambda (x) (f ((lambda (y) y) x))))
;;(lambda (f) (lambda (x) (f x)))

;; 同理(add-1 one)就是two
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
;; 写的时候犹豫了下 (f k) ((g k) x)，代换后正确
;; 乘法则是(f (g k)) x
(define (+ f g) (lambda (k)
                  (lambda (x) ((f k) ((g k) x)))))


;; 代换一下(+ two three)看看,顺便验证一下乘法
;; (define (+ f g) (lambda (k)
;;                   (lambda (x) (f k ((g k) x)))))
(lambda (k)
  (lambda (x)
    ((two k) ((three k) x))))
(lambda (k)
  (lambda (x)
    ((two k) ((lambda (y) (k (k (k y))) x)))))
(lambda (k)
  (lambda (x)
    ((two k) (k (k (k x))))))
;; (two k)
(lambda (k)
  (lambda (x)
    ((lambda (y) (k (k y))) (k (k (k x))))))
(lambda (k)
  (lambda (x)
    ((k (k (k (k (k x))))))))
