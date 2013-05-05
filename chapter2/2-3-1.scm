;; 矩形的表示
(define (make-rectangle length wide)
  (cons length wide))
(define (area rectangle)
  (* (car rectangle)
	 (cdr rectangle)))
(define (perimeter rectangle)
  (* (+ (car rectangle) (cdr rectangle))
	 2))
(begin
  (display (area (make-rectangle 4 5)))
  (newline)
  (display (perimeter (make-rectangle 4 5)))
  (newline))
