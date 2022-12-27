#lang racket
(define (entry tree) (car tree))

(define (left-bracket tree) (cadr tree))

(define (right-bracket tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-bracket set)))
        ((> x (entry set))
         (element-of-set? x (right-bracket set)))))

;  5
; / \
;2   7

(element-of-set? 2 (list 5 (list 2) (list 7)))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-bracket set))
                    (right-bracket set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-bracket set)
                    (adjoin-set x (right-bracket set))))))

(define tree '())

(adjoin-set 1 (adjoin-set 3 (adjoin-set 2 tree)))
(adjoin-set 3 (adjoin-set 2 tree))

