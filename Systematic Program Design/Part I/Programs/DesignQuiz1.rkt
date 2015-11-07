;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname DesignQuiz1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Larger-image.rkt

;; Image, Image -> Boolean
;; Takes two images and answers whether the first is larger than the second
;; (Larger is defined in terms of an "order of magnitude" area image-width * image-height)

;; Tests
(check-expect (larger? (square 10 "solid" "red") (square 20 "solid" "blue")) false)
(check-expect (larger? (square 10 "solid" "red") (triangle 10 "solid" "red")) true)
(check-expect (larger? (square 10 "solid" "red") (square 10 "solid" "blue")) false)
; stub
;(define (larger? i1 i2) false) ;stub


#;
(define (larger? i1 i2)
  (... i1 i2))


(define (larger? i1 i2)
  (> (* (image-height i1) (image-width i1))
     (* (image-height i2) (image-width i2))
     ))