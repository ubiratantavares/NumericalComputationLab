! Programa que resolve uma equação não-linear transcendental usando o método da força bruta
! Autor: Ubiratan Tavares
! Data: 07 de novembro de 2024
! Comando de compilação: 

program brute_force_test

    use module_brute_force

    implicit none

    integer, parameter :: num_points = 100000
    real(8) :: a, b
    real(8), dimension(:,:), allocatable :: roots
    integer :: num_roots

    a = 0.0
    b = 1.0
    
    ! calcular raízes e armazenar os resultados
    call brute_force(function, a, b, num_points, roots, num_roots)
    call display_result(roots, num_roots)

contains

    ! função que define f(x) = e^x - 2
    real(8) function function(x)
        real(8), intent(in) :: x
        function = exp(x) - 2.0
    end function function

end program brute_force_test
