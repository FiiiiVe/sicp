#lang sicp
(load ".\\sicp.scm")
(display (list 1 (list 2 (list 3 4))))
;; (1 (2 (3 4))) -> (2 (3 4)) -> (3 4) -> 4
;;       ↓              ↓          ↓
;;       1              2          3


;;     (1 (2 (3 4)))
;;         ↙ ↘
;;       1    （2 (3 4)
;;              ↙ ↘
;;             2   (3 4)
;;                 ↙ ↘
;;                3    4 
