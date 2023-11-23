using Printf

function newtonRaphson(f, fprime, x0, iterations)
    #x0 is the starting value
    #xn is the next value, when n,
    xn = 0

    for i in 1:iterations
        xn = x0 - f(x0)/fprime(x0)
        x0 = xn
        println(xn)
    end        

    println(xn)
end