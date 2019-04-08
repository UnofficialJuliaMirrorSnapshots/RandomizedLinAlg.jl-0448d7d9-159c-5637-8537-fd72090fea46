# [Randomized Linear Algebra](@id Randomized)

RandomizedLinAlg.jl is a Julia package that provides some randomized algorithms for numerical linear algebra as advocated in [^Halko2011].

```@docs
reigen
rsvd
rsvd_fnkz
```

## Condition number estimate

```@docs
rcond
```

## Extremal eigenvalue estimates

```@docs
reigmin
reigmax
```

## Norm estimate

```@docs
rnorm
rnorms
```

## Interpolative Decomposition

```@docs
id
```

[^Halko2011]: Halko, Nathan, Per-Gunnar Martinsson, and Joel A. Tropp. "Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions." SIAM review 53.2 (2011): 217-288.

[^Dixon1983]: Dixon, John D. "Estimating extremal eigenvalues and condition numbers of matrices." SIAM Journal on Numerical Analysis 20.4 (1983): 812-814.

[^Liberty2007]: Liberty, Edo, et al. "Randomized algorithms for the low-rank approximation of matrices." Proceedings of the National Academy of Sciences 104.51 (2007): 20167-20172.