#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
List odes_gprotein(double t, NumericVector A, NumericVector p) {
 
  // get the right lengths and set volume of the compartment  
  
  double unnamed = p[8];
  NumericVector odes_vec(A.length());

 
  double ReactionFlux1 = p[1] * A[4] * A[5] - p[0] * A[3];
  double ReactionFlux2 = p[2] * A[5] - p[3];
  double ReactionFlux3 = p[4] * A[3];
  double ReactionFlux4 = p[5] * A[1] * A[6];
  double ReactionFlux5 = p[6] * A[0] * A[3];
  double ReactionFlux6 = p[7] * A[2];
  
  odes_vec[0] = 1/unnamed * (ReactionFlux4 - ReactionFlux5);
  odes_vec[1] = 1/unnamed * (-ReactionFlux4 + ReactionFlux6);
  odes_vec[2] = 1/unnamed * (ReactionFlux5 - ReactionFlux6);
  odes_vec[3] = 1/unnamed * (ReactionFlux1 - ReactionFlux3);
  odes_vec[4] = 1/unnamed * (-ReactionFlux1);
  odes_vec[5] = 1/unnamed * (-ReactionFlux1 - ReactionFlux2);
  odes_vec[6] = 1/unnamed * (-ReactionFlux4 + ReactionFlux5);
  
  return Rcpp::List::create(odes_vec);

}




