function [ lout_wLoop ] = reverseImageWithoutLoop(Im,rowstart,rowend,colstart,colend)


%We have created our first function which will reverse the image without
%using for loop
%Here i take our original image and choose it's certain region using
%parameters such as rowstart.
%Then i flip that part in the x axis and assign it to xreversed
xreversed=fliplr(Im(rowstart:rowend,colstart:colend,:));
%Flip xreversed in the y axis
yreversed=flipud(xreversed(:,:,:));
%paste changed image onto original image
Im(rowstart:rowend,colstart:colend,:)=yreversed(:,:,:);
%give it  a new name
lout_wLoop=Im(:,:,:);

end