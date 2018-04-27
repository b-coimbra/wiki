#lang racket

(require json
         net/url)

(define args (vector->list (current-command-line-arguments)))


(if (not (eq? '() args))
    (set url (string-append "https://a.4cdn.org/g/thread/"
                            (last (string-split (car args) "/")) ".json"))
    (raise-arguments-error 'url "Not given."
                           "usage" "racket crawler.rkt <url>"))

(define filename "page.json")

(call-with-output-file filename
  (lambda (f)
    (display (port->bytes (get-pure-port (string->url url))) f))
  #:exists 'replace)

(define urls '())

(define (append-element 1st elem)
  (foldr cons (list elem) 1st))

(map (λ (posts)
       (with-handlers ([exn:fail?
                        (append-element urls (string-append (number->string (hash-ref posts 'tim)) (hash-ref posts 'ext)))])
         (raise "not an image")))
     (hash-ref (call-with-input-file filename read-json) 'posts))
