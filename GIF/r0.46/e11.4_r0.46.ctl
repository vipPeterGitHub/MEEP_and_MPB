(define-param eps 11.4) ; dielectric constant of waveguide    
;(define-param eps 12.5) ; dielectric constant of waveguide 
(define-param r 0.46) ; radius of holes        
(define-param w 1) ; width of waveguide                                  
(define-param d 0) ; defect spacing (ordinary spacing = 1)                    
(define-param N 20) ; number of holes on either side of defect
(define-param amp 5)                   
(define-param k 1e-2)
(define-param ww 0.95)

; The cell dimensions                                                           
(define-param sy 6) ; size of cell in y direction (perpendicular to wvg.)       
(define-param pad 2) ; padding between last hole and PML edge                   
(define-param dpml 1) ; PML thickness   

(define sx (+ (* 2 (+ pad dpml N)) d -1)) ; size of cell in x direction


(set! geometry-lattice (make lattice (size (- sx 6) (+ 1 (/ sx 3)) no-size)))

(set! geometry
      (append ; combine lists of objects:                                       
       (list (make block (center 0 0) (size infinity infinity infinity)
                   (material (make dielectric (epsilon eps)))))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 7) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 7) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 6) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 6) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) -5) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) -5) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 5) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 5) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) -4) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) -4) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 4) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 4) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) -3) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) -3) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 3) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 3) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) -2) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) -2) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 2) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 2) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) -1) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) -1) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 1) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 1) (radius r) (height infinity)
              (material air)))

       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 0) (radius r) (height infinity)
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 0) (radius r) (height infinity)
              (material air)))

       ;(list (make block (center 0 0) (size infinity ww infinity)
       ;            (material (make dielectric (epsilon eps)))))
       ;(list (make block (center 0 2) (size ww ww infinity)
       ;            (material (make dielectric (epsilon eps)))))

       (list (make block (center -12 0) (size 15 ww infinity)
                   (material (make dielectric (epsilon eps)))))
       (list (make block (center 12 0) (size 15 ww infinity)
                   (material (make dielectric (epsilon eps)))))
       (list (make block (center 0 2) (size 15 ww infinity)
                   (material (make dielectric (epsilon eps)))))
))

(set! pml-layers (list (make pml (thickness dpml))))
(set-param! resolution 20)

;(set-param! resolution 10)
;0.25  0.2
;(define-param fcen 0.233905) ; pulse center frequency ;MPB calculate
;(define-param fcen 0.3) ; pulse center frequency
;0.310226
(define-param fcen 0.310226) ; pulse center frequency(pre_value)
(define-param df 0.0001)  ; pulse width (in frequency)

;(define-param nfreq 500) ; number of frequencies at which to compute flux



;calculate ldos begin

;(set! sources (list (make source
;      (src (make gaussian-src (frequency fcen) (fwidth df))) (component Ey) (amplitude amp) (center 0 2))))

;(define-param a 1.28)
;(define-param Th 500)
;(run-sources+ Th (after-sources (harminv Ey (vector3 0) fcen df)))
;(define f (harminv-freq-re (car harminv-results)))
;(define Q (harminv-Q (car harminv-results)))
;(define f 0.2354523080979058)
;(define Q 1987.5661650095)
;(define Vmode (* 0.25 a a))
;(print "ldos:, " (/ Q Vmode (* 2 pi f pi 0.5)))
;(reset-meep)
;(define-param T (* 2 Q (/ f)))
;(run-sources+ T (dft-ldos f 0.5 100))

;calculate ldos end



(set! sources (list
               (make source
                 (src (make gaussian-src (frequency fcen) (fwidth df)))
                 (component Ey)
                 ;(center (+ dpml (* -0.5 sx)) 0)
                 ;(center (+ dpml (* -0.5 sx)) 0)
                 (amplitude amp)
		 (center -13 0)
                 (size 0 w))))

;(set! symmetries (list (make mirror-sym (direction Y) (phase -1))))

;(define trans ; transmitted flux                                          
;        (add-flux fcen df nfreq
;                  (make flux-region
;                    (center (- (* 0.5 sx) dpml 0.5) 0) (size 0 (* w 2)))))

;(run-sources+ (stop-when-fields-decayed
;               50 Ey
;               (vector3 (- (* 0.5 sx) dpml 0.5) 0)
;               1e-3)
;              (at-beginning output-epsilon)
;              (during-sources
;               ;(in-volume (volume (center 0 0) (size sx 0))
;	       (in-volume (volume (center 0 0) (size 6 0))
;               (to-appended "hz-slice" (at-every 0.4 output-hfield-z)))))


;(use-output-directory)


(run-until 200
        (at-beginning output-epsilon)
        ;(at-end output-hfield-z)
        (to-appended "hz" (at-every 0.5 output-hfield-z))
)


;(display-fluxes trans) ; print out the flux spectrum

