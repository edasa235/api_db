BEGIN;

CREATE EXTENSION if NOT EXISTS pgcrypto;

CREATE TABLE tasks (
  id UUID NOT NULL DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT NULL,
  status TEXT NOT NULL,
  assignee_id UUID NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT current_timestamp,
  completed_at TIMESTAMPTZ NULL,
  CONSTRAINT tasks_pkey PRIMARY KEY (id),
  CONSTRAINT tasks_assignee_id_fk FOREIGN key (assignee_id) REFERENCES users (id) ON DELETE SET NULL,
  CONSTRAINT tasks_status_check CHECK (status IN ('BACKLOG', 'READY', 'IN_PROGRESS', 'IN_REVIEW', 'IN_TESTING', 'COMPLETED')),
  CONSTRAINT tasks_completed_at_check CHECK (
    (
      status = 'COMPLETED' AND
      completed_at IS NOT NULL
    ) OR
    (
      status != 'COMPLETED' AND
      completed_at IS NULL
    )
  )
);

CREATE INDEX tasks_assignee_id_idx ON tasks (assignee_id);

CREATE INDEX tasks_status_idx ON tasks (status);

COMMIT;
