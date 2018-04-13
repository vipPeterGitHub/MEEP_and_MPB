(define-param eps 13)         ; dielectric constant of waveguide
(define-param w 1.2)          ; width of waveguide
(define-param r 0.36)         ; radius of holes
(define-param d 1.4)          ; defect spacing (ordinary spacing = 1)
(define-param N 3)            ; number of holes on either side of defect
(define-param k 10) 

(define-param sy 6)           ; size of cell in y direction (perpendicular to wvg.)
(define-param pad 2)          ; padding between last hole and PML edge
(define-param dpml 1)         ; PML thickness
(define-param amp 2)
;(define sx (+ (* 2 (+ pad dpml N)) d -1))    ; size of cell in x direction
(define sx (+ (* 2 (+ pad dpml 3)) d -1))    ; size of cell in x direction

(set! geometry-lattice (make lattice (size sx sy no-size)))

(set! geometry
      (append ; combine lists of objects:                                       
       (list (make block (center 0 0) (size infinity w infinity)
                   (material (make dielectric (epsilon eps)))))
       (geometric-object-duplicates (vector3 1 0) 0 (- N 1)
        (make cylinder (center (/ d 2) 0) (radius r) (height infinity)
		;(material (make dielectic (epsilon eps)))))
              (material air)))
       (geometric-object-duplicates (vector3 -1 0) 0 (- N 1)
        (make cylinder (center (/ d -2) 0) (radius r) (height infinity)
		;(material (make dielectic (epsilon eps)))))
              (material air)))
       (list (make block (center 0 0) (size 0.5 0.7 infinity)
              (material (make dielectric (epsilon 13)(chi3 k)))))
              ))

(set! pml-layers (list (make pml (thickness dpml))))
(set-param! resolution 20)

(define-param fcen 0.25) ; pulse center frequency
(define-param df 0.2)    ; pulse frequency width
(define-param nfreq 2000) ; number of frequencies at which to compute flux


(set! sources (list
;               (make source
 ;                (src (make gaussian-src (frequency 0.26) (fwidth 0.1)))
  ;               (component Ey)
   ;              (amplitude 1)
     ;            (center 0 0)
      ;           (size 0 w))
               (make source
                 (src (make gaussian-src (frequency fcen) (fwidth df)))
                 (component Ey)
                 (center (+ dpml (* -0.5 sx)) 0)
                 (size 0 w))
               (make source
                 (src (make continuous-src (frequency 0.26)))
                 (component Ey)
		 (amplitude amp)
                 (center 0 0)
                 (size 0 w))
))

;(set! sources (list
 ;              (make source
  ;               (src (make gaussian-src (frequency 0.25) (fwidth 0.001)))
   ;              (component Ex)
    ;             (center 0 0)
     ;            (size 0 w))
	;))

(set! symmetries (list (make mirror-sym (direction Y) (phase -1))))

(define trans ; transmitted flux                                          
        (add-flux fcen df nfreq
                  (make flux-region
                    (center (- (* 0.5 sx) dpml 0.5) 0) (size 0 (* w 2)))))

;(run-sources+ (stop-when-fields-decayed
 ;              50 Ey
  ;             (vector3 (- (* 0.5 sx) dpml 0.5) 0)
   ;            1e-3)
    ;          (at-beginning output-epsilon)
     ;         (during-sources
      ;         (in-volume (volume (center 0 0) (size sx 0))
       ;         (to-appended "hz-slice" (at-every 0.4 output-hfield-z)))))


(run-until 1000
              (at-beginning output-epsilon)
              (during-sources
               (in-volume (volume (center 0 0) (size sx 0))
                (to-appended "hz-slice" (at-every 0.4 output-hfield-z)))))
(display-fluxes trans) ; print out the flux spectrum


;(run-until 5
 ;          (at-beginning output-epsilon)
  ;         (at-end output-hfield-z))




















