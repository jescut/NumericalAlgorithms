# False Position
***
## Description
* Uses the false position method to estimate the root of a given function given a bracket interval.
## Inputs
*    func - the function being evaluated
*    xi - the lower guess
*    xu - the uper guess
*    es - the desired relative error ( default 0.0001%)    
*    maxiter - the number of iterations desired ( default 200)
## Outputs
*   root - the estimated root location
*   fx - the function evaluated at the root location
*   ea - the approximate relative erroe (%)
*   iter - how many iterations were performed
## Known Bugs
* Incorrect error
* Incorrect iterations 
