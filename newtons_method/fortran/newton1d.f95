!
! newton1d.f95
! 
! Josh Kaplan
!
! This is a generic implementation of Newton's Method in 1-dimension. 
! Edit the function, f, and it's derivative, df, for your specific problem.
!
! Compile: run "gfortran newton1d.f95 -o newton"
! Execute: run "./newton"
!

program NewtonsMethod

integer :: N    
real :: tol, x, f, df          

x   = 10                    ! Initial guess       <= EDIT THIS LINE
N   = 100                   ! Maximum Iterations  <= EDIT THIS LINE
tol = 1e-3                  ! Tolerance           <= EDIT THIS LINE

! Netwon's Method                   
do i = 1, N
    f  = 2*x**2 - 32        ! Function f(x)       <= EDIT THIS LINE 
    df = 4*x                ! Derivative f'(x)    <= EDIT THIS LINE
    x = x - f/df            ! Improved guess

    ! If close enough, exit loop
    if (ABS(f) < tol)  then   
        exit               
    end if
end do
print '("Converged to",f6.3," in",i2," iterations")', x, i

end program NewtonsMethod