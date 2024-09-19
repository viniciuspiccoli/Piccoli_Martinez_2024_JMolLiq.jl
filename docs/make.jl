using Documenter
using Piccoli_Martinez_2024_JMolLiq

makedocs(
    sitename = "Piccoli_Martinez_2024_JMolLiq",
    format = Documenter.HTML(),
    modules = [Piccoli_Martinez_2024_JMolLiq]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
