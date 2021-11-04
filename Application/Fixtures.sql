

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('8ed7bd15-2336-4929-984b-a75757a172a8', 'Hello World!', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam', '2021-11-04 00:42:57.921677-06');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('66769c08-2067-4d95-9221-5fb14171c24a', '8ed7bd15-2336-4929-984b-a75757a172a8', 'Yo Mero', 'My Body My Rules', '2021-11-04 13:59:43.248018-06');
INSERT INTO public.comments (id, post_id, author, body, created_at) VALUES ('1d086d9a-2db6-47ed-a8ec-dde5816c265a', '8ed7bd15-2336-4929-984b-a75757a172a8', 'Tu', 'Y Saboo Mafoo', '2021-11-04 13:59:43.248732-06');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


