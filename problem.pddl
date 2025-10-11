(define (problem rescue-instance-01)
  (:domain drone-rescue)

  (:objects
    d1 - drone
    base z1 z2 z3 - location
    i1 i2 - item
  )

  (:init
    (at d1 base)
    (at-item i1 z1)
    (at-item i2 z2)
    (dropzone z3)
    (dropzone base)

    (connected base z1) (connected z1 base)
    (connected z1 z2)   (connected z2 z1)
    (connected z2 z3)   (connected z3 z2)
    (connected z3 base) (connected base z3)

    (bat4 d1)
  )

  (:goal
    (and
      (at-item i1 z3)
      (at-item i2 z3)
      (at d1 base)
    )
  )
)