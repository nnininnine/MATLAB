function varargout = test1(varargin)
% TEST1 MATLAB code for test1.fig
%      TEST1, by itself, creates a new TEST1 or raises the existing
%      singleton*.
%
%      H = TEST1 returns the handle to a new TEST1 or the handle to
%      the existing singleton*.
%
%      TEST1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1.M with the given input arguments.
%
%      TEST1('Property','Value',...) creates a new TEST1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test1

% Last Modified by GUIDE v2.5 09-Dec-2019 14:23:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       'gui_mat3', ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before test1 is made visible.
function test1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test1 (see VARARGIN)

% Choose default command line output for test1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
if handles.rb_normal.Value == 1
    set(handles.edit_import,'enable','off');
else
    set(handles.edit_import,'enable','on');
end
set(handles.text_mode,'string','Upper');
% UIWAIT makes test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function n1_Callback(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n9 as text
%        str2double(get(hObject,'String')) returns contents of n9 as a double


% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    if handles.rb_normal.Value == 1
        set(handles.edit_import,'enable','off');
        B = [str2double(get(handles.n1,'string')) str2double(get(handles.n4,'string')) str2double(get(handles.n7,'string'));
             str2double(get(handles.n2,'string')) str2double(get(handles.n5,'string')) str2double(get(handles.n8,'string'));
             str2double(get(handles.n3,'string')) str2double(get(handles.n6,'string')) str2double(get(handles.n9,'string'));
             ];
        if handles.rb_inverse.Value == 1
            [A,timel] = gauss_jordan_inv(B);
            [A,times] = Gaussian_Inv(B);
            for i = 1:9
                if A(i) == -0
                    A(i) = 0;
                end
            end
        elseif handles.rb_upper.Value == 1
            [A,timel] = upper_loop(B);
            [A,times] = upper_unb(B);
        elseif handles.rb_lower.Value == 1
            [A,timel] = lower_loop(B);
            [A,times] = lower_unb(B);
        elseif handles.rb_diagonal.Value == 1
            [A,timel] = Diagonal_loop(B);
            [A,times] = Diagonal_unb(B);
            for i = 1:9
                if A(i) == -0
                    A(i) = 0;
                end
            end
        else
            [A,timel] = Identity_loop(B);
            [A,times] = Identity_unb(B);
            for i = 1:9
                if A(i) == -0
                    A(i) = 0;
                end
            end
        end
        set(handles.a1, 'string' , sprintf("%0.2f",A(1)));
        set(handles.a2, 'string' , sprintf("%0.2f",A(2)));
        set(handles.a3, 'string' , sprintf("%0.2f",A(3)));
        set(handles.a4, 'string' , sprintf("%0.2f",A(4)));
        set(handles.a5, 'string' , sprintf("%0.2f",A(5)));
        set(handles.a6, 'string' , sprintf("%0.2f",A(6)));
        set(handles.a7, 'string' , sprintf("%0.2f",A(7)));
        set(handles.a8, 'string' , sprintf("%0.2f",A(8)));
        set(handles.a9, 'string' , sprintf("%0.2f",A(9)));
        set(handles.timeloop,'string',sprintf("%0.6f ms",timel));
        set(handles.timespark,'string',sprintf("%0.6f ms",times));
    elseif handles.rb_random.Value == 1
        randomNum = randi([0,10],3,3)
        
        if handles.rb_inverse.Value == 1
            [R,timel] = gauss_jordan_inv(randomNum);
            [R,times] = Gaussian_Inv(randomNum);
            for i = 1:9
                if R(i) == -0
                    R(i) = 0;
                end
            end
        elseif handles.rb_upper.Value == 1
            [R,timel] = upper_loop(randomNum);
            [R,times] = upper_unb(randomNum);
        elseif handles.rb_lower.Value == 1
            [R,timel] = lower_loop(randomNum);
            [R,times] = lower_unb(randomNum);
        elseif handles.rb_diagonal.Value == 1
            [R,timel] = Diagonal_loop(randomNum);
            [R,times] = Diagonal_unb(randomNum);
        else
            [R,timel] = Identity_loop(randomNum);
            [R,times] = Identity_unb(randomNum);
            for i = 1:9
                if R(i) == -0
                    R(i) = 0;
                end
            end
        end
        set(handles.n1, 'string' , randomNum(1));
        set(handles.n2, 'string' , randomNum(2));
        set(handles.n3, 'string' , randomNum(3));
        set(handles.n4, 'string' , randomNum(4));
        set(handles.n5, 'string' , randomNum(5));
        set(handles.n6, 'string' , randomNum(6));
        set(handles.n7, 'string' , randomNum(7));
        set(handles.n8, 'string' , randomNum(8));
        set(handles.n9, 'string' , randomNum(9));
        
        set(handles.a1, 'string' , sprintf("%0.2f",R(1)));
        set(handles.a2, 'string' , sprintf("%0.2f",R(2)));
        set(handles.a3, 'string' , sprintf("%0.2f",R(3)));
        set(handles.a4, 'string' , sprintf("%0.2f",R(4)));
        set(handles.a5, 'string' , sprintf("%0.2f",R(5)));
        set(handles.a6, 'string' , sprintf("%0.2f",R(6)));
        set(handles.a7, 'string' , sprintf("%0.2f",R(7)));
        set(handles.a8, 'string' , sprintf("%0.2f",R(8)));
        set(handles.a9, 'string' , sprintf("%0.2f",R(9)));
        set(handles.timeloop,'string',sprintf("%0.6f ms",timel));
        set(handles.timespark,'string',sprintf("%0.6f ms",times));
    else
        name = get(handles.edit_import,'string');
        M = dlmread(name);
        if handles.rb_inverse.Value == 1
            [P,timel] = gauss_jordan_inv(M);
            [P,times] = Gaussian_Inv(M);
            for i = 1:9
                if P(i) == -0
                    P(i) = 0;
                end
            end
        elseif handles.rb_upper.Value == 1
            [P,timel] = upper_loop(M);
            [P,times] = upper_unb(M);
            
        elseif handles.rb_lower.Value == 1
            [P,timel] = lower_loop(M);
            [P,times] = lower_unb(M);
        elseif handles.rb_diagonal.Value == 1
            [P,timel] = Diagonal_loop(M);
            [P,times] = Diagonal_unb(M);
            for i = 1:9
                if P(i) == -0
                    P(i) = 0;
                end
            end
        else
            [P,timel] = Identity_loop(M);
            [P,times] = Identity_unb(M);
            for i = 1:9
                if P(i) == -0
                    P(i) = 0;
                end
            end
        end
        set(handles.n1, 'string' , M(1));
        set(handles.n2, 'string' , M(2));
        set(handles.n3, 'string' , M(3));
        set(handles.n4, 'string' , M(4));
        set(handles.n5, 'string' , M(5));
        set(handles.n6, 'string' , M(6));
        set(handles.n7, 'string' , M(7));
        set(handles.n8, 'string' , M(8));
        set(handles.n9, 'string' , M(9));
        
        set(handles.a1, 'string' , sprintf("%0.2f",P(1)));
        set(handles.a2, 'string' , sprintf("%0.2f",P(2)));
        set(handles.a3, 'string' , sprintf("%0.2f",P(3)));
        set(handles.a4, 'string' , sprintf("%0.2f",P(4)));
        set(handles.a5, 'string' , sprintf("%0.2f",P(5)));
        set(handles.a6, 'string' , sprintf("%0.2f",P(6)));
        set(handles.a7, 'string' , sprintf("%0.2f",P(7)));
        set(handles.a8, 'string' , sprintf("%0.2f",P(8)));
        set(handles.a9, 'string' , sprintf("%0.2f",P(9)));
        set(handles.timeloop,'string',sprintf("%0.6f ms",timel));
        set(handles.timespark,'string',sprintf("%0.6f ms",times));
    end 
function [x,timeVal] = upper_loop(a)
time = tic;
[m,n] = size(a);
for i = 1:m
    for j = 1:n
        if i > j
            a(i,j) = 0;
        end
    end
end
x = a;
timeVal = toc(time);

function [x,timeVal] = lower_loop(a)
time = tic;
[m,n] = size(a);
for i = 1:m
    for j = 1:n
        if i < j
            a(i,j) = 0;
        end
    end
end
x = a;
timeVal = toc(time);

function [A_out,timeVal] = Diagonal_loop(A)
time = tic;
[m,n] = size(A);
if m == n
    for i = 1:m
        for j = 1:n
            if i ~= j
                A(i,j) = 0;
            end
        end
    end 
else
    A_out = 'FAILED';
end
A_out = A;
timeVal = toc(time);

function [A_out,timeVal] = Identity_loop(A)
time = tic;
[m,n] = size(A);
if m == n
    for i = 1:m
        for j = 1:n
            if i ~= j
                A(i,j) = 0;
            else 
                A(i,j) = 1;
            end
        end
    end 
else
    A_out = 'FAILED';
end
A_out = A;
timeVal = toc(time);


function [x,timeVal] = gauss_jordan_inv(a)
%GAUSS Summary of this function goes here
%   Detailed explanation goes here
time = tic;
[m0,n0]=size(a);
a(:, n0+1:n0+n0) = eye(n0);
[m,n]=size(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            t=a(1,:);a(1,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end

for j=m:-1:2
    for i=j-1:-1:1
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
for s=1:m
    a(s,:)=a(s,:)/a(s,s);
end
x = [a(:,(n0+1:n0+n0))];
timeVal = toc(time);


function [ A_out,timeVal ] = Gaussian_Inv( A )
    time = tic;
    [m,n] = size(A);
    A(:,(n+1:n+n)) = eye(n);
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
  for i = 1:m
    ATR(i,:) = ATR(i,:)/ATL(i,i);
  end
  A_out = [ ATR ];
  timeVal = toc(time);

return


% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ A_out ,timeVal] = Identity_unb( A )
    time = tic;
    [m,n] = size(A);
    A(:,(n+1:n+n)) = eye(n);
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
    a01 = zeros(size(a01));
    alpha11 = 1;
    a21 = zeros(size(a21));

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end
    A_out = [ ATL, ATR
            ABL, ABR ];
    timeVal = toc(time);
return

function [ A_out ,timeVal] = Diagonal_unb( A )
    time = tic;
    
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
    a01 = zeros(size(a01));
    a21 = zeros(size(a21));

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end
    A_out = [ ATL, ATR
            ABL, ABR ];
    timeVal = toc(time);
return

function [ A_out ,timeVal] = upper_unb( A )
    time = tic;
    
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
    a21 = zeros(size(a21));

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end
    A_out = [ ATL, ATR
            ABL, ABR ];
    timeVal = toc(time);
return

function [ A_out ,timeVal] = lower_unb( A )
    time = tic;
    
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
    a01 = zeros(size(a01));

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end
    A_out = [ ATL, ATR
            ABL, ABR ];
    timeVal = toc(time);
return

function n2_Callback(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n9 as text
%        str2double(get(hObject,'String')) returns contents of n9 as a double


% --- Executes during object creation, after setting all properties.
function n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



    



function n3_Callback(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n6 as text
%        str2double(get(hObject,'String')) returns contents of n6 as a double


% --- Executes during object creation, after setting all properties.
function n3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n4_Callback(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n2 as text
%        str2double(get(hObject,'String')) returns contents of n2 as a double


% --- Executes during object creation, after setting all properties.
function n4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n5_Callback(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n9 as text
%        str2double(get(hObject,'String')) returns contents of n9 as a double


% --- Executes during object creation, after setting all properties.
function n5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n6_Callback(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n9 as text
%        str2double(get(hObject,'String')) returns contents of n9 as a double


% --- Executes during object creation, after setting all properties.
function n6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n7_Callback(hObject, eventdata, handles)
% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n3 as text
%        str2double(get(hObject,'String')) returns contents of n3 as a double


% --- Executes during object creation, after setting all properties.
function n7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n8_Callback(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n6 as text
%        str2double(get(hObject,'String')) returns contents of n6 as a double


% --- Executes during object creation, after setting all properties.
function n8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n9_Callback(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n9 as text
%        str2double(get(hObject,'String')) returns contents of n9 as a double


% --- Executes during object creation, after setting all properties.
function n9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a1_Callback(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a1 as text
%        str2double(get(hObject,'String')) returns contents of a1 as a double


% --- Executes during object creation, after setting all properties.
function a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a4_Callback(hObject, eventdata, handles)
% hObject    handle to a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a4 as text
%        str2double(get(hObject,'String')) returns contents of a4 as a double


% --- Executes during object creation, after setting all properties.
function a4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a7_Callback(hObject, eventdata, handles)
% hObject    handle to a7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a7 as text
%        str2double(get(hObject,'String')) returns contents of a7 as a double


% --- Executes during object creation, after setting all properties.
function a7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a2_Callback(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a2 as text
%        str2double(get(hObject,'String')) returns contents of a2 as a double


% --- Executes during object creation, after setting all properties.
function a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a5_Callback(hObject, eventdata, handles)
% hObject    handle to a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a5 as text
%        str2double(get(hObject,'String')) returns contents of a5 as a double


% --- Executes during object creation, after setting all properties.
function a5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a8_Callback(hObject, eventdata, handles)
% hObject    handle to a8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a8 as text
%        str2double(get(hObject,'String')) returns contents of a8 as a double


% --- Executes during object creation, after setting all properties.
function a8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a3_Callback(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a3 as text
%        str2double(get(hObject,'String')) returns contents of a3 as a double


% --- Executes during object creation, after setting all properties.
function a3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a6_Callback(hObject, eventdata, handles)
% hObject    handle to a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a6 as text
%        str2double(get(hObject,'String')) returns contents of a6 as a double


% --- Executes during object creation, after setting all properties.
function a6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a9_Callback(hObject, eventdata, handles)
% hObject    handle to a9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a9 as text
%        str2double(get(hObject,'String')) returns contents of a9 as a double


% --- Executes during object creation, after setting all properties.
function a9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_import_Callback(hObject, eventdata, handles)
% hObject    handle to edit_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_import as text
%        str2double(get(hObject,'String')) returns contents of edit_import as a double


% --- Executes during object creation, after setting all properties.
function edit_import_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_random.
function rb_random_Callback(hObject, eventdata, handles)
% hObject    handle to rb_random (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of rb_random
set(handles.edit_import,'enable','off');
set(handles.edit_import,'string','');



% --- Executes on button press in rb_normal.
function rb_normal_Callback(hObject, eventdata, handles)
% hObject    handle to rb_normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_import,'enable','off');
set(handles.edit_import,'string','');
% Hint: get(hObject,'Value') returns toggle state of rb_normal


% --- Executes on button press in rb_import.
function rb_import_Callback(hObject, eventdata, handles)
% hObject    handle to rb_import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_import,'enable','on');
% Hint: get(hObject,'Value') returns toggle state of rb_import


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.listbox1,'Value') == 1)
    close test1;
    gui_mat2;
elseif (get(handles.listbox1,'Value') == 3)
    close test1;
    gui_mat4;
elseif (get(handles.listbox1,'Value') == 4)
    close test1;
    gui_mat5;
else
end
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_upper.
function rb_upper_Callback(hObject, eventdata, handles)
% hObject    handle to rb_upper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_mode,'String','Upper');
% Hint: get(hObject,'Value') returns toggle state of rb_upper


% --- Executes on button press in rb_lower.
function rb_lower_Callback(hObject, eventdata, handles)
% hObject    handle to rb_lower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_mode,'String','Lower');
% Hint: get(hObject,'Value') returns toggle state of rb_lower


% --- Executes on button press in rb_inverse.
function rb_inverse_Callback(hObject, eventdata, handles)
% hObject    handle to rb_inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_mode,'String','Inverse');
% Hint: get(hObject,'Value') returns toggle state of rb_inverse


% --- Executes on button press in rb_diagonal.
function rb_diagonal_Callback(hObject, eventdata, handles)
% hObject    handle to rb_diagonal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_mode,'String','Diagonal');
% Hint: get(hObject,'Value') returns toggle state of rb_diagonal


% --- Executes on button press in rb_identity.
function rb_identity_Callback(hObject, eventdata, handles)
% hObject    handle to rb_identity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_mode,'String','Identity');
% Hint: get(hObject,'Value') returns toggle state of rb_identity
