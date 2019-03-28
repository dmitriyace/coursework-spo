( n -- 1/0 )
: primarity
    dup 1 < if
        ." Argument is not a natural number" cr
    else
        dup 1 = if 
            drop ( drop n )
            0 ( return 0 )
        else
            dup 2 = if
                drop ( drop n )
                1 ( 2 is a primarniy number )
            else 
                dup 
                2 do
                    dup r@
                    % 0 = if
                        dup r@ / ( new number )
                        r@
                        % 0 = if
                            drop ( drop n )
                            0 ( return 0, because mod{index} == 0 )
                            r> drop ( drop current index )
                            r@ >r ( and make index == limit )
                        then
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
