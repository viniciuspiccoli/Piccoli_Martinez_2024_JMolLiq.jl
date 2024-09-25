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

# ╔═╡ ebffc62c-c33c-45ad-921e-e65b87b6d889
md"
# Minimum-distance distribution functions and Kirkwood-Buff integrals.
"

# ╔═╡ f2fa1b1a-4ce1-4a29-92db-d0993c13ca30
begin
	figs1 = Images.load("Figures/Cl_BF4_MDDFS_KBIs.png")
	figs1
end

# ╔═╡ dc9b8701-437a-48c2-a510-7e03a14727ed
md"
**Figure S1** - Comparison of Minimum-Distance Distribution Functions (MDDFs) and Kirkwood-Buff (KB) integrals for ionic liquid systems containing [EMIM]+ and [BMIM]+ cations with various anions. Panels A and D compare the cations [EMIM]+ and [BMIM]+; panels B and E compare [BF4]- anions paired with [EMIM]+ and [BMIM]+; and panels C and F compare [Cl]- anions paired with [EMIM]+ and [BMIM]+.
"

# ╔═╡ 23cde5c3-8452-4cbb-ac1a-b35544492512
begin
	figs2 = Images.load("Figures/Cl_NO3_MDDFS_KBIs.png")
	figs2
end

# ╔═╡ 30ec26c2-946c-4d0c-8df9-4830244d5a11
md"
**Figure S2** - Comparison of Minimum-Distance Distribution Functions (MDDFs) and Kirkwood-Buff (KB) integrals for ionic liquid systems containing [EMIM]+ and [BMIM]+ cations with various anions. Panels A and D compare the cations [EMIM]+ and [BMIM]+; panels B and E compare [NO3]- anions paired with [EMIM]+ and [BMIM]+; and panels C and F compare [Cl]- anions paired with [EMIM]+ and [BMIM]+.
"

# ╔═╡ 638e0eb2-1bc2-4bbb-99d9-416255251570
begin
	figs3 = Images.load("Figures/DCA_BF4_MDDFS_KBIs.png")
	figs3
end

# ╔═╡ 517fd90d-efaf-412a-8236-b5277a1b0a69
md"
**Figure S3** - Comparison of Minimum-Distance Distribution Functions (MDDFs) and Kirkwood-Buff (KB) integrals for ionic liquid systems containing [EMIM]+ and [BMIM]+ cations with various anions. Panels A and D compare the cations [EMIM]+ and [BMIM]+; panels B and E compare [BF4]- anions paired with [EMIM]+ and [BMIM]+; and panels C and F compare [DCA]- anions paired with [EMIM]+ and [BMIM]+.
"

# ╔═╡ 116ed100-c1e6-4d40-810c-3256760d660c
begin
	figs4 = Images.load("Figures/DCA_NO3_MDDFS_KBIs.png")
	figs4
end

# ╔═╡ 1ccacabe-79f5-4023-ab4c-28cad223c81b
md"
**Figure S4** - Comparison of Minimum-Distance Distribution Functions (MDDFs) and Kirkwood-Buff (KB) integrals for ionic liquid systems containing [EMIM]+ and [BMIM]+ cations with various anions. Panels A and D compare the cations [EMIM]+ and [BMIM]+; panels B and E compare [NO3]- anions paired with [EMIM]+ and [BMIM]+; and panels C and F compare [DCA]- anions paired with [EMIM]+ and [BMIM]+.
"

# ╔═╡ 2ea9bf6a-4e0f-455a-aaf3-471e017eb368
begin
	figs5 = Images.load("Figures/BF4_NO3_MDDFS_KBIs.png")
	figs5
end

# ╔═╡ 40323822-9e47-45ca-a4db-d1f5e1174a19
md"
**Figure S5** - Comparison of Minimum-Distance Distribution Functions (MDDFs) and Kirkwood-Buff (KB) integrals for ionic liquid systems containing [EMIM]+ and [BMIM]+ cations with various anions. Panels A and D compare the cations [EMIM]+ and [BMIM]+; panels B and E compare [NO3]- anions paired with [EMIM]+ and [BMIM]+; and panels C and F compare [BF4]- anions paired with [EMIM]+ and [BMIM]+.
"

