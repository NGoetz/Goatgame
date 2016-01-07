function [ kwgewinn, wgewinn ] = Goatgame( n )
%Goatgame with n iterations

kwgewinn=0; %number of wins without change
wgewinn=0; % number of wins with change

%% n experiments
for i=1:n
    auto=randi(3); % where is car
    wahl=randi(3); % which door choosen
    if wahl == auto % choose random other car 
        rest=setdiff(1:3,wahl);
        leiter=rest(randi(2));
    else
        leiter=setdiff(1:3, [wahl, auto]); % if goat is choosen, other goat is shown 
    end
    %% no change
    kwgewinn=kwgewinn+(auto==wahl);
    %% change
    rest=setdiff(1:3,leiter); % other doors
    wahl=rest(randi(2)); % new door choosen with extra knowledge
    wgewinn=wgewinn+(auto==wahl);
end

%% calculate probabilities by absolute amount
kwgewinn=kwgewinn/n;
wgewinn=wgewinn/n;

end