;; SICP Practice: 3-33
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) <??>)
			  '()
			  sequence))

(define (append seq1 seq2)
  (accumulate cons
			  <??>
			  <??>))

(define (length sequence)
  (accumulate <??>
			  0
			  sequence))

(begin
  (display (map (lambda (x) (* x x)) '(1 2 3)))
  (newline)
  (display (append '(1 2) '(3 4)))
  (newline)
  (display (length '(1 2 3)))
  (newline)
  )
