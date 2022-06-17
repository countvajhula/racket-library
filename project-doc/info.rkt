#lang info

(define collection "<project>")
(define deps '("base"))
(define build-deps '("<project>-lib"
                     "scribble-lib"
                     "racket-doc"
                     "sandbox-lib"))
(define version "0.0")
(define pkg-authors '(<username>))
(define scribblings '(("scribblings/<project>.scrbl" ())))
(define clean '("compiled" "doc" "doc/<project>"))
