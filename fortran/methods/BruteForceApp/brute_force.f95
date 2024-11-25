module module_brute_force

    implicit none

contains

    ! função para calcular o passo
    real(8) function calculate_step(a, b, num_points)
        real(8), intent(in) :: a, b
        integer, intent(in) :: num_points
        calculate_step = (b - a) / num_points
    end function calculate_step

    ! função para verificar se os sinais são opostos
    logical function are_opposite_signs(func, a, b)
        real(8), external :: func
        real(8), intent(in) :: a, b
        are_opposite_signs = func(a) * func(b) < 0.0
    end function are_opposite_signs

    subroutine brute_force(func, a, b, num_points, roots, num_roots)
        real(8), external :: func
        real(8), intent(in) :: a, b
        integer, intent(in) :: num_points
        real(8), dimension(:,:), allocatable, intent(out) :: roots
        integer, intent(out) :: num_roots
        real(8) :: step, x
        real(8), dimension(:,:), allocatable :: temp_roots
        integer :: i

        step = calculate_step(a, b, num_points)
        num_roots = 0

        ! Alocar temporariamente para armazenar todas as possibilidades
        allocate(temp_roots(2, num_points))

        do i = 0, num_points
            x = a + i * step
            if (are_opposite_signs(func, x, x + step)) then
                num_roots = num_roots + 1
                temp_roots(1, num_roots) = x
                temp_roots(2, num_roots) = x + step
            end if
        end do

        ! Se encontrou raízes, aloca 'roots' apenas com o tamanho necessário
        if (num_roots > 0) then
            allocate(roots(2, num_roots))
            roots(:, 1:num_roots) = temp_roots(:, 1:num_roots)
        else
            if (allocated(roots)) then
                deallocate(roots)
            end if
        end if

        ! Desalocar o temporário
        deallocate(temp_roots)

    end subroutine brute_force

    ! função para verificar se a lista está vazia
    logical function is_list_empty(num_roots)
        integer, intent(in) :: num_roots
        is_list_empty = (num_roots == 0)
    end function is_list_empty

    ! subrotina para exibir o resultado
    subroutine display_result(roots, num_roots)
        real(8), dimension(:,:), allocatable, intent(in) :: roots
        integer, intent(in) :: num_roots
        integer :: i
        
        if (is_list_empty(num_roots)) then
            print *, "Não encontrou raíz(es) no intervalo."
        else
            print *, "Há raíz(es) no sub-intervalos:"	    
	    do i = 1, num_roots
                print *, "(", roots(1, i), ", ", roots(2, i), ")"
            end do
        end if
    end subroutine display_result

end module module_brute_force

