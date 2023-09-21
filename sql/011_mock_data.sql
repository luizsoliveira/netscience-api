INSERT INTO basic_auth.users(
	first_name, last_name, email, pass, role)
	VALUES ('Luiz', 'Oliveira', 'luizsoliveira@gmail.com', '123456', 'app_user');

INSERT INTO public.task_types(
	title, slug)
	VALUES ('BGP anomaly', 'BGPAnomaly');

INSERT INTO public.users(
	first_name, last_name, email)
	VALUES ('Luiz', 'Oliveira', 'luizsoliveira@gmail.com');


INSERT INTO public.projects(
	title, manager_user_id)
	VALUES ('CyberDefense', 1);