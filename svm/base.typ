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
  "Support Vector Machine",
  "Jack David Carson",
  "February 7, 2025",
  [
== Support Vector Machine
We have seen previously the perceptron algorithm and the passive-aggressive algorithm, two *on-line algorithms* (defined by processing each example individually) that fulfill the goal of minimize errors (perceptron) and minimize loss (passive-aggressive). However, the support vector machine attempts to solve the miminal loss solution with all of the data at once. Hence, it is called *off-line algorithm*. Now we will attempt to minimize $theta, theta_(0)$ with respect to all the data in $S_(n)$ at once by evaluating 
$ arg min_(theta, theta_(0)) sum_(i=1)^(n)[lambda/2 norm(x)^(2) + op("Loss")_(h)(y^((i))(theta^(TT)x^((i)) + theta_(0))) ] $
How would someone go about computing this? It turns out that this SVM *objective function* can be reformulated as a quadratic program.

$ 1/n sum_(i=1)^(n) [ zeta_(i) + lambda/2 norm(theta)^(2)] " subject to " cases(y^((i)) (theta^(TT)x^((i)) + theta_(0a)) >= 1 - zeta_(i), zeta_(i) >= 1 ) $
In practice, this algorithm does not scale well to computation, with a complexity of $cal(O)(n^(3))$. In practice we can use a simple *stochastic gradient descent* algorithm, by taking exactly one term $i$ randomly, and applying its gradient onto $theta$. The *Pegasos algorithm* relies on 
$ theta &<- theta - eta grad_(theta)[op("Loss")_(h)(y^((i))(theta^(TT)x^((i)) + theta_(0))) +  lambda/2 norm(x)^(2) ] \
& = (1 - lambda eta)theta + eta cases(y^((i))x^((i)) &" for " y^((i))(theta^(TT)x^((i))) <= 1, 0 &" otherwise") $
The derivation of this is quite simple, and its implementation in a gradient descent loop is _much_ more efficient.




  ]
)
