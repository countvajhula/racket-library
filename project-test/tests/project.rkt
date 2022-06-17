#lang racket

(require rackunit
         rackunit/text-ui
         <project>)

(define tests

  (test-suite
   "Tests for <project>"

   (check-equal? (hello) "Hello, World!")
   (check-equal? (hello "<username>") "Hello, <username>!")))

(module+ test
  (void
   (run-tests tests)))
