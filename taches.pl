
:- dynamic task/4.

create_task(Id, Description, Assignee) :-
    \+ task(Id, _, _, _),  % V�rifie que l'ID de la t�che n'existe pas d�j�
    assertz(task(Id, Description, Assignee, false)),
    format("T�che cr��e : ~w.~n", [Id]).

assign_task(Id, NewAssignee) :-
    retract(task(Id, Description, _, CompletionStatus)),
    assertz(task(Id, Description, NewAssignee, CompletionStatus)),
    format("T�che ~w assign�e � l�utilisateur : ~w.~n", [Id, NewAssignee]).

mark_completed(Id) :-
    retract(task(Id, Description, Assignee, _)),
    assertz(task(Id, Description, Assignee, true)),
    format("T�che ~w marqu�e comme termin�e.~n", [Id]).

display_tasks :-
    forall(task(Id, Description, Assignee, CompletionStatus),
           (format("T�che ~w :~n- Description : ~w~n- Assign� : ~w~n- Statut de compl�tion : ~w~n~n",
                   [Id, Description, Assignee, CompletionStatus]))).

display_tasks_assigned_to(Assignee) :-
    format("T�ches assign�es � ~w :~n", [Assignee]),
    forall(task(Id, Description, Assignee, CompletionStatus),
           (format("T�che ~w :~n- Description : ~w~n- Statut de compl�tion : ~w~n~n",
                   [Id, Description, CompletionStatus]))).

display_completed_tasks :-
    format("T�ches termin�es :~n"),
    forall(task(Id, Description, Assignee, true),
           (format("T�che ~w :~n- Description : ~w~n- Assign� : ~w~n~n",
                   [Id, Description, Assignee]))).
