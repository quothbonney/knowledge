#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content

#lecture_notes(
  "Multivariate Taylor Series",
  "Jack David Carson",
  "February 2, 2025",
  [
    The gradient of a function can be used as a locally linear approximation of function $f$ around $bold(x)_(0)$ such as 
    $ f(bold(x)) approx f(bold(x)_(0)) + grad_(bold(x))f(bold(x)_(0))(bold(x)-bold(x)_(0)) $
    However, this only works near the center at $bold(x)$. We can generalize this with the  *Multivariate Taylor Series*
    #definition(title: "Multivariate Taylor Series")[
      Consider a function 
      $ f :& RR^(D) -> RR \
            & bold(x) arrow.r.bar f(bold(x)) $
            that is smooth at $bold(x)_(0)$. If we define the difference vector $bold(delta):=bold(x)-bold(x)_(0)$ then the taylor series of $f$ at $bold(x)_(0)$ is defined as
      $ f(bold(x)) = sum_(k=0)^(oo) frac(D_(bold(x))^(k)f(bold(x)_(0)), k!) bold(delta)^(k) $
      where $D_(bold(x))^(k)f(bold(x)_(0))$ is the $k$-th total derivative of $f$ with respect to $bold(x)$ at $bold(x)_(0)$

      Finally $bold(delta)^(k)$ is actually specially defined as the $k$-th order tensor $bold(delta)^(k) in RR^(D times D times dots.c times D)$ $k$ times. It is obtained as the $k$-fold outer product by the $times.circle$ operator. 
    ]
    This last point is not as confusing as it sounds. It is mostly a formalization of an idea intuitive in programming. E.g.
    $ bold(delta)^(2) = bold(delta) times.circle bold(delta) = bold(delta delta)^(TT) "(Outer Product)" $
    where $bold(delta)^(2)[i, j] = delta[i]delta[j]$ as we expect in programming. So,
    $ k=0 quad : quad & D_(bold(x))^(0)f(bold(x)_(0))bold(delta)^(0) = f(bold(x)_(0)) in R \
      k=1 quad : quad & D_(bold(x))^(0) f(bold(x_(0))bold(delta)^(1) )= underbrace(grad_(bold(x)) f(bold(x)_(0)), 1 times D) underbrace(bold(delta), D times 1) = sum_(i=1)^(D)grad_(bold(x)) f(bold(x_(0))) [i]delta[i] in RR $
  ]
)
