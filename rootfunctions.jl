using Printf

#Newton Raphson method for finding the root of a function fast.
#Tested with function f(x) = x^2 -3 and its derivative fp(x) = 2x
#at newtonRaphson(f, fp, 3, 4)
#Change functions and input as needed.
function newtonRaphson(f, fp, x0, iterations)
    #x0 is the starting value of x
    #xn is the next value in the iteration
    xn = 0
    println("Iteration\tX-value\t")
    println("=========================")

    for i in 1:iterations
        println(string(lpad(i, 9), "\t", @sprintf("%.7f", x0), "\t"))
        xn = x0 - f(x0)/fp(x0)
        x0 = xn
    end        

    println("Root approximation: $xn after $iterations iterations.")
end

#Fix point method for finding a desired steplength towards the search of a root.
#Tested with function: f(x) = (x^5 -10x -1)/70 at values fixPoint( 6, 2, f, 0.01)
#Change functions and input as needed.
function fixPoint(iterations, x0, f, stepSize)
    i = 0
    xn = 0
    #A big number for currentStepSize to represent infinity
    currentStepSize = Inf
    println("Iteration\tX-value\t\tStep size")
    println("=========================================")
    #println("x starting value: $x0")
    while i <= iterations && currentStepSize > stepSize
        println(string(lpad(i, 9), "\t", @sprintf("%.7f", x0), "\t", @sprintf("%.7f", currentStepSize)))

        xn = x0 - f(x0)
        currentStepSize = abs(x0 - xn)
        x0 = xn
        i += 1
    end

    if currentStepSize < stepSize
        println("A step size of less then: $stepSize was achieved at iteration: $i.")
        println("The exact step size value: $currentStepSize.")
    else
        println("The desired step size was not achieved in $i iterations.")
    end
end