( n -- 1/0 )
: prime
    dup 1 < if
        ." Argument is less than 1" cr
    else
        dup 1 = if 
            drop ( drop n )
            0 ( return 0 )
        else
            dup 2 = if
                drop ( drop n )
                1 ( 2 is a prime number )
            else 
                dup ( limit n.Sqrt{n} is better but this method is easier )
                2 do
                    dup r@
                    % 0 = if
                        drop ( drop n )
                        0 ( return 0, because mod{index} == 0 )
                        r> drop ( drop current index )
                        r@ >r ( and make index == limit )
                    then
                loop
                0 = if
                    0 
                else
                    drop ( drop n )
                    1 ( return 1 )
                then
            then
        then
    then
;

( n -- addr{1/0} )
: prime-allot
    prime ( calculate result )
    cell% allot ( allocate 1 cell )
    dup ( duplicate address. Stack: result, addr, addr )
    rot  ( result, addr, addr -> addr, addr, result )
    swap ( addr, addr, result -> addr, result, addr )
    ! ( store result at addr. Stack: addr )
;
