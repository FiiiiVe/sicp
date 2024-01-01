#lang sicp
(load ".\\sicp.scm")

;; 加入的proc需要初始化，如加了inverter，如果不初始化，则输出可能不是输入的invert，初始值就错了，后面每次set-signal翻转输出就没有意义了