clear
clc

startNum = 256;
endNum = 2048;

isSeen = logical(zeros(endNum, 1));
coprimeList = zeros(260, 1);
counter = 0;

for idx = startNum:endNum
	uni = unique(factor(idx));
	if nnz(isSeen(uni) == true) > 0
		isSeen(uni) = true;
		continue;
	else
		counter = counter + 1;
		coprimeList(counter) = idx;
		isSeen(uni) = true;
	end
end

coprimeList = coprimeList(1:nnz(coprimeList));

for idx = 1:length(coprimeList)
	disp(factor(coprimeList(idx)))
end
