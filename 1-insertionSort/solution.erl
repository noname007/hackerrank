% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution
-module(solution).
% -export([main/0]).
-compile(export_all).
% https://www.hackerrank.com/challenges/insertionsort1

main()->
%     L = [2 4 6 8 3],
    insertionSort([2,4,6,8,3]).

insertionSort(T)->
    Last = lists:last(T),
    Sorted = lists:droplast(T),
    insertionSortInternal(Sorted,[],Last).


insertionSortInternal([],Sorted_tail,Last)->
    print_in_one_row(lists:append([Last,Sorted_tail]));

insertionSortInternal(Sorted_head,Sorted_tail,Last)->
    Current = lists:last(Sorted_head),
    case Current > Last of
        true->
            _New_sorted = lists:append([Current,Sorted_tail]),
            print_in_one_row(lists:append([Sorted_head,_New_sorted])),
            insertionSortInternal(lists:droplast(Sorted_head),_New_sorted,Last);
        false->
            print_in_one_row(lists:append([Sorted_head,Last,Sorted_tail]))
    end.


print_in_one_row(T)->
    io:format("~w~n",(T)).
