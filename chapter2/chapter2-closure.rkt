#lang racket
;В общем случае операция комбинирования объектов данных
;обладает свойством замыкания в том случае, если
;результаты соединения объектов при помощи этой операции сами могут соединяться через нее же
(define test-list (list 1 2 3 4))
(cons 1 (cons 2 (cons 3 (cons 4 null))))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref test-list 1)
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(length test-list)

(append (list 1 2 3) (list 3 4 5))
;2.17
(define (last-pair items)
  (if (= (length items) 1)
      (car items)
      (last-pair (cdr items))))
(last-pair test-list)
;2.18
(define (reverse items)
  (if (= (length items) 1)
      items
      (append (reverse (cdr items)) (list (car items)))))
(reverse test-list)

;2.20
;dot notation in functions
;(f x y . z) in case (f 1 2 3 4 5) => x = 1, y = 2, z = (3, 4, 5)
(define (same-parity x . items)
  (filter (lambda (item)
            (not (=
                  (abs (- item x)) 0)))
          items))
(same-parity 1 2 3 4 5 6 7)
(filter positive? (list 1 2 3 -1))

(define (scale-list items factor)
  (if (null? items)
      null
      (cons (* (car items) factor) (scale-list (cdr items) factor))))
(scale-list test-list 10)
;обобщение scale-list до map
(define (map func items)
  (if (null? items)
      null
      (cons (func (car items)) (map func (cdr items)))))
(map (lambda (x) (* x x)) test-list)
;2.21
(define (square-list items)
  (map (lambda (x) (* x x)) items))
