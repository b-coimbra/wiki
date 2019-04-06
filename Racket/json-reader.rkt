#lang racket

(require net/url
         html-parsing
         racket/match)

(define args (vector->list (current-command-line-arguments)))

(define (open url)
   (html->xexp (get-pure-port (string->url url))))

(define filename "tree.txt")

(write (open "https://boards.4chan.org/g/thread/65083593")
       (open-output-file filename
                         #:exists 'replace))

(for/list ([line (in-list (file->list filename))])
  (for-each (λ (expr)
              (display (flatten expr)))
            line))
