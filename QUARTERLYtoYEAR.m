function result = QUARTERLYtoYEAR(x)

%Here what we'll do is create a function that aggregates quarters to years.
% We'll make use of the Matlab function loop.

%Above, what we have is a generic vector x that must be inputted as a
%column vector.

%First we obtain the lenght of the inputted column vector:
NN = length(x);

%For the code to work it must be the case that by dividing x in 4 (there
%are 4 quarters in a year) we get an integer (that is the amount of years
%that we'll have once the data is converted.

%Create an index i that will tell us how many years we'll end up with
years = NN/4;

%Now we create the aggregation loop, but before, to make things faster we
%create a column vector where we'll store the annual data.  This vector
%will be a vector of zeros, and then we'll replace each element in this
%vector using a loop.  We'll also use another vector called premean to
%store preliminary data.

result = zeros(years,1); %This is the final vector with the annualized data
%which is the output of hte function.
premean = zeros(1,4); %This is the vector that will serve to store data
%on each quarter and then used to obtain their mean.

%In fact, what we'll do is create a double loop.  Loops are started off
%with the command for and finalized with the command end.

for i = 1:years; %For each year i
    for j = 1:4; %And for each quarter in a year j
    premean(i,j) = x(4*i+1-j,1); %The element i, je in the row vector
    %premean is equal to the element x(4*i+1-j,1) of the vector x that we
    %inputted; for example, if we input consumption, C, then in the first
    %iteration of the double loop the row vector premean is equatl to:
    %[ C(4*1+1-1,1) C(4*1+1-2,1) C(4*1+1-3,1) C(4*1+1-4,1 ] es decir:
    %[ C(4,1) C(3,1) C(2,1) C(1,1) ].  Similarly, in the second iteration of the
    %double loop we have:
    %[ C(4*2+1-1,1) C(4*2+1-2,1) C(4*2+1-3,1) C(4*2+1-4,1 ] that is:
    %[ C(8,1) C(7,1) C(6,1) C(5,1) ], etc.
    result(i,1) = mean(premean(i,:)); %The element i,1 of the vector
    %premean is equal to the mean of the first row i of the column vector
    %premean.  In our example, then:
    %premean(i,1) = mean( [ C(4,1) C(3,1) C(2,1) C(1,1) ] ) and
    %premean(i,2) = mean ( [ C(8,1) C(7,1) C(6,1) C(5,1) ] ), etc.
    end;
end;
%Note: since we opened two loops we have to close up twice.