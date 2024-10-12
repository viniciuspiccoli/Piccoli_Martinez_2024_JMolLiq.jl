using Plots
using LaTeXStrings

# Define the data for each IL
data = [
    # IL name, RC (mol/L), Γwp
    ("[EMIMCl]", 0.50, -105.197),
    ("[EMIMCl]", 1.00, -45.774),
    ("[EMIMCl]", 1.50, -16.400),
    ("[EMIMCl]", 2.00, -33.365),
    ("[EMIMCl]", 2.50, -8.496),
    ("[EMIMCl]", 3.00, 16.021),
    ("[BMIMCl]", 0.50, -356.299),
    ("[BMIMCl]", 1.00, -103.790),
    ("[BMIMCl]", 1.50, -42.476),
    ("[BMIMCl]", 2.00, -23.029),
    ("[BMIMCl]", 2.50, -12.502),
    ("[BMIMCl]", 3.00, 2.092),
    ("[EMIMDCA]", 0.50, -1866.255),
    ("[EMIMDCA]", 1.00, -1436.816),
    ("[EMIMDCA]", 1.50, -698.987),
    ("[EMIMDCA]", 2.00, -440.605),
    ("[EMIMDCA]", 2.50, -34.197),
    ("[EMIMDCA]", 3.00, -39.993),
    ("[BMIMDCA]", 0.50, -4084.857),
    ("[BMIMDCA]", 1.00, -2624.808),
    ("[BMIMDCA]", 1.50, -1170.839),
    ("[BMIMDCA]", 2.00, -496.559),
    ("[BMIMDCA]", 2.50, 64.950),
    ("[BMIMDCA]", 3.00, 172.238),
    ("[EMIMNO3]", 0.50, -547.909),
    ("[EMIMNO3]", 1.00, -308.163),
    ("[EMIMNO3]", 1.50, -239.711),
    ("[EMIMNO3]", 2.00, -72.261),
    ("[EMIMNO3]", 2.50, -61.728),
    ("[EMIMNO3]", 3.00, 14.201),
    ("[BMIMNO3]", 0.50, -855.254),
    ("[BMIMNO3]", 1.00, -477.283),
    ("[BMIMNO3]", 1.50, -273.608),
    ("[BMIMNO3]", 2.00, -108.104),
    ("[BMIMNO3]", 2.50, -20.392),
    ("[BMIMNO3]", 3.00, 65.173),
    ("[EMIMBF4]", 0.50, -346.736),
    ("[EMIMBF4]", 1.00, -175.647),
    ("[EMIMBF4]", 1.50, -104.075),
    ("[EMIMBF4]", 2.00, -18.232),
    ("[EMIMBF4]", 2.50, 76.056),
    ("[EMIMBF4]", 3.00, 112.685),
    ("[BMIMBF4]", 0.50, -615.927),
    ("[BMIMBF4]", 1.00, -359.319),
    ("[BMIMBF4]", 1.50, -204.319),
    ("[BMIMBF4]", 2.00, 87.075),
    ("[BMIMBF4]", 2.50, 154.834),
    ("[BMIMBF4]", 3.00, 179.008)
]


# plot headings
default(legend=:bottomright,
      fontfamily="Computer Modern",
      linewidth=2, framestyle=:box,
      grid=false)
scalefontsizes(); scalefontsizes(1.4)


# Create a 2x2 plot layout
plot_layout = @layout [a b; c d]

# Initialize the plots
p1 = plot(title = "", xlabel = L"\textrm{RC\ (mol L^{-1})}", ylabel = L"\Gamma_{wp}")
hline!([0],ls=:dot, color="gray", label=false)

p2 = plot(title = "", xlabel = L"\textrm{RC\ (mol L^{-1})}", ylabel = L"\Gamma_{wp}")
hline!([0],ls=:dot, color="gray", label=false)

p3 = plot(title = "", xlabel = L"\textrm{RC\ (mol L^{-1})}", ylabel = L"\Gamma_{wp}")
hline!([0],ls=:dot, color="gray", label=false)

p4 = plot(title = "", xlabel = L"\textrm{RC\ (mol L^{-1})}", ylabel = L"\Gamma_{wp}")
hline!([0],ls=:dot, color="gray", label=false)

# Function to add data to the plot
function add_plot!(p, il_data, color, shape, il)
    rc = [row[2] for row in il_data]
    gamma_wp = [row[3] for row in il_data]
    scatter!(p, rc, gamma_wp, marker = shape, color = color, label=il)
    plot!(p, rc, gamma_wp, seriestype = :line, color = color, linecolor = color, alpha = 0.4, label=false) # add guide lines
end

# Define the IL pairs and their properties
il_pairs = [
    (["[EMIMDCA]", "[BMIMDCA]"], p1),
    (["[EMIMCl]", "[BMIMCl]"], p2),
    (["[EMIMNO3]", "[BMIMNO3]"], p3),
    (["[EMIMBF4]", "[BMIMBF4]"], p4)
]

# Marker and color properties
colors = Dict("[EMIMDCA]" => :blue, "[BMIMDCA]" => "#FF6E6E", "[EMIMCl]" => :blue, "[BMIMCl]" => "#FF6E6E",
              "[EMIMNO3]" => :blue, "[BMIMNO3]" => "#FF6E6E", "[EMIMBF4]" => :blue, "[BMIMBF4]" => "#FF6E6E")
shapes = Dict("[EMIMDCA]" => :circle, "[BMIMDCA]" => :square, "[EMIMCl]" => :circle, "[BMIMCl]" => :square,
              "[EMIMNO3]" => :circle, "[BMIMNO3]" => :square, "[EMIMBF4]" => :circle, "[BMIMBF4]" => :square)

# Loop through the pairs and populate the plots
for (il_pair, p) in il_pairs
    for il in il_pair
        il_data = filter(row -> row[1] == il, data)
        add_plot!(p, il_data, colors[il], shapes[il], il)
    end
end

# Display the final layout
plot(p1, p2, p3, p4, layout = plot_layout, size = (800, 600), framestyle=:box, dpi=750)



savefig("pref_hydration.png")