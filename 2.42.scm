#lang sicp
(load ".\\sicp.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap
                 (lambda (rest-of-queens)
                   (map (lambda (new-row)
                          (adjoin-position new-row k rest-of-queens))
                        (enumerate-interval 1 board-size)))
                 (queen-cols (- k 1))))))
  (queen-cols board-size))

#|
(display-matrix
 (filter (lambda (positions) (safe? 5 positions))
         (flatmap (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row 5 rest-of-queens))
                 (enumerate-interval 1 5)))
          (list (list 1 3 5 2) (list 1 4 2 5)
                (list 2 4 1 3) (list 2 5 1 4) (list 2 5 3 1)
                (list 3 1 4 2) (list 3 5 2 4)
                (list 4 1 3 5) (list 4 1 5 2) (list 4 2 5 3)
                (list 5 2 4 1) (list 5 3 1 4)
))))
|#

(define empty-board nil)
(define (safe? k positions)
  (let ((new-row (nth (- k 1) positions)))
    (define (inner-safe? col positions)
      (let ((row (car positions)))
        ;; 检查到新增列前一个为止
        (if (= col k)
            #t
            (and
             ;; 不在同一行
             (not (= row new-row))
             ;; 不在对角线
             (not (= (abs (- row new-row))
                     (abs (- col k))))
             ;; 递归下一个
             (inner-safe? (+ col 1) (cdr positions))))))
    (inner-safe? 1 positions)))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

(define (nth k lst)
  (if (= k 0)
      (car lst)
      (nth (- k 1) (cdr lst))))


(display-matrix (queens 8))
(length (queens 8))
;;(nth 2  (list 1 2 3 4 5))
