create extension if not exists pgcrypto;
create table users (
                       id uuid not null default gen_random_uuid(),
                       username text not null,
                       email text not null,
                       created_at timestamptz default current_timestamp,

                       constraint users_pkey primary key (id),
                       constraint users_email_unique unique (email),
                       constraint users_username_unique unique (username)
);