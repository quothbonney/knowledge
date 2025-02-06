#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content



#lecture_notes(
  "Linear Mappings",
  "Jack David Carson",
  "January 22, 2025",
  [
    == Algebra
    #definition(title: "Vector Space")[
      A vector space is any collection of objects that can be added together and multiplied by a scalar, and the resulting object is still a vector.
    ]
    This property can be specified by considering two vector spaces $V, W$ and a mapping $Phi : V -> W$ that preserves the structure of the vector space if and only if
    $ Phi(bold(x) + bold(y)) = Phi(bold(x)) + Phi(bold(y)) \
    Phi (lambda bold(x)) = lambda Phi  (bold(x)) $ 
    for _all_ $bold(x), bold(y) in V "and" lambda in RR$. From this we can define a linear mapping
    #definition(title: "Linear Mapping")[
      A linear mapping, also known as a _vector space homomorphism_ or _linear transform_ $Phi : V -> W$ is defined for
      $ forall bold(x), bold(y) in V space forall lambda, psi in RR : Phi(lambda bold(x) + psi bold(y)) = lambda Phi(bold(x)) + psi Phi(bold(y)) $ 
      which essentialy reads for all vectors $bold(x), bold(y)$ in $V$ and all $lambda, psi$ in $RR$ the linear mapping $Phi$ satisfies the scalar multiplication and additivity constraints.
    ]
    These definitions are useful because we can define certain special mappings.
    - *Injective* if $forall bold(x), bold(y) in V : Phi(bold(x)) = Phi(bold(y)) arrow.r.double bold(x) = bold(y)$
    - *Surjective* if $Phi(V) = W$
    - *Bijective* if $Phi$ is both injective and surjective
    #align(center)[
      #image("images/20250122171549.png", width: 70%) 
    ]
    This specifies that if $Phi$ is surjective, then every element in $W$ can be "reached" from $Phi(V)$. For a bijective $Phi$, we can furthermore define an inverse mapping $Psi : W -> V$ such that $Psi compose Phi(bold(x)) = bold(x)$.

    Then, we can also introduce some special cases of linear mappings
    - *Isomorphism:* $Phi : V -> W$ is linear and bijective
    - *Endomorphism:* $Phi : V -> V$ is linear
    - *Automorphism:* $Phi : V -> V$ linear and bijective

    == Matrix Representation
    Based on this we can state the theorem that _finite-dimensional vector spaces $V$ and $W$ are ismorphic if and only if_ $dim(V) = dim(W)$. From hence we can define a matrix from first principles as representing an $n$-dimensional vector space isomorphic to $RR^(n)$. Specifically, we consider a basis ${bold(b)_(1), dots, bold(b)_(n)}$ of an $n$-dimensional vector space $V$ isomorphic to $RR^(n)$. As we are familiar with in linear algebra, this basis represents a linear transformation on a coordinate system.


    #remark[An *ordered* basis is a special form of basis in which the orer of vectors matters. Our canonical linear algebra intuition relies on this constraint, since matrix $[bold(v)_(1), bold(v_(2)) , bold(v)_(3)] != [bold(v)_(3), bold(v_(2)) , bold(v)_(1)]$ ]. However it is rarely necessary for understanding vector spaces. We specify ordered basis $B = (bold(b)_(1), dots, bold(b)_(n))$ and unordered basis $cal(B) = {bold(b)_(1), dots bold(b)_(n)}$

    #definition(title: "Transformation Matrix")[
    Consider vector spaces $V, W$ with ordered bases $B = (bold(b)_(1), dots, bold(b)_(n))$ and $C = (bold(c)_(1), dots, bold(c)_(n))$, scalars $bold(alpha) in RR^(n)$ and a linear mapping $Phi : V -> W$ such that
    $ Phi(bold(b)_(j)) = alpha_(1 j) bold(c)_(1) + dots.h.c +  alpha_(m j) bold(c)_(m) = sum_(i=1)^(m) alpha_(i j) bold(c_(i)) $
    The result of this in matrix form will be the _transformation matrix_ corresponding to $Phi$ (with respect to the chosen bases $B$ and $C$) which we call $bold(A_(Phi))$ such that for $bold(y)= Phi(bold(x)) in W$,
    $ bold(A_(Phi)) hat(bold(x)) = hat(bold(y)) $
    And just like that we've gone from algebra to linear algebra.
    ]


  ]
)T
