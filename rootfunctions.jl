using Printf

#Newton Raphson method for finding an approximation of a root
#Tested with function f(x) = x^2 -3 and its derivative fp(x) = 2x
#at newtonRaphson(f, fp, 3, 4)
#Change functions and input as needed
function newtonRaphson(f, fp, x0, iterations)
    x = x0 #x0 is the initial value of x or initial guess
    xn = 0 #xn is the next value in the iteration
    println("Iteration\tX-value\t")
    println("=========================")
    for i in 1:maxIterations
        println(string(lpad(i, 9), "\t", @sprintf("%.7f", x), "\t"))
        xn = x - f(x)/fp(x)
        x = xn
    end        

    println("Root approximation: $xn after $iterations iterations.")
end

#Fix point method for finding a desired steplength towards the search of a root
#Tested with functions and values:
#f(x) = x - ((x^5 -10x -1)/70) at values fixPoint(f, 2, 6, 1e-2)
#f(x) = sqrt(pi + x) at values fixPoint(f, pi, 50, 1e-11)
#Change functions and input as needed
function fixPoint(f, x0, maxIterations, stepLength)
    i = 0
    x = x0 #x0 is the initial value of x or initial guess
    xn = 0 #xn is the next value in the iteration
    currentStepLength = Inf #Infinity current step size until iteration has started
    println("Iteration\tX-value\t\tStep size")
    println("=========================================")
    while i <= maxIterations && currentStepLength > stepLength
        println(string(lpad(i, 9), "\t", @sprintf("%.7f", x), "\t", @sprintf("%.13f", currentStepLength)))
        xn = f(x)
        currentStepLength = abs(x - xn)
        x = xn
        i += 1
    end
    if currentStepLength < stepLength
        println("A step size of less then: $stepLength was achieved at iteration: $i.");
        println("The exact step size value: $currentStepLength.");
    else
        println("The desired step size was not achieved in $i iterations.");
    end
end
