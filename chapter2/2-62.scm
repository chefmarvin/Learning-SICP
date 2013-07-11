;; SICP Practice: 2-62
;; 求并集 union-set 的复杂度为 n 的实现
(define (union-set set1 set2)
  (cond ((null? set1) set2)
  	((null? set2) set1)
		(else (let ((x1 (car set1))
					(x2 (car set2)))
				(cond ((= x1 x2)
					   (cons x1
							 (union-set (cdr set1) (cdr set2))))
					  ((< x1 x2)
					   (cons x1
							 (union-set (cdr set1) set2)))
					  ((> x1 x2)
					   (cons x2
							 (union-set set1 (cdr set2)))))))))

(begin
  (display (union-set '(1 2 4 7) '(3 4 6 11)))
  (newline))
