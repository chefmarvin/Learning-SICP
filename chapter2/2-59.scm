;; SICP Practice: 2-59
;; x 是否在集合 set 中
(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

;; 将 x 加入集合 set 中
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

;; set1 和 set2 的交集
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

;; set1 和 set2 的并集
(define (union-set set1 set2)
  (cond ((null? set2) set1)
	((null? set1) set2)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1)
		    (union-set (cdr set1) set2)))))

(begin
  (display (element-of-set? '2 '(1 2 3)))
  (newline)
  (display (adjoin-set '4 '(1 2 3)))
  (newline)
  (display (intersection-set '(1 2 3) '(3 4 5)))
  (newline)
  (display (union-set '(1 2 3 9 4 5) '(3 4 5 6 7)))
  (newline))
