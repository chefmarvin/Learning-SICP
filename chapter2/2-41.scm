;; SICP Practice: 2-41
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
	  '()
	  (cons low
			(enumerate-interval (+ low 1) high))))

(define (add-equal? n seq)
  (if (= n (accumulate + 0 seq))
	  #t
	  $f))

(define (flatmap proc seq)
  (accumulate append
			  '()
			  (map proc seq)))

(define (permutations s)
  (define (remove item sequence)
	(filter (lambda (x) (not (= x item)))
			sequence))
  (if (null? s)
	  (list '())
	  (flatmap (lambda (x)
				 (map (lambda (p) (cons x p))
					  (permutations (remove x s))))
			   s)))

(define (triple n s)
  (accumulate append
			  '()
			  (map (lambda (i)
					 (accumulate append
								 '()
								 (map (lambda (j)
										(map (lambda (k) (list i j k))
											 (enumerate-interval 1 (- j 1))))
									  (enumerate-interval 1 (- i 1)))))
				   (enumerate-interval 1 n))))

(define (get-set n s)
  (accumulate append
			  '()
			  (map (lambda (x) (permutations x))
				   (filter (lambda (seq)
							 (if (= s (accumulate + 0 seq))
								 #t
								 #f))
						   (triple n s)))))

(begin
  ;; 不大于 6 的且和为 10 的组合
  (display (get-set 6 10))
  (newline))
