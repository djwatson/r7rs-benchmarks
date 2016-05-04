(define-syntax import
  (syntax-rules ()
    ((import stuff ...)
     (begin) ;; do nothing
     )))
(define flush-output-port force-output)
(define current-second current-time)
(define (jiffies-per-second) internal-time-units-per-second)
(define current-jiffy get-internal-real-time)
(define exact inexact->exact)
(define inexact exact->inexact)

(define (this-scheme-implementation-name) (string-append "guile-" (version)))
(read-enable 'r7rs-symbols)
(print-enable 'r7rs-symbols)
