using Printf

#Newton Raphson method for finding an approximation of a root
#Tested with values:
#f(x) = x^2 -3 and its derivative fp(x) = 2x at newtonRaphson(f, fp, 3, 4)
#Change input as needed
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
#Tested with values:
#f(x) = x - ((x^5 -10x -1)/70) at values fixPoint(f, 2, 6, 1e-2)
#f(x) = sqrt(pi + x) at values fixPoint(f, pi, 50, 1e-11)
#Change input as needed
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

#Bisection Method for finding an approximation of a root
#Tested with values:
#f(x) = 4x^2 + 3x - 3 at values bisectionMethod(f, 0, 1, 0.05)
#Change input as needed
function bisectionMethod(f, a, b, errorTolerance)
    i = 0
    c = 0
    println("Iteration\ta\t\tf(a)\t\tb\t\tf(b)\t\tc\t\tf(c)\t\tError")
    println()
    currentError = Inf
    if (f(a) * f(b) < 0) #We have a root in given interval
        currentError = b - a
        while currentError > errorTolerance
            c = a + (b - a) / 2 #Find midpoint
            currentError = b - a
            println(string(lpad(i, 9), "\t", @sprintf("%.7f", a), "\t", @sprintf("%.7f", f(a)), "\t", @sprintf("%.7f", b), "\t", @sprintf("%.7f", f(b)), "\t", @sprintf("%.7f", c), "\t", @sprintf("%.7f", f(c)), "\t", @sprintf("%.7f", currentError)))
            if ((f(a) * f(c)) < 0) #Root is on left side of midpoint
                b = c
            else
                a = c
            end
            i += 1
        end
    else
        println("No root in interval $a - $b.")
    end
    println("Root approximation: $c after $i iterations with an error of $currentError.");
end