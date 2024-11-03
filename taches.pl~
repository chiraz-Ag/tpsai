
:- dynamic task/4.

create_task(Id, Description, Assignee) :-
    \+ task(Id, _, _, _),  % Vérifie que l'ID de la tâche n'existe pas déjà
    assertz(task(Id, Description, Assignee, false)),
    format("Tâche créée : ~w.~n", [Id]).

assign_task(Id, NewAssignee) :-
    retract(task(Id, Description, _, CompletionStatus)),
    assertz(task(Id, Description, NewAssignee, CompletionStatus)),
    format("Tâche ~w assignée à l’utilisateur : ~w.~n", [Id, NewAssignee]).

mark_completed(Id) :-
    retract(task(Id, Description, Assignee, _)),
    assertz(task(Id, Description, Assignee, true)),
    format("Tâche ~w marquée comme terminée.~n", [Id]).

display_tasks :-
    forall(task(Id, Description, Assignee, CompletionStatus),
           (format("Tâche ~w :~n- Description : ~w~n- Assigné : ~w~n- Statut de complétion : ~w~n~n",
                   [Id, Description, Assignee, CompletionStatus]))).

display_tasks_assigned_to(Assignee) :-
    format("Tâches assignées à ~w :~n", [Assignee]),
    forall(task(Id, Description, Assignee, CompletionStatus),
           (format("Tâche ~w :~n- Description : ~w~n- Statut de complétion : ~w~n~n",
                   [Id, Description, CompletionStatus]))).

display_completed_tasks :-
    format("Tâches terminées :~n"),
    forall(task(Id, Description, Assignee, true),
           (format("Tâche ~w :~n- Description : ~w~n- Assigné : ~w~n~n",
                   [Id, Description, Assignee]))).
