create table users(
                      id uuid,
                      username text not null,
                      email text not null,
                      created_at timestamptz default current_timestamp

                          constraint users_pkey primary key (id),
                      constraint users_email_unique unique (email),
                      constraint users_username_unique unique (username)
);