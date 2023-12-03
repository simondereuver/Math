# Run this in your Julia environment to be able to use the package in this file
# using Pkg
# Pkg.add("Polynomials")

using Polynomials
using SymPy

#Horner's Scheme for fast evaluation of polynomial with a given x-value
#Tested with functions and values:
#P(x) = 2x^4 -3x^3 + 1x^2 - 2x^1 + 3 at values hornerScheme([2, -3, 1, -2], 2)
#P(x) is entered in format [2, -3, 1, -2] where the values are the constants
#Change input as needed
function hornerScheme(pHighOrder, x)
    currentValue = pHighOrder[1]
    for i in 2:length(pHighOrder)
        currentValue *= x
        #remove comment to see how algorithm calculates println("$currentValue + $(pHighOrder[i])")
        currentValue += pHighOrder[i]
        #remove comment to see how algorithm calculates println(currentValue)
    end

    #For printing and verification of correct polynom input only
    print("P(x) = ")
    exponent = length(pHighOrder) - 1
    for i in 1:length(pHighOrder)
        print("($(pHighOrder[i])x^$exponent) ")
        if (i < length(pHighOrder))
            print("+ ")
        end
        exponent -= 1
    end
    print("evaluated at x = $x resulted in $currentValue")
end

#Lagrangian method for creating Interpolation polynoms
#Tested with values:
#[(1,-15),(2,-1),(4,3),(5,17)] at values lagrangeIP([(1,-15),(2,-1),(4,3),(5,17)])
#Change input as needed
function lagrangeIP(pointsArray)
    n = length(pointsArray)
    expression = 0
    x = symbols(:x)
    print("Lagrange-IP passing through points ")
    for i in 1:n
        xi, yi = pointsArray[i]
        print("($xi,$yi) ")
        numerator = 1
        denominator = 1
        for j in 1:n
            xj, yj = pointsArray[j]
            if(pointsArray[i] != pointsArray[j])
                numerator *= (x-xj)
                denominator *= (xi-xj)
            end
        end
        term = yi * (numerator / denominator)
        expression += term
    end
    println("is: ")
    println(expression)
    expression = simplify(expression)
    println("Lagrange-IP simplified: ", expression)
end
