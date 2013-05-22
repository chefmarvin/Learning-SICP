;; SICP Practice: 2-33
;; 累积器
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
			  '()
			  sequence))

(define (append seq1 seq2)
  (accumulate cons
			  seq2
			  seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1))
			  0
			  sequence))

(begin
  (display (map (lambda (x) (- x 1)) '(1 2 3)))
  (newline)
  (display (append '(1 2) '(3 4)))
  (newline)
  (display (length '(1 2 3 4 6)))
  (newline))
