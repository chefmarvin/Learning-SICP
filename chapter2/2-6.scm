;; SICP Practice: 2-6
;; 0 = lambda f. lambda x. x
(define zero
  (lambda (f)
    (lambda (x) x)))

;; 可利用代换求值能定义 two 和 one
(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

;; 1 = lambda f. lambda x. f x
(define one
  (lambda (f)
    (lambda (x) (f x))))

;; 2 = lambda f. lambda x. f (f x)
(define two
  (lambda (f)
    (lambda (x) (f (f x)))))

;; 加法：
(define +
  (lambda (f)
    (lambda (x) ())))
