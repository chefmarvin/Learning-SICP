;; this is a test
;; 过滤器
(define (filter predicate sequence)
  (cond ((null? sequence) '())
		((predicate (car sequence))
		 (cons (car sequence)
			   (filter predicate (cdr sequence))))
		(else (filter predicate (cdr sequence)))))

;; (define (find-next x sequence)
;;   (define (find-iter x sequence n)
;; 	(if (and (= x (car sequence)) (not (> n (length sequence))))
;; 		(cadr sequence)
;; 		(find-iter x (cdr sequence) (+ n 1))))
;;   (find-iter x sequence 0))

(define (find-next x sequence)
  (if (= '() (sequence))
	  '()
	  (if ())))

(begin
  (display (find-next (read) '(1 3 2 8 9 0 5 7)))
  (newline))

