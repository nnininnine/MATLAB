    
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ A_out,timeVal ] = Gaussian_Inv( A )
    time = tic;
    A(:,4:6) = eye(3);
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
    a01 = a01/alpha11;
    a21 = a21/alpha11;
    A02 = (A02 -(a01*a12t));
    A22 = (A22 -(a21*a12t));
    a01 = zeros(size(a01));
    a21 = zeros(size(a21));
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
  for i = 1:3
    ATR(i,:) = ATR(i,:)/ATL(i,i);
  end
  A_out = [ ATR ];
  timeVal = toc(time);

return
