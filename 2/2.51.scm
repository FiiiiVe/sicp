#lang sicp
(load ".\\sicp.scm")

;; a) 直接beside
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((painter-below
           (transform-painter painter1
                              (make-vect 0 0)
                              (make-vect 1 0)
                              split-point))
          (painter-top
           (transform-painter painter2
                              split-point
                              (make-vect 1 0.5)
                              (make-vect 0 1))))
      (lambda (frame)
        (painter-below frame)
        (painter-top frame)))))

;; b) 由beside旋转得

(define (rotate90-anticlockwise painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))
(define (below painter1 painter2)
  (rotate90-anticlockwise (beside (rotate270-anticlockwise painter1)
                                  (rotate270-anticlockwise painter2))))
