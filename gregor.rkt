#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define PATH "/app/app/images")

(define port (if (getenv "PORT")
                 (string->number (getenv "PORT"))
                 8080))
 
(define (my-app req)
  (local ((define img-src (string-append PATH "/" (path->string (car (shuffle (directory-list PATH)))))))
    (response/full
     200 #"Ok"
     (current-seconds) (string->bytes/utf-8 (string-append "image/" (last (string-split img-src "."))))
     (list (make-header #"Trust-the"
                    #"natural recursion"))
     (cons (file->bytes img-src) empty))))
 
(serve/servlet my-app
               #:listen-ip #f
               #:servlet-regexp #rx""
               #:port port
               #:command-line? #t)