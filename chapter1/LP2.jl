using JuMP, GLPK

# Prepare optimization model
m = Model(with_optimizer(GLPK.Optimizer))

# Set vectors
# c is a column vector
c = [1; 2; 5]
# A is the matrix
A = [-1 1 3;
	1 3 -7]
# b is the constraint matrix
b = [-5; 10]

# Declare x variables and constraints
@variable(m, x[1:3] >= 0)
# Set objective function using sum/i notation
@objective(m, Max, sum( c[i]*x[i] for i in 1:3))

# Set constraints
@constraint(m, constraint[j in 1:2],
	sum(A[j,i]*x[i] for i in 1:3) <= b[j])
@constraint(m, bound, x[1] <= 10)

JuMP.optimize!(m)

println("Optimal solutions:")
for i in 1:3
	println("x[$i] = ", JuMP.value(x[i]))
end

println("Dual variables:")
for j in 1:2
	println("dual[$j] = ", JuMP.shadow_price(constraint[j]))
end