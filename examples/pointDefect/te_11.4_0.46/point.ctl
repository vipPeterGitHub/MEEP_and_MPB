(define-param r 0.46)
(define-param eps1 1)	;dielectric of holes
(define-param eps2 11.4)	;dielectric of background

(set! geometry-lattice (make lattice (size 7 7 no-size)))

(set! geometry
	(append
	(list (make block (center 0 0)(size infinity infinity infinity)
		(material (make dielectric (epsilon eps2))))
        (make cylinder (center 0 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 0) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))

        (make cylinder (center 0 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))

        (make cylinder (center 0 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))



        (make cylinder (center 0 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 -1) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))


        (make cylinder (center 0 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 -2) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))


        (make cylinder (center 0 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 -3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))


        (make cylinder (center 0 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 1 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 2 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -1 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -2 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center -3 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))
        (make cylinder (center 3 3) (radius r) (height infinity)
		(material (make dielectric (epsilon eps1))))




)))





;(set! geometry(list (make block (center 0 0)(size infinity infinity infinity)
;		(material (make dielectric (epsilon 12))))))
;(set! geometry (make cylinder
;                       (center 0 0 0) (radius 0.36) (height infinity)
;                       (material (make dielectric (epsilon 1)))))
;(set! geometry (append(geometric-objects-lattice-duplicates geometry)))




(set! geometry (append geometry 
                      (list (make cylinder (center 0 0 0) 
                                  (radius r) (height infinity)
                                  (material (make dielectric (epsilon eps2)))))))

(set! resolution 16)

(set! k-points (list (vector3 0.5 0.5 0)))

(set! num-bands 100)


(run-te (output-at-kpoint (vector3 0.5 0.5 0)
                          fix-hfield-phase output-hfield-z))
;(run-tm)

;(output-efield-z 49)

;(get-dfield 49)  ; compute the D field for band 49 for 7x7

;(compute-field-energy)  ; compute the energy density from D

;(print
; "energy in cylinder: "
; (compute-energy-in-objects (make cylinder (center 0 0 0)
;                                  (radius 1.0) (height infinity)
;                                  (material (make dielectric (epsilon eps2)))))
; "\n")

