
% Programmed by: Name of author
%                Email of author

function [ A_out ] = gauss_jordan_unb( A )
  
  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%
    if  not ((alpha11 == 0) && isequal(a21,zeros(size(a21))))
        while alpha11 == 0
            temp = a10t;
            a10t = A20(1,:);
            A20(1,:) = temp;

            temp = alpha11;
            alpha11 = a21(1,:);
            a21(1,:) = temp;

            temp = a12t;
            a12t = A22(1,:);
            A22(1,:) = temp;

        end
        a21 = a21/-alpha11;
        A22 = A22 + a21*a12t;
        a01 = a01/-alpha11;
        A02 = A02 + a01*a12t;
        a01 = zeros(size(a01));
        a21 = zeros(size(a21));
    end
    
    %                       update line 1                        %
    %                             :                              %
    %                       update line n                        %

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];
  [m,n] = size(A);
  for i = 1:m
     if not (A_out(i,i) == 0)
        A_out(i,:) = A_out(i,:)/A_out(i,i); 
     end
  end

return
