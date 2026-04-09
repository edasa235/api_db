create table tasks (
                       id uuid,
                       title text not null,
                       description text null,
                       status text not null,
                       assignee_id uuid not null,
                       created_at timestamptz default current_timestamp,
                       completed_at timestamptz null,

                       constraint status_check check (status in ('BACKLOG', 'READY', 'IN_PROGRESS', 'IN_REVIEW', 'IN_TESTING', 'COMPLETED')),
                       constraint tasks_pkey primary key (id),
                       constraint tasks_assignee_id_fk foreign key (assignee_id) references users(id),
    constraint INDEX tasks_assignee_id_idx (assignee_id),
    constraint INDEX tasks_status_idx (status)
);