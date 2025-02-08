#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content

#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#let colred(x) = text(fill: red, $#x$)
#let colblu(x) = text(fill: blue, $#x$)
#let colgreen(x) = text(fill: olive, $#x$)

#let implies  = math.arrow.r.double.long 


#lecture_notes(
  "Linear Classifier",
  "Jack David Carson",
  "February 5, 2025",
  [

    #definition(title: "Linear Regression")[
       A linear regression function is merely a linear function of the feature vectors and model parameters, such as
       $ f(x; theta, theta_(0)) = theta^(T)x + theta_(0) = sum_(i=1)^(n) theta_(i)x_(i)+ theta_(0). $
       for parameter choices $theta in cal(R)^(d), theta_(0) in cal(R)$ that give rise to set of functions $f in cal(F)$.
    ]
    We usually seek to find the ideal parameters $hat(theta), hat(theta_(0))$ based on training set $S_(n)$. In order to optimize we must first of course specify _optimimality_
    + How do we measure error? I.e. how do we say $theta_(a)$ is better than $theta_(b)$?
    + What algorithm can be used to optimize the training criterion?
    + If the training set is not _much_ larger than the parameter dimension $d$, there may be directions in the parameter space that are free variables unconstrained by the data. How do we set those degrees of freedom and regulate them?
    == Error
    If we have a simple loss function $op("Loss")(z) = z^(2) slash 2$, then our SVM is defined by
    $ R_(n)(theta) = 1/n sum_(i=1)^(n) op("Loss")(y^((i)) - theta^(TT)x^((i))) = 1/n sum_(i=1)^(n) (y^((i)) - theta^(TT)x^((i)))^(2) slash 2 $
    For entry $i$ we can optimize the criterion by $grad_(theta)(y^((i)) - theta^(TT)x^((i)))^(2) slash 2 = - (y^((i)) - theta^(TT)x^((i))) x^((i))$ via the chain rule. However, if we want to be more ambitious, we would like a closed form solution to the whole SVM instantly. We can solve for parameter $hat(theta)$ by
    $ grad_(theta)R(theta)_(theta = hat(theta)) &= 1/n sum_(i=1)^(n) grad_(theta)[ (y^((i)) - theta^(TT)x^((i)))^(2) slash 2  ] \
    &= 1/n sum_(i=1)^(n) [ - (y^((i)) - hat(theta)^(TT)x^((i))) x^(i)  ] \
    &= underbrace(-1/n sum_(i=1)^(n) y^((i))x^((i)), :=b) + underbrace(1/n sum_(i=1)^(n)(hat(theta)^(TT)x^((i)) )x^((i)) , :=A) \
    &:= -b + A hat(theta) = 0 $
    Remarkably, we have derived our way down to the most fundemental formula of linear algebra $A x = b$. For very large examples of feature sizes, even this is still _technically_ less efficient than gradient descent. But it's a nice thought. We can actually take this from coordinate form into matricies as
    $ b= 1/n X^(TT)bold(y), quad A = 1/n X^(T)X $
    for $X^(TT)$ is the matrix of the feature vectors stacked as columns, and $bold(y)^(TT) = [y^((1)), y^((2)), dots, y^((n))]^(TT)$ .
    == Regularization
    In the event that matrix $A$ is not invertible, the problem is ill-posed without the use of a regularization term. We've seen many times now the formula for loss with regularization. We can express it now in terms of an objective function $J_(n, lambda)(theta) = lambda/2 norm(theta)^(2) + R_(n) $ Using our previous result we can say that
    $ grad_(theta)J_(n, lambda) = lambda theta - (y^((i)) - theta^(TT)x^((i)))x^((i)) $

    where theregularization parameter $theta >= 0$ quantifies the trade-off between keeping the parameters small – minimizing the squared norm $norm(theta)^(2) slash 2$--and fitting to the training data-–minimizing the empirical risk$ R_n(theta)$. The use of this modified objective is known as *Ridge regression*.

    It is reasonable that large values of $lambda$ will have a negative impact on the training error, since it is directly impeding the model from fitting the training dataset in the perfectly optimal way, in the hope that it will fit the test dataset better.
  ]
)
