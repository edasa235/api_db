create table tasks (
                       id uuid not null default gen_random_uuid(),
                       title text not null,
                       description text null,
                       status text not null,
                       assignee_id uuid not null,
                       created_at timestamptz default current_timestamp,
                       completed_at timestamptz null,

                       constraint tasks_pkey primary key (id),
                       constraint tasks_assignee_id_fk foreign key (assignee_id) references users(id) on delete restrict,
                       constraint status_check check (status in ('BACKLOG', 'READY', 'IN_PROGRESS', 'IN_REVIEW', 'IN_TESTING', 'COMPLETED'))
);

create index tasks_assignee_id_idx on tasks(assignee_id);
create index tasks_status_idx on tasks(status);