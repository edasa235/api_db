BEGIN;
create extension if not exists pgcrypto;
create table tasks
(
    id           uuid        not null default gen_random_uuid(),
    title        text        not null,
    description  text        null,
    status       text        not null,
    assignee_id  uuid        null,
    created_at   timestamptz not null default current_timestamp,
    completed_at timestamptz null,

    constraint tasks_pkey primary key (id),
    constraint tasks_assignee_id_fk foreign key (assignee_id) references users (id) on delete set null,
    constraint tasks_status_check check (status in
                                         ('BACKLOG', 'READY', 'IN_PROGRESS', 'IN_REVIEW', 'IN_TESTING', 'COMPLETED')),
    constraint tasks_completed_at_check check (
        (status = 'COMPLETED' and completed_at is not null)
            or (status != 'COMPLETED' and completed_at is null)
        )
);
create index tasks_assignee_id_idx on tasks (assignee_id);
create index tasks_status_idx on tasks (status);
COMMIT;