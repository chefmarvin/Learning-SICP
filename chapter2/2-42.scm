;; SICP Practice: 2-42
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append
	      '()
	      (map proc seq)))

;; 确定在一个格局中，在第 k 列的皇后相对于其他列的皇后是否安全
;; 粗略想想应该是递归判断的
(define (safe? k position)
  position)

;; 将一个新的行列格局加入一个格局集合
(define (adjoin-position new-row k rest-of-queens)
  (append (list (list new-row k))
	  ;; (list new-row k)
	  rest-of-queens))

;; 表示空的格局集合
(define empty-board
  '())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (position) (safe? k position))
	 (flatmap
	  ;; rest-of-queens 是在前 k - 1 列放置 k - 1 个皇后的一种方式
	  (lambda (rest-of-queens)
	    ;; new-row 是在第 k 列放置所考虑的行编号
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(begin
  (display (queens 2))
  (newline))
