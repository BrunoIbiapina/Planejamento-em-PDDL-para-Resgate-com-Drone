(define (domain drone-rescue)
  (:requirements :strips :typing)
  (:types drone location item)

  (:predicates
    (at ?d - drone ?l - location)
    (connected ?a - location ?b - location)
    (at-item ?i - item ?l - location)
    (in ?i - item ?d - drone)
    (dropzone ?l - location)
    (bat4 ?d - drone)
    (bat3 ?d - drone)
    (bat2 ?d - drone)
    (bat1 ?d - drone)
  )

  (:action fly-4
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (and (at ?d ?from) (connected ?from ?to) (bat4 ?d))
    :effect (and (not (at ?d ?from)) (at ?d ?to) (not (bat4 ?d)) (bat3 ?d))
  )

  (:action fly-3
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (and (at ?d ?from) (connected ?from ?to) (bat3 ?d))
    :effect (and (not (at ?d ?from)) (at ?d ?to) (not (bat3 ?d)) (bat2 ?d))
  )

  (:action fly-2
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (and (at ?d ?from) (connected ?from ?to) (bat2 ?d))
    :effect (and (not (at ?d ?from)) (at ?d ?to) (not (bat2 ?d)) (bat1 ?d))
  )

  (:action fly-1
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (and (at ?d ?from) (connected ?from ?to) (bat1 ?d))
    :effect (and (not (at ?d ?from)) (at ?d ?to) (not (bat1 ?d)))
  )

  (:action pickup
    :parameters (?d - drone ?i - item ?l - location)
    :precondition (and (at ?d ?l) (at-item ?i ?l))
    :effect (and (not (at-item ?i ?l)) (in ?i ?d))
  )

  (:action deliver
    :parameters (?d - drone ?i - item ?l - location)
    :precondition (and (at ?d ?l) (in ?i ?d) (dropzone ?l))
    :effect (and (not (in ?i ?d)) (at-item ?i ?l))
  )

  (:action recharge
    :parameters (?d - drone ?b - location)
    :precondition (and (at ?d ?b) (dropzone ?b))
    :effect (and (bat4 ?d) (not (bat3 ?d)) (not (bat2 ?d)) (not (bat1 ?d)))
  )
)