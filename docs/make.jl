import Pkg
Pkg.add([
    "Documenter",
    "CRC32",
    "PlutoSliderServer",
]
)

using Documenter
import PlutoSliderServer
import CRC32


# build html pages of the pluto notebooks, only if the jl was updated
#nbs = [
#    "$(@__DIR__)/src/plutonotebooks/SystemsData.jl",
#    "$(@__DIR__)/src/plutonotebooks/SupportingCurves.jl",
#]

#for nb in nbs
#    checksum_file = tempdir()*"/"*string(open(CRC32.crc32,nb))
#    if isfile(checksum_file)
#        println("Notebook $nb was not updated.")
#    else
#        PlutoSliderServer.export_notebook(nb)
#        open(checksum_file, "w") do io write(io, "") end
#    end
#end

makedocs(
    sitename = "Piccoli_Martinez_2024_JMolLiq.jl",
    format=Documenter.HTML(;
        mathengine=Documenter.MathJax3(),
        size_threshold_ignore=[
            "$(@__DIR__)/SystemsData.md",
            "$(@__DIR__)/SupportingCurves.md",
        ],
    ),
    pages = [
        "Home" => "index.md",
        "Complementary data" => "SystemsData.md",
        "Supporting MDDFs and KBIs" => "SupportingCurves.md",
    ],
)

deploydocs(
    repo = "github.com/viniciuspiccoli/Piccoli_Martinez_2024_JMolLiq.jl.git",
    target = "build",
    branch = "gh-pages",
    versions = ["stable" => "v^", "v#.#"],
)





#makedocs(
#    sitename = "Piccoli_Martinez_2024_JMolLiq.jl",
#    format=Documenter.HTML(;
#        mathengine=Documenter.MathJax3(),
#    ),
#    pages = [
#        "Home" => "index.md"
#    ],
#)



