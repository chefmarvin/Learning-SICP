;; SICP Practice: 2-37
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
	  '()
	  (cons (accumulate op init (map car seqs))
			(accumulate-n op init (map cdr seqs)))))

;; 作为矩阵的行和列的运算
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; 矩阵乘以向量
(define (matrix-*-vector m v)
  (map (lambda (mat) (dot-product mat v))
	   m))

;; 矩阵乘以矩阵
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
	(map (lambda (mat) (matrix-*-vector cols mat))
		 m)))

;; 逆矩阵
(define (transpose mat)
  (accumulate-n cons '() mat))

(define vector-1 '(1 2 3 4))
(define vector-2 '(2 3 4 5))
(define matrix-1 '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define matrix-2 '((1 2) (3 4) (4 5) (6 8)))

(begin
  (display (dot-product vector-1 vector-2))
  (newline)
  (display (matrix-*-vector matrix-1 vector-1))
  (newline)
  (display (matrix-*-matrix matrix-1 matrix-2))
  (newline)
  (display (transpose matrix-1))
  (newline))
