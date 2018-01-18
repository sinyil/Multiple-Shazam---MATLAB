function [names,how,where] = MatchSong(recordMap)
   
     load('Database.mat');
     load('SongNames.mat');

    sizeOfDatabase = size(Database);
    len = sizeOfDatabase(2);
    whereItBegins = zeros(len,1);
    howManyMatches = zeros(len,1);
    for y=1:len
        s = 300;
        error = zeros(2250-s+1,1);
        songMap = Database(y).data;
        for i = 1:2250-s+1
            for j=1:300
               for m=1:5
                   if abs(songMap(i+j-1,m)-recordMap(j,m))<=1
                        error(i) = error(i) + 1;
                   end
               end
               % error(i) = error(i) + sum(abs(songMap(i+j-1,:)-recordMap(j,:))<=2);
            end
        end
        %[value, index] = min(error(:));
        
        [value, index] = max(error(:));
        
        whereItBegins(y) = index;
% 
%         count = 0;
%         for o=1:300
%             count = count + sum(abs(songMap(index+o-1,:)-recordMap(o,:)) <= 2) ;
%         end
%        howManyMatches(y) = count;
        howManyMatches(y) = value;
    end
    
    [max1,in1] = max(howManyMatches);
    how(1) = max1;
    names(1).title = datasetmusic(in1).name;
    where(1) = whereItBegins(in1);
    howManyMatches(in1) = 0;
    
    
    [max2,in2] = max(howManyMatches);
    how(2) = max2;
    names(2).title = datasetmusic(in2).name;
    where(2) = whereItBegins(in2);
    howManyMatches(in2) = 0;
    
    [max3,in3] = max(howManyMatches);
    how(3) = max3;
    names(3).title = datasetmusic(in3).name;
    where(3) = whereItBegins(in3);
    howManyMatches(in3) = 0;
    
    
  
    
    
end
