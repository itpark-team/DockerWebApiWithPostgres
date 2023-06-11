
DROP TABLE IF EXISTS workers_positions;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS users;

create table users
(
    id          serial      not null
        constraint users_pk
            primary key,
    username    varchar(32) not null,
    password    varchar(32) not null,
    name        varchar(32) not null,
    description varchar(32) not null
);

alter table users
    owner to postgres;

create unique index users_username_uindex
    on users (username);

INSERT INTO public.users (id, username, password, name, description) VALUES (1, 'admin', '123', 'Вася', 'главный по сайту');

create table authors
(
    id   serial       not null
        constraint authors_pk
            primary key,
    name varchar(256) not null,
    age  integer      not null
);

alter table authors
    owner to postgres;

INSERT INTO public.authors (id, name, age) VALUES (1, 'Ваня', 15);
INSERT INTO public.authors (id, name, age) VALUES (5, 'Влад', 16);

create table positions
(
    id     serial      not null
        constraint positions_pk
            primary key,
    name   varchar(32) not null,
    salary integer     not null
);

alter table positions
    owner to postgres;

INSERT INTO public.positions (id, name, salary) VALUES (1, 'Сисадмин', 10);
INSERT INTO public.positions (id, name, salary) VALUES (2, 'Программист', 15);
INSERT INTO public.positions (id, name, salary) VALUES (3, 'Уборщица', 125);

create table workers
(
    id   serial      not null
        constraint workers_pk
            primary key,
    name varchar(32) not null
);

alter table workers
    owner to postgres;

INSERT INTO public.workers (id, name) VALUES (1, 'Петя');
INSERT INTO public.workers (id, name) VALUES (2, 'Коля');
INSERT INTO public.workers (id, name) VALUES (3, 'Дима');

create table articles
(
    id        serial        not null
        constraint articles_pk
            primary key,
    title     varchar(64)   not null,
    content   varchar(1024) not null,
    author_id integer       not null
        constraint articles_authors_id_fk
            references authors
            on update restrict on delete restrict
);

alter table articles
    owner to postgres;

INSERT INTO public.articles (id, title, content, author_id) VALUES (1, 'Hello world', 'Написана первая программа мире', 1);
INSERT INTO public.articles (id, title, content, author_id) VALUES (4, 'lkdfnglkndf', '2342342', 1);

create table workers_positions
(
    worker_id   integer not null
        constraint workers_positions_workers_id_fk
            references workers
            on update restrict on delete restrict,
    position_id integer not null
        constraint workers_positions_positions_id_fk
            references positions
            on update restrict on delete restrict,
    constraint workers_positions_pk
        primary key (worker_id, position_id)
);

alter table workers_positions
    owner to postgres;

INSERT INTO public.workers_positions (worker_id, position_id) VALUES (1, 1);
INSERT INTO public.workers_positions (worker_id, position_id) VALUES (1, 2);
INSERT INTO public.workers_positions (worker_id, position_id) VALUES (3, 2);
