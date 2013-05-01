;; SICP Practice: 2-18
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
		(append (last-pair sample) (reverse-iter (drop-last sample) (- index 1)))))
  (reverse-iter sample (length sample)))

(begin
  (display (list-reverse (read)))
  (newline))
