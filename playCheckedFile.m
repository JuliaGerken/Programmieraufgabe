function playCheckedFile(handle,eventdata,data_array)
zeilennummer=eventdata.Indices(1);
if eventdata.EditData % if the checkbox was set to true
    file=strsplit(data_array{zeilennummer,2},'\t');
    [y,Fs] = audioread(['TIMIT MIT/' data_array{zeilennummer,1} '/' file{1} '.wav']);
    sound(y,Fs);
end
end