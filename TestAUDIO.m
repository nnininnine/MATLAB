%[y,Fs] = audioread('MAGNIFICAT_16bits_96kHz.flac');
%info = audioinfo('MAGNIFICAT_16bits_96kHz.flac')
player = audioplayer([y(:,1) y(:,2)],Fs,24)
subplot