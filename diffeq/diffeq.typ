#import "template.typ": *
#import "@preview/physica:0.9.4": *
#import "@preview/wrap-it:0.1.0": wrap-content

#let implies  = math.arrow.r.double.long 


#lecture_notes(
  "Differential Equations",
  "Jack David Carson",
  "February 2, 2025",
  [
    == Introduction 
    #definition(title: "Ordinary Differential Equations")[
      A differential equation is an equation between specified derivative on an unknown function, its values, and known quantities and functions. 

      Ordinary DEs are classified according to their order. The order of a DE is defined as the
largest positive integer, n, for which an nth derivative occurs in the equation.
    ]
    First we can say that any variables we are differentiating with respect to are _independent variables_, and any variables we are differentiating are _dependent variables_. For instance in $dv(y, t)$, $t$ is the ind. variable and $y$ is the dep. variable.
   For some quick notation we can remind ourselevs that $y^' = dv(y, x) " and " y'' = dv(y, x, 2)$ and more generally $y^((n)) = dv(y, x, n)$.

   A linear differential equation has a predictable form $ dv(y, x, n) +a_(n-1)(x) dv(y, x, n-1) + dots.c + a_(1)(x) dv(y, x) $
   where $bold(a)(x)$ is a function of only the independent variable. Anything that _doesn't_ look like this is a non-linear DE. In general linear DEs tend to have closed form solutions, while nonlinear ones often do not. In other words, for an $n$th order DE,
   $F(x, y, y ', y '', dots.c, y^((n)))=0$

   We say a DE is _homogeneous_  if $b(x) = 0$ and inhomogeneous for $b(x) != 0$ for the "constant term" $a_(1)(x) = b(x)$.

   == First Order Equations

   All first order equations can be spsecified in the form $dv(y, x) = f(x,y)$. It is considered _seperable_ if I can say $dv(y, x) = f(x) g(y)$. We can generally solve these by nicely saying
   $ dv(y, x) &= f(x)g(y) \
   integral 1/(g(y) )dif y &= integral f(x) dif x $
   which will have a solution.

   Similarly, all first order linear homogenous equations with constant coefficients in form $dv(y, x) + k y = 0$ can be expressed as
   $ dv(y, x) &= -k y \
   integral 1/y dif y &= - integral k dif x \
   ln |y| + c_(1) &= -k x + c_(2) \
   |y| &= e^(-k x + c) $


   We can say then that $|y| = e^(c) e^(-k x)$ or $y = plus.minus C e^(-k x)$.

  *Theorem:* $quad$ Lets suppose we have two solutions $y_(1)(x), y_(2)(x)$ to a linear differential equation $y ' + a(x)y = 0$. The linear combination $y = c_(1)y_(1)(x) + c_(2)y_(2)(x)$ is also a solution to $y '  + a(x) y = 0$. This is true of all _linear_ DE's. In the inhomogenous case where we have solutions $y_(1), y_(2)$ to $y ' + a(x) y = b_(i)(x)$, our sum $y_(1)(x) + y_(2)(x)$ is the solution to $y ' + a(x) y = b_(1)(x) + b_(2)(x)$

   == First Order, Linear, Inhomogenous
  A first order, linear, inhomogenous equation will be of the form $y ' + a(x)y = b(x)$. Let's suppose we have a solution $y_("hom")(x)$ for the homogeneous equation. We have some mystery function $phi(x)$ such that $y = phi(x)y_("hom")(x)$   is a solution the inhomogenous DE. We call this method *Variation of Parameters*.

  #example(title: $x y ' + 2 x y = x^(2)$)[
      In a more standard form we could divide by $x$ to say $y ' + 2y = x$. The hommogeneous version now is clearly $y ' + 2y = 0$ such that $y_("hom")(x) =  e^(-2x)$. We now introduce $phi(x)$ such that $y=phi(x) e^(-2x)$ and plug $y$ into $y ' + a(x) y = b(x)$ to get
      $ (phi(x)e^(-2x)) ' + 2 phi(x) e^(-2x) &= x \
        phi '(x) e^(-2x) - 2e^(-2x)phi(x) + 2 phi(x) e^(-2x) &= x \
        phi ' (x)e^(-2x) &= x $
  or $phi '(x) = x e^(2x)$ and $phi(x) = (1/2 x - 1/4)e^(2x) + C$ such that our general solution is
$ y(x) = 1/2 x - 1/4+ C e^(2x) $
  ]
    
  ]
)
