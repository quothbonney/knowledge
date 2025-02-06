#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content



#lecture_notes(
  "Backpropogation",
  "Jack David Carson",
  "February 1, 2025",
  [
    Finding good parameters for a machine learning model relies on the fact we can compute the gradient of a learning objective with respect to the parameters of a model. The \textbf{backpropogation} algorithm is an efficient way to compute the gradient of an error function with respect to the model parameters.

    In deep learning, the chain rule is used to the extreme where the function $bold(y)$ is computed as a many level function composition
    $bold(y) = (f_(K) compose f_(K-1) compose dots.c compose f_(1) ) (bold(x))$ for $x$ inputs and $y$ observations.
    #align(center)[
      #image("images/20250201213146.png", width: 70%)
    ]
    In a neural network with multiple layers we have functions $f_(i) (bold(x)_(i-1))=sigma(A_(i-1)bold(x)_(i-1)+bold(b)_(i-1))$ in layer $i$ for *sigmoid activation function* such as $sigma(bold(x)) = 1/(1+e^(-x))$. For instance, we can have loss function $ cal(L)(bold(theta)) = norm(bold(y) - bold(f)_(K)(bold(theta), bold(x))^(2)) $
    where $bold(theta)= {A_(0), bold(b)_(0), dots, A_(K-1), bold(b)_(K-1)}$ contains the previous layers of the model. We apply the chain rule to say
    $ pdv(cal(L), bold(theta)_(K-1)) &= pdv(cal(L), bold(f)_(K)) pdv(bold(f)_(K), bold(theta)_(K-1)) \
     pdv(cal(L), bold(theta)_(K-1)) &= pdv(cal(L), bold(f)_(K)) pdv(bold(f)_(K), bold(f)_(K-1)) pdv(bold(f)_(K-1), bold(theta)_(K-2))\ 
     pdv(cal(L), bold(theta)_(i)) &= pdv(cal(L), bold(f)_(K)) pdv(bold(f)_(K), bold(f)_(K-1)) dots.c pdv(bold(f)_(i+2), bold(f)_(i+1)) pdv(bold(f)_(i+1), bold(theta)_(i)) $
    

  ]
)
