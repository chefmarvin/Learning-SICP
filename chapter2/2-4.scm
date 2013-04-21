;;; SICP Practice: 2-4
;; cons 返回一个过程，这个过程以 m 为参数，将 m 作用于 x 和 y
(define (cons x y)
  (lambda (m) (m x y)))
;; z 是一个过程，可以是 cons，返回的是将 z 作用于一个匿名函数，这个匿名函数返回 p，q 两个参数中的前一个
(define (car z)
  (z (lambda (p q) p)))
;; z 是一个过程，可以是 cons，返回的是将 z 作用于一个匿名函数，这个匿名函数返回 p，q 两个参数中的后一个
(define (cdr z)
  (z (lambda (p q) q)))

(begin
  ;; car 的 z 参数是 (cons "head" "tail")，(cons "head" "tail") 过程要将参数 m 作用于参数 x 和 y
  ;; 所以 car 实际的操作即把过程 (lambda (p q) p) 作为 m 传递给 z，z 为 (cons "head" "tail")
  ;; m 作用于 "head" 和 "tail" 返回第一个参数，所以返回了 "head"
  (display (car (cons "head" "tail")))
  (newline)
  (display (cdr (cons "head" "tail")))
  (newline))
