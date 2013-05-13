;; SICP Practice: 2-32
(define (subsets s)
  (if (null? s)
	  (list '())
	  ;; rest 是 (cdr s) 子集的所有组合
	  (let ((rest (subsets (cdr s))))
		;; 这里添加的内容应该能返回含有 (car s) 的所有组合
		(append rest (map (lambda (x)
							(append (list (car s)) x))
						  rest)))))

(begin
  (display (subsets '(1 2 3 4)))
  (newline))
