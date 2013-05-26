;; SICP Practice: 2-3
;; 矩形表示为圆的半径长度和两个对角线交叉的角度
(define (make-rectangle r degree)
  (cons r degree))

(define pi 3.14159265359)

;; 把数字转换为度数
(define (convert num)
  (car (let ((number (list num)))
		 (map (lambda (x)
				(* x (/ (* 2 pi) 180)))
			  number))))

(define (len-rectangle rectangle)
  (let ((degree (max (/ (cdr rectangle) 2.0)
					 (/ (- 180 (cdr rectangle)) 2.0))))
	(* (car rectangle) (sin (convert degree)) 2)))

(define (wid-rectangle rectangle)
  (let ((degree (min (/ (cdr rectangle) 2.0)
					 (/ (- 180 (cdr rectangle)) 2.0))))
	(* (car rectangle) (cos (convert degree)) 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (area rectangle)
  (* (len-rectangle rectangle)
	 (wid-rectangle rectangle)))

(define (perimeter rectangle)
  (* (+ (len-rectangle rectangle)
		(wid-rectangle rectangle))
	 2))


(begin
  (define sample (make-rectangle 2 60))
  (display (area sample))
  (newline)
  (display (perimeter sample))
  (newline))
