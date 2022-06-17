#lang racket/base

(provide hello)

(require racket/format)

(define (hello [name "World"])
  (~a "Hello, " name "!"))

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29
  (displayln (hello)))
