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

(define (get-set n s)
  (accumulate append
			  '()
			  (map (lambda (i)
					 (map (lambda (j)
							;; (list i j))
							(map (lambda (k) (list i j k))
								 (enumerate-interval 1 (- j 1))))
						  (enumerate-interval 1 (- i 1))))
				   (enumerate-interval 1 n))))

(begin
  (display (get-set 6 10))
  (newline))
