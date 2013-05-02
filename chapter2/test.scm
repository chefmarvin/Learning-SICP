(define a '(1 2 3 4))

;; (define (drop-last sample)
;;   (if (null? (cdr sample))
;; 	  '()
;; 	  (cons (car sample) (drop-last (cdr sample)))))

(define (odd-pick sample)
  (if (null? sample)
	  '()
	  (if (odd? (car sample))
		  (cons (car sample) (odd-pick (cdr sample)))
		  (odd-pick (cdr sample)))))

(define (even-pick sample)
  (if (null? sample)
	  '()
	  (if (even? (car sample))
		  (cons (car sample) (even-pick (cdr sample)))
		  (even-pick (cdr sample)))))

(begin
  (display (odd-pick a))
  (newline)
  (display (even-pick a))
  (newline))
