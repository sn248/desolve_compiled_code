ODE_gprotein  <- function(t,A,p){
  
  # get the reaction fluxes
#   ReactionFlux1 = p["kRL"] * A["L"] * A["R"] - p["kRLm"] * A["RL"]
#   ReactionFlux2 = p["kRdo"] * A["R"] - p["kRs"]
#   ReactionFlux3 = p["kRD1"] * A["RL"]
#   ReactionFlux4 = p["kG1"] * A["Gd"] * A["Gbg"]
#   ReactionFlux5 = p["kGa"] * A["G"] * A["RL"]
#   ReactionFlux6 = p["kGd"] * A["Ga"]
#   
#   unnamed <- p["unnamed"]
  
  ReactionFlux1 = p["kRL"][[1]] * A["L"][[1]] * A["R"][[1]] - p["kRLm"][[1]] * A["RL"][[1]]
  ReactionFlux2 = p["kRdo"][[1]] * A["R"][[1]] - p["kRs"][[1]]
  ReactionFlux3 = p["kRD1"][[1]] * A["RL"][[1]]
  ReactionFlux4 = p["kG1"][[1]] * A["Gd"][[1]] * A["Gbg"][[1]]
  ReactionFlux5 = p["kGa"][[1]] * A["G"][[1]] * A["RL"][[1]]
  ReactionFlux6 = p["kGd"][[1]] * A["Ga"][[1]]
  
  unnamed <- p["unnamed"][[1]]
  
#   odes <- c(dG_dt = 1/unnamed*(ReactionFlux4 - ReactionFlux5),
#             dGd_dt = 1/unnamed*(-ReactionFlux4 + ReactionFlux6),
#             dGa_dt = 1/unnamed*(ReactionFlux5 - ReactionFlux6),
#             dRL_dt = 1/unnamed*(ReactionFlux1 - ReactionFlux3),
#             dL_dt = 1/unnamed*(-ReactionFlux1),
#             dR_dt = 1/unnamed*(-ReactionFlux1 - ReactionFlux2),
#             dGbg_dt = 1/unnamed*(-ReactionFlux4 + ReactionFlux5)
#   )
  
    odes <- c(1/unnamed*(ReactionFlux4 - ReactionFlux5),
              1/unnamed*(-ReactionFlux4 + ReactionFlux6),
              1/unnamed*(ReactionFlux5 - ReactionFlux6),
              1/unnamed*(ReactionFlux1 - ReactionFlux3),
              1/unnamed*(-ReactionFlux1),
              1/unnamed*(-ReactionFlux1 - ReactionFlux2),
              1/unnamed*(-ReactionFlux4 + ReactionFlux5)
    )
    # browser()
  list(odes)
}

