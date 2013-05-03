;; SICP Practice: 2-27
(define (deep-reverse items)
  (cond ((null? items) 0)
		((not (list? items)) 0)
		(else (begin (list-reverse items)
					 (deep-reverse (cdr items))
					 (deep-reverse (car items))))))

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
