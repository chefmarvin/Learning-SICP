;; SICP Practice: 2-27
;; 最小不可分解的 list 的形式是 '(a b)
;; a 和 b 不能为 list
(define (deep-reverse items)
  (if (and (eqv? #f (pair? (car items)))
		   (eqv? #t (list? (cdr items))))
	  (append (list (cadr items)) (list (car items)))
	  (append (list (deep-reverse (car (list-reverse items))))
			  (list (deep-reverse (cadr (list-reverse items)))))))

(define (list-reverse sample)
  (define (last-pair sample)
	(if (null? (cdr sample))
		sample
		(last-pair (cdr sample))))
  (define (drop-last sample)
	(if (null? (cdr sample))
		'()
		(cons (car sample) (drop-last (cdr sample)))))
  (define (reverse-iter sample index)
	(if (= index 0)
		'()
		(append (last-pair sample)
				(reverse-iter (drop-last sample) (- index 1)))))
  (reverse-iter sample (length sample)))

(begin
  (display (list-reverse '((1 2) (3 4))))
  (newline)
  (display (deep-reverse '((1 2) (3 4))))
  (newline))
