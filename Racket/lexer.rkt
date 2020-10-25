#lang racket

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

(define (tokenize expr)
  (regexp-split #rx" " expr))

(define eval-expr
  (let ((ns (make-base-namespace)))
    (lambda (expr) (eval (read (open-input-string expr)) ns))))

(match (tokenize "if ('a 'b) fg")
  [(list "if" expr body ...) (display (cadr (regexp-split #rx"[\\(\\)]" expr)))])
