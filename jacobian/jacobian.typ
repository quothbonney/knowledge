#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content



#lecture_notes(
  "Jacobian Matrix",
  "Jack David Carson",
  "January 30, 2025",
  [
    If we consider a function $bold(f) : RR^(n) -> RR^(m)$ and vector $bold(x) = [x_(1), dots, x_(n)]^(TT) in RR^(n)$, the coresponding vector of function values is
    $ bold(f)(bold(x)) = vec(f_(1)(bold(x)), dots.v, f_(m)(bold(x))) in RR^(m)$. It is like a vector of functions $[f_(1), dots, f_(m)]^(TT)$ for $f_(i) : RR^(n) -> RR$. We can say then that
    $ pdv(bold(f), x_(i)) = vec(pdv(f_(1), x_(i)), dots.v, pdv(f_(m), x_(i))) in RR^(m) $
    which implies
    $ dv(bold(f)(bold(x)), bold(x)) &= mat(pdv(bold(f)(bold(x)), x_(1)), dots.c, pdv(bold(f)(bold(x)), x_(n))) \
    &= mat( pdv(f_(1)(bold(x)), x_(1)), dots.c, pdv( f_(1)(bold(x)), x_(n) ) ; dots.v, ,dots.v ;pdv( f_(m)(bold(x)), x_(1) ), dots.c, pdv( f_(m)(bold(x)), x_(n) ) ) in RR^(m times n)  . $

    #definition(title: "Jacobian")[
       The Jacbian is defined as the collection of all first-order partial derivatives of $bold(f) : RR^(n) -> RR^(m)$. 
       $ bold(J) = grad_(bold(x)) bold(f) = dv(bold(f)(bold(x)), bold(x)) $
       where $J(i, j) = pdv(f_(i), x_(j))$
    ]
  ]
)
