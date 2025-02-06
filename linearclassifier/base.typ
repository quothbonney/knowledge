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
    _(Switching to the notation from the notes because the bold vectors are exhausting to type out)_
    == Loss

    In the perceptron algorithm notes, we saw a classifer that was reinforced based on a loss function only sensitive to "true" and "false", or 0 and 1. In reality, we will have uncertainty near the decision boundary and want to penalize terms far from it more than terms close to it. We can formalize the old method as
    $ op("Loss")_(0, 1)(y(theta^(TT) x + theta_(0)))= [[y(theta^(TT) x + theta_(0) <= 0]]  $
    We can now introduce a more sensitive kind of loss called the *hinge loss* that increases the penalty for greater violations
    $ op("Loss")_(h)(y(theta^(TT)x + theta_(0))) = max{0, 1- y(theta^(TT) x + theta_(0))} $
    If the prediction is correct, then $1 - y(theta^(TT) x + theta_(0)) <= 0$ and the loss is $0$. Otherwise, it is a function of the distance to the hyperplane decision boundary.

    From the last bit, we reference the norm of orthogonal component of the projection of each point onto the hyperplane as the margin $gamma = frac(y_(i)(theta^(TT)x + theta_(0)), norm(theta)). $
    If we wish to set this margin to $gamma=1$, we can say
    $ min_(i)  frac(y_(i)(theta^(TT)x + theta_(0)), norm(theta)) = 1 $
    which implies $min_(i) y_(i)(theta^(TT)x + theta_(0)) = norm(theta)$ and that *the margin is inversely proportional to $norm(theta)$*. This intuition leads to the Passive Aggressive (PA) algorithm.
    == Passive-Aggressive Algorithm
    We can use this hinge loss to update our parameters based on
    $ theta^((k+1)) = op("argmin",
     limits: #true)_(theta)  lambda/2 norm(theta - theta^((k)))^(2)  + max{0, 1- y(theta^(TT) x + theta_(0))} $
     -  $colred(op("argmin",limits: #true)_(theta) norm(theta - theta^((k)))^(2))$ penalizes the model for deviating too strongly from the current parameters.
     - $colblu(max{0, 1- y(theta^(TT) x + theta_(0))})$ is the hinge loss that highly incorrect predictions have a strong signal.
     - $colgreen(lambda)$ is the *regularization parameter* that determines how much weight is given to preserving the old parameters versus aggressively correcting the mistake.
     If we define a *learning rate* parameter 
     $ eta := min{frac(op("Loss")_(h)(y theta^(TT) x), norm(x)^(2)), 1/lambda} $
     we can express the PA Algorithm in a form which strongly resembles a *perceptron update*
     $ theta^((k+1)) = theta^((k)) + eta y x $
     #proof[
       First lets validate that this perceptron update even exists. In an update case we should be able to express it as something along the lines of $theta^((k+1)) <- theta^((k)) - eta grad_(theta)cal(L)(theta^((k)), x)$ for some function $cal(L)$ and observation $x$.
       $ -grad_(theta)op("Loss")_(h)(y theta^(TT)x) = - grad_(theta) cases(1-y theta^(TT)x, 0 ) = cases(y x & "false pred.", 0&" true pred.") $
       which can always be formulated as an update. Now we can plug our update case into the loss function to solve for eta. Starting with the penalty term
       $ lambda/2 norm(theta + eta y x - theta)^(2) = lambda/2 norm(eta y x)^(2) = lambda/2 eta^(2)norm(x)^(2) $
       since $y={-1,1}$, $y^(2)=1$, and the term disappears. Next, for the nonzero case of our loss,
       $ 1 -y(theta + eta y x)^(TT)x=1 - (y theta^(TT) x + eta norm(x)^(2)) $
       Before the update then our loss was $l_(0) := 1 - y theta^(T)x$. Therefore we can say that the loss after update is $l_(0) - eta norm(x)^(2)$ and _evaluate this on the original criteria_. Defining a piecewise objective function $J(eta)$
       $ J(eta) = lambda/2  eta^(2) norm(x)^(2) + max{0, l_(0) - eta norm(x)^(2)} $
       and evaluate the piecewise condition  $l- eta norm(x)^(2)> 0$       $ eta < l/norm(x)^(2)  &implies J(eta) = lambda /2 eta^(2)norm(x)^(2) + l - eta norm(x)^(2) &implies dv(J, eta) = lambda eta norm(x) -norm(x) $
       which, set to 0, implies $eta = 1/lambda$. Next, the case $l - eta norm(x)^(2) <= 0$
       $ eta >= l/norm(x)^(2) = frac(1-y theta^(TT)x, norm(x)^(2)) = (op("Loss")_(h) (y theta^(TT)x))/norm(x)^(2) $
     ]
     
     #pagebreak()

#algorithm({
  import algorithmic: *
  Function("Passive-Aggressive", args: (${(x^((i)), y^((i))), i=1,dots,n}$, $lambda$, $T$), {
    Cmt[Initialize the search range]
    Assign[$theta$][$bold(0)$ (vector)]
    For(cond: $t =1,dots, T$, {
      For(cond: $i =1,dots, n$, {
      Assign([$eta$], [$min{frac(op("Loss")_(h)(y theta^(TT) x), norm(x)^(2)), 1/lambda} $])
      Assign([$theta$], [$theta + eta y^((i))x^((i))$])
    })
    })
    Return[*$theta$*]
  })
})
== Support Vector Machine
So far we have two *on-line algorithms* (defined by processing each example individually) that fulfill the goal of minimize errors (perceptron) and minimize loss (passive-aggressive). However, the support vector machine attempts to solve the miminal loss solution with all of the data at once. Hence, it is called *off-line algorithm*. Now we will attempt to minimize $theta, theta_(0)$ with respect to all the data in $S_(n)$ at once by evaluating 
$ arg min_(theta, theta_(0)) sum_(i=1)^(n)[lambda/2 norm(x)^(2) + op("Loss")_(h)(y^((i))(theta^(TT)x^((i)) + theta_(0))) ] $
How would someone go about computing this? It turns out that this SVM *objective function* can be reformulated as a quadratic program.




  ]
)
