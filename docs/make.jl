import Pkg
Pkg.add([
    "Documenter",
    "Plots",
    "MolSimToolkit",
    "Unitful",
    "EasyFit",
    "Literate",
    "PlutoStaticHTML",
]
)
using Documenter
using Plots
using MolSimToolkit
using Unitful
using EasyFit
using Literate
using PlutoStaticHTML: build_notebooks, BuildOptions, documenter_output

# Building markdown from Pluto notebooks
#pluto_notebooks_dir = joinpath(@__DIR__, "src", "pluto_notebooks")
#bopts = BuildOptions(
#    pluto_notebooks_dir; 
#    output_format=documenter_output, 
#    previous_dir=pluto_notebooks_dir,
#)
#build_notebooks(bopts)

makedocs(
    sitename = "Piccoli_Martinez_2024_JMolLiq.jl",
    format=Documenter.HTML(;
        mathengine=Documenter.MathJax3(),
    ),
    pages = [
        "Home" => "index.md"
    ],
)

deploydocs(
    repo = "https://github.com/viniciuspiccoli/Piccoli_Martinez_2024_JMolLiq.jl.git",
    target = "build",
    branch = "gh-pages",
    versions = ["stable" => "v^", "v#.#"],
)



#makedocs(
#    sitename = "Piccoli_Martinez_2024_JMolLiq",
#    format = Documenter.HTML(),
#    modules = [Piccoli_Martinez_2024_JMolLiq]
#)


# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
