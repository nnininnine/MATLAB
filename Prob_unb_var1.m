
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ b_out ] = Prob_unb_var1( A, b, gamma )

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );
for i = 1:gamma
  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%
    
       b = a1 * b + b; 
   
    %                       update line 1                        %
    %                             :                              %
    %                       update line n                        %

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

  end
end

  b_out = b;


return
