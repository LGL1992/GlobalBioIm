function y = iSfft(x, Notindex)
% Recursive function for sliced inverse FFT. Computed the inverse FFT along all dimension
% of x exepted those indexed by Notindex;
if numel(Notindex)~=0
    y = complex(zeros(size(x))); 
    switch Notindex(1)
        case(1)
            for n=1:size(x,1)
                y(n,:,:,:,:,:,:,:) = iSfft(x(n,:,:,:,:,:,:,:),Notindex(2:end));
            end
        case(2)
            for n=1:size(x,2)
                y(:,n,:,:,:,:,:,:) = iSfft(x(:,n,:,:,:,:,:,:),Notindex(2:end));
            end            
        case(3)
            for n=1:size(x,3)
                y(:,:,n,:,:,:,:,:) = iSfft(x(:,:,n,:,:,:,:,:),Notindex(2:end));
            end            
        case(4)
            for n=1:size(x,4)
                y(:,:,:,n,:,:,:,:) = iSfft(x(:,:,:,n,:,:,:,:),Notindex(2:end));
            end            
        case(5)
            for n=1:size(x,5)
                y(:,:,:,:,n,:,:,:) = iSfft(x(:,:,:,:,n,:,:,:),Notindex(2:end));
            end            
        otherwise
                error('Slice FFT not implemented for number of dimensions >5')
    end
else
y = ifftn(x);
end