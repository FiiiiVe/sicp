#lang sicp
(load ".\\sicp.scm")

;; a)
;; peter -> paul -> mary = 45
;; peter -> mary -> paul = 35
;; paul -> mary -> peter = 50
;; mary -> peter -> paul = 40

;; b)
;; peter -> paul (-> mary) = 90
;; peter -> mary (-> paul) = 55
;; mary -> peter (-> mary) = 60
;; paul -> mary (-> peter) = 40
;; mary -> paul (-> peter) = 30
;; peter ->() = 110
;; paul -> () = 80
;; mary -> () = 50
