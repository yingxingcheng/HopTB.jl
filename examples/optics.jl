using HopTB, Test, LinearAlgebra

# Create model from openmx output
tm = HopTB.Interface.createmodelopenmx("GaAs.openmx39")

# Compute the SHG response
res = HopTB.Optics.get_shg(tm, 1, 2, 3, [1.5], -4.2, [5, 5, 5]; ϵ=0.1, scissor=0.69)

println(res)

# Use @test for proper validation
@test res[1] ≈ -255.84544 + 379.86693im atol=1.0e-3
