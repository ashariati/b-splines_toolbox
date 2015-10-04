# b-splines_toolbox

project_1.m :

    -   Deploying this runs the main program. A GUI appears and the user may
        click a set of deBoor points and the corresponding b-spline will be
        drawn as soon as the user as clicked at least 5 points. The spline will be
        redrawn and updated with each subsequent click. Also drawn are the computed
        Bezier points. 

    -   This program satisfies P1 (1), P2 (1), and P2 (2) where m = 3.

    -   If you want to change the number of times each curve is subdivided, 
        change the value of "n" in this file.

test_deCasteljau.m :

    -   This is a simple program which is only used to test the generalized version 
        of deCasteljau's which is used to draw Bezier curves of degree m.

    -   This program satisfies P2 (2) completely.

    -   To change the degree of the polynomial Bezier curve change "N".

    -   To change the number of subdivions performed change "n".


proj1.pdf :

    -   The written solution to P1 (2).
