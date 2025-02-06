#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content



#lecture_notes(
  "Matrix Calculus",
  "Jack David Carson",
  "January 31, 2025",
  [
    In machine learning, the fundmental operation of backpropogation is to take the derivative of a matrix with respect to a vector or another matrix. We may seek to calculate the gradient of a matrix $A_(m times n)$ with respect to $B_(p times q)$ and accumulate the partial derivatives in a Jacobian *tensor* $J$ whose enteries are given as $J_(i j k l) = diff A_(i j) slash diff B_(k l)$.
    == Gradient of a Matrix with Respect to a Matrix
    For the matrix expression $A_(m times p) = B_(m times n) C_(n times p)$, we can coordinate expand into 
    $A_(i j) &= sum_(r=1)^(n) B_(i r) C_(r j) $ by definition of matrix multiplication such that the derivative 
    $ pdv(A_(i j), B_(k l) ) &= pdv(, B_(k l)) (sum_(r=1)^(n) B_(i r) C_(r j)) \
    &= sum_(r=1)^(n) pdv(B_(i r), B_(k l)) C_(r j) $ 
    and we can define the *Kronecker delta* $delta_(i j)$ as
    $ delta_(i, j) := cases(1 " if " i=j, 0 " if " i != j) $
    which effectively "selects" the term of $i=j$ from the sum. Since for an isolated matrix, a value $B_(i j)$ does not depend on any other term but itself, its gradient with respect to other terms will always be 0 or 1. Hence
   $ pdv(A_(i j), B_(k l)) &= sum_(r=1)^(n) pdv(B_(i r), B_(k l)) C_(r j) \
   &= sum_(r=1)^(n) delta_(i k) delta_(r l) C_(r j)  \
   &= delta_(i k) C_(l j). $
   Here, the first Kronecker delta $delta_(i k)$ is not affected by the summation and is pulled out, and the second $delta_(r l)$ sets every term except for $C_(l j)$ to 0 where $r = l$.

   == Gradient of a Vector with Respect to a Matrix
   In the context of an expression $bold(y) = A bold(x)$, we can take the derivative starting again in coordinate form $y_(i) = sum_(j=1)^(n) A_(i j)x_(j)$ to find
   $ pdv(y_(i), A_(k l)) = pdv(A_(i j), A_(k l)) x_(j) = delta_(i k)x_(l) $
   === Simple Loss Function
   If we have simple loss $cal(L)$ for a one-layer neural network then we can say
   $ pdv(cal(L), A_(k l)) &= sum_(i=1)^(m) pdv(cal(L), y_(i)) pdv(y_(i), A_(k l))  \
   &= sum_(i=1)^(m) sum_(j=1)^(n) pdv(cal(L), y_(i)) pdv(A_(i j), A_(k l))x_(j)  \
   &= sum_(i) pdv(cal(L), y_(i)) delta_(i k) x_(l) \
   &= pdv(cal(L), y_(k) )x_(l) $
  which is a _very_ useful result in machine learning.

  #example(title: "Single Layer Network")[
     For a simple network with weights $W$, target vector $bold(t)$, output vector $bold(y) = W bold(x)$ and loss function $cal(L)(W) = 1/2 norm(W bold(x) - bold(t))^(2)$, we seek to find the gradient $grad_(W) cal(L)$.

     In coordinate form
     $ (W bold(x))_(i) - t_(i) = sum_(j=1)^(n) W_(i j)x_(j) -t_(i) $
     and using the chain rule to compute
     $ pdv(cal(L), W_(i j)) &= pdv(, W_(i j))[ 1/2 ( sum_(k=1)^(n)W_(i k)x_(k) - t_(i) )^(2) ] \
     &=  underbrace( (sum_(k=1)^(n)W_(i k)x_(k) - t_(i)) , "define as "r_(i)) underbrace(x_(j), inline(pdv(,W_(i j)(dot.c)))) \
     &= ((W bold(x))_(i) - t_(i))x_(j) $

     Now we connect this the vector form to say $bold(r) = W bold(x) - bold(t)$ such that
     $ pdv(cal(L), W_(i j)) &= r_(i)x_(j) \
     (grad_(W) cal(L))_(i j) &= (W bold(x) - bold(t))_(i) x_(j) $
     Then by the *outer product*
     $ bold(r) bold(x)^(T) = (W bold(x) - bold(t)) bold(x)^(TT) \
     grad_(W) cal(L) = (W bold(x) - bold(t)) bold(x)^(TT) $
     $square.stroked.big$
  ]
  #align(center)[
  #table(
  columns: (auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Identities for Computing Gradients*]
  ),

  $pdv(,bold(X)) bold(f)(bold(X))^(TT) = ( pdv(bold(f)(bold(X)), bold(X) )^(TT))$,
  $pdv(,bold(X)) tr(bold(f)(bold(X))) = tr( pdv(bold(f)(bold(X)), bold(X) ))$,
  $pdv(,bold(X)) det(bold(f)(bold(X))) = det(bold(f)(bold(X))) tr(bold(f)(bold(X))^(-1) pdv(bold(f)(bold(X)), bold(X) ))$, 
  $pdv(,bold(X)) bold(f)(bold(X))^(-1) = -bold(f)(bold(X))^(-1) pdv(bold(f)(bold(X)), bold(X) ) bold(f)(bold(X))^(-1)$,
  $pdv(,bold(X)) bold(x)^(TT)bold(a) = bold(a)^(TT)$,
  $pdv(,bold(X)) bold(a)^(TT)bold(x) = bold(a)^(TT)$,
  $pdv(,bold(X)) bold(a)^(TT)bold(X)bold(b) = bold(a) bold(b)^(TT)$,
  $pdv(,bold(X)) bold(x)^(TT)bold(A)bold(x) = bold(x)^(TT) (bold(A) + bold(A)^(TT))$,

  )
]

  ]
  
)

