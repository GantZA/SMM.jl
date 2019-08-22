module SMM

using SMMWeightMatrix
using Distributions
using Statistics
using HypothesisTests
using Random

include("mom_objective_function.jl")
include("summary_stats.jl")


export MoM, WeightMatrix, block_bootstrap_estimator
end # module
