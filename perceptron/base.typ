#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content
#import "@preview/algorithmic:0.1.0"
#import algorithmic: * 

#lecture_notes(
  "Perceptron",
  "Jack David Carson",
  "February 3, 2025",
  [
    If we have some linear classifier that we wish to use to predict the value $y$ corresponding to a feature vector $bold(x)^((i)) in RR^(d)$  for $y in  {-1, 1}$, we can first formalize the problem as trying to select an ideal classifier $hat(h) in cal(H)$, the set of all classifiers. In functional form we can say $h : RR^(d) -> {1, -1}$ and that 
    classifier $hat(h)$ has some parameters $bold(theta)$ and evaluate its training error over training data $S_(n) = {bold(x)^((i)), y^((i)), i=1,dots, n}$
    $ Epsilon_(n)(h) = 1/n sum_(i=1)^(n)[[h(bold(x)^((i))) != y^((i)))]] $
    where $[["true"]]=1$ is an error and $[["false"]]=0$ is a correct classification. We define the actual classification  $h(bold(x)^((i)))$ in terms of its parameters and a "bias" term $bold(theta)_(0)$ as
    $ h(bold(x), bold(theta)) = sgn(bold(theta)^(TT)bold(x) + bold(theta)_(0)) = cases(+1 " for " bold(theta)^(TT)bold(x ) + bold(theta)_(0) >0 \ -1 " for" bold(theta)^(TT)bold(x) + bold(theta)_(0) <= 0) $
    In this case the classifier represents a *hyperplane* through $RR^(d)$. If $bold(theta)_(0)=bold(0)$ then the hyperplane intersects the origin.
    #align(center)[#image("images/20250203222614.png", width: 60%)]
    We say that the training data $S^(n)$ is *linearly seperable* if we can design a linear classifier that is correct for all $bold(x)^((i)), y^((i))$.

    == Perceptron Algorithm
    The *Perceptron Algorithm* is the simplest algorithm we can use to optimize the parameters of our linear classifier. Simply, we compute the product of the parameters with the observation as in $h(bold(x))$ and, if the sign of $y^((i))$ does not equal the sign of $bold(theta)^(TT) bold(x)^((i)) + bold(theta)_(0)$, then we know the observation is incorrect, and can update our parameters by $bold(theta) = bold(theta) + y^((i)) bold(x)^((i))$. In algorithmic notation:
\
\


#algorithm({

  Function("Perceptron", args: ("D", "T"), {
    Cmt[Initialize parameters]
    Assign[$theta$][$0$]  // weight vector
    Assign[$theta_0$][$0$]  // bias term

    State[]
    For(cond: $t = 1, dots, T$, {
      For(cond: $i = 1, dots, n$, {
        If(cond: $y^((i)) (bold(theta)^(TT) bold(x)^((i)) + bold(theta)_(0)) <= 0$, {
          Cmt[Update weight and bias]
          Assign[$bold(theta)$][$bold(theta)+ y^((i)) bold(x)^((i))$]
          Assign[$bold(theta)_0$][$bold(theta)_0 + y^((i))$]
        })
      })
    })
    State[]
    Return[$(theta, theta_0)$]
  })
})
== Perceptron Convergence
In order to understand convergence we can first specify a linearly seperable dataset formally as
*Definition:*   $S_(n) = {(x^((i)), y^((i))), i=1,dots, n}$ is *linearly seperable* with margin $gamma$ if there exists ssome margin
$ y^((i))(bold(theta)^(TT)bold(x)^((i)) + bold(theta_(0))) >= gamma norm(bold(theta)_(0)) $
for _all_ training points. We can further this understanding by considering the projection of a point $bold(x)^((i))$. The projection must of course exist on the hyperplane governed by $bold(theta)^(T)bold(x)_(0)^((i)) + bold(theta)_(0)=0$ for projected point $bold(x)_(0)$. Since this exists on our hyperplane the orthogonal complement (the distance from $x_(0)^((i))$ to $bold(x)^((i))$ is simply $ d= norm(bold(x)^((i)) - bold(x)_(0)^((i))) $ 

#set enum(numbering: "a)")
So, given that there exists some 
+ $bold(theta)^* "such that" y^((i))(bold(theta^*)^(TT)bold(x)^((i))+ bold(theta_(0)^*)) >= gamma norm(bold(theta)_(0)^*) $
+ All examples are bounded by $norm(bold(x)^((i))) <= R$ to ensure finite vectors 

The *perceptron convergence theorem* states that the percetron algorithm will make at most $R^(2) slash gamma^(2)$ mistakes on the way to find the correct classifier. Remarkably, this does *not* depend on the length of the feature vector nor the number of examples!
]
)
