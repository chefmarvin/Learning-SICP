;; SICP Practice: 1-16
(define (expt b n)
  ;; 3 4  1
  ;; 3 3  1 * 3 = 3
  ;; 3 2  3 * 3 = 9
  ;; 3 1  9 * 3 = 27
  ;; 3 0  27 * 3 = 81
  ;; 81
  (define (expt-iter b counter product)
	(if (= counter 0)
		product
		(expt-iter b
				   (- counter 1)
				   (* b product))))
  (expt-iter b n 1))

(define (fast-expt b n)
  ;; (square (square (* 3 (fast-expt 3 0))))
  ;; (fast-expt 3 0) => 1
  ;; (square (square (* 3 1))) => (3^2)^2
  (cond ((= n 0) 1)
		((even? n) ((lambda (x)
					  (* x x))
					(fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n)
  ;; 3 4  1
  ;; 3 2  1 * (3^2) = 9
  ;; 3 1  9 * (3^2) = 81
  (define (fast-iter b counter product)
	(if (= counter 1)
		product
		(cond ((even? counter) (fast-iter b
										  (/ counter 2)
										  (* product ((lambda (x)
														(* x x))
													  b))))
			  (else (fast-iter b
							   (- counter 1)
							   (* b product))))))
  (fast-iter b n 1))

(begin
  (display (expt 3 4))
  (newline)
  (display (fast-expt 3 4))
  (newline)
  (display (fast-expt-iter 3 4))
  (newline))
