;; 矩形的表示
(define (make-rectangle r degree)
  (cons r (convert degree)))

(define pi 3.14159265359)

(define (convert num)
  (car (let ((number (list num)))
		 (map (lambda (x)
				(* x (/ (* 2 pi) 180)))
			  number))))

(define (length rectangle)
  (if (>= (cdr rectangle) 90)
	  (/ (cdr rectangle) 2.0)
	  ()))
(define (width rectangle)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (area rectangle)
  (* (width rectangle)
	 (length rectangle)))
(define (perimeter rectangle)
  (* (+ (length rectangle) (width rectangle))
	 2))

(begin
  (display (area (make-rectangle 1 90)))
  (newline)
  (display (perimeter (make-rectangle 1 90)))
  (newline))
