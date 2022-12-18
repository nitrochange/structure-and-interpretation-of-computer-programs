#lang racket
(define x (cons (list 1 2) (list 3 4)))
(length x)
(list x x)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves x)
;       (1 (2 (3 4)))
;        
(count-leaves (list 1 (list 2 (list 3 4))))
;2.25
(define test1 (list 1 3 (list 5 7) 9))
(define test2 (list (list 7)))
(define test3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr test1)))))
(car (car test2))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr test3))))))))))))
;2.27
(define x1 (list 1 2 3))
(define y1 (list 4 5 6))

(append x1 y1)
(cons x1 y1)
(list x1 y1)

(pair? (list 1))

(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))