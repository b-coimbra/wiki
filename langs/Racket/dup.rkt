#lang racket

(define (dupvowels str)
  (let ([counter 0])
    (if (regexp-match #px"([aeiou])\\S*\1" str)
        (begin
          (add1 counter)
          (printf "yes"))
        (void))))

(dupvowels "helle there")
