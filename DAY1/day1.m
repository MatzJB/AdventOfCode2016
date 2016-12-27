%Solution by: Matz Johansson Bergström (dec 10 2016)
% For a more detailed explanation, read http://matzjb.se/2016/12/08/advent-of-code-2016#final-version

% read the data and split into (relative) directions
dRel      = textscan(fopen('input-Day-1.txt'), '%c%d', 'Delimiter', ','); 
% cumulatively add the rotations and steps from the previous row using the short form of the Euler formula
coords    = cumsum( exp(1i*(repelem(cumsum( 2*(dRel{1} == 'L') - 1 ), dRel{2}))*pi*.5) );
% sort the coordinates so as to find the intersections
[vS, vI]  = sort(coords);
% find the first occurance of the intersection
intsctn   = min( vI(~[abs(diff(vS)); 0]) );
 
% convert complex numbers to coordinates and display the results
fprintf(1,'Distance from first to last coordinate: %d\n', real(coords(end)) + imag(coords(end)) )
fprintf(1,'Distance to first intersection: %d\n', real(coords(intsctn)) + imag(coords(intsctn)) )