# ╔═╡ 33a1fa66-dcaa-4720-99c8-c589541ed525
md"
# Preferential solvation parameter (``\Gamma ``)
"

# ╔═╡ 8192eca2-0e17-4c87-9273-6c12caa604f8
begin
	img = Images.load("Figures/Figure_All_pref_sol-SI.png")
	img
end

# ╔═╡ 1a9c69d4-13a7-4bb4-9fb8-d9fced0bc352
md"
**Figure S6** - Analysis of preferential solvation in all systems containing 0.5 mol/L. The comparison is performed side by side by plotting the preferential solvation parameters of all anion mixtures paired with [EMIM]+ (red) and with [BMIM]+ (green).

"

# ╔═╡ f8e4d668-9202-41c4-bf60-2e47fc329f50
begin
	img2 = Images.load("Figures/Figure5_kb_SI.png")
	img2
end

# ╔═╡ 8bd97810-6a42-4db2-9d11-8dc5a146ef13
md"
**Figure S7** - Kirkwood-Buff integrals for the cations in systems with [EMIM][Cl] + [EMIM][DCA] e [BMIM][Cl] + [BMIM][DCA]. The figure shows the KB integrals calculated considering 20 different simulations after 5 ns of NPT equilibration. Subfigures A), B), C), D), E) and F) represent EMIMDCA + EMIMBF4; D), E), and F) correspond to EMIMDCA + EMIMNO3; and G), H), and I) EMIMBF4 + EMIMNO3.
"

# ╔═╡ c4bbd1b7-8af7-416f-a064-c699aca58ca5
begin
	img3 = Images.load("Figures/Figure_All_pref_sol-SI.png")
	img3
end

# ╔═╡ d5375fc0-f4c1-4686-9e76-ca0bed0bdc35
md"
**Figure S8** - Preferential solvation parameters for all ionic liquid mixtures at various concentrations. The plot illustrates that from 0.5 to 1.5 mol L⁻¹, the presence of [BMIM]⁺ results in greater IL accumulation around the protein. However, at higher concentrations (>1.5 mol/L), [EMIM]⁺ shows less preferential exclusion. As the concentration increases, the preferential solvation parameter generally becomes negative, indicating a shift in solvation dynamics.

"

# ╔═╡ Cell order:
# ╟─610696f3-76c7-4be5-a105-3ea22b3f212c
# ╟─ebffc62c-c33c-45ad-921e-e65b87b6d889
# ╟─f2fa1b1a-4ce1-4a29-92db-d0993c13ca30
# ╟─dc9b8701-437a-48c2-a510-7e03a14727ed
# ╟─23cde5c3-8452-4cbb-ac1a-b35544492512
# ╟─30ec26c2-946c-4d0c-8df9-4830244d5a11
# ╟─638e0eb2-1bc2-4bbb-99d9-416255251570
# ╟─517fd90d-efaf-412a-8236-b5277a1b0a69
# ╟─116ed100-c1e6-4d40-810c-3256760d660c
# ╟─1ccacabe-79f5-4023-ab4c-28cad223c81b
# ╟─2ea9bf6a-4e0f-455a-aaf3-471e017eb368
# ╟─40323822-9e47-45ca-a4db-d1f5e1174a19
# ╟─33a1fa66-dcaa-4720-99c8-c589541ed525
# ╟─8192eca2-0e17-4c87-9273-6c12caa604f8
# ╟─1a9c69d4-13a7-4bb4-9fb8-d9fced0bc352
# ╟─f8e4d668-9202-41c4-bf60-2e47fc329f50
# ╟─8bd97810-6a42-4db2-9d11-8dc5a146ef13
# ╟─c4bbd1b7-8af7-416f-a064-c699aca58ca5
# ╟─d5375fc0-f4c1-4686-9e76-ca0bed0bdc35
