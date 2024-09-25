### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ 610696f3-76c7-4be5-a105-3ea22b3f212c
begin
	import Pkg;
	Pkg.activate(".");
	Pkg.instantiate();
	using DataFrames, LinearAlgebra, CSV, Statistics,  PDBTools, EasyFit, ComplexMixtures, LaTeXStrings, PlutoUI, Unitful, Printf, PrettyTables;
	import Images;
	TableOfContents();
end

# ╔═╡ 9ad736e2-779d-11ef-2680-fbb35aa93397
md"""
# Informations of the initial boxes
"""

# ╔═╡ 56878f0a-d52e-429e-89c7-d687d45fdbbc
md"""

**Table S1** - Data used to create 20 different replicates for each ionic liquid (IL) concentration simulation. The reference concentration (**RC**), given in mol/L, indicates the intended initial concentration for system setup. **Box sides** represent the dimensions of the cubic box after equilibration, where all boxes initially started with a length of 95 Å. The table sequentially lists the number of cations (**Cation**), the first anion (**Anion 1**), the second anion (**Anion 2**), and water molecules (**Water**). For instance, in the system [EMIMCl]+[EMIMDCA], [Cl] is the anion 1, and [DCA] is the anion 2. Here, and in the other tables, the charges and underscores are omitted to simplify the representation.

"""

# ╔═╡ 6f9c5765-e771-4058-bfcc-4e8c3269672d
begin
	box_data = DataFrame(CSV.File("Tables_data/box_data.csv"))
end

# ╔═╡ 0d4bbdfc-8153-4e70-9182-aeeec066f342
md"""

**Table S2** - Data of the bulk concentration of the components in the 20 different replicates for each ionic liquid (IL) concentration simulation. Values represent the mean value in the 20 simulations. The reference concentration (**RC**), given in mol/L, indicates the intended initial concentration for system setup. **Box sides** represent the dimensions of the cubic box after equilibration, where all boxes initially started with a length of 95 Å. The table sequentially lists the number of cations (**Cation**), the first anion (**Anion 1**), the second anion (**Anion 2**), and water molecules (**Water**). For instance, in the system [EMIMCl]+[EMIMDCA], [Cl] is the anion 1, and [DCA] is the anion 2. Here, the charges and underscores are omitted to simplify the representation.

"""

# ╔═╡ 105a5d0f-2336-40a2-a7dd-e792a156a2be
md"
# Bulk concentration of the ions and water
"

# ╔═╡ 186846b7-efb3-4ddb-ac91-a9302453fd63
begin
	conc_data = DataFrame(CSV.File("Tables_data/bulk_concentration_data.csv"))
end

# ╔═╡ 9ccd12fa-bd55-4ebd-a41c-ec9edc8e06da
md"""
## Notes:

	This notebook contains data for creating the initial boxes and also the post-NPT concentrations of all components of the systems. We use the packages MolSimToolkit, PDBTools, DAtaFrames and CSV from Julia Lang. All the data is stored in CSV files and the Env contains a reproducible way to get the data by using the same versions apllied here.
"""

# ╔═╡ Cell order:
# ╟─610696f3-76c7-4be5-a105-3ea22b3f212c
# ╟─9ad736e2-779d-11ef-2680-fbb35aa93397
# ╟─56878f0a-d52e-429e-89c7-d687d45fdbbc
# ╟─6f9c5765-e771-4058-bfcc-4e8c3269672d
# ╟─0d4bbdfc-8153-4e70-9182-aeeec066f342
# ╟─105a5d0f-2336-40a2-a7dd-e792a156a2be
# ╟─186846b7-efb3-4ddb-ac91-a9302453fd63
# ╟─9ccd12fa-bd55-4ebd-a41c-ec9edc8e06da
