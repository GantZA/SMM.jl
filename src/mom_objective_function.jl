mutable struct MoM
    log_prices::Array{Float64,1}
    weight_matrix::Array{Float64,2}
end

function (mom::MoM)(simulated_log_price_paths::Array{Float64,2})
    log_price_stats = select_moments(mom.log_prices)

    num_replications = size(simualted_log_prices, 2)
    G = zeros(num_replications, 5)

    summary_stats_mat = get_summary_stats(simualted_log_prices, mom.log_prices)
    G = summary_stats_mat - transpose(repeat(log_price_stats,1,num_replications))
    G = transpose(mean(G, dims = 1))
    return (transpose(G) * mom.weight_matrix * G)[1,1]
end
