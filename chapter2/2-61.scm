;; SICP Practice: 2-61
;; set 是已经排序的表
;; 平均步数是没有排序时的一半
(define (adjoin-set x set)
  (cond ((null? set) (list x))
  	((= x (car set)) set)
		((< x (car set)) (cons x set))
		(else (cons (car set)
					(adjoin-set x (cdr set))))))

(begin
  (display (adjoin-set '6 '(1 3 6 10)))
  (newline)
  (display (adjoin-set '11 '(1 3 6 10)))
  (newline)
  (display (adjoin-set '5 '(1 3 6 10)))
  (newline))
