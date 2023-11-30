using Printf

function newtonRaphson(f, fp, x0, iterations)
    #x0 is the starting value of x
    #xn is the next value in the iteration
    xn = 0
    println("x starting value: $x0")
    for i in 1:iterations
        xn = x0 - f(x0)/fp(x0)
        x0 = xn
        println(xn)
    end        

    println("Root approximation: $xn after $iterations")
end

function fixPoint(iterations, x0, f, stepSize)
    i = 0
    xn = 0
    #A big number for currentStepSize to represent infinity
    currentStepSize = Inf
    println("Iteration\tX-value\t\t\tStep size")
    println("================================================")
    #println("x starting value: $x0")
    while i < iterations && currentStepSize > stepSize
        xn = x0 - f(x0)
        currentStepSize = abs(x0 - xn)
        x0 = xn
        println("$i\t\t$xn\t$currentStepSize")
        i += 1
    end

    if currentStepSize < stepSize
        println("A step size of less then: $stepSize was achieved at iteration: $i.")
        println("The exact step size value: $currentStepSize.")
    else
        println("The desired step size was not achieved in $i iterations.")
    end
end